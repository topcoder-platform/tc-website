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
    <A href="/stat?c=round_overview&er=5&rd=10665">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506231" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 341</span><br>Saturday, March 10, 2007
<br><br>



<h2>Match summary</h2> 

 

<p> 

In division 1, the easy problem was easier than 
usual, so most coders solved it quickly. In the coding phase, only ten coders 
found the solution to the hard problem, but nine of them failed the testing 
phase. The yellow coder, 
<tc-webtag:handle coderId="22652597" context="algorithm"/>, passed the 
systest and won the SRM for the first time.</p>
<p>In division 2, the hard problem was so tough that most coders failed to solve 
it. Only a new member, 
<tc-webtag:handle coderId="22675367" context="algorithm"/>, managed to solve all 3 problems 
and won division.

</p> 

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7585&amp;rd=10665" name="7585">ChangingString</a></b> 

</font> 

<A href="Javascript:openProblemRating(7585)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506231" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      601 / 694 (86.60%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      472 / 601 (78.54%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>vanessa</b> for 248.25 points (2 mins 23 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      191.83 (for 472 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This is just a greedy problem. Obviously, to gain the 
minimal possible target the distance between each letter in A, after 
changed, and the corresponding letter in B must be 0 (if they are different 
from each other) or 1 otherwise.</p>
<p>We choose K letters in A that have K maximal distance with 
K corresponding letters in B and change them in that way.</p>
<p>Java code follows:</p>
<pre>
public int distance(String A, String B, int K) {
    int n = A.length();
    int[] a = new int[n];
    for(int i=0;i&lt;n;i++) a[i] = Math.abs((int)A.charAt(i)-(int)B.charAt(i));
    Arrays.sort(a);
    int ans = 0;
    for(int i=0;i&lt;n-K;i++) ans+=a[i];
    for(int i=n-K;i&lt;n;i++) ans+=a[i] == 0 ? 1 : 0;
    return ans;
}
</pre>

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7397&amp;rd=10665" name="7397">KLastNonZeroDigits</a></b> 

</font> 

<A href="Javascript:openProblemRating(7397)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506231" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      573 / 694 (82.56%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      478 / 573 (83.42%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>vanessa</b> for 496.21 points (2 mins 29 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      385.37 (for 478 correct submissions) 

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

      539 / 544 (99.08%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      497 / 539 (92.21%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>mirosuaf</b> for 249.66 points (1 mins 3 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      227.45 (for 497 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This one was easier than the usual Div1 Easy or &nbsp;Div2 
Medium problem. Considering the small constraint of N, most coders were confident 
in solving this with the iterative approach. </p>
<p>Java code follows:</p>
<pre>
public String getKDigits(int N, int K) {
    long f = 1;
    for(long i=1;i&lt;=N;i++)f *=i;
    String s = String.valueOf(f);
    while(s.endsWith(&quot;0&quot;)) s = s.substring(0, s.length() - 1);
    return s.length() &lt;= K ? s : s.substring(s.length() - K);
}
</pre>

<p>The problem will be a little tougher if the constraint of N 
is changed into 10^6.

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7512&amp;rd=10665" name="7512">LandAndSea</a></b> 

</font> 

<A href="Javascript:openProblemRating(7512)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506231" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1050 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      26 / 694 (3.75%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1 / 26 (3.85%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>vanessa</b> for 457.68 points (48 mins 19 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      457.68 (for 1 correct submission) 

    </td> 

  </tr> 

</table></blockquote> 

 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      550 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      250 / 544 (45.96%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      73 / 250 (29.20%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>gozman</b> for 359.52 points (23 mins 28 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      250.35 (for 73 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The solution can be split into 
two parts - generating a tree with nodes considered as&nbsp; islands and seas and 
finding the number of islands of each level. In generating a tree, we 
will add covering waters '.' as the boundary of the map. We use the flood fill 
to find all seas and islands. The sea connected with the boundary element is 
defined as the root of the tree. From each visited sea we will visit unvisisted 
islands if they have at least one element vertically or horizontally adjacent to 
any element of the sea. From each visited island we will visit unvisisted seas if 
they have at least one element vertically, horizontally, or diagonally adjacent 
to any element of the island.</p>
<pre>                    ...............<font color="#0000FF">          <strong>000000000000000</strong>
</font>xxx.x...xxxxx       .xxx.x...xxxxx.<font color="#0000FF">          <strong>0</strong></font><strong><font color="#FF0000">111</font><font color="#0000FF">0</font><font color="#FF0000">1</font><font color="#0000FF">000</font><font color="#FF0000">22222</font></strong><font color="#0000FF"><strong>0</strong></font>
xxxx....x...x       <font color="#0000FF">.</font>xxxx....x...x.<font color="#0000FF">          <strong>0</strong></font><strong><font color="#FF0000">1111</font><font color="#0000FF">0000</font><font color="#FF0000">2</font><font color="#0000FF">000</font><font color="#FF0000">2</font>0</strong>
........x.x.x       .........x.x.x.<font color="#0000FF">          <strong>00</strong></font><strong><font color="#0000FF">0000000</font><font color="#FF0000">2</font><font color="#0000FF">0</font><font color="#FF0000">3</font><font color="#0000FF">0</font><font color="#FF0000">2</font></strong><font color="#0000FF"><strong>0</strong></font>
..xxxxx.x...x       ...xxxxx.x...x.<font color="#0000FF">          <strong>00</strong></font><strong><font color="#0000FF">0</font><font color="#FF0000">44444</font><font color="#0000FF">0</font><font color="#FF0000">2</font><font color="#0000FF">000</font><font color="#FF0000">2</font></strong><font color="#0000FF"><strong>0</strong></font>
..x...x.xxx.x   -&gt;  ...x...x.xxx.x.<font color="#0000FF">   -&gt;     <strong>00</strong></font><strong><font color="#0000FF">0</font><font color="#FF0000">4</font><font color="#0000FF">666</font><font color="#FF0000">4</font><font color="#0000FF">0</font><font color="#FF0000">222</font><font color="#0000FF">0</font><font color="#FF0000">2</font></strong><font color="#0000FF"><strong>0</strong></font>
..x.x.x...x..       ...x.x.x...x...          <font color="#0000FF"><strong>0</strong></font><strong><font color="#0000FF">00</font><font color="#FF0000">4</font><font color="#0000FF">6</font><font color="#FF0000">7</font><font color="#0000FF">6</font><font color="#FF0000">4</font><font color="#0000FF">000</font><font color="#FF0000">2</font><font color="#0000FF">000</font></strong>
..x...x...xxx       ...x...x...xxx.<font color="#0000FF">          <strong>00</strong></font><strong><font color="#0000FF">0</font><font color="#FF0000">4</font><font color="#0000FF">666</font><font color="#FF0000">4</font><font color="#0000FF">000</font><font color="#FF0000">222</font></strong><font color="#0000FF"><strong>0</strong></font>
...xxxxxx....       ....xxxxxx.....<font color="#0000FF">          <strong>00</strong></font><strong><font color="#0000FF">00</font><font color="#FF0000">444444</font><font color="#0000FF">0000</font></strong><font color="#0000FF"><strong>0</strong></font>
x............       .x.............<font color="#0000FF">          </font><strong><font color="#0000FF">0</font><font color="#FF0000">5</font><font color="#0000FF">000000000000</font></strong><font color="#0000FF"><strong>0</strong></font>
                    <strong>...............<font color="#0000FF">          000000000000000</font></strong></pre>
<p>In the picture above, connected groups 0 and 6 are seas and connected groups are islands. 
The root 0 has children 1, 2, 3, 4, 5. The node 4 has a child 6(a sea). 
The sea 6 has a child 7(an island).</p>
After creating the tree, it is easy to find the number of islands of each level 
as following. Any island or sea that have no child will be defined as level 1 
and 0, respectively. The level of each island is defined as the maximum level 
of all its own children plus 1 and the level of each sea is defined as the 
maximum level of all its own children. 
<p>See the
<a href="http://www.topcoder.com/stat?c=problem_solution&rm=263824&rd=10665&pm=7512&cr=310333">
kalinov' solution</a> for an implementation of this approach. </p>
<p>See also
<a class="coderTextRed" href="http://www.topcoder.com/stat?c=problem_solution&cr=13351270&rd=10665&pm=7512">
Vasyl(alphacom)' solution</a>&nbsp;
for a nice recursive approach.

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6876&amp;rd=10665" name="6876">ValidPlates</a></b> 

</font> 

<A href="Javascript:openProblemRating(6876)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506231" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      9 / 544 (1.65%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1 / 9 (11.11%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>xhl_kogitsune</b> for 395.08 points (59 mins 49 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      395.08 (for 1 correct submission) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

If the plates stayed reasonably short, this is a straightforward
dynamic programming problem. The example with the very long plate
should indicate that a bit more is required, however.
Specifically, if we attempt a dynamic programming approach, with
our state being the length of the plate and the first character in
the plate, and our value being the count of plates with those
characteristics, our runtime would be O(length*digits^2) which
is too high. Nonetheless it is instructive to examine the
dynamic programming solution and see how we can improve it.
</p><p>
The dynamic programming solution is straightforward. Expressed
as a recursion, we have:
</p>
<pre>
long count(int len, char firstdigit) {
    if (len == 1)
        return 1 ;
    else {
        long r = 0 ;
        for (char d : digits)
            if (legal[firstdigit][d])
                r += count(len-1, d) ;
        return r ;
    }
}
</pre>
</p><p>
Like many dynamic programming problems of this sort, the
code above is essentially matrix multiplication, with the
condition on legal replaced by multiplication by an entry in
a matrix that is either 0 or 1. That is, the above code can
be rewritten to compute all the digits in parallel using
the following code:
</p>
<pre>
long[][] counts(int len) {
    if (len == 1)
        return new long[][] {{1}, {1}, {1}, {1}, ..., {1}} ;
    else
        return matrixmul(legal, counts(len-1)) ;
}
</pre>
<p>
where legal is a 0/1 matrix representing the legal sets of
digits. Since we're just using matrix multiplication, we can
of course convert this to a simple matrix exponentiation
routine that will give us the counts at any length very quickly.
</p><p>
We need to avoid iterating over the possible lengths, however,
since the final length can be quite high. We'd rather use a
binary search. But our count vector contains only the values
at a particular length. One way to solve this issue is to
introduce an eleventh digit, lexicographically before all the
others; we'll use 'X' here. Then, when considering the length
three plates, for instance, all length two plates will be
included, but preceded by 'X'. Similarly, all length one plates
will be included, preceded by two 'X's. If we do this, one
computation will tell us the total number of plates of a given
length and smaller. We have to extend our "legal" matrix with
an eleventh row and column; we do not permit 'X' to come after
anything but another 'X', and we never allow an 'X' to precede
a '0'.
</p><p>
With this improvement, we can use binary search to calculate the
length. When computing the count matrix at a length len, if the
number of plates starting with 'X' is greater than our sequence
number, we know we're too high. If the sum of plates at that
length is greater than our sequence number, we're at the correct
length. Otherwise we're too low.
</p><p>
Once we have the length, we can compute the digits one by one
by simply iterating over the potential starting digits,
determine the starting sequence of the plate with each starting
digit by accumulating values from the matrix, and figuring out
where our sequence number fits. Then we can subtract the count
of plates with all prior digits from our sequence number, and
move on to the next digit.

</p>







<div class="authorPhoto">
    <img src="/i/m/radeye_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10596762" context="algorithm"/> &amp; <tc-webtag:handle coderId="277659" context="algorithm"/><br />
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
