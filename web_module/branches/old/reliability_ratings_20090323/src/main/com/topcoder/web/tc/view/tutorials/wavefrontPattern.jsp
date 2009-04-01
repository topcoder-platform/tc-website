<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Component Tutorials</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="../script.jsp" />
    <jsp:include page="/style.jsp">
      <jsp:param name="key" value="tc_main"/>
    </jsp:include>
    
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
            <jsp:include page="/includes/global_left.jsp">
               <jsp:param name="node" value="comp_tutorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBodyFull">

<jsp:include page="../page_title.jsp" >
   <jsp:param name="image" value="comp_tut"/>
   <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div style="float: right;"><tc-webtag:forumLink forumID="505901" message="Discuss this article" /></div>
<span class="bodyTitle">Parallel Patterns: WaveFront Pattern</span>

<p>
<img src="/i/m/Pops_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="119676" context="design"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

<p>
<span class="bodySubtitle">Introduction</span><br>
In a nod to the Intel Multi-Threading Competition Series, I've decided to deviate a bit from the design pattern series and explore a few parallel programming patterns.  Similar to design work, parallel programming has a number of patterns that can help a person recognize trends in data processing and to efficiently process those trends in a multi-threaded environment.  The first pattern we will explore is the WaveFront.  This pattern describes a set of strategies to efficiently process data over multiple threads when the flow of processing resembles a 'wave' (more on that later).  This pattern is a good candidate where you have dynamic programming or any divide and conquer type of scheme that can become more efficient when processed over multiple threads.  
<br><br>
<span class="bodySubtitle">Levenshtein distance</span><br>
To understand this pattern, let's look at a common algorithm that involves some dynamic programming:  Levenshtein distance.  This algorithm is used to determine the edit distance between two strings.  An edit distance is defined as the minimal number of character insertions, deletions or substitutions to transform one string (called the source string) into another (called the target string).  Side note: this is also a good data entry algorithm to provide a data entry typist with good alternatives if the item they type is a misspelled value (like vendor or supplier names).
<br><br>
The distance between a source string of "bottomcoder" and a target string "topcoder" would be 4 because you would drop the initial "b", "o", "t" and change the "m" to a "p" (4 changes).
<br><br>
The algorithm works by laying out the strings in a grid and assigning the first row/column as follows:
<br/><br/>
<div align=center><img src="/i/education/wavefront1.gif" alt="Figure 1"/></div>
<br/>
You then iterate the grid through the grid assigning each cell the following value (where r is the current row and c is the current column:

<pre class="code">
cost = if (d[r,0] == d[0,c]) then 0 otherwise 1
d[r,c] = min(d[r-1,c] + 1, 
             min(d[r,c-1] + 1, d[r-1,c-1] + cost))
</pre>

Basically this is saying that the cell's value is based on the minimum cost of changing the upper value, changing the lower value or potentially changing the current value.  A filled out grid looks like:
<br/><br/>
<div align=center><img src="/i/education/wavefront2.gif" alt="Figure 2"/></div>
<br/>
The final cell value represents the edit distance &ndash; in this case 4.
<br><br>
<span class="bodySubtitle">Back to the WaveFront Pattern - Recognition</span><br>
If we study how the data flows from cell to cell, we'll see that a cell will flow the data to the right, to the bottom right and to the bottom.  On an aggregate scale we will see:
<br/><br/>
<div align=center><img src="/i/education/wavefront3.gif" alt="Figure 3"/></div>
<br/>
The flow of information describes how and when each cell can process the information.  Once cell 1 has completed &ndash; it flows it's information to the right, right bottom and bottom.  Cells 2 can then be processed (note that cell 3 [that is to the bottom right of cell 1] cannot be processed until cells 2 have processed).  Once cells 2 flow their information, cells 3 can then be processed and so on.   This type of processing resembles a processing wave and provides us with the recognition that the WaveFront pattern strategies may apply to our algorithm.
<br><br>

<h2>WaveFront Strategies</h2>
Now that we have recognized the pattern, let's discuss the strategies that can enable us to take advantage of multiple threads.  Any parallel pattern strategy attempts to minimize the communication between threads (i.e. the synchronization between threads to communicate the data), to minimize the idle time for any given thread (i.e. we want to keep our threads consistently busy) and to provide an even load balancing across each thread (i.e. so each thread does the same amount of work).  If we achieve those three goals, then data was processed in as efficient a manner as possible.
<br><br>
<span class="bodySubtitle">Fixed Block Based Strategy</span><br>
This strategy simply divides the rows and columns by the number of threads and allocates each thread that block of information to work on.  If we have 3 threads we will be using, we could divide a 12x9 grid into blocks of 4x3s and assign the threads as shown here:
<br/><br/>
<div align=center><img src="/i/education/wavefront4.gif" alt="Figure 4"/></div>
<br/>
Thread 1 will process the first block (i.e. the first wave).  When that is completed, the second wave is processed by both thread 1 and thread 2 (the white cells to the right and bottom of the first wave).  By the third wave, thread 3 has joined our processing.
<br><br>
The advantages of this approach are that the communication between each thread is minimized (i.e. a lot of cells are processed without having to communicate to other threads) and that the balance of work is evenly spread across threads (each thread is responsible for 3 blocks and each block processes the same amount of information).
<br><br>
The disadvantage of this approach is that idle time is not minimized and in fact, is quite prevalent.  Thread 3 is idle until wave 3 is processed.  Thread 1 become idle after the third wave.
<br><br>
This strategy is the simplest to implement and would be an ideal approach if the communication time between threads is more expensive then the cost of having threads that are idle.
<br><br>

<span class="bodySubtitle">Cyclical Fixed Block Based Strategy</span><br>
As shown above, the biggest disadvantage is in the idle time of threads.  Choosing a cyclical fixed block strategy pattern can help alleviate this disadvantage by balancing the load, per wave, by cycling over the various threads by using smaller block sizes.  An example would be to drop the block size down to a 2x3 block and then cycle the threads over the blocks:
<br/><br/>
<div align=center><img src="/i/education/wavefront5.gif" alt="Figure 5"/></div>
<br/>
As you can see, this helps to minimize the idle time by allowing each of the threads to participate in more waves and on smaller blocks.  However, there is a tradeoff in the inter-thread communication because less work per block can be done independent of other threads.  
<br><br>
If the cost of the communication is extremely low and idle time cost is high, you can even choose 1x1 blocks (as shown below) that will minimize the idle time at the cost of maximizing communication.
<br/><br/>
<div align=center><img src="/i/education/wavefront6.gif" alt="Figure 6"/></div>
<br/>
The cyclical block strategy provides a nice balance between the cost of communication and the cost of idle time while the programmer can play with the block sizes to provide an optimal combination.
<br><br>

<span class="bodySubtitle">Variable Cyclical Block Based Strategy</span><br>
The above strategies work well because each cell has the same processing time involved (evaluating 3 other cells to determine this cell) and would be ideal for the Levenshtein algorithm or any other fixed processing based algorithm.  However, there are many times when the processing time can vary cell by cell.   Consider the following algorithm:
<pre class="code">
d[r,c] = min(sum(d[0&#8230;r-1,c]), sum(d[r,0&#8230;c-1]))
</pre>

This algorithm specifies each cell processing the cells before it and the cell's processing time will increase the farther away from the origin the cell is.  Please look at the following for a demonstration of this:
<br/><br/>
<div align=center><img src="/i/education/wavefront7.gif" alt="Figure 7"/></div>
<br/>
You can see that cell A needs the values from 4 other cells.  Cell B will process 11 other values and cell C will need the most at 19 values.  So the time spent calculating the cell's value is skewed in the direction of the wave itself.  If we were to choose fixed block sizes, the balancing of load between the threads will be uneven because the fixed block size does not take into account the processing size of each block and each block will become more expensive than the last.
<br><br>
The solution would use variable sized blocks.  In the example below, we process the first three waves using a large block size and reduce the block size as the processing cost increases:
<br/><br/>
<div align=center><img src="/i/education/wavefront8.gif" alt="Figure 8"/></div>
<br/>
This allows us to balance the load over all the calculations yet still gain the advantages of minimizing communication needs.
<br><br>

<span class="bodySubtitle">Conclusion</span><br>
The WaveFront pattern is a good introduction to the parallel patterns that is fairly easy to implement, understand and is more generally useful (and is one of the more simplistic patterns).  Like all patterns, you need to understand the flow of data and processing, recognize it and then apply the appropriate strategy to deal with it. 
<br><br>
As a last word, good luck in the Intel Multi-Threading Competition Series!

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
