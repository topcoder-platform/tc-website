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
<style type="text/css">
    .code
{
   width: 500;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 12px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
    }

</style>
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
<tc-webtag:forumLink forumID="506109" message="Discuss this match" /></div>
<span class="bodySubtitle">2006 TopCoder Collegiate Challenge <br> Online Round 1-C</span><br>September 27, 2006
<br><br>

<h2>Match summary</h2>

 

<p>
The score distribution in this round seems similar to the ones in rounds 1-A and 1-B. The problems were balanced, with the exception of the hard problem, which was solved by only three people.
The top spot was taken by <tc-webtag:handle coderId="260835" context="algorithm"/>, second went <tc-webtag:handle coderId="9906197" context="algorithm"/> and rounding out the top three was <tc-webtag:handle coderId="8527113" context="algorithm"/>, who regained his red status. Congratulations to them and to all the advancers!
</p>

 

<H1>
The Problems
</H1>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6750&amp;rd=10104" name="6750">FriendlySequences</a></b>

</font>

<A href="Javascript:openProblemRating(6750)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506109" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      274 / 300 (91.33%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      236 / 274 (86.13%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Krzysan</b> for 248.44 points (2 mins 15 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      208.06 (for 236 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

This proved to be a simple problem -- many people solved it, and some did so in impressively short times. A naive approach is to fix the start and end indices of a contignuous subsequence. We can then test if the numbers in the sequence are friendly. We can do this by testing if each number in the subsequence is friendly with the first number in it. 
<pre>        
    public int count(int[] a) {
        int nr = 0;
        for (int i = 0; i < a.length;i++) {
            for (int j = i + 1; j < a.length; j++) {
                if (isFriendly(i, j, a)) nr++;
                else break;
            }
        }
        return nr;
    }

        boolean isFriendly(int start, int end, int[] a) {
        for (int i = start + 1; i <= end; i++)
                        if (!friendly(a[start], a[i]) return false;
                return true;                
        }
</pre>
<br>
To test if two numbers are friendly, we need to find the set of digits in each number. Here is one way of doing this:
<br>
<pre>
    int[] digits(int x) {
        int[] ret = new int[10];
        if (x == 0) ret[0] = 1;
        else {
            while (x != 0) {
                ret[x % 10] = 1;
                x /= 10;
            }
        }
        return ret;
    }
</pre>

ret[i] will be 1 if x contains the digit i, and 0 otherwise.

<br><br>
Testing the friendlyness of two numbers is easy now:
<br>
<pre>
    boolean friendly(int x, int y) {
        int[] a = digits(x);
        int[] b = digits(y);
    return Arrays.equals(a, b);
    }
</pre>



</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6723&amp;rd=10104" name="6723">QueenCovering</a></b>

</font>

<A href="Javascript:openProblemRating(6723)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506109" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      123 / 300 (41.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      102 / 123 (82.93%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Krzysan</b> for 434.66 points (11 mins 22 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      286.70 (for 102 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

To solve this problem we can simply try every possible valid queen placement on the board, and check if the configuration covers all the cells on the board. 
One way of doing this is the following:
<pre>
    boolean ok() {
        for (int i = 0; i < 8; i++) {
            if (row[i]) continue;
            for (int j = 0; j < 8; j++) {
                if (b[i].charAt(j) == '.') {
                    if (column[j] || firstDiagonal[i - j + 7] || secondDiagonal[i + j]) return false;
                }
            }
        }
        return true;
    }

    void back(int curRow, String curSol) {
        if (curRow == 8) {
            if (!ok()) return;
            if (curSol.length() < sol.length() ||
                    (curSol.length() == sol.length() && curSol.compareTo(sol) < 0))
                sol = curSol;
            return;
        }
        for (int i = 0; i < 8; i++) {
            if (!column[i] && !firstDiagonal[curRow - i + 7]
                && !secondDiagonal[curRow + i] && b[curRow].charAt(i) != '#') {

                row[curRow] = true; column[i] = true;  firstDiagonal[curRow - i + 7] = true; 
                secondDiagonal[curRow + i] = true;

                back(curRow + 1, curSol + (char)('1' + row) + (char)('A' + i));

                row[curRow] = false; column[i] = false; firstDiagonal[curRow - i + 7] = false; 
                secondDiagonal[curRow + i] = false;
            }
        }
        back(curRow + 1, curSol);
    }
</pre>

The boolean arrays row, column, firstDiagonal and secondDiagonal keep information about which rows, columns and diagonals have a queen placed on them. This makes the process of finding a configuration where the queens don't attack one another easier, and also make the last verification step  more efficient.
<br><br> 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6695&amp;rd=10104" name="6695">SnowStorm</a></b>

</font>

<A href="Javascript:openProblemRating(6695)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506109" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division One - Level Three: <blockquote><table cellspacing="2">

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

      9 / 300 (3.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      3 / 9 (33.33%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>reid</b> for 524.49 points (37 mins 34 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      470.65 (for 3 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

This problem is a bit harder than the usual div 1 1000. 
The problem asks the solver to find the number of different connected subgraphs of a given graph G, with the set V of vertices, and the set E of edges, so that the subgraphs contains all vertices in V.
The fact that n is smaller than 16 suggests that an exponential solution is possible. 
One approach would be to try finding num[V'], where V' is a subset of V and num[V'] is the number of connected subgraphs of G that have as vertices the nodes in V'. 
Also let e[V'] be the number of subgraphs of G, with the vertex set V'.
e[V'] is easy to find because if we have m edges between the vertices of V' in the original graph, 
then for each edge we have two possibilities, adding it or not adding it to a subgraph, so e[V'] = 2<sup>m</sup>. 
<br>
<br>
Now suppose we want to find num[V'], and we know e[V'] and also num[V"] and e[V"] for every subset V" of V'.
Having this data, it's easier for us to compute the number of disconnected subgraphs of G with the vertex set V'. Let v be the vertex with the largest index in V'. Now for a subgraph G' of G that contains the vertices V' to be disconnected we have to have v in one connected component, and the other vertices in different components, so we have to split V' in two sets of nodes V<sub>1</sub> and V<sub>2</sub>. We also need a connected subgraph with the nodes V<sub>1</sub> and another subgraph with the nodes V<sub>2</sub>.
This way we can find that the number of disconnected subgraphs with the vertice set V' is equal to the sum of num[V<sub>1</sub>] * e[V<sub>2</sub>] for every possible way of splitting V' in sets V<sub>1</sub> and V<sub>2</sub> so that V<sub>1</sub> contains the node v. <br>
<br>
To find the connected graphs we just need to substract the previous number from e[V'].
So we have the recurrence formula num[V'] = e[V'] - sum num[V<sub>1</sub>] * e[V<sub>2</sub>]. This solution has the complexity O(3<sup>n</sup> + n * 2<sup>n</sup>) because we can iterate through the sets and subsets in the problem by going through numbers 0 to 3<sup>n</sup> - 1. The digits that are not 0 in the current number correspond to the vertices of V', and digits 1 and 2 correspond to vertices in V<sub>1</sub> and V<sub>2</sub>, respectively.
<br>
 <br>
 One way of implementing the above would be this:
<pre>
    void doit(int x, int b1, int b2, int l) {
        if (x == n) {
            if (l == 2)
                num[b1 | b2] = (10000 + num[b1 | b2] - (e2[b1] * num[b2])) % 1000;
        } else {
            doit(x + 1, b1, b2, l);
            doit(x + 1, b1 | (1 << x), b2, 1);
            doit(x + 1, b1, b2 | (1 << x), 2);
        }
    }
    public int countWays(String[] paths) {
        n = paths.length;
        num = new int[1 << n];
        e2 = new int[1 << n];
        for (int i = 0; i < (1 << n); i++) {
            for (int j = n - 1; j  >= 0; j--) {
                if ((i & (1 << j))!= 0) {
                    if (i == (1 << j)) {
                        num[i] = 1;
                        e2[i] = 1;
                    } else {
                        num[i] = num[i & ~(1 << j)];
                        for (int j1 = j - 1; j1 >= 0; j1--) {
                            if ((i & (1 << j1))!= 0) {
                                if (paths[j].charAt(j1) == 'Y') {
                                    num[i] = (2 * num[i]) % 10000;
                                }
                            }
                        }
                        e2[i] = num[i];
                    }
                    break;
                }
            }
        }
        doit(0, 0, 0, -1);
        return num[(1 << n) - 1] % 10000;
    }
</pre>
</p>

<div class="authorPhoto">
    <img src="/i/m/Cosmin.ro_big.jpg" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="303185" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="/public_right.jsp">
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
