<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 409 Problem Set &amp; Analysis</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>



<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=12181">Match Overview</a><br />
    <tc-webtag:forumLink forumID="522178" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 409</span><br />Thursday, July 10, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
In the SRM 409 we witnessed many great performances, fast submissions and high scores. The top three rated topcoders <tc-webtag:handle coderId="19849563" context="algorithm"/>, <tc-webtag:handle coderId="144400" context="algorithm"/> and <tc-webtag:handle coderId="10574855" context="algorithm"/> fought
to the last seconds of the challenge phase to claim the match win.
</p> 
<p>The division 1 problems were simpler than usual, which allowed 78 coders to end up with over 1000 points. <tc-webtag:handle coderId="10574855" context="algorithm"/> once again showed his incredible skills by
finishing with the fastest time on 250 and 900 points problems, and the second best time on the 600 pointer, taking only around 14 minutes of solving time to complete all three.
But even that wasn't enough to leave <tc-webtag:handle coderId="19849563" context="algorithm"/> far behind, as he got the fastest time on 600, and the second fastest on 900. A successful challenge allowed him to climb to the top, 
but only for a couple of minutes, until <tc-webtag:handle coderId="10574855" context="algorithm"/> also got a challenge what finally gave him his 45th division 1 SRM win.</p>
<p>In the division 2 scores weren't that high, mostly due to the difficult 1000 points problem, that only <tc-webtag:handle coderId="22742950" context="algorithm"/> ended up solving. However it was <tc-webtag:handle coderId="22698875" context="algorithm"/> who took the win with a very
fast times on the first two problems and 100 points from challenges.</p>

<h1>The Problems</h1>


<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9810&amp;rd=12181" name="9810">Stick</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9810)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522178" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      807 / 923 (87.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      643 / 807 (79.68%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>ohhenrie</strong> for 249.23 points (1 mins 34 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      190.72 (for 643 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>This problem was a nice example, how taking more time on thinking about a solution can save you time, on a longer run. I'll show three solutions, each a bit harder to come up with, but on the other hand easier to implement.</p>
<h3>Solution 1</h3>
<p>Since the problem statement already gives the complete algorithm we can simply follow it directly and implement something like this:</p>
<font face="monospace">
<font color="#804040">&nbsp;1 </font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;sum(ArrayList&lt;Integer&gt; A)&nbsp;{<br />
<font color="#804040">&nbsp;2 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;r = <font color="#ff00ff">0</font>;<br />
<font color="#804040">&nbsp;3 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for</strong></font>&nbsp;(<font color="#2e8b57"><strong>int</strong></font>&nbsp;y : A)&nbsp;r += y;<br />
<font color="#804040">&nbsp;4 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font>&nbsp;r;<br />
<font color="#804040">&nbsp;5 </font>&nbsp;&nbsp;&nbsp;&nbsp;}<br />
<font color="#804040">&nbsp;6 </font><br />
<font color="#804040">&nbsp;7 </font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>public</strong></font>&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;pieces(<font color="#2e8b57"><strong>int</strong></font>&nbsp;x)&nbsp;{<br />
<font color="#804040">&nbsp;8 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ArrayList&lt;Integer&gt; A = <font color="#804040"><strong>new</strong></font>&nbsp;ArrayList&lt;Integer&gt;();<br />
<font color="#804040">&nbsp;9 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A.add(<font color="#ff00ff">64</font>);<br />
<font color="#804040">10 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>while</strong></font>&nbsp;(sum(A)&nbsp;&gt; x)&nbsp;{<br />
<font color="#804040">11 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;minIndex = <font color="#ff00ff">0</font>;<br />
<font color="#804040">12 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for</strong></font>&nbsp;(<font color="#2e8b57"><strong>int</strong></font>&nbsp;i = <font color="#ff00ff">0</font>; i &lt; A.size(); i++)<br />
<font color="#804040">13 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>if</strong></font>&nbsp;(A.get(i)&nbsp;&lt; A.get(minIndex))&nbsp;minIndex = i;<br />
<font color="#804040">14 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;newPiece = A.get(minIndex)&nbsp;/ <font color="#ff00ff">2</font>;<br />
<font color="#804040">15 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A.remove(minIndex);<br />
<font color="#804040">16 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A.add(newPiece);<br />
<font color="#804040">17 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>if</strong></font>&nbsp;(sum(A)&nbsp;&lt; x)<br />
<font color="#804040">18 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A.add(newPiece);<br />
<font color="#804040">19 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
<font color="#804040">20 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font>&nbsp;A.size();<br />
<font color="#804040">21 </font>&nbsp;&nbsp;&nbsp;&nbsp;}<br />
</font>
<p>That certainly works, but as you can see it requires some effort to code.</p>
<h3>Solution 2</h3>
<p>If you look closer at the algorithm, you can notice that every time we add something to the list, it's smaller than all the elements that are already there (we take the smallest element and cut it in half). So we don't have to traverse the whole list to get the minimum, just take the last element. Even more we don't really need to keep track of the whole list at all. Knowing the sum of elements, the last element, and the count of elements is all we need. That gives a much simpler code:</p>
<font face="monospace">
<font color="#804040">&nbsp;1 </font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>public</strong></font>&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;pieces(<font color="#2e8b57"><strong>int</strong></font>&nbsp;x)&nbsp;{<br />
<font color="#804040">&nbsp;2 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;sum = <font color="#ff00ff">64</font>;<br />
<font color="#804040">&nbsp;3 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;count = <font color="#ff00ff">1</font>;<br />
<font color="#804040">&nbsp;4 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;last = <font color="#ff00ff">64</font>;<br />
<font color="#804040">&nbsp;5 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>while</strong></font>&nbsp;(sum &gt; x)&nbsp;{<br />
<font color="#804040">&nbsp;6 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;newPiece = last / <font color="#ff00ff">2</font>;<br />
<font color="#804040">&nbsp;7 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>if</strong></font>&nbsp;(sum - newPiece &gt;= x)&nbsp;sum -= newPiece; <font color="#0000ff">// discard one piece</font><br />
<font color="#804040">&nbsp;8 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>else</strong></font>&nbsp;count++; <font color="#0000ff">// sum doesn't change, count does.</font><br />
<font color="#804040">&nbsp;9 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;last = newPiece;<br />
<font color="#804040">10 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
<font color="#804040">11 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font>&nbsp;count;<br />
<font color="#804040">12 </font>&nbsp;&nbsp;&nbsp;&nbsp;}<br />
</font>
<p>Not only it's faster to type, but what's more important, less complex code means less places where you can make bugs.</p>
<h3>Solution 3</h3>
<p>Consider what are the possible sticks lengths at the end of the algorithm.</p>
<ul>
    <li>All of them are powers of 2 - We take 64 and keep dividing it by two.</li>
    <li>They are all distinct - In a middle of the algorithm we can have two occurrences of the same length, right after a break. But if we kept both halves it means that the sum was greater than <strong>x</strong> and one of them will be broken in the next step.</li>
    <li>The lenghts sum up to <strong>x</strong>.</li>
</ul>
<p>That should look fammilar, as it's nothing else than a binary representation of <strong>x</strong>, where each stick represents one bit that is set.</p>
<font color="#804040">1 </font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>public</strong></font>&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;pieces(<font color="#2e8b57"><strong>int</strong></font>&nbsp;x)&nbsp;{<br />
<font color="#804040">2 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font>&nbsp;Integer.bitCount(x);<br />
<font color="#804040">3 </font>&nbsp;&nbsp;&nbsp;&nbsp;}<br />
<p>It can't get any simpler than that.</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9823&amp;rd=12181" name="9823">OrderedSuperString</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9823)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522178" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      516 / 923 (55.90%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      174 / 516 (33.72%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>dlwjdans</strong> for 476.31 points (6 mins 23 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      294.49 (for 174 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      616 / 640 (96.25%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      425 / 616 (68.99%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Petr</strong> for 247.11 points (3 mins 5 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      189.24 (for 425 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>To understand better how an ordered superstring looks like, imagine that you've written a string <strong>S</strong> on a piece of paper, and now you want to write all the elements of <strong>words</strong> in rows beneath it - In a way that each word starts in the same column, or right from the previous word and characters in every column match. If it's possible to do that then <strong>S</strong> is an ordered superstring of <strong>words</strong> otherwise it isn't. For example</p>
<font face="monospace" color="#804040" ><pre>
<strong>abbbcabbbcabb</strong>
<strong>abbb</strong>cabbbcabb    
ab<strong>bb</strong>cabbbcabb    
abbbca<strong>bbb</strong>cabb
abbbcabbb<strong>c</strong>abb
abbbcabbbca<strong>bb</strong>
</pre></font><p>shows that "abbbcabbbcabb" is an ordered superstring of {"abbb", "bb", "bbb","c", "bb"}. Although not the shortest as you can also write:</p>
<font face="monospace" color="#804040"><pre>
<strong>abbbcbb</strong>
<strong>abbb</strong>cbb
a<strong>bb</strong>bcbb
a<strong>bbb</strong>cbb
abbb<strong>c</strong>bb
abbbc<strong>bb</strong>
</pre></font><p>
Now how do we find this shortest ordered superstring? Just iterate over the <strong>words</strong> and place each word as far left as possible. Where possible means not earlier than the previous word, and matching the already placed characters. Here is a sample code:</p><font face="monospace">
<font color="#804040">&nbsp;1 </font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>public</strong></font>&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;getLength(String[]&nbsp;words)&nbsp;{<br />
<font color="#804040">&nbsp;2 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String superString = <font color="#ff00ff">&quot;&quot;</font>;<br />
<font color="#804040">&nbsp;3 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;last = <font color="#ff00ff">0</font>;<br />
<font color="#804040">&nbsp;4 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for</strong></font>&nbsp;(String w : words)&nbsp;{<br />
<font color="#804040">&nbsp;5 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for</strong></font>&nbsp;(<font color="#2e8b57"><strong>int</strong></font>&nbsp;i = last; i &lt;= superString.length(); i++)&nbsp;{&nbsp;&nbsp;<font color="#0000ff">//checking all positions</font><br />
<font color="#804040">&nbsp;6 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;common = Math.min(superString.length()&nbsp;- i, w.length());&nbsp;&nbsp;<font color="#0000ff">//length of the overlapping part</font><br />
<font color="#804040">&nbsp;7 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String a = superString.substring(i, i + common);<br />
<font color="#804040">&nbsp;8 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;String b = w.substring(<font color="#ff00ff">0</font>, common);<br />
<font color="#804040">&nbsp;9 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>if</strong></font>&nbsp;(a.equals(b))&nbsp;{&nbsp;&nbsp;<font color="#0000ff">//match found</font><br />
<font color="#804040">10 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;superString += w.substring(common);<br />
<font color="#804040">11 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;last = i;<br />
<font color="#804040">12 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>break</strong></font>;<br />
<font color="#804040">13 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
<font color="#804040">14 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
<font color="#804040">15 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
<font color="#804040">16 </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font>&nbsp;superString.length();<br />
<font color="#804040">17 </font>&nbsp;&nbsp;&nbsp;&nbsp;}<br />
</font>
<h3>Proof</h3>
<p>What is left is to show that the algorithm actually always give the optimal solution. I'm going to use the "ad absurdum" argument, that is assuming that that there is a better solution and showing how that leads to a contradiction.</p>
<ul>
    <li>(w<sub>1</sub>...w<sub>n</sub>) - input words.</li>
    <li>X - the ordered superstring generated by the above algorithm.</li>
    <li>(x<sub>1</sub>...x<sub>n</sub>) - indices at which words were placed by the above algorithm.</li>
    <li>Y - the shortest solution (we are assuming it's shorter than X).</li>
    <li>(y<sub>1</sub>...y<sub>n</sub>) - indices of words in Y.</li>
</ul>
First I'm going to generate a sequence of indices (y'<sub>1</sub>...y'<sub>n</sub>), with the following algorithm:<br />
y'<sub>1</sub> = y<sub>1</sub><br />
for i=2 to n<br />
&nbsp;&nbsp;&nbsp;&nbsp;S - the string made from words (w<sub>1</sub>...w<sub>i-1</sub>) placed at indices (y'<sub>1</sub>..y'<sub>i-1</sub>).<br />
&nbsp;&nbsp;&nbsp;&nbsp;if (there is an index z &gt;= y'<sub>i-1</sub> such as w<sub>i</sub> is a substring of S that starts at index z)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;y'_i = z (if there are more than one possible indices choose the lowest).<br />
&nbsp;&nbsp;&nbsp;&nbsp;else<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;y'<sub>i</sub> = y<sub>i</sub><br />
end<br />
<p>What it does is, for each word if it fits entirely in the already generated string, move it as far left as possible. Note that the procedure doesn't change any letters, just generates a valid, non-decreasing, sequence of indices.
</p>
<p>If y'<sub>n</sub> &lt; y<sub>n</sub> we have a contradiction since Y was assumed to be the shortest superstring.
Otherwise:
</p>
<p>
Take the first index where sequences (x<sub>1</sub>...x<sub>n</sub>) and (y'<sub>1</sub>...y'<sub>n</sub>) differ, and call it j.
</p>
<ul>
    <li>x<sub>j</sub> &lt; y'<sub>j</sub> - Since while generating x<sub>j</sub> it was placed as far left as possible.</li>
    <li>S - the string made from words (w<sub>1</sub>...w<sub>j</sub>) placed at indices (x<sub>1</sub>..x<sub>j</sub>).Note that it ends with w<sub>j</sub>, because otherwise while generating y'<sub>j</sub> it would've been made equal to x<sub>j</sub>.</li>
    <li>Z - the substring of Y from the index y'<sub>j</sub> to the end - It starts with w<sub>j</sub>.</li>
</ul>
<p>
Now, since S and Z have an overlapping part (w<sub>j</sub>), we can decrease indices (y'<sub>j</sub>...y'<sub>n</sub>) by y'<sub>j</sub> - x<sub>j</sub> resulting with a new ordered superstring, shorter than Y. Which contradicts that Y was the shortest, and completes the proof.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9830&amp;rd=12181" name="9830">TeleportsNetwork</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9830)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522178" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      17 / 923 (1.84%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1 / 17 (5.88%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>bogomaster</strong> for 423.25 points (51 mins 18 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      423.25 (for 1 correct submission) 
    </td> 
  </tr> 
</table></blockquote> 
<p>The problem proved to be rather difficult, and only one competitor managed to solve it during the match.
When you are facing a complex problem, it's always a good idea to see if it can be divided into simpler subproblems.
And that's exactly what I want to show here, I'll break it down into few parts, each of them quite simple to solve on its own, and then glued together they'll give the full solution.
</p>
<h3>The general idea</h3>
<p>After the first read of the problem you should get at least the following facts:</p>
<ul>
    <li>You have cities connected with roads, which is probably the most common disguise for a graph problem. What's less common is that the graph isn't given explicitly, but described by a building algorithm given in the problem statement.</li>
    <li>You need to select a subset of vertices to put teleports on them.</li>
    <li>If you read the problem all the way down to the constraints section, you noticed that the number of teleports is at most 4, which should immediately turn on a glowing "bruteforce" sign inside your head.</li>
    <li>The inconvenience that you need to minimize is <em>"the minimal number of roads one needs to follow..."</em> so simply the minimal distance between two vertices in an undirected graph.</li>
</ul>
<h3>Constructing the graph</h3>
<p>All that's to be done here, is directly following the algorithm given in the statement. For each of the cities, other than capital, we select another city and put an edge connecting them. And here's a code:</p>
<font face="monospace">
&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>long</strong></font>&nbsp;dist(<font color="#2e8b57"><strong>long</strong></font>&nbsp;x1, <font color="#2e8b57"><strong>long</strong></font>&nbsp;y1, <font color="#2e8b57"><strong>long</strong></font>&nbsp;x2, <font color="#2e8b57"><strong>long</strong></font>&nbsp;y2)&nbsp;{<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font>&nbsp;(x1 - x2)&nbsp;* (x1 - x2)&nbsp;+ (y1 - y2)&nbsp;* (y1 - y2);<br />
&nbsp;&nbsp;&nbsp;&nbsp;}<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;getTarget(<font color="#2e8b57"><strong>int</strong></font>&nbsp;city, <font color="#2e8b57"><strong>int</strong></font>[]&nbsp;X, <font color="#2e8b57"><strong>int</strong></font>[]&nbsp;Y)&nbsp;{<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>long</strong></font>&nbsp;myCapDist = dist(X[city], Y[city], X[<font color="#ff00ff">0</font>], Y[<font color="#ff00ff">0</font>]);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ArrayList&lt;Integer&gt; candidates = <font color="#804040"><strong>new</strong></font>&nbsp;ArrayList&lt;Integer&gt;();<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for</strong></font>&nbsp;(<font color="#2e8b57"><strong>int</strong></font>&nbsp;p = <font color="#ff00ff">0</font>; p &lt; n; p++)&nbsp;{<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>long</strong></font>&nbsp;capDist = dist(X[p], Y[p], X[<font color="#ff00ff">0</font>], Y[<font color="#ff00ff">0</font>]);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>if</strong></font>&nbsp;(capDist &lt; myCapDist)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;candidates.add(p); <font color="#0000ff">// consider only cities closer to the capital</font><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;best = -<font color="#ff00ff">1</font>; <font color="#0000ff">// index of the best city found</font><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>long</strong></font>&nbsp;bestDistance = Long.MAX_VALUE;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for</strong></font>&nbsp;(<font color="#2e8b57"><strong>int</strong></font>&nbsp;p : candidates)&nbsp;{<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>long</strong></font>&nbsp;d = dist(X[city], Y[city], X[p], Y[p]);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>if</strong></font>&nbsp;(d &lt; bestDistance)&nbsp;{<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bestDistance = d;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;best = p;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;} <font color="#804040"><strong>else</strong></font>&nbsp;<font color="#804040"><strong>if</strong></font>&nbsp;(d == bestDistance)&nbsp;{<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>if</strong></font>&nbsp;(X[p]&nbsp;&lt; X[best]&nbsp;<font color="#0000ff">// first tie-breaker</font><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|| (X[p]&nbsp;== X[best]&nbsp;&amp;&amp; Y[p]&nbsp;&lt; Y[best]))&nbsp;{ <font color="#0000ff">// second tie-breaker</font><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;best = p;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font>&nbsp;best;<br />
&nbsp;&nbsp;&nbsp;&nbsp;}<br />
<br />
&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>boolean</strong></font>[][]&nbsp;buildGraph(<font color="#2e8b57"><strong>int</strong></font>[]X, <font color="#2e8b57"><strong>int</strong></font>[]Y){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>boolean</strong></font>[][]G = <font color="#804040"><strong>new</strong></font>&nbsp;<font color="#2e8b57"><strong>boolean</strong></font>[n][n];<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for</strong></font>(<font color="#2e8b57"><strong>int</strong></font>&nbsp;i=<font color="#ff00ff">1</font>;i&lt;G.length;i++){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;j=getTarget(i, X, Y);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;G[i][j]=G[j][i]=<font color="#ff00ff">true</font>;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font>&nbsp;G;<br />
&nbsp;&nbsp;&nbsp;&nbsp;}<br />
</font>
<p>
One little trick to note is that the dist function returns the square of the Euclidean distance. That's because we don't really need to know the actual distance, just be able to compare two distances. If we compare squares that allows us to avoid using floating point numbers.
Not that it matters in this particular problem but it's a good habit to use exact arithmetic whenever you can.
</p>
<h3>Generating all possible teleports placements</h3>
<p>What we basically need to do here is to iterate over all subsets of vertices that have size equal to <strong>teleportCount</strong>. There are few ways to do that, in example, if you are not afraid of a messy code, you can just use a number of nested for loops.
But I prefer to do that with a recursive function, that at each level of recursion tests all the possible elements at a position, and keeps that elements are generated in the increasing order.</p>
<font face="monospace">
&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>void</strong></font>&nbsp;allCombinations(&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;index, <font color="#2e8b57"><strong>int</strong></font>&nbsp;minValue, <font color="#2e8b57"><strong>int</strong></font>[]&nbsp;teleports){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>if</strong></font>(index==teleports.length){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#0000ff">//do something with the teleports here</font><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<font color="#804040"><strong>else</strong></font>{<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for</strong></font>(<font color="#2e8b57"><strong>int</strong></font>&nbsp;i=minValue;i&lt;n;i++){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;teleports[index]&nbsp;= i;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;allCombinations(index + <font color="#ff00ff">1</font>, i+1, teleports);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
&nbsp;&nbsp;&nbsp;&nbsp;}<br />
</font>
<p>As you can see it's short and easy to code. If you are not sure why it works, try to output the values it generates and see the pattern they follow.</p>
<h3>Measuring the inconvenience for the given teleports placement</h3>
<p>From the definition of "the inconvenience of the whole Kingdom" we know that we need to compute the inconveniences of every city and take the maximum of them.
To compute the inconvenience of the city we need to know its distance to the capital and to all the cities with teleports. To make things simpler we can start with precomputing
distances between all the pairs of cities. Again in can be done in various ways, especially if you notice that the graph is in fact a tree. I choose to use the good old Floyd–Warshall algorithm, it's not the most efficient choice,
but it's good enough for at most 50 vertices, and it's so simple to code.</p>
<font face="monospace">
&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>[][]&nbsp;getDistances(<font color="#2e8b57"><strong>boolean</strong></font>[][]G){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>[][]D = <font color="#804040"><strong>new</strong></font>&nbsp;<font color="#2e8b57"><strong>int</strong></font>[n][n];<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for</strong></font>(<font color="#2e8b57"><strong>int</strong></font>[]d:D)Arrays.fill(d,<font color="#ff00ff">1000</font>);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for</strong></font>(<font color="#2e8b57"><strong>int</strong></font>&nbsp;i=<font color="#ff00ff">0</font>;i&lt;n;i++){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D[i][i]=<font color="#ff00ff">0</font>;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for</strong></font>(<font color="#2e8b57"><strong>int</strong></font>&nbsp;j=<font color="#ff00ff">0</font>;j&lt;n;j++)<font color="#804040"><strong>if</strong></font>(G[i][j])D[i][j]=<font color="#ff00ff">1</font>;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for</strong></font>(<font color="#2e8b57"><strong>int</strong></font>&nbsp;k=<font color="#ff00ff">0</font>;k&lt;n;k++)<font color="#804040"><strong>for</strong></font>(<font color="#2e8b57"><strong>int</strong></font>&nbsp;i=<font color="#ff00ff">0</font>;i&lt;n;i++)<font color="#804040"><strong>for</strong></font>(<font color="#2e8b57"><strong>int</strong></font>&nbsp;j=<font color="#ff00ff">0</font>;j&lt;n;j++)<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; D[i][j]=Math.min(D[i][j],D[i][k]+D[k][j]);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font>&nbsp;D;<br />
&nbsp;&nbsp;&nbsp;&nbsp;}
</font>
<p>With that done, computing the inconvenience of a city and of the whole Kingdom becomes only a matter of:</p>
<font face="monospace">
&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;inconv(<font color="#2e8b57"><strong>int</strong></font>&nbsp;p, <font color="#2e8b57"><strong>int</strong></font>[]teleports){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;res = D[p][<font color="#ff00ff">0</font>];<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for</strong></font>(<font color="#2e8b57"><strong>int</strong></font>&nbsp;q:teleports)res = Math.min(res, D[p][q]);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font>&nbsp;res;<br />
&nbsp;&nbsp;&nbsp;&nbsp;}<br />
&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;kingdomInconv(<font color="#2e8b57"><strong>int</strong></font>[]teleports){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;maxIncov =<font color="#ff00ff">0</font>;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for</strong></font>(<font color="#2e8b57"><strong>int</strong></font>&nbsp;p=<font color="#ff00ff">0</font>;p&lt;n;p++)maxIncov = Math.max(maxIncov, inconv(p,teleports));<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font>&nbsp;maxIncov;<br />
&nbsp;&nbsp;&nbsp;&nbsp;}
</font>
<h3>Putting it all together</h3>
And this way we are basically done. Change the line<br />
<font face="monospace" color="#0000ff">&nbsp;&nbsp;&nbsp;&nbsp;//do something with the teleports here</font>
<br />to<br />
<font face="monospace">
&nbsp;&nbsp;&nbsp;&nbsp;result = Math.min(result, kingdomInconv(teleports)); <font color="#0000ff">//result is a class variable</font><br />
</font><br />
And call the already written methods:<br /><br />
<font face="monospace">
    &nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;n;<br />
&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;result = <font color="#ff00ff">1000</font>;<br />
&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>int</strong></font>[][]&nbsp;D;<br /><br />
&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>public</strong></font>&nbsp;<font color="#2e8b57"><strong>int</strong></font>&nbsp;distribute(<font color="#2e8b57"><strong>int</strong></font>&nbsp;teleportCount, <font color="#2e8b57"><strong>int</strong></font>[]&nbsp;citiesX, <font color="#2e8b57"><strong>int</strong></font>[]&nbsp;citiesY)&nbsp;{<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;n= citiesX.length;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>boolean</strong></font>[][]&nbsp;G = buildGraph(citiesX, citiesY);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D = getDistances(G);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;allCombinations(<font color="#ff00ff">0</font>,<font color="#ff00ff">0</font>,<font color="#804040"><strong>new</strong></font>&nbsp;<font color="#2e8b57"><strong>int</strong></font>[teleportCount]);<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font>&nbsp;result;<br />
&nbsp;&nbsp;&nbsp;&nbsp;}</font><br /><br />

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9828&amp;rd=12181" name="9828">MagicalSpheres</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9828)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522178" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      600 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      297 / 640 (46.41%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      211 / 297 (71.04%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>ACRush</strong> for 574.84 points (5 mins 59 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      381.98 (for 211 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>To solve the problem we need to find the largest value, not greater then <strong>gnomesAvailable</strong>, that divides 
C(<strong>spheresCount + fakeSpheresCount</strong>, <strong>spheresCount</strong>), where the C(n,k) denotes the number of ways to chose k elements
out of n. That's a well known function in Combinatorics and it can be computed using the formula (n!)/(k! * (n-k)!). Of course
it's not feasible to directly compute the value of factorial of a number as big as two billion. But as it turns out we don't need to know
the exact value to find it's divisors.</p>
<p>Consider the value of 13!, it can be written as </p>
<pre>1 * 2 * 3 * 4 * 5 * 6 * 7 * 8 * 9 * 10 * 11 * 12 * 13</pre>
<p>To easily find it's divisors, we want to factorize it, and represent it as a multiplication of its exponented prime factors, that is 2^e<sub>1</sub> * 3^e<sub>2</sub> * 5^e<sub>3</sub>...</p>
<p>To compute e<sub>1</sub> we need to know how many times 2 divides 13!, lets do that by looking at the above representation and counting occurrences of 2 for each factor separately.
<pre>
1 * 2 * 3 * 4 * 5 * 6 * 7 * 8 * 9 * 10 * 11 * 12 * 13
    X       X       X       X        X         X
            X               X                  X
                            X
</pre><p>You can notice the pattern, every second number adds 1 to the result, every fourth number adds additional 1, and so on for higher powers. 
The same thing happens for other prime factors, for example for 3:</p>
<pre>
1 * 2 * 3 * 4 * 5 * 6 * 7 * 8 * 9 * 10 * 11 * 12 * 13
        X           X           X              X
                                X
</pre><p>If we follow that logic for all primes less than or equal to 13 we get 13! = 2^10 * 3^5 * 5^2 * 7 * 11 * 13, which, as you can check, is correct.
That gives as a function to compute the exponent of the given prime factor of n!:</p>
<font face="monospace">
&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>long</strong></font>&nbsp;count(<font color="#2e8b57"><strong>long</strong></font>&nbsp;p, <font color="#2e8b57"><strong>long</strong></font>&nbsp;n){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>long</strong></font>&nbsp;res =<font color="#ff00ff">0</font>;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>long</strong></font>&nbsp;q=p;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>while</strong></font>(q&lt;=n){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;res+=n/q;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;q*=p;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font>&nbsp;res;<br />
&nbsp;&nbsp;&nbsp;&nbsp;}</font>
<p>Now how to do the same thing for C(n,k)? Very simple, based on the  (n!)/(k! * (n-k)! formula, it's just:</p>
&nbsp;&nbsp;&nbsp;&nbsp;count(p, n)&nbsp;- count(p, k)&nbsp;- count(p, n-k)<br />
<p>So to check if a number x divides the C(n,k) we only need to factorize it, and then see if all the exponents are less than equal to the
corresponding exponents of C(n,k). Within the problem constraints it was enough to iterate over the possible team sizes and test them one by one.
See the <a href="/stat?c=problem_solution&amp;rm=297945&amp;rd=12181&amp;pm=9828&amp;cr=10157606">code</a> of <tc-webtag:handle coderId="10157606" context="algorithm"/> for a clean implementation of exactly this idea.</p>
<p>There was also a faster way to find which team sizes are acceptable. Rather than checking each number separatly we can use a sieve-like method to eliminate all the numbers
that are not acceptable. Notice that if in C(n,k) we have a prime factor p, and the corresponding exponent e. No number divisible by p^(e+1) will be a divisor of C(n,k), so we 
can iterate over all primes (found by the sieve of Eratosthenes), calculate q as p^(e+1), and mark all numbers divisible by q as incorrect. The highest unmarked number will be the answer.</p>


<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8012&amp;rd=12181" name="8012">GridColoring</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8012)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=522178" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      900 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      140 / 640 (21.88%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      122 / 140 (87.14%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Petr</strong> for 878.05 points (4 mins 30 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      589.08 (for 122 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>We are required to find the expected number of cells colored after <strong>K</strong> iterations.<br />
From the definition of expected value, if you know how to calculate the probability that the given cell (x,y) gets colored, then the answer is just
the sum of these probabilities over all cells.
</p>
<p>Lets start with defining a function p(x,y) - probability that a cell at (x,y) gets covered by a single selection.<br />
To calculate it we can count the number of different selections that cover it, divided by the total number of selections
(which is rows*cols*rows*cols).
</p><p>
If a rectangle covers the cell(x,y) it's left side must be between 0 and x, and it's right side between x and (cols - 1), 
so there is a total of 2 * (x+1) * (cols-x) - 1 pairs of X-coordinates that cover x. The factor 2 comes from the fact that
we can get the same pair of cells in two ways (A,B), or (B,A). The -1 at the end is to avoid counting twice in the case where both coordinates are the same.
Analogically we compute it for y, so the final function looks like:
</p>
<font face="monospace">
&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>double</strong></font>&nbsp;p(<font color="#2e8b57"><strong>double</strong></font>&nbsp;x, <font color="#2e8b57"><strong>double</strong></font>&nbsp;y, <font color="#2e8b57"><strong>double</strong></font>&nbsp;rows, <font color="#2e8b57"><strong>double</strong></font>&nbsp;cols ){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>double</strong></font>&nbsp;rx = <font color="#ff00ff">2</font>*(x+<font color="#ff00ff">1</font>)*(cols-x)-<font color="#ff00ff">1</font>;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>double</strong></font>&nbsp;ry = <font color="#ff00ff">2</font>*(y+<font color="#ff00ff">1</font>)*(rows-y)-<font color="#ff00ff">1</font>;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font>&nbsp;rx*ry/(rows*rows*cols*cols);<br />
&nbsp;&nbsp;&nbsp;&nbsp;}<br />
</font>
<p>Once we have this we can compute the probability that the cell in <strong>not</strong> covered by a single selection, as 1-p(x,y). And further, since all the selections are independent, we compute the probability that the cell is not covered by K selections as (1-p(x,y))^K.
That's all we need to complete the solution:
</p><p>
<font face="monospace">
&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>public</strong></font>&nbsp;<font color="#2e8b57"><strong>double</strong></font>&nbsp;area(<font color="#2e8b57"><strong>int</strong></font>&nbsp;K, <font color="#2e8b57"><strong>int</strong></font>&nbsp;rows, <font color="#2e8b57"><strong>int</strong></font>&nbsp;cols)&nbsp;{<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>double</strong></font>&nbsp;r =<font color="#ff00ff">0</font>;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>for</strong></font>(<font color="#2e8b57"><strong>int</strong></font>&nbsp;i=<font color="#ff00ff">0</font>;i&lt;cols;i++)<font color="#804040"><strong>for</strong></font>(<font color="#2e8b57"><strong>int</strong></font>&nbsp;j=<font color="#ff00ff">0</font>;j&lt;rows;j++){<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>double</strong></font>&nbsp;p = p(i,j,rows,cols); <font color="#0000ff">//covered in a single selection</font><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#2e8b57"><strong>double</strong></font>&nbsp;q = Math.pow(<font color="#ff00ff">1</font>-p, K); <font color="#0000ff">//not covered in K selections</font><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;r+=<font color="#ff00ff">1</font>-q;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#0000ff">//covered in K selections</font><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#804040"><strong>return</strong></font>&nbsp;r;<br />
&nbsp;&nbsp;&nbsp;&nbsp;}<br />
</font>
</p>

<br /><br />


<div class="authorPhoto">
    <img src="/i/m/slex_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8382018" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
