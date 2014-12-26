#ifndef STRESS_INSTANCE_H
#define STRESS_INSTANCE_H

#include <cstdint>
#include <atomic>
#include <thread>

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

#endif // STRESS_INSTANCE_H
