<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Algorithm Tutorials</title>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
<style type="text/css">
.code
{
   width: 550;
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
<div id="onTop">
    <jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
    </jsp:include>
</div>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180" id="onLeft"><jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="algo_tutorials"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->
        <!-- Center Column Begins -->
        <td width="100%" align="center"><div class="tutorBodyFull">
            <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="alg_tut"/>
            <jsp:param name="title" value="&#160;"/>
            </jsp:include>
            <div class="linkBox"> <A href="/tc?module=Static&d1=tutorials&d2=alg_index">Archive</A><br>
                <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br>
                </span> <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br>
                </span>
                <tc-webtag:forumLink forumID="515996" message="Discuss this article" /><br />
                <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
            </div>
            
            <span class="bigTitle">Binary Indexed Trees</span>
            <br /><br />

            <div class="authorPhoto">
                <img src="/i/m/boba5551_big.jpg" alt="Author" />
            </div>

            <div class="authorText"> By&#160;<tc-webtag:handle coderId="20394568" context="algorithm"/><br />
                <em>TopCoder Member</em>
            </div>

            <br clear="all">

<a href="#introduction">Introduction</a><br>
<a href="#notation">Notation</a><br>
<a href="#basicidea">Basic idea</a><br>
<a href="#lastdigit">Isolating the last digit</a><br>
<a href="#read">Read cumulative frequency</a><br>
<a href="#add">Change frequency at some position and update tree</a><br>
<a href="#reada">Read the actual frequency at a position</a><br>
<a href="#scaling">Scaling the entire tree by a constant factor</a><br>
<a href="#find">Find index with given cumulative frequency</a><br>
<a href="#2d">2D BIT</a><br>
<a href="#prob">Sample problem</a><br>
<a href="#conc">Conclusion</a><br>
<a href="#ref">References</a><br><br>

<p><span class="bodySubtitle"><a name="introduction"></a>Introduction</span><br>
We often need some sort of data structure to make our algorithms faster. In this article we will 
discuss the <b>Binary Indexed Trees</b> structure. According to <a target="_blank" href="<tc-webtag:linkTracking link='http://www.cs.ubc.ca/local/reading/proceedings/spe91-95/spe/vol24/issue3/spe884.pdf' refer='binaryIndexedTrees' />">Peter M. Fenwick</a>, this structure was first used for data compression. Now it is often used for storing frequencies and manipulating cumulative frequency tables.</p>

<p>Let's define the following <b>problem</b>: We have n boxes. Possible queries are<br> 
1. add marble to box <b>i</b> <br>
2. sum marbles from box <b>k</b> to box <b>l</b></p>

<p>The naive solution has time complexity of O(1) for query 1 and O(n) for query 2. Suppose we make <b>m</b> queries. The worst
case (when all queries are 2) has time complexity O(n * m). Using some data structure (i.e. 
<a href="/tc?module=Static&d1=tutorials&d2=lowestCommonAncestor">RMQ</a>) we can solve this
problem with the worst case time complexity of O(m log n). Another approach is to use Binary Indexed Tree data structure, 
	    also with the worst time complexity O(m log n) -- but Binary Indexed Trees are much easier to code, and require less memory 
space, than RMQ.</p>
<br>
<p><span class="bodySubtitle"><a name="notation"></a>Notation</span><br>
&nbsp;&nbsp;BIT  - <b>B</b>inary <b>I</b>ndexed <b>T</b>ree<br>
&nbsp;&nbsp;MaxVal - maximum value which will have non-zero frequency<br>
&nbsp;&nbsp;f[i] - frequency of value with index <b>i</b>, <b>i</b> = 1 .. MaxVal <br>
&nbsp;&nbsp;c[i] - cumulative frequency for index <b>i</b> (f[1] + f[2] + ... + f[i])<br>
&nbsp;&nbsp;tree[i] - sum of frequencies stored in <b>BIT</b> with index <b>i</b> 
(latter will be described what index means); sometimes we will write <i>tree frequency</i> instead
	<i>sum of frequencies stored in BIT</i><br>
&nbsp;&nbsp;num¯ - complement of integer <b>num</b> (integer where each binary digit is inverted: 0 -&gt; 1; 1 -&gt; 0 )<br>
NOTE: Often we put f[0] = 0, c[0] = 0, tree[0] = 0, so sometimes I will just ignore index 0.</p>
<br>
<p><span class="bodySubtitle"><a name="basicidea"></a>Basic idea</span><br>
Each integer can be represented as sum of powers of two. In the same way, cumulative frequency can be 
represented as sum of sets of subfrequencies. In our case, each set contains some successive number of non-overlapping frequencies.</p>

<p><b>idx</b> is some index of <b>BIT</b>. <b>r</b> is a position in <b>idx</b> of the last digit 1 
(from left to right) in binary notation. <b>tree[idx]</b> is sum of frequencies from index (<b>idx</b> - 2^<b>r</b> + 1) to 
index <b>idx</b> (look at the Table 1.1 for clarification). We also write that <b>idx</b> is <b>responsible</b> for
indexes from (<b>idx</b> - 2^<b>r</b> + 1) to <b>idx</b> (note that responsibility is the key in our algorithm and
is the way of manipulating the tree).</p>

<div align="center">
<table border="1" cellspacing="0" cellpadding="3">
	<tr>
		<th></th><th>1</th><th>2</th><th>3</th><th>4</th><th>5</th><th>6</th><th>7</th><th>8</th>
		<th>9</th><th>10</th><th>11</th><th>12</th><th>13</th><th>14</th><th>15</th><th>16</th>
	</tr>
	<tr>
		<th>f</th><td>1</td><td>0</td><td>2</td><td>1</td><td>1</td><td>3</td><td>0</td><td align="center">4</td>
		<td align="center">2</td><td align="center">5</td><td align="center">2</td><td align="center">2</td><td align="center">3</td><td align="center">1</td><td align="center">0</td><td align="center">2</td>
	</tr>
	<tr>
		<th>c</th><td>1</td><td>1</td><td>3</td><td>4</td><td>5</td><td>8</td><td>8</td><td>12</td>
		<td>14</td><td>19</td><td>21</td><td>23</td><td>26</td><td>27</td><td>27</td><td>29</td>
	</tr>
	<tr>
		<th>tree</th><td>1</td><td>1</td><td>2</td><td>4</td><td>1</td><td>4</td><td>0</td><td>12</td>
		<td align="center">2</td><td align="center">7</td><td align="center">2</td><td>11</td><td align="center">3</td><td align="center">4</td><td align="center">0</td><td>29</td>
	</tr>
</table>
<p><i>Table 1.1</i></center></p>
<br>
<table border="1" align="center" cellspacing="0" cellpadding="3">
	<tr>
		<th></th><th>1</th><th>2</th><th>3</th><th>4</th><th>5</th><th>6</th><th>7</th><th>8</th>
		<th>9</th><th>10</th><th>11</th><th>12</th><th>13</th><th>14</th><th>15</th><th>16</th>
	</tr>
	<tr>
		<th>tree</th><td>1</td><td>1..2</td><td>3</td><td>1..4</td><td>5</td><td>5..6</td><td>7</td><td>1..8</td>
		<td>9</td><td>9..10</td><td>11</td><td>9..12</td><td>13</td><td>13..14</td><td>15</td><td>1..16</td>
	</tr>
</table>
<p><i>Table 1.2 - table of responsibility</i></p>
</div>

<div align="center"><img src="/i/education/binaryIndexedTrees/BITimg.gif" alt="" title="tree of responsibility for indexes (bar shows range of frequencies accumulated in top element)" border="0" style="margin: 10px;" /></a><br>
<i>Image 1.3 - tree of responsibility for indexes (bar shows range of frequencies accumulated in top element)</i></div> 

<div align="center"><img src="/i/education/binaryIndexedTrees/bitval.gif" alt="" title="tree with tree frequencies" border="0" style="margin: 10px;" /></a><br>
<i>Image 1.4 - tree with tree frequencies</i></div>
<br>
<p>Suppose we are looking for cumulative frequency of index 13 (for the first 13 elements). In binary notation, 
13 is equal to 1101. Accordingly, we will calculate <b>c[1101] = tree[1101] + tree[1100] + tree[1000]</b>
(more about this later).</p>

<p><span class="bodySubtitle"><a name="lastdigit"></a>Isolating the last digit</span><br>
<b>NOTE:</b> Instead of "the last non-zero digit," it will write only "the last digit."</p>

<p>There are times when we need to get just the last digit from a binary number, so we need an 
efficient way to do that. Let <b>num</b> be the integer whose last digit we want to isolate. In binary
notation <b>num</b> can be represented as <b>a1b</b>, where <b>a</b> represents binary digits before the last digit and 
<b>b</b> represents zeroes after the last digit.<br><br>

Integer <b>-num</b> is equal to <b>(a1b)¯ + 1 = a¯0b¯ + 1</b>. <b>b</b> consists of all zeroes, so <b>b¯</b> 
consists of all ones. Finally we have<br>

<center><b>-num = (a1b)¯ + 1 = a¯0b¯ + 1 = a¯0(0...0)¯ + 1 = a¯0(1...1) + 1 = a¯1(0...0) = a¯1b</b>.</center></p>

<p>Now, we can easily isolate the last digit, using <u>bitwise</u> operator <b>AND</b> (in C++, Java it is <b>&</b>) with <b>num</b> and <b>-num</b>:</p>

<b><blockquote>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a1b<br>
	&&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a¯1b<br>
	--------------------<br>
	= (0...0)1(0...0)
	  </blockquote></b>
<br>
<p><span class="bodySubtitle"><a name="read"></a>Read cumulative frequency</span><br>
If we want to read cumulative frequency for some integer <b>idx</b>, we add to <b>sum tree[idx]</b>, substract
last bit of <b>idx</b> from itself (also we can write - remove the last digit; change the last digit to zero) 
and repeat this while <b>idx</b> is greater than zero. We can use next function (written in C++)</p>

<pre class="code">
<font color="blue">int</font> read(<font color="blue">int</font> idx){
	<font color="blue">int</font> sum <font color="green">=</font> <font color="red">0</font>;
	<font color="blue">while</font> (idx <font color="green">></font> <font color="red">0</font>){
		sum <font color="green">+=</font> tree[idx];
		idx <font color="green">-=</font> (idx <font color="green">& -</font>idx);
	}
	<font color="blue">return</font> sum;
}
</pre>

<p>Example for <b>idx</b> = 13; <b>sum</b> = 0:</p>

<table border="1" align="center" cellspacing="0" cellpadding="3">
	<tr>
		<th>iteration</th><th>idx</th><th>position of the last digit</th><th>idx & -idx</th><th>sum</th>
	<tr>
	<tr>
		<td align="center">1</td><td align="center">13 = 1101</td><td align="center">0</td><td align="center">1 (2 ^0)</td><td align="center">3</td>
	</tr>
	<tr>
		<td align="center">2</td><td align="center">12 = 1100</td><td align="center">2</td><td align="center">4 (2 ^2)</td><td align="center">14</td>
	</tr>
	<tr>
		<td align="center">3</td><td align="center">8 = 1000</td><td align="center">3</td><td align="center">8 (2 ^3)</td><td align="center">26</td>
	</tr>
	<tr>
		<td align="center">4</td><td align="center">0 = 0</td><td align="center">---</td><td align="center">---</td><td align="center">---</td>
	</tr>
</table>

<div align="center"><img src="/i/education/binaryIndexedTrees/read.gif" alt="" title="arrows show path from index to zero which we use to get sum" border="0" style="margin: 10px;" /></a><br>
<i>Image 1.5 - arrows show path from index to zero which we use to get sum (image shows example for index 13)</i></div>
<br>
<p>So, our result is 26. The number of iterations in this function is number if bits in <b>idx</b>, which is at most <b>log MaxVal</b>.</p>

<blockquote><i>Time complexity:</i> O(log MaxVal).<br>
  <i>Code length:</i> Up to ten lines.</blockquote>
<br>
<p><span class="bodySubtitle"><a name="add"></a>Change frequency at some position and update tree</span><br>
The concept is to update tree frequency at all indexes which are responsible for frequency whose value we are changing. In reading cumulative frequency at some index, 
we were removing the last bit and going on. In changing some frequency <b>val</b> in tree, we should increment value at the current index (the starting index is always the 
one whose frequency is changed) for <b>val</b>, add the last digit to index and go on while the index is less than or equal to <b>MaxVal</b>. Function in C++:</p>

<pre class="code">
<font color="blue">void</font> update(<font color="blue">int</font> idx ,<font color="blue">int</font> val){
	<font color="blue">while</font> (idx <font color="green"><=</font> MaxVal){
		tree[idx] <font color="green">+=</font> val;
		idx <font color="green">+=</font> (idx <font color="green">& -</font>idx);
	}
}
</pre>

<p>Let's show example for <b>idx</b> = 5:</p>

<table border="1" align="center" cellspacing="0" cellpadding="3">
	<tr>
		<th>iteration</th><th>idx</th><th>position of the last digit</th><th>idx & -idx</th>
	<tr>
	<tr>
		<td align="center">1</td><td align="center">5 = 101</td><td align="center">0</th><td align="center">1 (2 ^0)</td>
	</tr>
	<tr>
		<td align="center">2</td><td align="center">6 = 110</td><td align="center">1</td><td align="center">2 (2 ^1)</td>
	</tr>
	<tr>
		<td align="center">3</td><td align="center">8 = 1000</td><td align="center">3</td><td align="center">8 (2 ^3)</td>
	</tr>
	<tr>
		<td align="center">4</td><td align="center">16 = 10000</td><td align="center">4</td><td align="center">16 (2 ^4)</td>
	</tr>
	<tr>
		<td align="center">5</td><td align="center">32 = 100000</td><td align="center">---</td><td align="center">---</td>
	</tr>
</table><br>

<div align="center"><img src="/i/education/binaryIndexedTrees/bitupdate.gif" alt="" title="updating tree; picture shows each step; (in brackets are tree frequencies before updating)" border="0" style="margin: 10px;" /></a><br>
<i>Image 1.6 - Updating tree (in brackets are tree frequencies before updating); arrows show path while we update tree from index to <b>MaxVal</b> (image shows example for index 5)</i></div>
<br>
<p>Using algorithm from above or following arrows shown in Image 1.6 we can update <b>BIT</b>. </p>
<blockquote>
<i>Time complexity:</i> O(log MaxVal).<br>
<i>Code length:</i> Up to ten lines.</blockquote>

<br>
<p><span class="bodySubtitle"><a name="reada"></a>Read the actual frequency at a position</span><br>
We've described how we can read cumulative frequency for an index. It is obvious that
we can not read just <b>tree[idx]</b> to get the actual frequency for value at index <b>idx</b>. One approach is to have
one aditional array, in which we will seperately store frequencies for values. Both reading and storing take O(1); memory
space is linear. Sometimes it is more important to save memory, so we will show how you can get actual 
frequency for some value without using aditional structures.</p>

<p>Probably everyone can see that the actual frequency at a position <b>idx</b> can be calculated by calling function <b>read</b> 
twice -- <b>f[idx] = read(idx) - read(idx - 1)</b> -- just by taking the difference of two adjacent cumulative frequencies.  
This procedure always works in 2 * O(log n) time. If we write a new function, we can get a bit faster algorithm, with smaller const.</p>

<p>If two paths from two indexes to root have the same part of path, then we can calculate the sum until the paths meet, 
substract stored sums and we get a sum of frequencies between that two indexes. It is pretty simple
to calculate sum of frequencies between adjacent indexes, or read the actual frequency at a given index.</p>

<p>Mark given index with <b>x</b>, its predecessor with <b>y</b>. We can represent (binary notation) <b>y</b> as <b>a0b</b>, 
where <b>b</b> consists of all ones. Then, <b>x</b> will be <b>a1b¯</b> (note that <b>b¯</b> consists all zeros).
Using our algorithm for getting <b>sum</b> of some index, let it be <b>x</b>, in first iteration we remove the last
digit, so after the first iteration <b>x</b> will be <b>a0b¯</b>, mark a new value with <b>z</b>.</p>

<p>Repeat the same process with <b>y</b>. Using our function for reading <b>sum</b> we will remove the last digits
from the number (one by one). After several steps, our <b>y</b> will become (just to remind, it was <b>a0b</b>)
<b>a0b¯</b>, which is the same as <b>z</b>. Now, we can write our algorithm. Note that the only exception is when <b>x</b>
is equal to 0. Function in C++:</p>

<pre class="code">
<font color="blue">int</font> readSingle(<font color="blue">int</font> idx){
<font color="blue">int</font> sum <font color="green">=</font> tree[idx]; <i><font color="#999999">// sum will be decreased</font></i>
<font color="blue">if</font> (idx <font color="green">&gt;</font> <font color="red">0</font>){ <i><font color="#999999">// special case</font></i>
	<font color="blue">int</font> z <font color="green">=</font> idx <font color="green">-</font> (idx <font color="green">&amp; -</font>idx); <i><font color="#999999">// make z first</font></i>
	idx<font color="green">--</font>; <i><font color="#999999">// idx is no important any more, so instead y, you can use idx</font></i>
	<font color="blue">while</font> (idx <font color="green">!=</font> z){ <i><font color="#999999">// at some iteration idx (y) will become z</font></i>
		sum <font color="green">-=</font> tree[idx]; 
<i><font color="#999999">// substruct tree frequency which is between y and "the same path"</font></i>
		idx <font color="green">-=</font> (idx <font color="green">&amp; -</font>idx);
	}
}
<font color="blue">return</font> sum;
}
</pre>

<p>Here's an example for getting the actual frequency for index 12:<br><br>
First, we will calculate <b>z = 12 - (12 & -12) = 8</b>, <b>sum = 11</b></p>

<div align="center">
<table border="1" cellspacing="0" cellpadding="3">
	<tr>
		<th>iteration</th><th>y</th><th>position of the last digit</th><th>y & -y</th><th>sum</th>
	<tr>
	<tr>
		<td align="center">1</td><td align="center">11 = 1011</td><td align="center">0</td><td align="center">1 (2 ^0)</td><td align="center">9</td>
	</tr>
	<tr>
		<td align="center">2</td><td align="center">10 = 1010</td><td align="center">1</td><td align="center">2 (2 ^1)</td><td align="center">2</td>
	</tr>
	<tr>
		<td align="center">3</td><td align="center">8 = 1000</td><td align="center">---</td><td align="center">---</td><td align="center">---</td>
	</tr>
</table><br>
</div>

<div align="center"><img src="/i/education/binaryIndexedTrees/reada.gif" alt="" title="read actual frequency at some index in BIT" border="0" style="margin: 10px;" /></a><br>
<i>Image 1.7 - read actual frequency at some index in BIT <br>(image shows example for index 12)</i></div>
<br>
<p>Let's compare algorithm for reading actual frequency at some index when we twice use function <b>read</b> and 
the algorithm written above. Note that for each odd number, the algorithm will work in const time O(1), without any iteration. For
almost every even number <b>idx</b>, it will work in c * O(log idx), where c is strictly less than 1, compare to
<b>read(idx) - read(idx - 1),</b> which will work in c1 * O(log idx), where c1 is <b>always</b> greater than 1.</p>

<blockquote>
<i>Time complexity:</i> c * O(log MaxVal), where c is less than 1.<br>
<i>Code length:</i> Up to fifteen lines.
</blockquote>
<br>
<p><span class="bodySubtitle"><a name="scaling"></a>Scaling the entire tree by a constant factor</span><br>
Sometimes we want to scale our tree by some factor. With the procedures described above it is very simple. 
If we want to scale by some factor <b>c</b>, then each index <b>idx</b> should be updated by 
<b>-(c - 1) * readSingle(idx) / c</b> (because <b>f[idx] - (c - 1) * f[idx] / c = f[idx] / c</b>). Simple function in C++:</p>

<pre class="code">
<font color="blue">void</font> scale(<font color="blue">int</font> c){
	<font color="blue">for</font> (<font color="blue">int</font> i <font color="green">=</font> <font color="red">1</font> ; i <font color="green">&lt;=</font> MaxVal ; i<font color="green">++</font>)
		update(<font color="green">-</font>(c <font color="green">-</font> <font color="red">1</font>) <font color="green">*</font> readSingle(i) <font color="green">/</font> c , i);
}
</pre>

<p>This can also be done more quickly. Factor is linear operation. Each tree frequency is a linear composition of some frequencies.
If we scale each frequency for some factor,  we also scaled tree frequency for the same factor. Instead of rewriting the procedure above, which has time complexity O(MaxVal * log MaxVal), we can achieve time complexity
of O(MaxVal):</p>

<pre class="code">
<font color="blue">void</font> scale(<font color="blue">int</font> c){
	<font color="blue">for</font> (<font color="blue">int</font> i <font color="green">=</font> <font color="red">1</font> ; i <font color="green">&lt;=</font> MaxVal ; i<font color="green">++</font>)
		tree[i] <font color="green">=</font> tree[i] <font color="green">/</font> c;
}
</pre>

<blockquote>
<i>Time complexity:</i> O(MaxVal).<br>
<i>Code length:</i> Just a few lines.
</blockquote>
<br>
<p><span class="bodySubtitle"><a name="find"></a>Find index with given cumulative frequency</span><br>
The naive and most simple solution for finding an index with a given cumultive frequency
is just simply iterating through all indexes, calculating cumulative frequency, and checking if it's equal to
the given value. In case of negative frequencies it is the only solution. However,
if we have only non-negative frequencies in our tree (that means cumulative frequencies for greater indexes are not smaller)
we can figure out logarithmic algorithm, which is modification of <a href="/tc?module=Static&d1=tutorials&d2=binarySearch">binary search</a>. We go through
all bits (starting with the highest one), make the index, compare the cumulative frequency of the current index and given
value and, according to the outcome, take the lower or higher half of the interval (just like in binary search). Function in C++:</p>

<pre class="code">
<i><font color="#999999">// if in tree exists more than one index with a same
// cumulative frequency, this procedure will return 
// some of them (we do not know which one)

// bitMask - initialy, it is the greatest bit of MaxVal
// bitMask store interval which should be searched</font></i>
<font color="blue">int</font> find(<font color="blue">int</font> cumFre){
	<font color="blue">int</font> idx <font color="green">=</font> <font color="red">0</font>; <i><font color="#999999">// this var is result of function</font></i>
	
	<font color="blue">while</font> ((bitMask <font color="green">!=</font> <font color="red">0</font>) <font color="green">&amp;&amp;</font> (idx <font color="green">&lt;</font> MaxVal)){ <i><font color="#999999">// nobody likes overflow :)</font></i>
		<font color="blue">int</font> tIdx <font color="green">=</font> idx <font color="green">+</font> bitMask; <i><font color="#999999">// we make midpoint of interval</font></i>
		<font color="blue">if</font> (cumFre <font color="green">==</font> tree[tIdx]) <i><font color="#999999">// if it is equal, we just return idx</font></i>
			<font color="blue">return</font> tIdx;
		<font color="blue">else if</font> (cumFre <font color="green">&gt;</font> tree[tIdx]){ 
		        <i><font color="#999999">// if tree frequency "can fit" into cumFre,
		        // then include it</font></i>
			idx <font color="green">=</font> tIdx; <i><font color="#999999">// update index </font></i>
			cumFre <font color="green">-=</font> tree[tIdx]; <i><font color="#999999">// set frequency for next loop </font></i>
		}
		bitMask <font color="green">&gt;&gt;=</font> <font color="red">1</font>; <i><font color="#999999">// half current interval</font></i>
	}
	<font color="blue">if</font> (cumFre <font color="green">!=</font> <font color="red">0</font>) <i><font color="#999999">// maybe given cumulative frequency doesn't exist</font></i>
		<font color="blue">return</font> <font color="green">-</font><font color="red">1</font>;
	<font color="blue">else</font>
		<font color="blue">return</font> idx;
}



<i><font color="#999999">// if in tree exists more than one index with a same
// cumulative frequency, this procedure will return 
// the greatest one</font></i>
<font color="blue">int</font> findG(<font color="blue">int</font> cumFre){
	<font color="blue">int</font> idx <font color="green">=</font> <font color="red">0</font>;
	
	<font color="blue">while</font> ((bitMask <font color="green">!=</font> <font color="red">0</font>) <font color="green">&amp;&amp;</font> (idx <font color="green">&lt;</font> MaxVal)){
		<font color="blue">int</font> tIdx <font color="green">=</font> idx <font color="green">+</font> bitMask;
		<font color="blue">if</font> (cumFre <font color="green">&gt;=</font> tree[tIdx]){ 
		        <i><font color="#999999">// if current cumulative frequency is equal to cumFre, 
		        // we are still looking for higher index (if exists)</font></i>
			idx <font color="green">=</font> tIdx;
			cumFre <font color="green">-=</font> tree[tIdx];
		}
		bitMask <font color="green">&gt;&gt;=</font> <font color="red">1</font>;
	}
	<font color="blue">if</font> (cumFre <font color="green">!=</font> <font color="red">0</font>)
		<font color="blue">return</font> <font color="green">-</font><font color="red">1</font>;
	<font color="blue">else</font>
		<font color="blue">return</font> idx;
}
</pre>

<p>Example for cumulative frequency 21 and function <b>find</b>:</p>

<table border="1" align="center" cellpadding="3" cellspacing="0" width="70%">
<tbody><tr>
     <th>First iteration</th>
     <td align="left">tIdx is 16; tree[16] is greater than 21; half bitMask and continue</td>
</tr>
<tr>
     <th>Second iteration</th>
     <td align="left">tIdx is 8; tree[8] is less than 21, so we should include first 8 indexes in result, remember idx because we surely know it is part of result;
subtract tree[8] of cumFre (we do not want to look for the same cumulative frequency again - we are looking for another cumulative frequency in the
rest/another part of tree); half bitMask and contiue</td>
</tr>
<tr>
     <th>Third iteration</th>
     <td align="left">tIdx is 12; tree[12] is greater than 9 (there is no way to overlap interval 1-8, in this example,
with some further intervals, because only interval 1-16 can overlap); half bitMask and continue</td>
</tr>
<tr>
     <th>Forth iteration</th>
     <td align="left">tIdx is 10; tree[10] is less than 9, so we should update values; half bitMask and continue</td>
</tr>
<tr>
     <th>Fifth iteration</th>
     <td align="left">tIdx is 11; tree[11] is equal to 2; return index (tIdx)</td>
</tr>
</tbody></table>
<br>

<blockquote>
<i>Time complexity:</i> O(log MaxVal).<br>
<i>Code length:</i> Up to twenty lines.
</blockquote> 
<br>
<p><span class="bodySubtitle"><a name="2d"></a>2D BIT</span><br>
BIT can be used as a multi-dimensional data structure. Suppose you have a plane with dots (with non-negative 
coordinates). You make three queries: </p>

<ol>
<li>set dot at (x , y)</li>
<li>remove dot from (x , y)</li>
<li>count number of dots in rectangle (0 , 0), (x , y) - where (0 , 0) if down-left corner, (x , y) is up-right corner and
sides are parallel to x-axis and y-axis.</li>
</ol>

<p>If <b>m</b> is the number of queries, <b>max_x</b> is maximum x coordinate, and <b>max_y</b> is maximum y coordinate, then
the problem should be solved in O(m * log (max_x) * log (max_y)). In this case, each element of the tree will contain
array - (<b>tree[max_x][max_y]</b>). Updating indexes of x-coordinate is the same as before. For example, suppose we are setting/removing dot
(<b>a</b> , <b>b</b>). We will call <b>update(a , b , 1)/update(a , b , -1)</b>, where <b>update</b> is:</p>

<pre class="code">
<font color="blue">void</font> update(<font color="blue">int</font> x , <font color="blue">int</font> y , <font color="blue">int</font> val){
	<font color="blue">while</font> (x <font color="green">&lt;=</font> max_x){
		updatey(x , y , val); 
		<font color="#999999"><i>// this function should update array tree[x] </i></font>
		x <font color="green">+=</font> (x <font color="green">&amp; -</font>x); 
	}
}
</pre>

<p>The function <b>updatey</b> is the "same" as function <b>update</b>:</p>

<pre class="code">
<font color="blue">void</font> updatey(<font color="blue">int</font> x , <font color="blue">int</font> y , <font color="blue">int</font> val){
	<font color="blue">while</font> (y <font color="green">&lt;=</font> max_y){
		tree[x][y] <font color="green">+=</font> val;
		y <font color="green">+=</font> (y <font color="green">&amp; -</font>y); 
	}
}
</pre>

<p>It can be written in one function/procedure:</p>

<pre class="code">
<font color="blue">void</font> update(<font color="blue">int</font> x , <font color="blue">int</font> y , <font color="blue">int</font> val){
	<font color="blue">int</font> y1;
	<font color="blue">while</font> (x <font color="green">&lt;=</font> max_x){
		y1 <font color="green">=</font> y;
		<font color="blue">while</font> (y1 <font color="green">&lt;=</font> max_y){
			tree[x][y1] <font color="green">+=</font> val;
			y1 <font color="green">+=</font> (y1 <font color="green">&amp; -</font>y1); 
		}
		x <font color="green">+=</font> (x <font color="green">&amp; -</font>x); 
	}
}
</pre>

<div align="center"><img src="/i/education/binaryIndexedTrees/bit2d.gif" alt="" title="BIT is array of arrays, so this is two-dimensional BIT (size 16 x 8). Blue fields are fields which we should update when we are updating index (5 , 3)" border="0" style="margin: 10px;" /></a><br>
<i>Image 1.8 - BIT is array of arrays, so this is two-dimensional BIT (size 16 x 8). <br>Blue fields are fields which we should update when we are updating index (5 , 3).</i></div>
<br>

<p>The modification for other functions is very similar. Also, note that BIT can be used as an n-dimensional data structure.</p>
<br>
<p><span class="bodySubtitle"><a name="prob"></a>Sample problem</span>
<ul>
	<li><a href="/stat?c=problem_statement&pm=6551&rd=9990">SRM 310 - FloatingMedian</a></li>
	
	<li>Problem 2:<br>
		<b>Statement:</b><br>
		There is an array of <b>n</b> cards. Each card is putted face down on table. You have two queries:<br>
		&nbsp;&nbsp;1. T i j (turn cards from index i to index j, include i-th and j-th card - card which was
		face down will be face up; card which was face up will be face down)<br>
		&nbsp;&nbsp;2. Q i (answer 0 if i-th card is face down else answer 1)<br><br>
		<b>Solution:</b><br>
		This has solution for each query (and 1 and 2) has time complexity O(log n). In array
		<b>f</b> (of length <b>n + 1</b>) we will store each query <b>T (i , j)</b> - we set <b>f[i]++</b> and 
		<b>f[j + 1]--</b>. For each card <b>k</b> between <b>i</b> and <b>j</b> (include <b>i</b> and <b>j</b>) sum
		<b>f[1] + f[2] + ... + f[k]</b> will be increased for 1, for all others will be same as before (look at the
		image 2.0 for clarification), so our solution will be described sum (which is same as cumulative frequency) module 2.<br><br>

<div align="center"><img src="/i/education/binaryIndexedTrees/problem2.gif" alt="" border="0" style="margin: 10px;" /></a><br>
<i>Image 2.0</i></div>
<br>
Use <b>BIT</b> to store (increase/decrease) frequency and read cumulative frequency.
	</li>
</ul>
</p>
<br>
<p><span class="bodySubtitle"><a name="conc"></a>Conclusion</span>
<ul>
	<li>Binary Indexed Trees are very easy to code.</li>
	<li>Each query on Binary Indexed Tree takes constant or logarithmic time.</li>
	<li>Binary Indexeds Tree require linear memory space.</li>
	<li>You can use it as an n-dimensional data structure.</li>
</ul>
</p>
<br>
<p><span class="bodySubtitle"><a name="ref"></a>References</span><br>
[1] <a href="/tc?module=Static&d1=tutorials&d2=lowestCommonAncestor">RMQ</a><br>
[2] <a href="/tc?module=Static&d1=tutorials&d2=binarySearch">Binary Search</a><br>
[3] <a target="_blank" href="<tc-webtag:linkTracking link='http://www.cs.ubc.ca/local/reading/proceedings/spe91-95/spe/vol24/issue3/spe884.pdf' refer='binaryIndexedTrees' />">Peter M. Fenwick</a>
</p>

            <p>&nbsp; </p>
            <br>
            <br>
        </td>
        <!-- Center Column Ends -->
        <!-- Right Column Begins -->
        <td width="170" id="onRight"><jsp:include page="../public_right.jsp">
            <jsp:param name="level1" value="defaults"/>
            </jsp:include>
        </td>
        <!-- Right Column Ends -->
        <!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
        <!-- Gutter Ends -->
    </tr>
</table>
<div id="onBottom">
    <jsp:include page="../foot.jsp" />
</div>
</body>
</html>
