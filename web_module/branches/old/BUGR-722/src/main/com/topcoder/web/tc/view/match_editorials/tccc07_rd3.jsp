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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=10908">Match Overview</A><br />
    <tc-webtag:forumLink forumID="517409" message="Discuss this match" />
</div>
<span class="bodySubtitle">2007 TopCoder Collegiate Challenge<br />Algorithm Round 3</span><br />Saturday, September 15, 2007
<br /><br />



<h2>Match summary</h2> 

<p> 
Online Round 3 of the 2007 TopCoder Collegiate Challenge brought us something to think, something to code
and a huge space for possible bugs. What else does a top coder need on a Saturday morning (or day, or night)? As a result, the 
cutoff was quite low - 175 points - so a fast, correct solution on the easy or 3.5 challenges were enough to advance.
</p>

<p>
The round was won by <tc-webtag:handle coderId="10574855" context="algorithm"/> with a really improbable score on the hard problem,
followed by <tc-webtag:handle coderId="15881985" context="algorithm"/>, <tc-webtag:handle coderId="7442498" context="algorithm"/>,
<tc-webtag:handle coderId="310333" context="algorithm"/> and <tc-webtag:handle coderId="19849563" context="algorithm"/>.
</p> 

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8148&amp;rd=10908" name="8148">LazyCat</a></b> 

</font> 

<A href="Javascript:openProblemRating(8148)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517409" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      293 / 296 (98.99%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      136 / 293 (46.42%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>JBoy</b> for 245.05 points (4 mins 3 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      197.91 (for 136 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
This problem can be solved with a greedy algorithm. Mice are running away from the cat, so each of them is
available for the first a[i] seconds only. It's always better to catch the mouse that will be
available for less time with the hat that need less time to rest.  
</p>

<p>
The code follows:
</p>

<pre>
    public int maxMiceCount(int[] pos, int[] speed, int d, int[] rest) {
        int n = pos.length;
        int[] a = new int[n];
        for (int i = 0; i &lt; n; i++) {
            a[i] = 0;
            while (pos[i] &lt;= d) {
                a[i]++;
                pos[i] += speed[i];
            }
        }
        Arrays.sort(a);
        int m = rest.length;
        Arrays.sort(rest);
        int t = 0;
        int res = 0;
        for (int i = 0; i &lt; m; i++) {
            for (int j = 0; j &lt; n; j++) {
                if (a[j] &gt; t) {
                    res++;
                    a[j] = -1;
                    t += rest[i];
                    break;
                }
            }
        }
        return res;
    }
</pre>


</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8150&amp;rd=10908" name="8150">TristripeBacteria</a></b> 

</font> 

<A href="Javascript:openProblemRating(8150)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517409" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      238 / 296 (80.41%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      79 / 238 (33.19%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Petr</b> for 423.69 points (12 mins 31 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      282.85 (for 79 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

<p>
This problem is quite technical. Coders need to find the easiest way to determine if
the figure can be formed by three stripes. It is important in such problems to make the 
code short and easy and to avoid big copy-paste parts.
</p>

<p>
One easy way to do this is to use back tracking algorithms. First find the leftmost topmost cell
of the bacteria. This cell should be the end of a stripe, horizontal or vertical. The stripe should
be as long as possible. We can choose one of the variants, mark cells covered by the stripe 
and start back tracking on the remaining cells. Then unmark the cells, choose another variant and check 
it in the same way.
</p>

<p>
The code follows:
</p>

<pre>

    int n;
    int m;
    boolean[][] a;
    boolean[][] b;
    int[][] c;

    public int howMany(String[] photo) {
        n = photo.length + 2;
        m = photo[0].length() + 2;
        a = new boolean[n][m];
        b = new boolean[n][m];
        c = new int[n][m];
        for (int i = 0; i &lt; photo.length; i++) {
            for (int j = 0; j &lt; photo[i].length(); j++) {
                a[i + 1][j + 1] = photo[i].charAt(j) == '*';
            }
        }
        int res = 0;
        for (int i = 0; i &lt; n; i++) {
            for (int j = 0; j &lt; m; j++) {
                if (a[i][j]) {
                    clear(b);
                    dfs(i, j);
                    if (bt(0)) {
                        res++;
                    }
                }
            }
        }
        return res;
    }

    private boolean bt(int q) {
        if (q &gt; 3) return false;
        for (int i = 0; i &lt; n; i++) {
            for (int j = 0; j &lt; m; j++) {
                if (b[i][j] && c[i][j] == 0) {
                    int ii = i;
                    while (b[ii][j]) {
                        c[ii][j]++;
                        ii++;
                    }
                    if (bt(q + 1)) return true;
                    ii = i;
                    while (b[ii][j]) {
                        c[ii][j]--;
                        ii++;
                    }
                    int jj = j;
                    while (b[i][jj]) {
                        c[i][jj]++;
                        jj++;
                    }
                    if (bt(q + 1)) return true;
                    jj = j;
                    while (b[i][jj]) {
                        c[i][jj]--;
                        jj++;
                    }
                    return false;
                }
            }
        }
        return true;
    }

    private void clear(boolean[][] a) {
        for (boolean[] b : a) {
            Arrays.fill(b, false);
        }
    }

    private void dfs(int i, int j) {
        if (!a[i][j]) return;
        a[i][j] = false;
        b[i][j] = true;
        dfs(i - 1, j);
        dfs(i + 1, j);
        dfs(i, j - 1);
        dfs(i, j + 1);
    }

</pre>

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7738&amp;rd=10908" name="7738">SimilarPairs</a></b> 

</font> 

<A href="Javascript:openProblemRating(7738)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517409" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      30 / 296 (10.14%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      4 / 30 (13.33%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Petr</b> for 819.75 points (13 mins 58 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      578.23 (for 4 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

<p>
Let's call the substrings we need to find the "interesting substrings." It's shorter then
"strings that belong to at least one such pair."</p>

<p>
First we need to understand that all substrings of an interesting substring are interesting too.
So, for each i there is a t[i], the longest interesting substring starting from i-th character.
All other interesting substrings starting from the i-th character are prefixes of t[i]. 
</p>

<p>
How to calculate t[i]? Each interesting substring has a pair. Let's find it. We can check all
pairs (i, j) and calculate r[i][j], the maximal length of matching substrings, starting from i-th and j-th 
characters. This can be done easily using n^3 time, but it's too much. We can make it faster using
this simple idea: if we know the number of characters that differ in substrings [i..i+k] and [j..j+k], 
then we can calculate this number for substrings [i+1..i+k] and [j+1..j+k]. 
So we can use the value of r[i][j] to calculate the value of r[i+1][j+1] and make all calculations using
n^2 time. Look at <tc-webtag:handle coderId="310333" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=266285&rd=10908&pm=7738&cr=310333">solution</a>
for an implementation of this idea.
</p>

<p>
Now finally we need to count the number of different interesting substrings. This is a problem too,
because we have too many substrings, and we cannot just put them into the hash set. 
</p>

<p>
First solution (correct): All interesting substrings are prefixes of t[i]. Sort t[i] 
lexicographically, their common prefixes are now together and it is easy to skip them.
Look at <tc-webtag:handle coderId="310333" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=266285&rd=10908&pm=7738&cr=310333">solution</a>
for implementation.
</p>

<p>
Second solution (actually incorrect but useful): We can calculate the hash function of all interesting 
substrings as longs, sort this values and find the number of different. This solution
fails if there are two different interesting substrings with same hash, but it happens not very often.
Look at <tc-webtag:handle coderId="10574855" context="algorithm"/>'s
<a href="/stat?c=problem_solution&rm=266283&rd=10908&pm=7738&cr=10574855">solution</a>
for implementation.
</p>

</p>
</p>
<br /><br />



<div class="authorPhoto">
    <img src="/i/m/pashka_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="15881985" context="algorithm"/><br />
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
