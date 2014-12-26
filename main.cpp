
#include <iostream>
#include <iomanip>
#include <algorithm>
#include <cstring>
#include <thread>
#include <atomic>
#include <chrono>
#include <mutex>
#include <condition_variable>
#include <unordered_map>

static constexpr std::size_t max_threads = 256;

typedef std::chrono::system_clock Clock;
typedef std::chrono::time_point<Clock> TimePoint;
typedef std::chrono::duration<double> Duration;

static void error(char const* message, int exitcode = 2)
{
    std::cerr << message << std::endl;
    exit(exitcode);
}

class stress_instance
{
public:
    stress_instance();
    ~stress_instance();
    void run();
    std::int64_t getCount();
    void stop();

private:
    typedef std::atomic_int_least64_t CounterType;
    void worker();

    std::atomic_bool stopRequested;
    std::thread thread;
    char padding1[64];
    CounterType counter;
    char padding2[64];
};

static int run_stress(int cpucount, int timeLimit)
{
    static stress_instance instances[max_threads];
    stress_instance* end = instances + cpucount;
    std::for_each(instances, end,
    [](stress_instance& instance)
    {
        instance.run();
    });

    // Use a condition variable wait for delays
    // It looks more like we are doing work than
    // it would if we were calling sleep_for
    std::mutex dummyMutex;
    std::condition_variable dummyConditionVariable;
    std::unique_lock<std::mutex> lock(dummyMutex);
    do
    {
        dummyConditionVariable.wait_until(lock, Clock::now() + Duration(1));

        std::for_each(instances, end,
        [](stress_instance& instance)
        {
            std::cout << std::setw(5) <<
                         (instance.getCount() / 1000000) <<
                         "M ";
        });
        std::cout << std::endl;

        // Only decrement it if it is positive
        timeLimit -= (timeLimit > 0);
    }
    while (timeLimit != 0);
}

int main(int argc, char** argv)
{
    int threads = 0;
    bool force = false;
    int timeLimit = -1;

    for (int i = 1; i < argc; ++i)
    {
        if (!strcmp(argv[i], "-t"))
        {
            if (i + 1 >= argc)
                error("Missing argument to thread count option (-t)");
            threads = atoi(argv[++i]);
        }
        else if (!strcmp(argv[i], "-i"))
        {
            if (i + 1 >= argc)
                error("Missing argument to iteration count option (-i)");
            timeLimit = atoi(argv[++i]);
        }
        else if (!strcmp(argv[i], "-f"))
        {
            force = true;
        }
        else
        {
            error((std::string("Invalid switch: ") + argv[i]).c_str());
        }
    }

    std::size_t cpuCount = std::thread::hardware_concurrency();

    if (threads <= 0)
    {
        std::cerr << "Using all " << cpuCount << " CPUs" << std::endl;
        threads = cpuCount;
    }

    if (threads > cpuCount)
    {
        if (force)
        {
            std::cerr << "Warning, forced to use more threads"
                         " than CPUs, " << threads << " threads,"
                         " but only " << cpuCount <<
                         " CPUs detected!" << std::endl;
        }
        else
        {
            std::cerr << "Capping to " << cpuCount <<
                    ". Use -f to override." << std::endl;
            threads = cpuCount;
        }
    }

    if (threads > max_threads)
    {
        std::cerr << "Capping to " << max_threads <<
                ". Use -f to override." << std::endl;
        threads = max_threads;
    }

    return run_stress(threads, timeLimit);
}

stress_instance::stress_instance()
    : stopRequested(false)
    , counter(0)
{
}

stress_instance::~stress_instance()
{
    stop();
}

void stress_instance::run()
{
    thread = std::thread(&stress_instance::worker, this);
}

std::int64_t stress_instance::getCount()
{
    return counter.exchange(0);
}

void stress_instance::stop()
{
    stopRequested = true;
    if (thread.joinable())
        thread.join();
}

void stress_instance::worker()
{
    while (!stopRequested)
        ++counter;
}
