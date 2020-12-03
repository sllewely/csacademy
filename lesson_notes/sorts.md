#  Sorts

## Day 1

Lets say you wanted to sort all of the cards in a card game, like Letter Jam, where each card is a letter of the alphabet.
How would you sort?

**Selection Sort** walks through to find the smallest letter (A if present) and puts it at the front.  Then finds the next smallest, and puts it next.

How long does this take?  O(n^2)

What happens if the list is already sorted?

**Insertion Sort** is kinda like how I sort a deck my hand of cards.  I choose the next card and put it where it belongs (out of all of the cards that came before it).

How long does it take?  O(n^2)

How long does it take if the list is sorted?  O(n)  How long does it take if the list is mostly sorted?  O(kn) where k is the distance.

Some sorting algorithms are called *stable* which means that if there are two or more elements with the same value, they keep the same order they had originally.  Is selection sort stable?  Is insertion sort stable?

[Visualizer](https://visualgo.net/bn/sorting)

**Merge Sort** is more efficient.  It is a "divide and conquer" algorithm which means it splits the problem into small parts and solves each of the small parts recursively.  Beginning with a list, break it into n lists of size 1.  You see, now we have n sorted lists!

Then, we merge two lists together at a time.  Compare the first element of one list with the first element of the second and take the smallest.  Increment the pointer to the smallest element on the chosen list and repeat.  Since you are always comparing the smallest element of each list each time, you don't need to compare all of list A against all of list B.  Now you have some number of lists of size 2.  After merging a second time, you have some number of lists of size 4, and then 8, and then 16, until you have one list of size n.


---

Implementing merge sort is homework.  Good recursion practice!
