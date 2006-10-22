<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
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
        <td width="180" id="onLeft">	<jsp:include page="/includes/global_left.jsp">
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
<tc-webtag:forumLink forumID="505744" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 254</span><br>Tuesday, July 26, 2005
<br><br>

<span class="bigTitle">Match summary</span>
 
<p>
SRM 254 kicked off at the crack of dawn in the United
States.  In Europe, Asia and Australia, the hour was
slightly more reasonable, and coders flocked from these
regions.  In division 1, kalinov had the most points from
the coding phase.  However, the challenge phase hurt him as
he lost 50, while misof gained 50 and took first place.
However, kalinov's score was still high enough to give him
second place, beating out bladerunner who took third.  In
division 2, the top three spots were all taken by first time
competitors: Issi, __OK__, macin.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4617&amp;rd=8006" name="4617">BalancedGame</a></b>
</font>
<A href="Javascript:openProblemRating(4617)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505744" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      242 / 299 (80.94%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      184 / 242 (76.03%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>nickel</b> for 243.68 points (4 mins 35 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      182.11 (for 184 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The problem statement pretty much spelled out how to do this one.  Examine each
element of the input and count the W's and L's in it.  If the number of W's is
less than ceil((N-1)*p/100) or the number of L's is less than ceil((N-1)*q/100),
then the that player is unbalanced.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4670&amp;rd=8006" name="4670">ListeningIn</a></b>
</font>
<A href="Javascript:openProblemRating(4670)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505744" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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

      224 / 299 (74.92%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      110 / 224 (49.11%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>kdz13</b> for 485.02 points (5 mins 1 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      375.74 (for 110 correct submissions)
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
      184 / 186 (98.92%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      148 / 184 (80.43%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>JongMan</b> for 247.93 points (2 mins 36 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      224.41 (for 148 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

We can solve this problem using a greedy algorithm.  Initalize a pointer  to the
first character of typed.  Now, iterate over the characters in phrase.  If
the current character in phrase matches the character pointed to in typed,
advance the point to the character in typed.  Otherwise, add the character in
phrase to the list of deleted characters.  If, when you have iterated over all
characters in phrase, the pointer to the character in typed is past the last
character, you have a match, and can return the deleted characters.  Otherwise,
return "UNMATCHED".
<pre>
    int p = 0;
    String ret = "";
    for(int i = 0; i&lt;phrase.length(); i++){
        if(p&lt;typed.length() &amp;&amp; phrase.charAt(i) == typed.charAt(p))p++;
        else ret += phrase.charAt(i);
    }
    if(p!=typed.length())return "UNMATCHED";
    else return ret;
</pre>

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2245&amp;rd=8006" name="2245">Piglets</a></b>
</font>
<A href="Javascript:openProblemRating(2245)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505744" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      89 / 299 (29.77%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      12 / 89 (13.48%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Issi</b> for 672.56 points (22 mins 14 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      534.53 (for 12 correct submissions)
    </td>
  </tr>
</table></blockquote>


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
      129 / 186 (69.35%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      77 / 129 (59.69%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      <b>misof</b> for 453.54 points (9 mins 17 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      291.82 (for 77 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
There are two different ways to do this problem.  The more commonly used
algorithm uses recursion to determine where the piglet should go.  Each piglet
considers the current situation, and all possible positions and asks the
question: "If I go in this position, what will the other piglets do, and how
good will that be for me?"  Most coders basically took this approach, using
dynamic programming to make their solutions run in time -- once you know what
will happen from a particular situation, you should avoid computing it
again.<br/><br/>
This less commonly used, but much simpler and slicker solution goes like this:
<pre>
    if(trough.charAt(0) == '-')return 0;
    if(trough.charAt(trough.length()-1) == '-')return trough.length()-1;
    int idx = trough.lastIndexOf("--");
    if(idx != -1)return idx;
    return trough.indexOf("-");

</pre>
First, if one of the ends is open, our piglet takes it.  Next, we find the
rightmost occurrence of "--", if there is one, and go at that position.  This may seem counterintuitive
because the problem statement says to pick the leftmost when ties occur.
However, at the end of the simulation, when the pigs who come in are sandwiched
immediately, they will pick the leftmost spots first, since the delay is 0 for
them.  Hence, every spot to the left of the spot we pick will be filled up
before we are finally sandwiched.  If we were to pick a spot further left the delay
would be less, as there would be less open spots to our left.  If we picked the spot
one position to the right, the delay would be the same, while spots further
right must cause an immediate sandwich.  Finally, if there is no occurrence of
"--", simply take the leftmost open spot, if there is one.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2246&amp;rd=8006" name="2246">SelfCatalogue</a></b>
</font>
<A href="Javascript:openProblemRating(2246)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505744" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      21 / 186 (11.29%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      17 / 21 (80.95%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>liympanda</b> for 643.47 points (24 mins 10 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      511.62 (for 17 correct submissions)
    </td>
  </tr>

</table></blockquote>

<p>
A brute force approach to this problem runs with plenty of time so long as you
do a little bit of pruning.  The basic algorithm uses recursion to try many
possible counts.<br/><br/>
A good first step is to figure out an upper bound on the total number of digits
in a valid sentence.  If there is a count less than 10, but more than 0 for
every digit, then there are 20 total digits.  This suggests that perhaps 2 of the counts
could be 10 or higher, for 22 digits total.  If 3 or more of the counts were
10 or higher, there would have to be at least 30 digits, which is a lot more
than 3 double digit numbers provide.  So, we know that the sum of the counts is
at most 22.  It turns out that if we generate all of the possible counts whose
sum is 22 or less and which are consistent with the input, we can easily check
them and run the solution can run in time, provided you generate the counts in
lexicographic order.
<pre>
int[] it;
int[] a = new int[10];
int cnt = 0;
public int[] construct(int[] a){
    it = a;
    if(go(0,22))
        return it;
    else 
        return new int[0];
}
<font color="blue">
    /*
    * The go function tries to place a count for digit d,
    * bounded above by r.  r starts at 22, the upperbound
    * for the sum of the counts, and is decreased in
    * recursive calls to ensure that the sum stays at 22 or
    * less.  The function returns true if a valid solution
    * is found, and false otherwise.
    **/
</font>
boolean go(int d, int r){
    if(r&lt;0)return false;
    if(d == 10){
        for(int i = 0; i&lt;10; i++)a[i] = 0;
        for(int i = 0; i&lt;10; i++){
            if(it[i]&gt;0){
                a[i]++;
                if(it[i]&lt;10)a[it[i]]++;
                else {
                    a[it[i]%10]++;
                    a[it[i]/10]++;
                }
            }
        }
        for(int i = 0; i&lt;10; i++){
            if(a[i] != it[i]){
                return false;
            }
        }
        return true;
    }
    if(it[d] == -1){
        it[d] = 0;
        if(go(d+1,r))return true;
        for(int i = 1; i&lt;=r; i++){
            it[d] = i;
            if(go(d+1,r-i))return true;
        }
        it[d] = -1;
        return false;
    }else{
        return go(d+1,r-it[d]);
    }
}

</pre>

The code above can be further optimized in many ways (it
runs in about 1.5 seconds as is on some cases).  For one
thing, once we have already assigned some digits, we can
easily come up with a better lower bound for some of the
counts.  For instance, if we have already assigned the fact
that there are '2 occurrences of 1', then there must also be
at least 1 occurrence of 2.  <br/><br/>
We can also find better upper bounds on the counts for some
digits.  For instance, there can certainly be at most 3
occurrences of 9.  If there were 4 occurrences, then three
of the counts would have to be 9, which would make more than
22 total digits.  If we add similar upper bounds for all the
digits, the runtime drops off significantly.  There are all
sorts of further optimizations you could add if you felt
inclined to do so, but they aren't needed.
</p>


<div class="authorPhoto">
    <img src="/i/m/lbackstrom_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
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
