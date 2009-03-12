<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>

<tc-webtag:forumLink forumID="506038" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 16</span><br>Monday, October 16, 2006
<br><br>

<h2>Match summary</h2>

 

<p>
<tc-webtag:handle coderId="22652504" context="hs_algorithm"/> won the first HS event in three weeks.
In his second ever HS match, <tc-webtag:handle coderId="22652504" context="hs_algorithm"/> destroyed the field -- recording the highest score on the hard problem, racking up +475 points on challenges and winning by more than 400 points.
HS-veteran <tc-webtag:handle coderId="14886245" context="hs_algorithm"/> was second, <tc-webtag:handle coderId="22630769" context="hs_algorithm"/> finished third, and <tc-webtag:handle coderId="20812309" context="hs_algorithm"/> ended up in fourth place (despite being in the lead after the coding phase).
</p>

 

<H1>

The Problems

</H1>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6783&amp;rd=10068" name="6783">MissedCall</a></b>

</font>

<A href="Javascript:openProblemRating(6783)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506038" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

      67 / 74 (90.54%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      27 / 67 (40.30%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>ahyangyi</b> for 245.11 points (4 mins 1 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      213.99 (for 27 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
This problem was a simulation of the process, described in the statement, but a lot of solutions failed because of different tricky cases.
The first thing to note is that the album contains at most 20 songs of 180 seconds each, or, in other words, playing all songs will take 
less than 20 * (180 + 5) < 20 * 200 = 4000 seconds. 
Therefore, we start checking every second fror the second 0 and until we find the moment when Victor will hear the ring.
The phone will ring at seconds with numbers 0, <b>delay</b>, 2*<b>delay</b>, 3*<b>delay</b>, ..., so, as you can see, the phone will ring a second <b>i</b> if (<b>i</b> % <b>delay</b>) == 0. Let's find how to check if the music will play at second i.
</p>
<p>
The first song will play from second 0 till the second (<b>songDuration</b> - 1), then will be a 5-seconds pause, then 
the music will play for another (<b>songDuration</b>) seconds, then another pause will start and so on.
As you can see, the process is repeated every (<b>songDuration</b> + 5) seconds, with the music playing first <b>songDuration</b> of each such period. Therefore, the music does not play during second <b>i</b>, if (<b>i</b> % (<b>songDuration</b> + 5)) is greater or equal to <b>songDuration</b> (which corresponds to the pause in the interval). Having this formula, we are almost done except the last corner case. If second <b>i</b> is greater than N * (<b>songDuration</b> + 5), then the music cannot play during this second, because all songs from the album were already played. The implementation of this approach follows:
</p>
<pre>
    int waitingTime(int N, int songDuration, int delay) {
    for (int i = 0; ; i++) 
        if (i % delay == 0 && 
        (((i % (songDuration + 5)) >= songDuration || i / (songDuration + 5) >= N))) 
            return i;
    }
</pre>
</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6817&amp;rd=10068" name="6817">BrokenElevator</a></b>

</font>

<A href="Javascript:openProblemRating(6817)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506038" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      57 / 74 (77.03%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      50 / 57 (87.72%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Loner</b> for 462.72 points (8 mins 11 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      337.12 (for 50 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
Since each two floors are connected by only 1 stairs, there will be no need to ever go a floor down if the finish is higher than the starting point. Similarly, if the finish is lower than the starting point, you will never need to go a floor up.
Also, at every intermediate floor, you will need to go in only one direction - either left or right - and never go both left and right at the same floor. Taking this into account, there will be exactly 1 path satisfying all these conditions. Lets now compute the time you will need to pass it.
</p>
<p>
The time you'll need to spend can be split in two parts. First, you'll need to pass a number of stairs. If the starting position is located at floor F<sub>s</sub>, and the final position is located at floor F<sub>f</sub>, the total time you'll need to spend on the stairs will be (F<sub>s</sub> - F<sub>f</sub>) if the starting floor is located higher than the final floor, and (F<sub>f</sub> - F<sub>s</sub>) * 3 otherwise. Here you must remember two things. First, the earlier elements of the input represent higher floors, and second, half of the elements of the input represent empty spaces between floors. Therefore, if 'S' is located in the i-th element of the input, and 'F' is located in the j-th element of the input, the time spent on stairs will be equal to:
<pre>
int time = (i > j) ? ((i - j) * 3 / 2) : ((j - i) / 2);
</pre>
Now you need to find the time you'll spend going left or right on different floors. There can be three different cases. If you are on the starting floor, you'll need from the position of 'S' character to the position of the necessary '|'. If you  just entered the final floor, you need to pass the distance between your current position (the position of last stairs) and the 'F' position. If you are at an intermediate level, you need to go from the position of the previous stairs to the position of the next. In all three cases, the distance is twice bigger than the difference between positions of the corresponding characaters in the elements of the input.
</p>
<p>
Since you can calculate the time spent on stairs independently (see the previous paragraph), and because the path from the finish to the start is the same as from the start to the finish, you can assume the start floor to be lower than the final floor (if it isn't so, just swap the start and the finish). As the very last note, don't forget about the special case when start and finish positions are at the same floor:
<pre>
public int wayTime(String[] s) {
        int rs = 0, cs = 0, rf = 0, cf = 0;
        for (int i = 0; i < s.length; i++) for (int j = 0; j < s[0].length(); j++) 
                if (s[i].charAt(j) == 'S') { rs = i; cs = j; }
        for (int i = 0; i < s.length; i++) for (int j = 0; j < s[0].length(); j++) 
                if (s[i].charAt(j) == 'F') { rf = i; cf = j; }
        if (rs == rf)
                return 2 * Math.abs(cs - cf);
// time spent on the stairs
        int ans = Math.abs(rf - rs) / 2; 
        if (rs > rf) {
                int q = rf; rf = rs; rs = q;
                q = cf; cf = cs; cs = q;
// climbing is 3 times slower than running down
                ans *= 3; 
        }
// time spent on the first floor
        ans += Math.abs(s[rs + 1].indexOf('|') - cs) * 2; 
// time spent on the last floor
        ans += Math.abs(s[rf - 1].indexOf('|') - cf) * 2; 
        for (int i = rs + 1; i < rf - 1; i += 2)
                ans += 2 * Math.abs(s[i].indexOf('|') - s[i + 2].indexOf('|'));
        return ans;
}
</pre>
</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6658&amp;rd=10068" name="6658">Divisibility</a></b>

</font>

<A href="Javascript:openProblemRating(6658)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506038" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      36 / 74 (48.65%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      8 / 36 (22.22%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Achtung-Achtung</b> for 946.49 points (6 mins 49 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      722.17 (for 8 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
The first thing to note in this problem is that numDivisible(L, R, a) is equal to (numDivisible(1, R, a) - numDivisible(1, L - 1, a)). 
This approach -- counting specific numbers not greater than A, instead of counting specific numbers not greater than A and not smaller than B -- is a well-known trick and may help you in future contests, so don't forget it after submitting this problem!
</p>
<p>
Now we need to find the number of positive integers not greater than <b>A</b>, which are divided by at least one element of <b>a</b>.
Lets start solving this problem from much simpler cases, when the total number of elements in <b>a</b> is small. Let's go step by step:
<ul><li>If <b>a</b> contains only 1 element, the answer to this problem is the total number of positive integers less than <b>A</b>, which are divided by <b>a</b>[0]. Obviously, this is equal to <b>A</b>/<b>a</b>[0], with the result is rounded down.</li>
<li>
If <b>a</b> contains exactly 2 elements, the answer can be <b>A</b>/<b>a</b>[0] + <b>A</b>/<b>a</b>[1] (total number of integers divided by <b>a</b>[0] plus total number of integers divided by <b>a</b>[1]), but usually it will be smaller. Why? Because the numbers which are divided by <b>a</b>[0] and <b>a</b>[1] will be counted twice. Therefore, the correct answer will be equal to (f(<b>a</b>[0]) + f(<b>a</b>[1]) - f(<b>a</b>[0], <b>a</b>[1])), where f(a, b, c, ...) notes the total number of positive integers not greater than <b>A</b>, which are divided by each of a, b, c... As you see, each of the integers which is divided by both elements of <b>a</b>, is added to the result twice (in f(<b>a</b>[0]) and f(<b>a</b>[1])), but also subtracted once in f(<b>a</b>[0], f(<b>a</b>[1])).
</li>
<li>
We can apply similar idea to <b>a</b>, if it contains 3 elements: calculate the result as (f(<b>a</b>[0]) + f(<b>a</b>[1]) + f(<b>a</b>[2]) - f(<b>a</b>[0], <b>a</b>[1]) - f(<b>a</b>[0], <b>a</b>[2]) - f(<b>a</b>[1], <b>a</b>[2])), but this result will appear to be smaller than correct. Why? All integers which are divided by 1 or 2 elements of <b>a</b> will be counted correctly, but the numbers which are divided by all three elements of <b>a</b> will not be counted. Each of these numbers will be added to the result three times (in f(<b>a</b>[i]), 0 <= i <= 2) and subtracted from the result three times. Therefore, each of these numbers should be included into result, and the correct answer for this case will be:</li></ul>
<pre>
f(<b>a</b>[0]) + f(<b>a</b>[1]) + f(<b>a</b>[2]) - f(<b>a</b>[0], <b>a</b>[1]) - f(<b>a</b>[0], <b>a</b>[2]) - f(<b>a</b>[1], <b>a</b>[2]) + f(<b>a</b>[0], <b>a</b>[1], <b>a</b>[2]).
</pre>
<ul>
<li>
We can assume that in a more general case, when <b>a</b> contains K elements, the answer can be computed in the following way:<br/>
Set the result to 0.<br/> 
Add f(<b>a</b>[i]) (for all 0 <= i <= K) to the result.<br/>
Subtract f(<b>a</b>[i], <b>a</b>[j]) (for all 0 <= i < j <= K, ) from the result.<br/>
Add f(<b>a</b>[i], <b>a</b>[j], <b>a</b>[k]) (for all 0 <= i < j < k <= K) to the result.<br/>
...<br/>
In general, for any subset of <b>m</b> indices 0 <= i<sub>0</sub> < i<sub>1</sub> < ... < i<sub><b>m-1</b></sub> <= K, f(<b>a</b>i<sub>0</sub>, <b>a</b>i<sub>1</sub>, ..., <b>a</b>i<sub><b>m</b> - 1</sub>) should be added to the result if <b>m</b> is odd (1, 3, 5, ...) and subtracted from the result if <b>m</b> is even.<br/>
...<br/>
This principle is known as <a href="http://en.wikipedia.org/wiki/Inclusion-exclusion_principle">Inclusion-Exclusion principle</a>, and you can find the formal proof if you follow the link.
</li>
</ul>
Since <b>a</b> can contain at most 18 elements, we can easily check all 2<sup>18</sup> subsets of indices and add or subtract the corresponding numbers to the result. The only tricky part left is to compute the value of f(<b>a</b>i<sub>0</sub>, <b>a</b>i<sub>1</sub>, ..., <b>a</b>i<sub><b>m</b> - 1</sub>). Naturally, this is equal to f(LCM(<b>a</b>i<sub>0</sub>, <b>a</b>i<sub>1</sub>, ..., <b>a</b>i<sub><b>m</b> - 1</sub>)), where LCM(<b>a</b>i<sub>0</sub>, <b>a</b>i<sub>1</sub>, ..., <b>a</b>i<sub><b>m</b> - 1</sub>) - the Least Common Multiple - the smallest possible positive integer which is divided by any of <b>a</b>i<sub>0</sub>, <b>a</b>i<sub>1</sub>, ..., <b>a</b>i<sub><b>m</b> - 1</sub>. The algorithm to compute the LCM of several numbers can be found at <a href="http://en.wikipedia.org/wiki/Least_common_multiple">this web-page</a>.
<br /><br />Java implementation of the algorithm described above follows:
<pre>
    public int numDivisible(int L, int R, int[] a) {
        return f(R, a) - f(L - 1, a);
    }
// computes the greatest common dividor for numbers n1 and n2
    long gcd(long n1, long n2) { 
        return n2 == 0 ? n1 : gcd(n2, n1 % n2);
    };
    int f(int A, int[] a) {
        int ans = 0;
        int N = a.length;
// if i has 1 at the j-th bit, this means a[j] is included into the i-th set
        for (int i = 1; i < (1 << N); i++) { 
            long lcm = 1;
            int ones = 0;
            for (int j = 0; j < N; j++) if ((i & (1 << j)) != 0) {
// one more number in the set
                ones++; 
                long r = gcd(lcm, a[j]);
                lcm /= r;
                lcm *= a[j];
// to avoid overflowing the value of lcm, we stop calculations as soon as 
                if (lcm > A) break; 
//the value of lcm is greater than A - the answer for A/lcm will be 0 anyway.
            }
            if (ones % 2 == 1)
                ans += (A / lcm);
            else
                ans -= (A / lcm);
        }
        return ans;
    }
</pre>
</p>

<div class="authorPhoto">
    <img src="/i/m/Olexiy_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/><br />    <em>TopCoder Member</em>
</div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
