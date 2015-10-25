#include <thread>
#include <future>

int main() {
    return std::async([]{return 42;}).get() - 42;
}
