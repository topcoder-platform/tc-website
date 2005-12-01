<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Algorithm Tutorials</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="../script.jsp" />
<style type="text/css">
.code
{
   width: 500;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
}
</style>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="education"/>
                <jsp:param name="level2" value="alg_tutorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBodyFull">

            <h2>Sorting</h2>

<p>
<img src="/i/m/timmac_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="10407399" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

<A name="introduction"></A>
<H3>Introduction</H3>
Any number of practical applications in computing require things to be in order.  Even before we start computing, the importance of sorting is drilled into us.  From group pictures that require the tallest people to stand in the back, to the highest grossing salesman getting the largest Christmas bonus, the need to put things smallest to largest or first to last cannot be underestimated.
<br><br>
When we query a database, and append an ORDER BY clause, we are sorting.  When we look for an entry in the phone book, we are dealing with a list that has already been sorted.  (And imagine if it weren't!)  If you need to search through an array efficiently using a binary search, it is necessary to first sort the array.  When a problem statement dictates that in the case of a tie we should return the lexicographically first result, well… you get the idea.
<br><br>
<span class="bodySubtitle">General Considerations</span><br>
Imagine taking a group of people, giving them each a deck of cards that has been shuffled, and requesting that they sort the cards in ascending rank order.  Some people might start making piles, others might spread the cards all over a table, and still others might juggle the cards around in their hands.  For some, the exercise might take a matter of seconds, for others several minutes or longer.  Some might end up with a deck of cards where spades always appear before hearts, in other cases it might be less organized.  Fundamentally, these are all the big bullet points that lead algorithmists to debate the pros and cons of various sorting algorithms.
<br><br>
When comparing various sorting algorithms, there are several things to consider.  The first is usually runtime.  When dealing with increasingly large sets of data, inefficient sorting algorithms can become too slow for practical use within an application.
<br><br>
A second consideration is memory space.  Faster algorithms that require recursive calls typically involve creating copies of the data to be sorted.  In some environments where memory space may be at a premium (such as an embedded system) certain algorithms may be impractical.  In other cases, it may be possible to modify the algorithm to work "in place", without creating copies of the data.  However, this modification may also come at the cost of some of the performance advantage.
<br><br>
A third consideration is stability.  Stability, simply defined, is what happens to elements that are comparatively the same.  In a stable sort, those elements whose comparison key is the same will remain in the same relative order after sorting as they were before sorting.  In an unstable sort, no guarantee is made as to the relative output order of those elements whose sort key is the same.
<br><br>
<span class="bodySubtitle">Bubble Sort</span><br>
One of the first sorting algorithms that is taught to students is bubble sort.  While it is not fast enough in practice for all but the smallest data sets, it does serve the purpose of showing how a sorting algorithm works.  Typically, it looks something like this:
<pre class="code">
for (int i = 0; i < data.Length; i++)
   for (int j = 0; j < data.Length - 1; j++)
      if (data[j] > data[j + 1])
      {
         tmp = data[j];
         data[j] = data[j + 1];
         data[j + 1] = tmp;
      }
</pre>
The idea is to pass through the data from one end to the other, and swap two adjacent elements whenever the first is greater than the last.  Thus, the smallest elements will "bubble" to the surface.  This is O(n2) runtime, and hence is very slow for large data sets.  The single best advantage of a bubble sort, however, is that it is very simple to understand and code from memory.  Additionally, it is a stable sort that requires no additional memory, since all swaps are made in place.
<br><br>
<span class="bodySubtitle">Insertion Sort</span><br>
Insertion sort is an algorithm that seeks to sort a list one element at a time.  With each iteration, it takes the next element waiting to be sorted, and adds it, in proper location, to those elements that have already been sorted.
<pre class="code">
for (int i = 0; i <= data.Length; i++) {
   int j = i;
   while (j > 0 && data[i] < data[j - 1])
      j--;
   int tmp = data[i];
   for (int k = i; k > j; k--)
      data[k] = data[k - 1];
   data[j] = tmp;
}
</pre>
The data, as it is processed on each run of the outer loop, might look like this:
<pre class="code">
{<b>18</b>,  6,  9,  1,  4, 15, 12,  5,  6,  7, 11}
{ <b>6</b>, 18,  9,  1,  4, 15, 12,  5,  6,  7, 11}
{ 6,  <b>9</b>, 18,  1,  4, 15, 12,  5,  6,  7, 11}
{ <b>1</b>,  6,  9, 18,  4, 15, 12,  5,  6,  7, 11}
{ 1,  <b>4</b>,  6,  9, 18, 15, 12,  5,  6,  7, 11}
{ 1,  4,  6,  9, <b>15</b>, 18, 12,  5,  6,  7, 11}
{ 1,  4,  6,  9, <b>12</b>, 15, 18,  5,  6,  7, 11}
{ 1,  4,  <b>5</b>,  6,  9, 12, 15, 18,  6,  7, 11}
{ 1,  4,  5,  6,  <b>6</b>,  9, 12, 15, 18,  7, 11}
{ 1,  4,  5,  6,  6,  <b>7</b>,  9, 12, 15, 18, 11}
{ 1,  4,  5,  6,  6,  7,  9, <b>11</b>, 12, 15, 18}
</pre>
One of the principal advantages of the insertion sort is that it works very efficiently for lists that are nearly sorted initially.  Furthermore, it can also work on data sets that are constantly being added to.  For instance, if one wanted to maintain a sorted list of the highest scores achieved in a game, an insertion sort would work well, since new elements would be added to the data as the game was played.
<br><br>
<span class="bodySubtitle">Merge Sort</span><br>

A merge sort works recursively.  First it divides a data set in half, and sorts each half separately.  Next, the first elements from each of the two lists are compared.  The lesser element is then removed from its list and added to the final result list.
<pre class="code">
int[] mergeSort (int[] data) {
   if (data.Length == 1)
      return data;
   int middle = data.Length / 2;
   int[] left = mergeSort(subArray(data, 0, middle - 1));
   int[] right = mergeSort(subArray(data, middle, data.Length - 1));
   int[] result = new int[data.Length];
   int dPtr = 0;
   int lPtr = 0;
   int rPtr = 0;
   while (dPtr < data.Length) {
      if (lPtr == left.Length) {
         result[dPtr] = right[rPtr];
         rPtr++;         
      } else if (rPtr == right.Length) {
         result[dPtr] = left[lPtr];
         lPtr++;
      } else if (left[lPtr] < right[rPtr]) {
         result[dPtr] = left[lPtr];
         lPtr++;
      } else {
         result[dPtr] = right[rPtr];
         rPtr++;         
      }
      dPtr++;
   }
   return result;
}
</pre>
Each recursive call has O(<i>n</i>) runtime, and a total of O(log <i>n</i>) recursions are required, thus the runtime of this algorithm is O(<i>n</i> * log <i>n</i>).  A merge sort can also be modified for performance on lists that are nearly sorted to begin with.  After sorting each half of the data, if the highest element in one list is less than the lowest element in the other half, then the merge step is unnecessary.  (The Java API implements this particular optimization, for instance.)  The data, as the process is called recursively, might look like this:

<pre class="code">
{18, 6, 9, 1, 4, 15, 12, 5, 6, 7, 11}
{18, 6, 9, 1, 4} {15, 12, 5, 6, 7, 11}
{18, 6} {9, 1, 4} {15, 12, 5} {6, 7, 11}
{18} {6} {9} {1, 4} {15} {12, 5} {6} {7, 11}
{18} {6} {9} {1} {4} {15} {12} {5} {6} {7} {11}
{18} {6} {9} {1, 4} {15} {5, 12} {6} {7, 11}
{6, 18} {1, 4, 9} {5, 12, 15} {6, 7, 11}
{1, 4, 6, 9, 18} {5, 6, 7, 11, 12, 15}
{1, 4, 5, 6, 6, 7, 9, 11, 12, 15, 18}
</pre>

Apart from being fairly efficient, a merge sort has the advantage that it can be used to solve other problems, such as determining how "unsorted" a given list is.  
<br><br>

<span class="bodySubtitle">Heap Sort</span><br>

In a heap sort, we create a heap data structure.  A heap is a data structure that stores data in a tree such that the smallest (or largest) element is always the root node.  (Heaps, also known as priority queues, were discussed in more detail in <A href="/tc?module=Static&d1=tutorials&d2=dataStructures">Data Structures</A>.)  To perform a heap sort, all data from a list is inserted into a heap, and then the root element is repeatedly removed and stored back into the list.  Since the root element is always the smallest element, the result is a sorted list.  If you already have a Heap implementation available or you utilize the Java PriorityQueue (newly available in version 1.5), performing a heap sort is fairly short to code:

<pre class="code">
Heap h = new Heap();
for (int i = 0; i < data.Length; i++)
   h.Add(data[i]);
int[] result = new int[data.Length];
for (int i = 0; i < data.Length; i++)
   data[i] = h.RemoveLowest();
</pre>

The runtime of a heap sort has an upper bound of O(<i>n</i> * log <i>n</i>).  Additionally, its requirement for storage space is only that of storing the heap; this size is linear in proportion to the size of the list.  Heap sort has the disadvantage of not being stable, and is somewhat more complicated to understand beyond just the basic implementation.
<br><br>

<span class="bodySubtitle">Quick Sort</span><br>

A quick sort, as the name implies, is intended to be an efficient sorting algorithm.  The theory behind it is to sort a list in a way very similar to how a human might do it.  First, divide the data into two groups of "high" values and "low" values.  Then, recursively process the two halves. Finally, reassemble the now sorted list.

<pre class="code">
Array quickSort(Array data) {
   if (Array.Length <= 1)
      return;
   middle = Array[Array.Length / 2];
   Array left = new Array();
   Array right = new Array();
   for (int i = 0; i < Array.Length; i++)
      if (i != Array.Length / 2) {
         if (Array[i] <= middle)
            left.Add(Array[i]);
         else
            right.Add(Array[i]);
      }
   return concatenate(quickSort(left), middle, quickSort(right));
}
</pre>

The challenge of a quick sort is to determine a reasonable "midpoint" value for dividing the data into two groups.  The efficiency of the algorithm is entirely dependent upon how successfully an accurate midpoint value is selected.  In a best case, the runtime is O(<i>n</i> * log <i>n</i>).  In the worst case-where one of the two groups always has only a single element-the runtime drops to O(<i>n</i>&sup2;).  The actual sorting of the elements might work out to look something like this:

<pre class="code">
{18, 6, 9, 1, 4, 15, 12, 5, 6, 7, 11}
{6, 9, 1, 4, 12, 5, 6, 7, 11} {15} {18}
{6, 9, 1, 4, 5, 6, 7, 11} {12} {15} {18}
{1, 4} {5} {6, 9, 6, 7, 11} {12} {15} {18}
{1} {4} {5} {6} {6} {9, 7, 11} {12} {15} {18}
{1} {4} {5} {6} {6} {7} {9, 11} {12} {15} {18}
{1} {4} {5} {6} {6} {7} {9} {11} {12} {15} {18}
</pre>

If it is known that the data to be sorted all fit within a given range, or fit a certain distribution model, this knowledge can be used to improve the efficiency of the algorithm by choosing midpoint values that are likely to divide the data in half as close to evenly as possible.  A generic algorithm that is designed to work without respect to data types or value ranges may simply select a value from the unsorted list, or use some random method to determine a midpoint.
<br><br>

<span class="bodySubtitle">Radix Sort</span><br>

The radix sort was designed originally to sort data without having to directly compare elements to each other.  A radix sort first takes the least-significant digit (or several digits, or bits), and places the values into buckets.  If we took 4 bits at a time, we would need 16 buckets.  We then put the list back together, and have a resulting list that is sorted by the least significant radix.  We then do the same process, this time using the second-least significant radix.  We lather, rinse, and repeat, until we get to the most significant radix, at which point the final result is a properly sorted list.
<br><br>
For example, let's look at a list of numbers and do a radix sort using a 1-bit radix.  Notice that it takes us 4 steps to get our final result, and that on each step we setup exactly two buckets:

<pre class="code">
{6, 9, 1, 4, 15, 12, 5, 6, 7, 11}
{6, 4, 12, 6} {9, 1, 15, 5, 7, 11}
{4, 12, 9, 1, 5} {6, 6, 15, 7, 11}
{9, 1, 11} {4, 12, 5, 6, 6, 15, 7}
{1, 4, 5, 6, 6, 7} {9, 11, 12, 15}
</pre>

Let's do the same thing, but now using a 2-bit radix.  Notice that it will only take us two steps to get our result, but each step requires setting up 4 buckets:

<pre class="code">
{6, 9, 1, 4, 15, 12, 5, 6, 7, 11}
{4, 12} {9, 1, 5} {6, 6} {15, 7, 11}
{1} {4, 5, 6, 6, 7} {9, 11} {12, 15}
</pre>

Given the relatively small scope of our example, we could use a 4-bit radix and sort our list in a single step with 16 buckets:

<pre class="code">
{6, 9, 1, 4, 15, 12, 5, 6, 7, 11}
{1} {} {} {4} {5} {6, 6} {7} {} {9} {} {11} {12} {} {} {15}
</pre>

Notice, however, in the last example, that we have several empty buckets.  This illustrates the point that, on a much larger scale, there is an obvious ceiling to how much we can increase the size of our radix before we start to push the limits of available memory.  The processing time to reassemble a large number of buckets back into a single list would also become an important consideration at some point.
<br><br>
Because radix sort is qualitatively different than comparison sorting, it is able to perform at greater efficiency in many cases.  The runtime is O(<i>n</i> * <i>k</i>), where <i>k</i> is the size of the key.  (32-bit integers, taken 4 bits at a time, would have <i>k</i> = 8.)  The primary disadvantage is that some types of data may use very long keys (strings, for instance), or may not easily lend itself to a representation that can be processed from least significant to most-significant.  (Negative floating-point values are the most commonly cited example.)
<br><br>

<span class="bodySubtitle">Sorting Libraries</span><br>

Nowadays, most programming platforms include runtime libraries that provide a number of useful and reusable functions for us.  The .NET framework, Java API, and C++ STL all provide some built-in sorting capabilities.  Even better, the basic premise behind how they work is similar from one language to the next.
<br><br>
For standard data types such as scalars, floats, and strings, everything needed to sort an array is already present in the standard libraries.  But what if we have custom data types that require more complicated comparison logic?  Fortunately, object-oriented programming provides the ability for the standard libraries to solve this as well.
<br><br>
In both Java and C# (and VB for that matter), there is an interface called Comparable (IComparable in .NET).  By implementing the IComparable interface on a user-defined class, you add a method <tt>int CompareTo (object other)</tt>, which returns a negative value if less than, 0 if equal to, or a positive value if greater than the parameter.  The library sort functions will then work on arrays of your new data type.
<br><br>
Additionally, there is another interface called Comparer (IComparer in .net), which defines a single method <tt>int Compare (object obj1, object obj2)</tt>, which returns a value indicating the results of comparing the two parameters.
<br><br>
The greatest joy of using the sorting functions provided by the libraries is that it saves a lot of coding time, and requires a lot less thought and effort.  However, even with the heavy lifting already completed, it is still nice to know how things work under the hood.


        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
