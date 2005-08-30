<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
 <xsl:import href="../top.xsl"/>
 <xsl:import href="../script.xsl"/>
 <xsl:import href="../includes/body_top.xsl"/>
 <xsl:import href="../foot.xsl"/>
 <xsl:import href="../includes/modules/srm_results.xsl"/>
 <xsl:import href="../includes/modules/white_last_srm.xsl"/>
 <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
 <xsl:import href="../includes/modules/coder_week2.xsl"/>
 <xsl:import href="../includes/modules/practice_room.xsl"/>
 <xsl:import href="../includes/modules/calendar.xsl"/>
 <xsl:import href="../includes/modules/top_room_wins.xsl"/>
 <xsl:import href="../includes/global_left.xsl"/>
 <xsl:import href="../includes/public_right_col.xsl"/>
 <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
 <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<title>Single Round Match 190 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

<script>
function openWin(url, name, w, h) {
 win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
 win.location.href = url;
 win.focus();
}
</script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">

<!-- Left Column Begins -->
     <td width="170" bgcolor="#FFFFFF">
         <xsl:call-template name="global_left"/>
     </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
     <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
     <td class="bodyText" width="100%">
         <xsl:call-template name="BodyTop">
             <xsl:with-param name="image1">white</xsl:with-param>
             <xsl:with-param name="image">statisticsw</xsl:with-param>
             <xsl:with-param name="title">Last Match Editorials</xsl:with-param>
         </xsl:call-template>

         <table border="0" cellspacing="10" cellpadding="0" width="100%">
         <tr valign="top">
                 <td class="bodyText" width="100%">

<!--body contextual links-->
                     <table width="100%" border="0" cellspacing="0" cellpadding="3">
                         <tr valign="middle">
                             <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 190</font></td>
                             <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                         </tr>

                         <tr valign="middle">
                             <td class="bodyText">Tuesday, April 6, 2004</td>
                             <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                         </tr>
                     </table>
<!--end contextual links-->

<h2>Match summary</h2> 

<p> 
The last match before the TCCC may not have been the warm-up that competitors were looking for, as division 1 had one of the hardest sets in recent memory -- only 10 competitors solved more than 1 problem.  Of those, tomek, bladerunner and Klinck were the only coders to solve all 3 problems, taking 1<sup>st</sup>, 2<sup>nd</sup> and 3<sup>rd</sup>, respectively.  In division 2, coders had it a bit easier, with most coders solving the easy, and over half solving the medium.  First timer kaylin took first by less than a point over Artist_, while long time TopCoder, Uranium-235, rounded out the top 3.
</p> 
  
<p>
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2341&amp;rd=4770">ScoringEfficiency</a></b> 
</font> 
<A href="Javascript:openProblemRating(2341)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      156 / 172 (90.70%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      148 / 156 (94.87%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>NeverMore</b> for 243.67 points (4 mins 36 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      190.96 (for 148 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
A fitting problem to follow March Madness.  In order to calculate the points per shot, you need to know 3 things: the total number of points, the number of free throws attempted, and the number of field goals attempted.  The simplest way to find all of these is to just have 6 separate cases, one for each possible value of the elements.  Clearly, you should just copy and paste these strings from the problem statement, since typing them in yourself is a good way to introduce typos.  That was by far the most common solution, and pretty much everyone got it right.  There are a few ways in which you could get clever if you really wanted to, but with only 6 cases to deal with, coding each one up is pretty simple.<br/><br/>If you want to see how this metric works in the NBA (or how it worked in the '00-'01 season), check <a href="http://www.grad.cgu.edu/~andersoj/Abb_pps.htm">this</a> out.
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2343&amp;rd=4770">Hangman</a></b> 
</font> 
<A href="Javascript:openProblemRating(2343)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      122 / 172 (70.93%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      83 / 122 (68.03%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SamBob</b> for 462.54 points (8 mins 13 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      324.84 (for 83 correct submissions) 
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
      153 / 158 (96.84%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      129 / 153 (84.31%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>antimatter</b> for 246.85 points (3 mins 13 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      213.20 (for 129 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This is a bit tougher than it looks at first glance.  Its pretty simple to verify that the characters which have been revealed so far match up. But then you have to make sure that there isn't a letter, some of whose instances have been revealed, and some of whose instances have not.  Lets consider a method, matches, which takes strings feedback and word, and returns true if word matches the feedback.  Once we have this part written, we're 90% done.  The first thing we want to do is make sure the strings are the same length.  Assuming they are, we look at each character in word.  If a character is in word, opposite a '-' in feedback, then we need to make sure the same character doesn't appear anywhere in feedback.  If the corresponding character in feedback isn't a '-', we just check that they match:
<pre>
   boolean matches(feedback,word)
      if(lengthof(feedback)!=lengthof(word))return false;
      for (i = 1 to lengthof(feedback))
         if (feedback<sub>i</sub> == '-')
            if(feedback.containsCharacter(word<sub>i</sub>))
               return false
            endif
         else 
            if(feedback<sub>i</sub> != word<sub>i</sub>)
               return false
            endif
         endif
      end for
      return true
   end
</pre>
Once we have this written, the rest of the solution is just a matter of checking each word.  If there are zero that match, or more than one that matches, return "", otherwise return the matching word.
<br/><br/>
An alternative solution uses regular expressions to do the matching.  A '-' can be any character that doesn't appear in feedback, so, we can build a regular expression out of feedback as follows (in Java):
<pre>
   String letters = feedback.replaceAll("-","");
   String regex = feedback.replaceAll("-","[^"+letters+"9]");
</pre>
Then, matching is exactly identical to regular expression matching.  Note that the '9' is not a typo, but is neccessary to make are regular expression valid if letters = "".
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2363&amp;rd=4770">Homomorphism</a></b> 
</font> 
<A href="Javascript:openProblemRating(2363)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      12 / 172 (6.98%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      5 / 12 (41.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Uranium-235</b> for 605.98 points (26 mins 55 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      473.17 (for 5 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem is a bit easier than it looks.  Behind all the big fancy words, the algorithm is relatively simple.  Basically, we need to find h(0) and h(1) so that if we simultaneously replace all of the 0's in <tt>u</tt> with h(0) and all of the 1's in <tt>u</tt> with h(1), we get v.  Now, without any loss of generality, lets say that the first character of <tt>u</tt> is a '1'.  Then, h(1) needs to be the first i characters of v, for some i >= 1.  Thus, there are O(n) possibilities of h(1).  Now, to find h(0), we can just try every substring of v, of which there are O(n<sup>2</sup>).  This gives us O(n<sup>3</sup>) combinations of h(0) and h(1) to consider.  Finally, to check a given h(0) and h(1), we can just do it in the obvious way: intiialize tmp = "", iterate over characters of u, and append h(0) or h(1) to tmp, depending on the character in u.  This adds another factor of n to your runtime, and you end up with an O(n<sup>4</sup>) algorithm:
<pre>
   set validPairs;
   foreach potential h(0), h(1) pair
      tmp = ""
      for (i = 1 to lengthof(u))
         if(u<sub>i</sub> == 0)
            tmp = tmp + h(0)
         else
            tmp = tmp + h(1)
         endif
      end for
      if(tmp == v)
         validPairs.add(h(0),h(1))
      endif
   endfor
   return validPairs.size()
</pre>
The algorithm above is O(n<sup>4</sup>).  This is good enough, but its a bit slow.  It turns out we can do as well as O(n<sup>2</sup>).  Lets continue to assume that <tt>u</tt> starts with a '1'.  First, we count the number of 0's and 1's in <tt>u</tt>, <tt>z</tt> and <tt>o</tt>, as well as the number of leading ones, <tt>leading</tt>.  Now, we know that <tt>z*|h(0)| + o*|h(1)| == |v|</tt>.  Thus, given h(1), we can find the length of h(0).  Since <tt>u</tt> starts with <tt>leading</tt> ones, the first <tt>leading * |h(1)|</tt> characters of <tt>v</tt> are accounted for.  The next <tt>|h(0)|</tt> characters in <tt>v</tt> make up h(0).  Thus, we can find all potential <tt>h(0)</tt>, <tt>h(1)</tt> pairs in time O(n), and we can then check the pair against <tt>v</tt> in time O(n), for O(n<sup>2</sup>) total.  Can anyone do better?

</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2344&amp;rd=4770">AlienMultiplication</a></b> 
</font> 
<A href="Javascript:openProblemRating(2344)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      600 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      20 / 158 (12.66%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      8 / 20 (40.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tomek</b> for 377.76 points (25 mins 8 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      286.54 (for 8 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem was pretty hard, but when it comes down to it, its just brute force with some pruning.  First off, note that the answer is at most 6, since we can just change the 6 digits of c.  So, as we are changing digits, if we ever get to 5, and still aren't done, then we shouldn't bother to change any more.  Once we figure that out, we should work from right to left.  Once we have the rightmost (ones) digits of a, b and c fixed, and <tt>(a*b)%10 == c%10</tt>, the next digit to  the left can no longer mess up what we already have.  That is, regardless of what we do to the hundreds digits of a, b and c, we will still have <tt>(a*b)%10 == c%10</tt>.  This suggest a recursive solution, where we first change the tens digits then the hundreds digits, and so on.  We stop recursing if we have ever made 5 or more changes, and aren't done yet.  Also, to make things a bit quicker, once we have changed the digits of a and b in a particular place, we can tell right away what the corresponding digit of c should be.  Here is dgarthur's solution, where pow10 is an array with powers of 10.
<pre>
   int bestErrors = 6;
   void recursiveCorrect(long a, long b, long c, int pos, int errors)
   {
      if ((a*b-c)%pow10[6]==0 &amp;&amp; errors&lt;bestErrors){
         bestErrors = errors;
         return;
      }
      if (errors &gt;= bestErrors-1) return;
      
      for (int d1 = 0; d1 &lt; 10; d1++)
      for (int d2 = 0; d2 &lt; 10; d2++){
         int newErrors = errors;
         long newA = setDigit(a,pos,d1);
         long newB = setDigit(b,pos,d2);
         if (a != newA) newErrors++;
         if (b != newB) newErrors++;
         int d3 = (int)getDigit(newA*newB,pos);
         long newC = setDigit(c,pos,d3);
         if (c != newC) newErrors++;
         recursiveCorrect(newA, newB, newC, pos+1, newErrors);
      }
   }
</pre>
Now, there is clearly some concern that this solution might timeout.  We are changing at most 5 out of 18 digits, and there are 10 possibilities for the new value of each digit.  This gives us an upper bound of C(18,5)*10<sup>5</sup> = 8.6E8, which is too many.  However, in reality, the number is much smaller, since most changes to digits in a or b will also require a change in c.  A solution following this algorithm should run in well under a second.
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2342&amp;rd=4770">SquareFree</a></b> 
</font> 
<A href="Javascript:openProblemRating(2342)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      16 / 158 (10.13%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      6 / 16 (37.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tomek</b> for 800.51 points (14 mins 58 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      620.46 (for 6 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Let's start by counting the number of square free integers less than or equal to <tt>k</tt>, for some <tt>k</tt>.  Instead of doing this directly, we'll calculate the number of integers less than or equal to <tt>k</tt> that have a perfect square as a factor, and subtract this from <tt>k</tt>.  If an integer has a perfect square as a factor, then it has the square of a prime as a factor, since any square can be broken up into the product of some primes squared.  Therefore, we only need to count the integers with squares of primes as factors.  Consider the number of integers less than or equal to <tt>k</tt> with 4 as a factor (4 is the square of 2).  Every 4<sup>th</sup> number has 4 as a factor, so there are <tt>floor(k/4)</tt> integers with 4 as a factor.  Similarly, there are <tt>floor(k/9)</tt> integers with 9 as a factor.  However, we can't just add these together to get the number of integers with 4 or 9 as factors, since we would end up counting the integers with 36 as a factor twice (the have both 4 and 9 as factors).  The simplest way to deal with this is to use the <a href="http://mathworld.wolfram.com/Inclusion-ExclusionPrinciple.html">Inclusion-Exclusion Principle</a>.  To avoid double counting integers divisible by 36, we subtract <tt>floor(k/36)</tt>.  So, if we are considering the first three primes squared, then there are <tt>floor(k/4) + floor(k/9) + floor(k/25) - floor(k/36) - floor(k/100) - floor(k/225) + floor(k/900)</tt> integers with one of the 3 squared primes as factors.  Unfortunately, there are 2<sup>m</sup> terms to the full equation, if we have <tt>m</tt> primes to consider.  Luckily, most of those are 0, and don't need to be computed.  We can find all the non-zero terms using recursion as follows (assume <tt>primesSquared</tt> is a sorted array holding enough primes squared so that the biggest one is bigger than k).
<pre>
<font color="blue">//idx is the index of the prime we are looking at
//soFar is the product of some primes squared
//k is as described above
//this returns the number of integers<br/>//less than or equal to k which have 
//soFar and some prime squared as a factor</font>
   int recurse(int idx, long soFar,int k){
      int ret = 0;
<font color="blue">//If primesSquared[idx]*soFar > k,<br/>//then floor(primesSquared[idx]*soFar/k) == 0, 
//so all further terms are 0</font>
      if(primesSquared[idx]*soFar > k)return 0;
<font color="blue">//Otherwise, add the number of integers<br/>//divisible by primesSquared[idx]*soFar to ret</font>
      ret += (int)(k/primesSquared[idx]/soFar);
<font color="blue">//Then, add terms that don't include primesSquared[idx], 
//but do include soFar and some other prime squared</font>
      ret += recurse(idx+1,soFar,k);
<font color="blue">//Finally, subtract terms that include 
//both primesSquared[idx] and soFar and some other prime squared</font>
      ret -= recurse(idx+1,soFar*primesSquared[idx],k);
      return ret;
   }
</pre>
Once you get this far, you are just a couple steps away.  First, you need to compute <tt>primesSquared</tt>.  This can be done fastest with the <a href="http://mathworld.wolfram.com/SieveofEratosthenes.html">Sieve of Eratosthenes</a>.  Finally, we need to find an integer <tt>m</tt> such that <tt>m - recurse(0,1,m) == n</tt>.  A simple binary search will suffice for this.<br/><br/>
As pointed out above, the inclusion-exclusion principle could potentially result in a lot of calculations.  However, a bit of analysis suggests that we don't need to worry about it too much.  The product of the first 6 primes squared is 4*9*25*49*121*169 = 901,800,900.  So, at most we will need to consider terms made from 6 primes squared (of which there are a lot).  However, once we get up into the higher primes, most of the terms with more than a single prime squared can be ignored.  Analysis gets a bit tricky beyond here (it is possible, but beyond the scope of this article).  Suffice it to say that it turns out you only need to consider about 50,000 terms, which is easy to do in 8 seconds.  You have to do this as many as 31 times (for the binary search), but that is still plenty fast.  In fact, the slowest part of the whole algorithm ends up being the Sieve of Eratosthenes, which takes O(sqrt(n) * log(n)).
<br/><br/>
An alternative solution involves using the <a href="http://mathworld.wolfram.com/MoebiusFunction.html">M'bius Function</a> to compute the sum of the all the terms we found using the inclusion-exclusion principal.  The math behind this approach is a bit more involved, but it boils down to computing the M'bius Function up to about sqrt(n).  Without going into the details, here is dgarthur's solution along these lines:
<pre>
   public int getNumber(int n){
      long lb = 1;
       long ub = 1700000000;

      long i, j;
      long maxMoebius = (long)Math.sqrt(ub);
      int moebius[] = new int[(int)maxMoebius];
      int prime[] = new int[(int)maxMoebius];
      
      for (i=0; i&lt;maxMoebius; i++){
         moebius[(int)i] = -1; 
         prime[(int)i] = 1;
      }
      for (i=2; i&lt;maxMoebius; i++){
         for (j=2*i; j&lt;maxMoebius; j+=i) prime[(int)j] = 0;
         
         if ( ((long)Math.sqrt(i))*((long)Math.sqrt(i)) == i){
            for (j=i; j&lt;maxMoebius; j+=i)
               moebius[(int)j] = 0;
         }else if (prime[(int)i] == 1){
            for (j=i; j&lt;maxMoebius; j+=i)
               moebius[(int)j] = -moebius[(int)j];
         }
      }
      
      while (lb &lt; ub){
         long m = (lb+ub)/2;
         
         long thisN = m;
         for (i = 2; i &lt; maxMoebius; i++)
            thisN -= moebius[(int)i] * (m / (i*i));
            
         if (thisN &lt; n)
            lb = m+1;
         else
            ub = m;
      }
      
      return (int)lb;
   }
</pre>
You can read more about Square Free numbers and there applications at <a href="http://mathworld.wolfram.com/Squarefree.html">MathWorld</a>.
</p> 



                     <p>
                     <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                     By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=159052"><strong>lbackstrom</strong></a><br />
                     <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
                     </p>
                 </td>
             </tr>
         </table>

         <p><br /></p>

     </td>
<!-- Center Column Ends -->

<!-- Gutter -->
     <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
     <td width="170">
         <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
         <xsl:call-template name="public_right_col"/>
     </td>
<!-- Right Column Ends -->

<!-- Gutter -->
     <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

 </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

 </xsl:template>
</xsl:stylesheet>
