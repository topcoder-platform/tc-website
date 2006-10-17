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
<tc-webtag:forumLink forumID="505795" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 281</span><br>Thursday, January 5, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>
SRM 281 proved to be very challenging for most competitors and sported low success rates on all but one problem. Congratulations to <b>Petr</b> for coming out on top of division 1, despite having to resubmit the hard problem. <b>andrewzta</b> and <b>misof</b> followed closely in second and third.
</p> 

<p>
Coders in division 2 faced tricky easy and medium problems, but a relatively easy 900-pointer which more than 150 competitors got right. <b>P_YegreS_P</b> won the match with all three successful submissions and 4 challenges for a rating boost of almost 200 points and a chance to participate in division 1 for the first time.
</p>

<H1> 
The Problems 
</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5983&amp;rd=8078" name="5983">RunLengthEncoding</a></b> 
</font> 
<A href="Javascript:openProblemRating(5983)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505795" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      357 / 396 (90.15%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      186 / 357 (52.10%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>jakub</b> for 245.31 points (3 mins 56 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      187.56 (for 186 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 
<p>
<p>As illustrated by the examples, there's a little more to this problem than it may seem at first glance: the decoded string can get very long (much longer than we can fit into memory) so it will not suffice to just reconstruct the string and then check if the result is too long. To avoid this, we can observe that the result will surely be too long if any three consecutive characters in the input are decimal digits. After we've made sure that this isn't the case, the result can become no longer than about 1600 characters, which will easily fit into memory. The rest of the problem is string manipulation.</p>

<p>Alternatively, the problem can be solved in one pass using Horner's method of parsing integers from strings left to right. It starts from zero and, as each new digit is processed, multiplies the number by 10 and adds the new digit. This way we can detect large integers early enough and bail out. Here's how it could have looked in C++:</p>

<pre>   string decode( string text )
   {
      string ret;
      int rep = 0;
      for ( int i=0; i&lt;(int)text.length(); ++i ) {
         if ( isdigit( text[i] ) ) {
            // new digit, continue building integer
            rep = rep*10 + ( text[i] - '0' );
            if ( rep &gt; 50 )
               return "TOO LONG";
         }
         else {
            // letter, append rep occurences to the return
            if ( rep &lt; 1 ) rep = 1;
            if ( ret.length() + rep &gt; 50 )
               return "TOO LONG";
            
            ret += string( rep, text[i] );
            rep = 0;
         }            
      }

      return ret;
   }</pre>

</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5984&amp;rd=8078" name="5984">IntegerGenerator</a></b> 
</font> 
<A href="Javascript:openProblemRating(5984)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505795" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      291 / 396 (73.48%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      52 / 291 (17.87%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>jianqinf</b> for 425.21 points (12 mins 22 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      280.75 (for 52 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 

Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      333 / 345 (96.52%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      166 / 333 (49.85%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>bmerry</b> for 239.33 points (6 mins 3 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      184.51 (for 166 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 
<p>
<p>The constraints were set up so that an approach which repeatedly increases the current number until it runs into a valid number was sure to time out (such an algorithm can take about 90 billion steps in the worst case). A good rule of thumb which helps avoid failure by timeout is to always test your solution on large cases, regardless of the point value of the problem.</p>

<p>A much more efficient algorithm parallels how we increase a decimal number (on paper, say): we add 1 to the last digit and if it was 9, set it to 0, carry 1 to the left and repeat. The same algorithm can be generalized and applied here: change the last digit to the next smallest allowed digit. If the last digit was already the largest possible, instead set it to the smallest allowed and proceed with the second last digit etc.</p>

<p>Another approach coders tried was (if allowed contains B digits) to interpret the input as a base-B integer (which fits into a 64-bit integer type), increase it by one and then convert back. There were many tricks to this, such as leading zeros in the base-B representaion. Most successful submissions used the first algorithm.</p>

<p>One more common mistake was failing to notice that, while the input number was at most 10 digits long, the output could be 11 digits. Examples 4 and 6 in the problem statement served as hints for this case.</p>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5869&amp;rd=8078" name="5869">BinarySearchable</a></b> 

</font> 
<A href="Javascript:openProblemRating(5869)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505795" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      900 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      200 / 396 (50.51%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      162 / 200 (81.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>fengjun</b> for 888.25 points (3 mins 16 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      733.65 (for 162 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 
<p>
<p>The pseudo-code in the problem statement can be directly converted into a dynamic programming solution. For each element X and pair of indices a and b, calculate f(X, a, b), a boolean function which returns true if X would be found in the subsequence of the original sequence represented by indices a and b. To calculate f(X, a, b) for some X, a and b, we try all possible choices of pivots and recursively evaluate f, with the new a and b depending on X and the pivot. If X would be found for all choices of pivots, then f(X, a, b) is true. Caching the results yields a <i>O</i>(n<sup>4</sup>) algorithm, which will easily do.</p>

<p>Most (if not all) competitors who successfully solved the problem recognized a much simpler (and more efficient) solution. It is easy to prove that an element X is not binary searchable if and only if there is an element before X larger than it or if there is an element after X smaller than it. What follows is a simple <i>O</i>(n<sup>2</sup>) algorithm which can even be improved to <i>O</i>(n) with a little preprocessing.</p>

<pre>   public int howMany( int[] sequence )
   {
      int ret = 0;
      for ( int i=0; i&lt;sequence.length; ++i ) {
         boolean ok = true;
         for ( int j=0; j&lt;i && ok; ++j )
            if ( sequence[j] &gt; sequence[i] )
               ok = false;

         for ( int j=i+1; j&lt;sequence.length && ok; ++j ) 
            if ( sequence[j] &lt; sequence[i] )
               ok = false;

         if ( ok )
            ++ret;
      }
      
      return ret;
   }</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5919&amp;rd=8078" name="5919">BallBouncing</a></b> 
</font> 
<A href="Javascript:openProblemRating(5919)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505795" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      600 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      87 / 345 (25.22%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      35 / 87 (40.23%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>KOTEHOK</b> for 461.15 points (16 mins 40 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      305.65 (for 35 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 
<p>
<p>With a board of size at most 1000000x1000000, a straightforward simulation (step by step) would time out so a different approach was required. One important observation is that, given the current position and direction of the ball, it is possible to determine where it will bounce next (position and direction) in <i>O</i>(1) time using arithmetic. If we're able to determine a reasonable upper bound on the number of bounces then a simulation bounce by bounce will be fast enough. One such upper bound is 8 million bounces, because there are about 4 million boundary points in the worst case and the ball can enter each boundary point from two directions. As it turns out, 4 million bounces was also good enough (see the analysis by members in the forum for this match). Additionally, by the pigeonhole principle, if the ball does that many bounces then it has surely visited some state twice and thus run into a cycle, so we can return -1.</p>

<p>One implementation detail was checking whether the ball will fall into a hole before the next bounce. It was intended that this check be done in <i>O</i>(1) time rather than in <i>O</i>(holes), although coders got away with the latter. An important observation is that the expression row-col is constant for all squares on a single "slash" diagonal (line with slope +1). Similarly, all squares on a "backslash" diagonal (line with slope -1) have constant row+col. By preprocessing the holes (keeping track of which diagonals have holes on them) it is possible to do the check in <i>O</i>(1) time during the simulation. See <a href="http://www.topcoder.com/stat?c=problem_solution&rm=247294&rd=8078&pm=5919&cr=10574855">Petr's solution</a> for a clean implementation.</p>

</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5949&amp;rd=8078" name="5949">Equidistance</a></b> 
</font> 
<A href="Javascript:openProblemRating(5949)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505795" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      68 / 345 (19.71%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      23 / 68 (33.82%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Egor</b> for 872.30 points (11 mins 12 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" xstyle="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" xstyle="background: #eee;"> 
      610.28 (for 23 correct submissions) 
    </td> 
  </tr> 

</table></blockquote> 
<p>

<p>The division 1 hard problem was quite mathy and required a lot of intuition to solve. I'll try and go about describing how to solve the problem and prove claims along the way. To simplify things, let's make a few definitions: we are given a sequence of integers a<sub>1</sub>, a<sub>2</sub> &#8230; a<sub>n</sub>, sorted in ascending order (sorting is the first step in the solution which, unfortunately, some coders missed). What we are to find is a sequence &delta;<sub>1</sub>, &delta;<sub>2</sub> &#8230; &delta;<sub>n</sub> (where &delta;<sub>i</sub> is how much we move item i; the difference between its positions after and before) such that a<sub>i</sub>+&delta;<sub>i</sub> - (a<sub>i-1</sub>+&delta;<sub>i-1</sub>) equals some constant <i>D</i> for all positive i and the sum of all abs(&delta;<sub>i</sub>) is minimal.</p>

<p>The first osbservation is that there exists an optimal arrangement (arrangement with the smallest possible total effort) in which at least one of the items does not move. This can be proven by contradiction: assume that all optimal arrangements have no items which don't move. But then, if we take any such optimal arrangement, we can move all of the items left by one or right by one without increasing the cost. If we continue moving the items in that direction, we will eventually run into an arrangement in which at least one of the items is fixed (and the effort is no greater than that of the starting optimal arrangement).</p>

<p>One wrong assumption some coders made is that an optimal arrangement exists in which at least two of the items remain fixed. While this would be true if the items' positions could be real numbers, it isn't in this problem.</p>

<p>The next part of the solution is to show that for a fixed item a<sub>f</sub> (&delta;<sub>f</sub>=0) and a chosen <i>D</i>, the positions of all the other items are uniquely determined. This should be obvious and the actual formula to calculate &delta;<sub>i</sub> is &delta;<sub>i</sub> = a<sub>f</sub> + (i-f)<i>D</i> - a<sub>i</sub>.</p>

<p>What's left is to analyze how total effort changes with <i>D</i> (when one item is fixed). As we said, total effort is the sum of abs(&delta;<sub>i</sub>) for each i. But each of these component functions is, according to the formula from the previous paragraph, a "spike" (it would be a line if it weren't for the absolute value) with slope abs(i-f). Since this function is convex and the sum (actually, any linear combination with positive coefficients) of convex functions is also a convex function, the sum is also unimodal (decreases, reaches minimum, then increases again) and we can use ternary search to find the minimum. A number of successful submissions used this approach, for example those by <b>misof</b> and <b>John Dethridge</b>.</p>

<p>An alternate solution is to go even deeper into analyzing the function and prove that the minimum must be somewhere around (ceil or floor) the minima (spikes) of the component functions (if real numbers were allowed, then the total minimum would be exactly at the minimum of one of the component functions). The formal proof for this is similar to what we used in the first observation. This solution takes <i>O</i>(n<sup>3</sup>) time. <b>Petr</b> and <b>andrewzta</b> are among those who used this approach during the contest. Here is the code which implements this approach:</p>

<pre>   long effort( int[] initial, int fixed, long D )
   {
      if ( D &lt; 1 ) D = 1;
      
      long ret = 0;
      for ( int k=0; k&lt;initial.length; ++k )
         ret += Math.abs( initial[fixed] + (k-fixed)*D - initial[k] );
      return ret;
   }
   
   public long minimumEffort( int[] initial )
   {
      Arrays.sort( initial );
      long best = Long.MAX_VALUE;

      int n = initial.length;
      for ( int i=0; i&lt;n; ++i )
         for ( int j=0; j&lt;n; ++j ) {
            double D = (double)( (long)initial[j] - initial[i] ) / (j-i);

            best = Math.min( best, effort( initial, i, (long)Math.floor(D) ) );
            best = Math.min( best, effort( initial, i, (long)Math.ceil(D) ) );
         }

      return best;
   }
}</pre>

</p><div class="authorPhoto">
    <img src="/i/m/lovro_mug.gif" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="7390467" context="algorithm"/><br />
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
