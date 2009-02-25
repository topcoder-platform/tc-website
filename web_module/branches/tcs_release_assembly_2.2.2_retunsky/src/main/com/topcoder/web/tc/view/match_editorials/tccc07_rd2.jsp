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
    <A href="/stat?c=round_overview&er=5&rd=10891">Match Overview</A><br />
    <tc-webtag:forumLink forumID="517259" message="Discuss this match" />
</div>
<span class="bodySubtitle">2007 TopCoder Collegiate Challenge<br />Algorithm Round 2</span><br />Saturday, September 8, 2007
<br /><br />



<h2>Match summary</h2>

<p> 

Round 2 of the 2007 TopCoder Collegiate Challege had to cut 900 competitors down to the 300 slots available in Round 3. In the battle to continue their quest for Disney World, coders had to face 3 problems of increasing difficulty. More than 20 of them
finished the round with all three correct, proving themselves deserving of getting to Round 3.
As it turned out, even a good time on the easy was enough to move forward.
</p> 
<p>
The round was won by <tc-webtag:handle coderId="13351270" context="algorithm"/>, who took first place ahead of many higher rated coders. <tc-webtag:handle coderId="251074" context="algorithm"/> followed
closely, with <tc-webtag:handle coderId="9906197" context="algorithm"/> rounding out the top three.
</p>

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7554&amp;rd=10891" name="7554" onClick="return (false);">PowerOfInteger</a></b> 

</font> 

<A href="Javascript:openProblemRating(7554)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517259" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      764 / 811 (94.20%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      536 / 764 (70.16%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>rahulgarg123</b> for 248.13 points (2 mins 28 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      201.43 (for 536 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
This problem can be solved by direct search. Let us fix number k and try to find whether there is a number
between left and right, inclusive, that is the k-th power of some integer. To do this we can find x - the
smallest number such that its k-th power is greater or equal to the left, and test whether x^k &le; right.
If it is, x^k is the k-th power of integer that is between left and right. In the other case, clearly,
there is none.
</p>
<p>
To find x we can use either binary search (in this case we can use only integers), or use
floating point math functions and, for example, test numbers around left^(1/k).
</p>
<p>
The last thing to note is that since 2^40=1099511627776 &gt; 10^12, the answer doesn't exceed 39, so
we only need to test k from 1 to 39.
</p>
<p>
The code follows.
</p>

<pre>
    long power(long v, int k) {
        long r = 1;
        for (int i = 0; i &lt; k; i++) {
            r *= v;
        }
        return r;
    }

    long root(long v, int k) {
        long l = 1;
        long r = Math.round(Math.pow(v, 1.0 / k)) + 1;
        while (l &lt; r - 1) {
            long m = (l + r) / 2;
            if (power(m, k) &gt; v) {
                r = m;
            } else {
                l = m;
            }
        }
        return l;
    }

    public int greatestPower(String left, String right) {
        long l = Long.parseLong(left);
        long r = Long.parseLong(right);

        for (int k = 39; k &gt; 1; k--) {
            long vl = root(l, k);
            long vlp = power(vl, k);
            if (l &lt;= vlp &amp;&amp; vlp &lt;= r) {
                return k;
            }
            vlp = power(vl + 1, k);
            if (l &lt;= vlp &amp;&amp; vlp &lt;= r) {
                return k;
            }
        }
        return 1;
    }

</pre>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8111&amp;rd=10891" name="8111" onClick="return (false);">RLESum</a></b> 

</font> 

<A href="Javascript:openProblemRating(8111)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517259" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      435 / 811 (53.64%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      166 / 435 (38.16%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Petr</b> for 407.20 points (14 mins 15 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      238.20 (for 166 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem turned out to be quite technical, so many coders had a hard time implementing its solution.
Actually, as usually for such problems, it was needed to clearly understand about each statement
in the program - what, how and why it does.
</p>
<p>
First, let us convert the representation of each number to the list of pairs (d<sub>i</sub>, l<sub>i</sub>), 
where the pair means that the digit d<sub>i</sub> is repeated l<sub>i</sub> times.
After that we refactor these lists so that in both lists for a and for b corresponding l<sub>i</sub> are
equal (we can do it by splitting some of the pairs).
</p>
<p>
Now we sum the blocks, keeping the carry. Suppose that we add up the blocks (a<sub>i</sub>, l)
and (b<sub>i</sub>, l), and the carry from the previous block is c. Then the last digit
of the sum block is (a<sub>i</sub>+b<sub>i</sub>+c) mod 10, the carry inside the block 
is c'=(a<sub>i</sub>+b<sub>i</sub>+c)/10 (integer division),
the digit inside the block is (a<sub>i</sub>+b<sub>i</sub>+c') mod 10, and the carry
to the next block is equal to c'.
</p>
<p>
All we need to answer the questions now is to track which block each of the digits of the sum
is in. Another thing not to forget is that the sum can contain one digit more if there is a 
carry from the last block.
</p>
<p>
The code follows:</p>
<pre>
    class Pair {
        long l;
        int d;

        public Pair(long l, int d) {
            this.l = l;
            this.d = d;
        }
    }

    ArrayList decompress(String a) {
        ArrayList r = new ArrayList();
        for (int i = 0; i &lt; a.length(); i++) {
            long l = 1;
            if (a.charAt(i) == '[') {
                int j = i;
                while (a.charAt(j) != ']') {
                    j++;
                }
                l = Long.parseLong(a.substring(i + 1, j));
                i = j + 1;
            }
            r.add(new Pair(l, a.charAt(i) - '0'));
        }
        ArrayList rr = new ArrayList();
        for (int i = r.size() - 1; i &gt;= 0; i--) {
            rr.add(r.get(i));
        }
        return rr;
    }

    public int getDigit(String a, String b, long k) {
        ArrayList ap = decompress(a);
        ArrayList bp = decompress(b);

        ArrayList ai = new ArrayList();
        ArrayList bi = new ArrayList();
        int i = 0;
        int j = 0;
        while (i &lt; ap.size() &amp;&amp; j &lt; bp.size()) {
            long d = Math.min(ap.get(i).l, bp.get(j).l);
            ai.add(new Pair(d, ap.get(i).d));
            bi.add(new Pair(d, bp.get(j).d));
            if (d == ap.get(i).l) {
                i++;
            } else {
                ap.get(i).l -= d;
            }
            if (d == bp.get(j).l) {
                j++;
            } else {
                bp.get(j).l -= d;
            }
        }
        while (i &lt; ap.size()) {
            ai.add(new Pair(ap.get(i).l, ap.get(i).d));
            bi.add(new Pair(ap.get(i).l, 0));
            i++;
        }
        while (j &lt; bp.size()) {
            ai.add(new Pair(bp.get(j).l, 0));
            bi.add(new Pair(bp.get(j).l, bp.get(j).d));
            j++;
        }

        long d = 0;
        int carry = 0;
        i = 0;
        while (d &lt;= k &amp;&amp; i &lt; ai.size()) {
            Pair aa = ai.get(i);
            Pair bb = bi.get(i);
            long l = aa.l;

            if (d == k) {
                return (aa.d + bb.d + carry) % 10;
            } else if (d + l &gt; k) {
                if (aa.d + bb.d + carry &gt;= 10) {
                    return (aa.d + bb.d + 1) % 10;
                } else {
                    return (aa.d + bb.d) % 10;
                }
            }

            if (aa.d + bb.d + carry &gt;= 10) {
                carry = 1;
            } else {
                carry = 0;
            }
            d += l;
            i++;
        }
        if (d == k) {
            return carry;
        } else {
            return 0;
        }
    }

    public int[] getDigits(String a, String b, String[] k) {
        int n = k.length;

        int[] r = new int[n];
        for (int i = 0; i &lt; n; i++) {
            r[i] = getDigit(a, b, Long.parseLong(k[i]));
        }

        return r;
    }
</pre>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6177&amp;rd=10891" name="6177" onClick="return (false);">JobPlanner</a></b> 

</font> 

<A href="Javascript:openProblemRating(6177)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517259" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      116 / 811 (14.30%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      36 / 116 (31.03%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>NauCoder</b> for 862.58 points (11 mins 43 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      630.60 (for 36 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

As the method name slightly hints, this problem is related to <a href="/tc?module=Static&d1=tutorials&d2=minimumCostFlow1">mincost flow</a>. 
Suppose that the worker i is already performing t tasks and is assigned another one. In this 
case the total cost of completing
all tasks increases by cost[i] * ((t + 1)<sup>2</sup> - t<sup>2</sup>) = cost[i] * (2 * t + 1). 
</p>
<p>
Suppose that each worker completes a task he can perform in one hour.
Then completing the task by the i-th worker on the k-th hour costs cost[i] * (2 * k - 1).
</p>
<p>
Create a bipartite graph where the vertex of the left part is the task, and vertex
of the right part is the process of some worker completing some task
on some hour. If worker i can perform task j, for all k from 1 to n we connect
the vertex that represents task j with the vertex that represtents
the k-th hour of worker j by an edge with capacity 1 and cost cost[j] * (2 * k - 1).
The fragment of the graph with worker 1 is shown on the picture
below.
</p>
<p align="center">
<img src="/i/education/tccc07_rd2/JobPlanner-1.gif" />
</p>
<p>
Combining these fragments for all workers, and adding a source and a sink, we get
the graph, the value of mincost flow for the cost of completing
all tasks.
</p>
<p align="center">
<img src="/i/education/tccc07_rd2/JobPlanner-2.gif" />
</p>
<p>
However, the size of the graph is too large. Although the solution which finds the mincost flow
in the described graph actually passes systests, we cannot feel comfortable when looking for the
mincost flow in the graph with 2500+ vertices. There are several ways to deal with that.
One, as <tc-webtag:handle coderId="10574855" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=266182&rd=10891&pm=6177&cr=10574855">solution</a> suggests,
is to add vertices when needed, keeping only one vertex for each worker, besides saturated 
(although the solution failed systests, the idea is correct).
</p>
<p>
Another way is to reduce the size of the graph. Looking at the right part of the graph,
we note that the cost of the edge entering some vertex is the same for all edges. So we can
actually move this cost from these edges to the edge that goes to the sink. And now we can
merge vertices corresponding to the same worker to one, getting parallel edges to the sink.
We get the graph, as shown on the picture below. It has a vertex for each task, and a vertex
for each worker. Each task is connected to each worker that can perform it by an edge
with capacity 1 and cost 0, and each worker is connected to the sink by n edges with
capacity 1 each, and costs cost[i], 3 * cost[i], ..., (2 * n -1) * cost[i], respectively.
</p>
<p align="center">
<img src="/i/education/tccc07_rd2/JobPlanner-3.gif" />
</p>
<p>
And finally the most surprising idea is that we actually need no mincost flow at all!
We can go with just a 
<a href="/tc?module=Static&d1=tutorials&d2=maxFlow2">bipartite matching</a> algorithm.
</p>
<p>
Looking again at the graph that we first constructed, we see that we actually need
to find the minimal weight matching in the bipartite graph. And the cost of the
edge only depends on its right end. Thus we can move the cost from the edge to the vertex.
So we need to find the matching that has the minimal sum of costs of its right ends.
This is exactly the problem of finding the minimal cost base in a transversal 
<a href="http://en.wikipedia.org/wiki/Matroid">matroid</a> (called
<a href="http://planetmath.org/encyclopedia/Matroid.html">matching matroid</a>
at <a href="http://planetmath.org">Planet Math</a>). This base can be found
by a <a href="http://en.wikipedia.org/wiki/Weighted_matroid">greedy algorithm</a>. 
So we sort the vertices in the right part by their weight, 
and try to find the augmenting paths starting from the cheapest one. When all vertices
in the left part are saturated, we are done. Look at 
<tc-webtag:handle coderId="15881985" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=266195&rd=10891&pm=6177&cr=15881985">solution</a>
for a nice implementation of this idea.
</p>
<br /><br />



<div class="authorPhoto">
    <img src="/i/m/andrewzta_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="11829284" context="algorithm"/><br />
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
