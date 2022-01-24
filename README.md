# tenna-test
Software Development Problems

## Optimized Math

This program should be a short piece of code that prints all of the positive integers from 1 to 100 as described more fully below. The program may contain multiple methods, and if using an OO language, should be contained within a single class or object. The program should be designed so that it begins execution when invoked through whichever mechanism is most common for the implementation language. 

* Print out all positive integers from 1 to 100, inclusive and in order. 
* Print messages to standard output, matching the Sample Output below. 
* In the output, state whether the each integer is 'odd' or 'even' in the output. 
* If the number is divisible by three, instead of stating that the number is odd or even, statethat the number is 'divisible by three'. 
* If the number is divisible by both two and three, instead of saying that the number is odd,even or divisible by three; state that the number is 'divisible by two and three'. 
* Design the logic of the loop to be as efficient as possible, using the minimal numberof operations to perform the required logic. 

### Sample Output 
* The number '1' is odd. 
* The number '2' is even. 
* The number '3' is divisible by three.
 ... 
* The number '6' is divisible by two and three.
 ...

### Thread Synchronization
This program may be written in the language of your choosing, but must be written in a languagethat supports multithreading. This program should output all of the positive integers from 1 to 100. Internally, the program must use two threads; one thread that prints odd numbers and another thread that prints even numbers. Furthermore, these two threads must be synchronized such that the output appears in correct numerical order. The program may contain multiple methods, and if using an OO language, the program should be contained within asingle class or object.

* The program should be designed so that it begins execution when invoked through whichever mechanism is most common for the implementation language. 
* Print out all positive integers from 1 to 100, inclusive and in order. 
* Print messages to standard output, matching the Sample Output below. 
* Upon starting, create two separate threads, one thread that counts odd numbers only and one thread that counts even numbers only. 
* Through the use of synchronization blocks, notifications, semaphores, or other similar mechanisms, coordinate the threads such that the combined output from both threads appears in numerical order. 
* Include a thread identifier in the output, indicating the source thread that generated the message. 
* Execute as fast as possible, avoiding the use of any sleep or timed waits.

### Sample Output 
* The number '1'
* The number '2'
* The number '3'
 ...
