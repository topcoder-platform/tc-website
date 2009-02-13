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
    <A href="/tc?module=HSRoundOverview&rd=10703&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="514493" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS07 Round 1 Gamma</span><br>Monday, February 26, 2007
<br><br>

<h2>Match summary</h2> 
 
On Monday, February 26, high school students entered the first round of the
ultimate battle for the onsite spots of the 2007 TopCoder High School Tournament.
The students from Gamma region were given a chance to compete first. 
With 51 students from Gamma registered for the tournament, 40 actually 
coming to compete, and 250 spots in the next round, the main goal for
all the contestants was to have a positive score in the round. 
<br /><br />

Thirty-eight contestants were successful in getting that positive score, 
led <tc-webtag:handle coderId="21468741" context="hs_algorithm"/>
from Saint-Petersburg Phys-Math Lyceum #30. He had the fastest time on all three problems and two successful challenges,
separating him from the next closest competitor by a gap of almost 450 points.
<br /><br />
Second place went to <tc-webtag:handle coderId="22666540" context="hs_algorithm"/>
from Yaroslavl 45, with <tc-webtag:handle coderId="22532444" context="hs_algorithm"/>
from Kulachi Hansraj coming in third.

 
<H1> 
The Problems 
</H1>
</p> 
 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7523&amp;rd=10703" name="7523">TriangleConstruction</a></b> 
</font>
<A href="Javascript:openProblemRating(7523)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514493" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>


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
      38 / 40 (95.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      37 / 38 (97.37%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Burunduk3</b> for 248.25 points (2 mins 23 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      238.08 (for 37 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

There are many possible approaches to this problem, and most of them were acceptable within the
given constraints. Probably the easiest of them is the brute-force option: consider
all triples of sticks, and for each check whether they can form a triangle.
From among these choose the triangle with greatest perimeter.
<br /><br />

To check whether the sticks with lengths a, b and c can form a triangle, we
must check that the sum of lengths of two shorter ones is greater than the length
of the longest. Alternatively we can check all three possible inequalities: 
a + b &gt; c, b + c &gt; a and  c + a &gt; b.
These inequalities are known as <i>triangle inequalities</i>. Clearly, one
of them corresponds to the required one, and the other two are trivially satisfied.
The code follows:

<pre>
    public int greatestPerimeter(int[] l) {
        int best = -1;
        int n = l.length;
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                for (int k = j + 1; k < n; k++) {
                    if (l[i] + l[j] > l[k] && l[j] + l[k] > l[i] && l[k] + l[i] > l[j]) {
                        if (l[i] + l[j] + l[k] > best) {
                            best = l[i] + l[j] + l[k];
                        }
                    }
                }
            }
        }

        return best;
    }
</pre>

Another approach is to sort the array beforehand. In this case we can check
only one inequality, since we know the order of the lengths. However, 
an additional observation shows that in this case we need to check only successive
sticks. 
<br /><br />

Accordingly, let the array be sorted and the optimal solution be sticks with lengths l[i], l[j] and l[k]
where i &lt; j &lt; k.
Then l[k - 2] &ge; l[i], l[k - 1] &ge; l[j], and therefore l[k - 2] + l[k - 1] &ge; l[i] + l[j] &gt; l[k],
so the triangle with edges made of sticks with lengths l[k - 2], l[k - 1] and l[k]
exists and is at least as good. The code for this approach follows.

<pre>
    public int greatestPerimeter(int[] l) {
        Arrays.sort(l);
        int best = -1;
        int n = l.length;
        for (int i = 2; i < n; i++) {
            if (l[i - 2] + l[i - 1] > l[i]) {
                if (l[i - 2] + l[i - 1] + l[i] > best) {
                    best = l[i - 2] + l[i - 1] + l[i];
                }
            }
        }

        return best;
    }
</pre>

 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7500&amp;rd=10703" name="7500">SortingPhotos</a></b> 
</font>
<A href="Javascript:openProblemRating(7500)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514493" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 
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
      39 / 40 (97.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      30 / 39 (76.92%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Burunduk3</b> for 444.48 points (3 mins 10 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      397.11 (for 30 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

For each photo i let us find a[i] - the number of photos that are smaller than it, and
b[i] - the number of photos that it is smaller than. After that, checking
whether the photo is large, small or average is straightforward.
The code follows:

<pre>
    boolean smaller(int w1, int h1, int w2, int h2) {
        return w1 < w2 && h1 < h2;
    }

    public int[] sortPhotos(int[] w, int[] h) {
        int n = w.length;
        int[] a = new int[n];
        int[] b = new int[n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (smaller(w[i], h[i], w[j], h[j])) {
                    a[i]++;
                    b[j]++;
                }
            }
        }

        int sm = 0;
        int lg = 0;
        for (int i = 0; i < n; i++) {
            if (a[i] == 0 && b[i] > 0) {
                lg++;
            }
            if (b[i] == 0 && a[i] > 0) {
                sm++;
            }
        }

        return new int[]{sm, n - sm - lg, lg};
    }
</pre>
 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7502&amp;rd=10703" name="7502">MultiprocessorProgramming</a></b> 
</font>
<A href="Javascript:openProblemRating(7502)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514493" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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
      29 / 40 (72.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      9 / 29 (31.03%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Burunduk3</b> for 929.39 points (7 mins 57 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      507.46 (for 9 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

First of all, consider the function 
<img src="/i/srm/tchs07rd1gamma/fofx.gif" alt="f(x)=a/x+bx">,
where a &gt; 0, b &gt; 0. 
Let us find the value of x that minimizes f. Transform f in the following way:
<img src="/i/srm/tchs07rd1gamma/transformation.gif" alt="f(x)=a/x+bx = (\sqrt{a/x})^2 + (\sqrt{bx})^2 = (\sqrt{a/x} - \sqrt{bx})^2 + 2\sqrt{ab}">.
Since the square of a real number is non-negative, this value is at least 
<img src="/i/srm/tchs07rd1gamma/2sqrtamulb.gif" alt="2\sqrt{ab}">
and is minimized when 
<img src="/i/srm/tchs07rd1gamma/xissqrtadivb.gif" alt="x = \sqrt{a/b}">.
<br /><br />

Now let us get back to our problem. Let the function <tt>relax(int n)</tt> calculate
the time needed for executing the task on n processors, compare it to the best
known value, and update it if necessary.
<br /><br />

The time needed to execute the task onthe optimal number of processors is at least t0 + tp, 
since this value can be achieved using one processor. Therefore we can safely initialize the
best known needed time as t0 + tp. 
<br /><br />

Following the considerations from the first paragraph,
we deduce that the time needed to execute the parallelizable part of the task on several 
processors descends until n - 1 is approximately <img src="/i/srm/tchs07rd1gamma/sqrttpdivts.gif" alt="\sqrt{tp/ts}">
and grows after that. Therefore it is clearly irrelevant to use
more than <img src="/i/srm/tchs07rd1gamma/sqrttpdivts.gif" alt="\sqrt{tp/ts}"> rounded up additional
processors. Since tp doesn't exceed 10<sup>9</sup>, this value doesn't exceed
31623. So we can check n from 1 to 
<img src="/i/srm/tchs07rd1gamma/ceiltptsplus1.gif" alt="\left\lceil\sqrt{tp/ts}\right\rceil + 1">
and call <tt>relax(n)</tt> for all of these values. Code follows:

<pre>
    double best;
    int opt;

    int t0;
    int tp;
    int ts;

    void relax(int n) {
        double value = Math.max(t0, 1.0 * tp / (n - 1) + 1.0 * ts * (n - 1));
        if (value < best) {
            best = value;
            opt = n;
        }
    }

    public long optimalNumberOfProcessors(int t0, int tp, int ts) {
        this.t0 = t0;
        this.tp = tp;
        this.ts = ts;

        best = t0 + tp;
        opt = 1;

        for (int i = 2; i <= Math.sqrt(tp / ts) + 2; i++) {
            relax(i);
        }

        return opt;
    }
</pre>


<div class="authorPhoto">
    <img src="/i/m/andrewzta_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="11829284" context="algorithm"/><br />    <em>TopCoder Member</em>
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
