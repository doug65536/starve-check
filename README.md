starve-check
============

Detect CPU starvation

### What it does
It starts a worker thread per cpu. Each worker thread has a counter, which it atomically increments as fast as it can. Each worker gets its own counter, and they are separated by enough padding to land them on their own cache lines. This causes each worker to have its own cache line to hammer on at full speed.

Periodically, the main thread exchanges each counter with zero, and prints the value. There is no sleeping, the sleeps are disguised as waits for condition variables with a timeout, so it looks like we are doing real work the whole time on all threads.

### Understanding the results
Higher numbers are better. Ideally, it should print the same number every row. It will never be that perfect though, what you are looking for, is the number not varying very much. There is one number per cpu, it tracks them independently. There is no affinity pinning, this relies on the OS having some common sense and scheduling one busy thread per cpu. Any weirdness with scheduling or CPU imbalance will be revealed.

It is normal to see one cpu being slightly worse than all the rest on real hardware, that is probably cpu 0, and some drivers and stuff like legacy IRQ handlers are pinned there.
