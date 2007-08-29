<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
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
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/stat?c=round_overview&er=5&rd=10003">Match Overview</A><br>
    <tc-webtag:forumLink forumID="505998" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 323</span><br>Thursday, October 19, 2006
<br><br>

<h2>Match summary</h2> 

<p>
This match was harder than usual. All three problems in the
first division proved to be rather tricky. Only 229 coders solved the so-called easy 
problem, 40 solved the medium, while only 10 coders successfully restored 
expression in the hard one.
<p/>
<tc-webtag:handle coderId="10574855" context="algorithm"/> and <tc-webtag:handle coderId="153656" context="algorithm"/> were the only two coders who solved all three problems. 
<tc-webtag:handle coderId="10574855" context="algorithm"/> won the match with a wide margin, thanks to his fast 1000-pointer. They 
were followed by <tc-webtag:handle coderId="11829284" context="algorithm"/>. His fourth place showing allowed <tc-webtag:handle coderId="310333" context="algorithm"/> to reach the target rating -- congratulations! And an amazing +500 at the challenge phase lifted <tc-webtag:handle coderId="7340263" context="algorithm"/> up to the fifth place.                                                                   
<p/>
In the second division <tc-webtag:handle coderId="22653739" context="algorithm"/> enjoyed the victory with the fastest hard and 
+200 in challenges.
</p>                                        
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6813&amp;rd=10003" name="6813">IrreducibleNumber</a></b>
</font>
<A href="Javascript:openProblemRating(6813)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505998" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      426 / 496 (85.89%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      277 / 426 (65.02%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>hungson175</b> for 247.92 points (2 mins 36 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      197.92 (for 277 correct submissions) 
    </td>
  </tr>
</table></blockquote>

<p>
Actually, this problem can be solved efficiently with the size of <b>A</b> much greater than 3. The solution is as follows:
<pre>
Sort(A);
N = 0; K = 0;
<font color=blue>while</font> K &lt; A.size <font color=blue>and</font> <b>A</b>[K] &le; N+1 <font color=blue>do</font>
    N = N + <b>A</b>[K]
    K = K+1
<font color=blue>return</font> N+1
</pre>
To prove this solution, let's prove the following property: on each step of the algorithm above,
only non-negative integers less or equal to N can be represented as a required sum of first K elements from <b>A</b>.<br>
<br/>
When N = K = 0, it's obvious. Moreover, if on some step <b>A</b>[K] appears to be greater than N+1, it implies that
the number N+1 is irreducible. Indeed, N+1 cannot be represented as a sum of first K elements from <b>A</b>,
and all other elements from <b>A</b> are greater than N+1, so N+1 is irreducible.<br>
<br/>
In the other case, if <b>A</b>[K] &le; N+1, all the integers in range from N+1 to N+<b>A</b>[k] can also be represented as a sum
of first K+1 elements. The desired representation can be obtained by adding <b>A</b>[K] to the representation of the respected 
element in range from 1 to N.<br>
<br>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6674&amp;rd=10003" name="6674">RoadsAndFools</a></b> </font> <A href="Javascript:openProblemRating(6674)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505998" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      200 / 496 (40.32%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      64 / 200 (32.00%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Melbob</b> for 366.59 points (18 mins 37 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      249.90 (for 64 correct submissions) 
    </td>
  </tr>
</table></blockquote> 

Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      403 / 452 (89.16%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      229 / 403 (56.82%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Spieler</b> for 242.15 points (5 mins 8 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      162.61 (for 229 correct submissions) 
    </td>
  </tr>
</table></blockquote>

<p>
This problems reformulates as follows: given a sequence <b>A</b>[1..N] and integer <b>length</b>,
your task is to construct a new sequence <b>B</b>[1..N], where for each index <i>i</i>
either <b>B</b>[<i>i</i>] = <b>A</b>[<i>i</i>] or <b>B</b>[<i>i</i>] = 
<b>length</b> - <b>A</b>[<i>i</i>] and sequence <b>B</b> is strictly 
increasing.
<p/>
Note that if such a sequence exists, then the lexicographically first of them will have the following structure: 
<b>B</b>[<i>i</i>] = min( <b>A</b>[<i>i</i>], <b>length</b> - <b>A</b>[<i>i</i>]) for each 
index <i>i</i> from 1 to some integer K &le; N and <b>B</b>[<i>i</i>] = max( <b>A</b>[<i>i</i>], <b>length</b> - <b>A</b>[<i>i</i>])
for each <i>i</i> &gt; K. So let's try to take <b>B</b>[<i>i</i>] = min( <b>A</b>[<i>i</i>], <b>length</b> - <b>A</b>[<i>i</i>])
while it's possible and then switch to max( <b>A</b>[<i>i</i>], <b>length</b> - <b>A</b>[<i>i</i>]).
<p/>
The following pseudocode illustrates this approach:

<pre>
<b>B</b>[<i>1</i>] = min( <b>A</b>[<i>1</i>], <b>length</b> - <b>A</b>[<i>1</i>]) 
<font color=blue>for</font> i = 2 <font color=blue>to</font> N <font color=blue>do begin</font> 
    minimum = min( <b>A</b>[<i>i</i>], <b>length</b> - <b>A</b>[<i>i</i>]) 
    maximum = max( <b>A</b>[<i>i</i>], <b>length</b> - <b>A</b>[<i>i</i>]) 
    <font color=blue>if</font> minimum>B[i-1] <font color=blue>then</font> <b>B</b>[<i>i</i>] = minimum 
    <font color=blue>else if</font> maximum>B[i-1] <font color=blue>then</font> <b>B</b>[<i>i</i>] = maximum 
    <font color=blue>else return</font> "NO SOLUTION"                 
<font color=blue>end</font> 
</pre>

<p/>
How do you check if the solution is unique? It's simple: for each index <i>i</i> try to replace <b>B</b>[<i>i</i>] with
<b>length</b> - <b>B</b>[<i>i</i>] and see if the result remains strictly increasing. The only corner case is when
<b>B</b>[<i>i</i>] = <b>length</b>/2, such indices <i>i</i> mustn't be checked.  It is sufficient, because if <b>B</b> is strictly increasing and you replace more than two of its element with its difference with <b>length</b>,
the resulting sequence won't be able to be strictly increasing.<br>
<br>  
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6603&amp;rd=10003" name="6603">UnrepeatableWords</a></b>
</font>
<A href="Javascript:openProblemRating(6603)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505998" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      15 / 496 (3.02%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      7 / 15 (46.67%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Astein</b> for 878.91 points (10 mins 51 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      610.85 (for 7 correct submissions) 
    </td>
  </tr>
</table></blockquote>

<p>
The solution of this problem is based on the backtracking.
Suppose that we have already found k-unrepeatable word of length n-1 and we want to extend it to length n.
Let's try to add character 'A' and check, whether the resulting
word will be k-unrepeateble or not. If not, we'll try letter 'B' and so on.
If we can't extend our word to length n by adding any allowed character, we'll have to
move one step back, to the word of length n-2.
<p/> 
The general scheme of the
solution looks like this:<br>
<br>
<pre>
<font color=blue>for</font> i = 0 <font color=blue>to</font> N-1 <font color=blue>do</font> Res[i] = '?'; 
pos = 0; 
<font color=blue>while</font> true <font color=blue>begin</font> 
    <font color=blue>if</font> pos<0 <font color=blue>then</font> 
        <font color=green>no solution;</font> 
    <font color=blue>if</font> pos=N <font color=blue>then</font> 
        <font color=green>solution found;</font> 
    <font color=blue>if</font> Res[pos]=='?' <font color=blue>then</font> 
         Res[pos] = 'A'; 
        <font color=blue>if</font> <b>checkUnrepeatable</b>(pos) <font color=blue>then</font> 
             pos = pos + 1; 
    <font color=blue>else</font> <font color=blue>if</font> Res[pos]<'A' + allowed <font color=blue>then</font> 
         Res[pos] = next_character(Res[pos]); 
        <font color=blue>if</font> <b>checkUnrepeatable</b>(pos) <font color=blue>then</font> 
             pos = pos + 1; 
    <font color=blue>else</font> 
         Res[pos] = '?'; 
         pos = pos - 1; 
<font color=blue>end</font> <font color=blue>while</font>; 
</pre>
<p/>
Now we need to implement the <b>checkUnrepeatable</b> function.<br/>
<br>
Note, that in our algorithm if <b>checkUnrepeatable</b>(<i>pos</i>), where pos &gt; 0, is called, then <b>checkUnrepeatable</b>(<i>pos-1</i>)
is true. So, we only need to try all the subwords with length 1, 2, .., (<i>pos</i>+1) / k that end at position <i>pos</i>.

For clarity, see the picture below:
<p/>
<div align="center">
<img src="/i/srm/srm323/unrepeat.jpg" alt="unrepeat"/>
</div>
<p/>
Here, for k=3 and pos=8 possible length of the subword could be 3, 2 or 1.
<p/>
For every possible length we need to check whether all <i>k</i> subwords are the same. A good optimization is to
compare all the first characters of these words, then all the second characters and so on. The comparison of <i>k</i> characters
can be done at <i>O(k)</i>. So the whole <b>checkUnrepeatable</b> will 
take at most <i>O(pos^2)</i>.             
<br>
<br>
It took <tc-webtag:handle coderId="22653739" context="algorithm"/> less then 11 minutes to accomplish this approach. See his <a 
href="/stat?c=problem_solution&rm=250049&rd=10003&pm=6603&cr=22653739">solution</a> 
for clear implementation.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6782&amp;rd=10003" name="6782">Survived</a></b> </font> <A href="Javascript:openProblemRating(6782)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505998" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      215 / 452 (47.57%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      40 / 215 (18.60%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>wd.h</b> for 433.46 points (11 mins 29 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      306.92 (for 40 correct submissions) 
    </td>
  </tr>
</table></blockquote>

<p>
Let <b>V</b> be our own velocity and <b>U</b> be the velocity of the ocean stream, and we are supposed to reach point (<b>x</b>, <b>y</b>).
<p/>
First of all, let's consider all corner cases.
If <b>x</b> = <b>y</b> = 0 return 0, else if
<b>V</b> = 0 then we still may achieve point (<b>x</b>, <b>y</b>) if <b>x</b> &gt; 0, <b>y</b>=0 and <b>U</b> &gt; 0.
<p/> 
Due to the laws of relative motion, we may consider our own velocity and stream's velocity separately.
Let's suppose that the minimal time necessary to reach the desired 
destination is <i>T</i>.
During this time the stream will move us to point (<b>U</b><i>T</i>, 0). So, the task 
reduces to reachability of point (<b>x</b>, <b>y</b>) from point (<b>U</b><i>T</i>, 0) in time <i>T</i> with speed <b>V</b>.
In other words, we need to solve the equation
<div align="center">
<img src = "/i/srm/srm323/eq1.jpg"/>
</div>
and find its minimal non-negative root.
We can simply obtain the following equation:
<div align="center">
<img src = "/i/srm/srm323/eq2.jpg"/>
</div>

We should consider two general cases. If <i>U = V</i> then this equation is linear and has only one root. In the other case, the equation is quadratic and its discriminant equals:
<div align="center">
<img src = "/i/srm/srm323/eq3.jpg"/>
</div>
We need to check if the discriminant is less than zero (in this case there is no solution), equals to zero (one root) or is greater than zero (two roots). We may choose only positive roots and if no such roots exist there is no solution. If more than one positive root exists we need to choose the smaller one.

See <tc-webtag:handle coderId="22636969" context="algorithm"/>'s <a 
href="/stat?c=problem_solution&rm=250032&rd=10003&pm=6782&cr=22636969">solution</a> for the details.

<p/>
Another approach is based on the Viete's formulas. By making a substitution <i>S=1/T</i> we can 
obtain quadric equation with positive leading coefficient:
<div align="center">
<img src = "/i/srm/srm323/eq4.jpg"/>
</div>

Let's denote coefficients of this equation as <i>A</i>, <i>B</i> and <i>C</i>. If discriminant 
<i>B*B-4*A*C</i> is less than zero, no solution exists. In the other case, 
let <i>s1</i> and <i>s2</i> be the (possible equal) roots of the equation <i>f(S)=0</i>. According to 
Viete's formulas, <i>s1*s2 = C/A</i> and <i>s1+s2 = -B/A</i>. Note, that 
if <i>s1*s2 &lt; 0</i> exactly one positive root exists. In the other case, 
if both <i>s1</i> and <i>s2</i> have the same sign, we need their sum to be 
greater than zero. Since <i>A>0</i>, we only need to demand that or <i>C &lt; 0</i>, 
or <i>C &ge; 0</i> and <i>B &lt; 0</i>. See <tc-webtag:handle coderId="22628829" context="algorithm"/>'s <a 
href="/stat?c=problem_solution&rm=250026&rd=10003&pm=6782&cr=22628829">solution</a> for the details.<br>
<br>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6580&amp;rd=10003" name="6580">RestoreExpression</a></b>
</font>
<A href="Javascript:openProblemRating(6580)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505998" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      48 / 452 (10.62%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      10 / 48 (20.83%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 866.99 points (11 mins 29 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      605.78 (for 10 correct submissions) 
    </td>
  </tr>
</table></blockquote>

<p>
Attention and accuracy are the keys to solve this problem.
First of all, let's parse our "A+B=C" expression and pick out 
three masks: A, B and C. Let's add leading zeroes to make their lengths equal, and denote this length as <i>Len</i>.


To make the implementation easier, let's introduce the <i>can</i>(string 
X, int <i>Pos</i>, char <i>D</i>)
that checks, if it is possible to apply digit <i>D</i> at position <i>Pos</i> to mask X. This function must also
prevent the appearing of leading zeroes.

Now we are going to write recursive <i>solvePosition</i>(int <i>Pos</i>, int <i>ToAdd</i>) function, where <i>Pos</i> is the current position in
masks and <i>ToAdd</i> equls to 0 or 1. It checks, if it's possible to restore the expression "A[<i>Pos</i>..N-1]+B[<i>Pos</i>..N-1]=<i>D</i>C[<i>Pos</i>..N-1]".

<br/>The rough plan of this function looks like this.<p/>
<pre>
<font color=blue>bool</font> <i>solvePosition</i>(<font color=blue>int</font> Pos, <font color=blue>int</font> ToAdd){
    <font color=blue>if</font>(Pos==Len && ToAdd==0){
        <font color=green>we've found a solution!</font>
        l<font color=green>et's check if it's better than those we've already found</font>
        <font color=blue>return</font> true;
    }
    <font color=blue>if</font>(Pos==Len && ToAdd==0)
        <font color=blue>return</font> false;
    <font color=red>// pay attention to the order of the loops!</font>
    <font color=blue>for</font>(<font color=blue>int</font> ci = 9; ci>=0; ci--)<font color=blue>if</font>(can(C, Pos, ci))
        <font color=blue>for</font>(<font color=blue>int</font> ai = 9; ai>=0; ai--)<font color=blue>if</font>(can(A, Pos, ai))
            <font color=blue>for</font>(<font color=blue>int</font> bi = 9; bi>=0; bi--)<font color=blue>if</font>(can(B, Pos, bi)){
                <font color=blue>if</font>(ai+bi == ToAdd*10+ci && <i>solvePosition</i>(Pos+1, 0)){
                    <font color=green>we can take
                    c[Pos] = (ai+bi)%10;
                    a[Pos] = ai;
                    b[Pos] = bi;</font>
                }
                <font color=blue>else</font> <font color=blue>if</font>(ai+bi+1 == ToAdd*10+ci && <i>solvePosition</i>(Pos+1, 1)){
                    <font color=green>we can take
                    c[Pos] = (ai+bi)%10;
                    a[Pos] = ai;
                    b[Pos] = bi;</font>
                }
        }
}
</pre>

Now all we need is just to call <i>solvePosition(0,0)</i>. This solution will work, but too slowly. Fortunately, the following two tricks will make it work almost instant.
First, note that if we've already found the solution for current <i>ci</i> and <i>ai</i> we do not need to check the others,
because they are less than ours. (But we still need to finish the iteration of the <i>bi</i>-loop!)
<br/>
The second trick involves the memoization. Note, that the result of <i>solvePositon</i> call do not depend
on current values of <i>ai, bi</i> and <i>ci</i>. So if it returns false, we'll be able to store this result, and we won't call it again.
(But we still need to make the "true-calls," even if we already know that it will return true!)
Now, it's easy to see that the whole soution will make at most 2^<i>Len</i> calls of <i>solvePosition</i>, which is acceptable.

<p/>
See <tc-webtag:handle coderId="310333" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=250021&rd=10003&pm=6580&cr=310333">solution</a> for a clear implementation.
</p>


<div class="authorPhoto">
    <img src="/i/m/Pawa_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10323773" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
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
