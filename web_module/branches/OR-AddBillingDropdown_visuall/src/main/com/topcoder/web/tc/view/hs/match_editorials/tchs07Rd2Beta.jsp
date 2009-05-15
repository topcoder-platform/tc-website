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
    <A href="/tc?module=HSRoundOverview&rd=10715&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="514494" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS07 Round 2 Beta</span><br>Monday, March 12, 2007
<br><br>

<h2>Match summary</h2>

<tc-webtag:handle coderId="15604398" context="hs_algorithm"/>
won the match thank to an amazing 945.38 points on the hard problem.
Two reds rounded out the first three: <tc-webtag:handle coderId="11972352" context="hs_algorithm"/>
finished second, and <tc-webtag:handle coderId="14886245" context="hs_algorithm"/>
ended up in third.
<br /><br />

The relatively large number of participants led to real competition -- there were 104 coders and only 100 slots for advancement!
Unfortunately, however, only 97 participants were able to earn a positive score and move on.
<br /><br />

<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7535&amp;rd=10715" name="7535">LargestCountry</a></b>
</font>
<A href="Javascript:openProblemRating(7535)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514494" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      102 / 104 (98.08%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      88 / 102 (86.27%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>sluga</b> for 249.24 points (1 mins 34 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      235.76 (for 88 correct submissions)
    </td>
  </tr>
</table></blockquote>

The problem just requires you to count how many times each of the uppercase letters occurs
in the given array of strings, then to choose the letter that occurs the most times.
In case of a tie, choose the smallest letter.
<br /><br />

C++ code follows:


<pre>
string getLargest(vector &lt;string> worldMap) {
    char ch;
    pair &lt;int, char> ret;
    int cnt[256];
    int i, j;
    memset(cnt, 0, sizeof(cnt));
    for (i = 0; i &lt; worldMap.size(); i++)
        for (j = 0; j &lt; worldMap[i].size(); j++)
            if (worldMap[i][j] != ' ') cnt[worldMap[i][j]]++;
    ret = make_pair(0, 'A');
    for (ch = 'A'; ch &lt;= 'Z'; ch++) ret = min(ret, make_pair(-cnt[ch], ch));
    return (string)"" + ret.second;
}    
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7536&amp;rd=10715" name="7536">ChangingSeats</a></b>
</font>
<A href="Javascript:openProblemRating(7536)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514494" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      80 / 104 (76.92%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      74 / 80 (92.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomekkulczynski</b> for 495.12 points (2 mins 49 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      397.19 (for 74 correct submissions)
    </td>
  </tr>
</table></blockquote>

This one can be solved by brute force due to the low constraints.
Iterate over the seats and try to move all the people to seats around the current one.
<br /><br />

C++ code follows:

<pre>
int getDistance(string s) {
    int ret, cur, n, i, j, k;
    n = s.size();
    ret = 2000000000;
    for (i = 0; i < n; i++) {
        cur = 0;
        // going to the right from i, k stores the last empty position
        for (k = j = i; j &lt; n; j++) if (s[j] == 'X') cur += j - k++;
        // going to the left from i, k stores the last empty position
        for (k = j = i - 1; j >= 0; j--) if (s[j] == 'X') cur += k-- - j;
        ret = min(ret, cur);
    }
    return ret;
</pre>

Of course, brute force is not the only solution to this problem.
Now, when the contest is over and you have a bit more time, 
try to find a mathematical solution for this problem.
<br /><br />

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6532&amp;rd=10715" name="6532">LatticeCrossword</a></b>
</font>
<A href="Javascript:openProblemRating(6532)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514494" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      37 / 104 (35.58%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      32 / 37 (86.49%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>sluga</b> for 945.38 points (6 mins 54 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      586.99 (for 32 correct submissions)
    </td>
  </tr>
</table></blockquote>

This problem was also solvable by a brute force approach because of the relatively low constraints.
There are four possible relative positions of the words in the resulting crossword - top, bottom (both for horizontal words), left and right (both for vertical words), 
and there are 4! = 24 ways to assign a position to each word from the input.
<br /><br />

Now we need to compute all thhe possible crosswords.
This can be done by brute-forcing over all possible starting positions of all words (taking into account that the words have length of 15 and their starting positions can be more than 15 cells apart):
<br /><br />

Java code follows:

<pre>
int go(String[] data) {
    int ans = 0;
    for (int c = -15; c < 16; c++)
        for (int r = 2; r <= 15; r++) {
            int ri = Math.min(data[0].length(), data[1].length() + c);
            for (int i = Math.max(c, 0); i < ri; i++) {
                int cnt = count(data[0], data[1], data[2], r, c, i);
                for (int j = i + 2; j < ri; j++)
                    ans += cnt * count(data[0], data[1], data[3], r, c, j);
            }
        }
    return ans;
}

int count(String a, String b, String w, int r, int c, int c1) {
    int res = 0;
    for (int i = r - w.length() + 1; i <= 0; i++)
        if (w.charAt(-i) == a.charAt(c1) && w.charAt(r - i) == b.charAt(c1 - c))
            res++;
    return res;
}
</pre>



<div class="authorPhoto">
    <img src="/i/m/gevak_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7340263" context="algorithm"/><br />    <em>TopCoder Member</em>
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
