<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
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
<tc-webtag:forumLink forumID="505799" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 285</span><br>Tuesday, January 24, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p> 
Each of the problems presented to the competitors have at least two fundamentally different solutions and this may explain the high success rate even for the harder problems. The Division 1 winner is rem with the highest score for the hard problem. bmerry, wleite and andrewzta placed second to forth correspondingly. marek.cygan who was the first coder to submit a correct solution for the 1000th problem took fifth place.
<br><br>
The Division 2 winner is knuckleslives followed by two newcomers pawko and jackiex.
</p>
 

<H1> 

The Problems 

</H1>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6006&amp;rd=8082" name="6006">BasketsWithApples</a></b> 

</font> 

<A href="Javascript:openProblemRating(6006)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505799" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 

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

      296 / 384 (77.08%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      237 / 296 (80.07%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>fpavetic</b> for 248.66 points (2 mins 5 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      203.60 (for 237 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
The solution for this problem is straightforward. 
Obviously the discarded baskets should have smaller number of apples then 
the remaining. So we just need to sort the baskets and choose the best 
answer for all possible numbers of discarded baskets. 
Here is the sample solution:

<pre>
    public int removeExcess(int[] apples) {
        Arrays.sort(apples);
        int ans = 0;
        for(int i=0; i&lt;apples.length; i++) {
            ans = Math.max(ans, (apples.length - i) * apples[i]);
        }
        return ans;
    }
</pre>
</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6007&amp;rd=8082" name="6007">SentenceSplitting</a></b> 

</font> 

<A href="Javascript:openProblemRating(6007)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505799" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 

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

      90 / 384 (23.44%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      30 / 90 (33.33%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>RodrigoBurgos</b> for 441.83 points (10 mins 35 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      284.21 (for 30 correct submissions) 

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

      273 / 317 (86.12%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      198 / 273 (72.53%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Im2Good</b> for 244.57 points (4 mins 15 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      179.76 (for 198 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
The easiest way to solve the problem is to try all possible values of the 
text width and choose the smallest value which satisfies the problem statement. 
For a given width of the text we can greedy add words to the current line, 
unless their total length exceeds the width. 
After that we put the line break and go to the next line. 
If the total number of lines will not exceed K + 1, 
the width considered satisfying the problem statement. 
The sample solution goes further:
</p>

<pre>
    public int split(String sentence, int K) {
        String[] words = sentence.split(" ");
        for(int ln = 1; ln &lt;= sentence.length(); ln++) {
            if (can(words, K, ln))
                return ln;
        }
        return -1;
    }

    private boolean can(String[] words, int k, int ln) {
        int l = -1;
        for (String s : words) {
            if (l + 1 + s.length() &gt; ln) {
                k--;
                if (k &lt; 0)
                    return false;
                l = s.length();
                if (l  &gt; ln)
                    return false;
            } else {
                l += 1 + s.length();
            }
        }
        return true;
    }

</pre>

<p>
A lot of coders used more complex dynamic programming algorithms, 
calculating for example the answer for all possible substrings and all allowable numbers of lines.
</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=5952&amp;rd=8082" name="5952">OperationsArrangement</a></b> 

</font> 

<A href="Javascript:openProblemRating(5952)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505799" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 

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

      64 / 384 (16.67%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      13 / 64 (20.31%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>michu23</b> for 739.51 points (18 mins 16 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      548.30 (for 13 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
If given sequences contains zero digit, all operators in the result string will be '*', 
because the value of the expression will be minimal possible - zero 
and '*' comes before '+' lexicographically.<br/>
For all other cases it is easy to show that the following 
algorithm is correct. We will iterate from left to right, putting 
the operators and calculating the current result of continuous 
multiplication. If the current digit is B and current product is P, 
we should put the '+' operator if and only if B * P &gt; B + P. 
Here is the solution written by <b>brett1479</b>:
</p>

<pre>
public String arrange(String sequence) { 
    String ret = sequence.charAt(0)+"";
    if (sequence.indexOf("0")!=-1) {
        for (int i = 1; i < sequence.length(); i++) ret += "*" + sequence.charAt(i);
        return ret;
    }
    int acc = sequence.charAt(0)-'0';
    for (int i = 1; i < sequence.length(); i++) {
        char c = sequence.charAt(i);
        if (acc*(c-'0') > acc+(c-'0')) {
            ret += "+"+c;
            acc = c-'0';
        } else {
            ret += "*"+c;
            acc *= c-'0';
        }
    }
    return ret;
}

</pre>

<p>
Dynamic programming solution was also possible for this problem.
</p>
<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=5953&amp;rd=8082" name="5953">RobotTesting</a></b> 

</font> 

<A href="Javascript:openProblemRating(5953)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505799" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 

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

      181 / 317 (57.10%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      132 / 181 (72.93%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>b285714</b> for 449.39 points (9 mins 45 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      319.83 (for 132 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
Let's put one robot to each cell, resulting N*N robots on the grid. 
We will calculate the number of commands all robots will do in total before stop. 
Obviously the answer will be equal to the calculated number of commands divided by the 
number of robots N*N. Each robot will do no more then 50000 moves, so we can calculate 
the number of "live" robots for each move by simulating the process.
</p>
<p>

All "live" robots on each move will form a rectangle, which can be defined by 
coordinates of two opposite vertices. The total number of commands is equal to the 
sum of counts of "live" robots during all steps of simulation.
</p>

<p>
Here is the sample C++ solution by <b>BenjaminHummel</b>:
</p>

<pre>
double estimateCommands(int N, string program) {
 
  long long sum = 0;
  int xmin = 0, xmax = 0, ymin = 0, ymax = 0;
  int x = 0, y = 0;
  int ps = program.size ();
  
  for (int i = 0; i &lt; 50000; ++i) {
    xmin &lt;?= x;
    xmax &gt;?= x;
    ymin &lt;?= y;
    ymax &gt;?= y;
    
    int dx = xmax - xmin;
    int dy = ymax - ymin;
    
    if (dx &gt;= N || dy &gt;= N) break;
    
    sum += (N - dx) * (N - dy);
 
    switch (program[i % ps]) {
      case 'U': ++y; break;
      case 'D': --y; break;
      case 'L': --x; break;
      case 'R': ++x; break;
    }
  }
  
  return (double)sum / (N*N);
}
</pre>
 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=5951&amp;rd=8082" name="5951">Distincter</a></b> 

</font> 

<A href="Javascript:openProblemRating(5951)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505799" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 

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

      30 / 317 (9.46%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      22 / 30 (73.33%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>rem</b> for 835.45 points (13 mins 9 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      629.53 (for 22 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
We will solve the problem using the dynamic programming.
</p>
<p>
First step is to sort the numbers in ascending order. 
After sorting we can assume that performing operations will not change the order of the numbers. 
</p>
<p>
Let's define A(i, j, k) as a number of operations required to make k distinct numbers using 
first i elements so that i-th element is not greater then j.
To calculate A(i, j, k) we should choose best from two choices: 
<ul>
<li> A(i, j-1, k), which means that we are not going to make sequence[i] equals to j;
<li> A(i-1, j-1, k-1) + abs(sequence[i] - j), which means that we are going to make sequence[i] equals to j in order to increase number of distinct numbers and abs(sequence[i] - j) is a number of operations required to make sequence[i] be equal to j.

</ul>
</p>
<p>
So the final formula is:
<div align="center">A(i, j, k) = min(A(i, j-1, k), A(i-1, j-1, k-1) + abs(sequence[i] - j))</div>

</p>
<p>
As a sample solution you can take the fastest coded solution by <b>rem</b>.
</p><div class="authorPhoto">
    <img src="/i/m/Andrew_Lazarev_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="7485898" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
