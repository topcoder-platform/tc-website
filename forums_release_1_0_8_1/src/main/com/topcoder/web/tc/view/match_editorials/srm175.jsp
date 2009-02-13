<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

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
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505624" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 175</span><br>Wednesday, December 17, 2003
<br><br>

<span class="bigTitle">Match summary</span>

<p> 
In a relatively hard SRM, SnapDragon marched to another SRM win, bringing his total to 26.  In a rare 
appearance from down under, John Dethridge was a close second, less than 20 points behind.  radeye was 
a distant third, followed by lars, and up-and-comer Eryx in his second SRM.  In division 2, coders were 
faced with a tough hard problem (shared with division one's medium) and no one was able to solve it correctly.  
xmux, an Argentinian, won handily in his fifth SRM, beating second place telars and third place mthreat by over 
100 points.  The highest rated new comer was Jasko, who took seventh.
</p> 
  
<p>
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b>ClockWalk</b> 
</font> 
<A href="Javascript:openProblemRating(2241)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505624" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      179 / 196 (91.33%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      102 / 179 (56.98%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>weimazhu</b> for 249.83 points (0 mins 45 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      208.43 (for 102 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Modular arithmetic is the key to solving this problem with a high score.  If you are at <tt>h</tt> on the clock, then moving forward <tt>n</tt> hours puts you at <tt>(h+n)%12</tt>.  This isn't too hard to see, if you understand the % operator.  Basically, what this does is subtract out all the extra twelves, so 13 becomes 1, and 26 becomes 2.  The case where you go backwards is a bit trickier.  If you get into negative values, <tt>%12</tt> will no longer give you the correct position.  However, if you add some large number that is divisible by 12, then subtract and finally do <tt>%12</tt>, then you will get the right result: <tt>(h-n+120)%12</tt>.  Another solution is to just start at some large number that is divisible by 12, and not do any % operations until the end:
<pre>
   int h = 6000;
   for(int i = 0; i&lt;flips.length(); i++){
      h += flips.charAt(i)=='h'?(i+1):(-i-1);
   }
   return 12-(12-h%12)%12;
</pre>
Note that the fancy return statement returns <tt>h%12</tt> if <tt>h%12 != 0</tt> and 12 otherwise.
</p> 

<font size="+2"> 
<b>InstantRunoff</b> 
</font> 
<A href="Javascript:openProblemRating(2244)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505624" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
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
      81 / 196 (41.33%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      37 / 81 (45.68%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>xmux</b> for 428.19 points (16 mins 8 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      262.82 (for 37 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      300 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      150 / 160 (93.75%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      85 / 150 (56.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ZorbaTHut</b> for 282.67 points (7 mins 7 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      207.71 (for 85 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
There weren't any special cases, or advanced algorithms required to solve this problem, but it was still a relatively hard problem, requiring a fair bit of code.  There are two ways that you could approach this.  First, you could implement your code to follow the 3 steps in the problem statement.  If you do it this way, then each iteration you start by looking at all of the ballots, and counting the number of ballots that each candidate is first on.  Then, you find the uneliminated candidate(s) with the minimum number of votes, and remove them from each ballot.  One important note is that you need to eliminate candidates with no votes first.  Then, simply repeat until a candidate has greater than half of the vote.  The other popular way to do it is to just mark which candidates are eliminated, as you eliminate them.  Then, when you are tallying the votes, simply move down the ballot until you get to a candidate that hasn't been eliminated:
<pre>
   boolean[] elim = new boolean[26];
   while(true){
      int[] cnt = new int[26];
      for(int i = 0; i&lt;ballots.length; i++){
         while(ballots[i].length()&gt;0 &amp;&amp; elim[ballots[i].charAt(0)-'A']){
            ballots[i] = ballots[i].substring(1);
         }
         if(ballots[i].length()==0)return "";
         cnt[ballots[i].charAt(0)-'A']++;
         if(cnt[ballots[i].charAt(0)-'A']&gt;ballots.length/2)return ""+ballots[i].charAt(0);
      }
      int min = 100;
      for(int i = 0; i&lt;26; i++) if(!elim[i]) min = Math.min(min,cnt[i]);
      for(int i = 0; i&lt;26; i++) if(cnt[i]==min) elim[i] = true;
      }
</pre>
Finally, I think its worth noting that this voting scheme also has cases where it seems not to elect the person who might make the most sense.  Consider a case like {"ACDEFB","ACDEFB","ACDEFB","BCDEFA","BCDEFA","BCDEFA","CADEFB"}.  In this case, A will win, but perhaps C would have been the better choice, since C was no worse than second on anyone's list, while A was dead last on 3 ballots.
</p> 

<font size="+2"> 
<b>Books</b> 
</font> 
<A href="Javascript:openProblemRating(2240)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505624" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      13 / 196 (6.63%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      0 / 13 (0.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      No correct submissions 
    </td> 
  </tr> 
</table></blockquote> 



Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      450 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      63 / 160 (39.38%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      39 / 63 (61.90%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tjq</b> for 436.62 points (5 mins 0 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      355.92 (for 39 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
In past editorials, I've suggested that a limit of 20 should immediately set off a brute force alarm in your head.  While this problem can be solved with brute force enumeration of subsets, a quicker solution to code runs in polynomial time.  But, first the brute force solution.  For each of the 2<sup>n</sup> subsets, consider removing that subset of books from the shelf.  We can imagine removing the books and reinserting one at a time, but its easier to think of taking them all off at once, and it doesn't make any real difference.  So, once we've got our subset of books off the shelf, we need to put them back in such a way that all of the books are ordered.  If the books that we left on the shelf are in order, then this is easy - we just put each one where it belongs in the final ordering.  If the books left on the shelf are not in order, then its clearly impossible.  So, the solution is to take as few books off the shelf as possible, such that the books left on the shelf are in order.  Put another way, you want to leave the largest subset of books on the shelf such that all the books left on the shelf are in order.  Some of you may recognize this as the longest increasing subsequence (LIS) problem.  A subsequence is exactly what we are looking for - the original sequence with zero or more element removed.  Furthermore, we want one which is in increasing alphabetical order, and we want the longest one (largest subset).  So, then the question becomes how to find the LIS.  We can define the following recurrence (where max(null) = 0):
<br/>
<tt>len[i] = 1+max(len[j] s.t. j&lt;i &amp;&amp; book[j] &lt;= book[i])</tt>
<br/>In plain English, the length of the LIS ending at element i is either one plus the length of the LIS ending at j, where the book at j comes before i alphabetically, or else 1 if there is no such book.  Implementing the recurrence is a textbook example of dynamic programming, and something that every TopCoder should probably familiarize themselves with:
<pre>
   public int sortMoves(String[] titles){
      int[] dp = new int[titles.length];
      int ret = 0;
      for(int i = 0; i&lt;titles.length; i++){
         dp[i] = 1;
         for(int j = 0; j&lt;i; j++){
            if(titles[i].compareTo(titles[j])&gt;=0)
               dp[i] = Math.max(dp[i],dp[j]+1);
         }
         ret = Math.max(ret,dp[i]);
      }
      return titles.length-ret;
   }
</pre>
</p> 

<font size="+2"> 
<b>BinaryQuipu</b> 
</font> 
<A href="Javascript:openProblemRating(2239)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505624" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      8 / 160 (5.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      6 / 8 (75.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SnapDragon</b> for 797.44 points (15 mins 8 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      560.97 (for 6 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
One way to solve this problem is to think of the BinaryQuipu as a non-deterministic finite automaton (NFA), and then to reduce the NFA to a minimal DFA, and compute the number of knots that the DFA represents.  I won't go in to very much detail about this solution, other that to say that it works, and is way more complicated than it needs to be.  Instead, we should use SnapDragon's approach of recursion with memoization.  We start be defining a recursive solution that takes a set of strings (sequences of knots).  To make things a bit simpler, we'll replace the 'top knot' with an 's' by prepending 's' to each string.  Then, the recursive method can always assume that the first character of each strings is the same.  So, the first step will be to add the set to a cache.  Then, we can trim off the first character of each string, which is tantamount to installing a single knot in our network.  Then, we split the set of strings into two subsets - those that start with 'b' and those that start with 's' - and recursively calls itself with each non-empty subset.  Each time we make a recursive call, we increment a counter to keep track of the number of knots we've added.  So far, our code computes the number of knots used if we only merge the common prefixes (which can be done fairly simply with a number of other methods).  The harder part is merging some of the suffixes to reduce the number of knots.  We handle this only recursing on novel subsets.  That is subsets that we have not yet seen.  The idea behind this is that if we have already seen an identical set of strings, then we've already created a network of knots to represent this subset, and we can simply add a link to that network, rather than recreating the network.  For example, consider the input {"ssb","sb"}.  We first call recurse({"sssb","ssb"}), and increment our counter to 1 (this represents the 'top knot' which is handled be prepending 's' to each string).  Since none of the strings start with 'b' after we trim off the initial characters, we only make one recursive call, recurse({"ssb","sb"}), and increment our counter to 2.  Now, after we trim the initial characters, we have {"sb","b"} and lets say that we branch on the strings that start with 's' first, calling recurse({"sb"}), and incrementing our counter to 3.  Then, we make one more call to recurse({"b"}), increment our counter to 4, and once we trim the initial 'b', no strings start with 's' or 'b', so we backtrack.  Next, we would call recurse({"b"}), but looking in our cache, we see that we've already made this exact call, so we don't make it again, and we're done.  Not making that call is equivalent to adding a link from the first 's' to the final 'b'.  In pseudocode (see SnapDragon's solution for an implementation very similar to this, or John Dethridge's solution for a different, but horribly obfuscated solution):
<pre>
int counter = 0;
set cache;
void recurse(set s){
   cache.add(s);
   counter++;
   foreach string t in s
      remove the first character of t
   set s1 = null;
   foreach string t in s that starts with 's'
      s1.add(t)
   if(s1!=null &amp;&amp; !cache.contains(s1))recurse(s1);
   set s2 = null;
   foreach string t in s that starts with 'b'
      s2.add(t)
   if(s2!=null &amp;&amp; !cache.contains(s2))recurse(s2);
}
</pre>
As a challenge, either find an example where one could make a more compact non-deterministic Quipu (one with multiple branches to the same type of knot), or else prove that one does not exist.
</p> 

<p>
<img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
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
