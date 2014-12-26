#include "stress_instance.h"

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
