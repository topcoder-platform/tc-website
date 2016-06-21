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
    <A href="/stat?c=round_overview&er=5&rd=10897">Match Overview</A><br />
    <tc-webtag:forumLink forumID="517209" message="Discuss this match" />
</div>
<span class="bodySubtitle">2007 TopCoder Collegiate Challenge<br />Algorithm Round 1B</span><br />Thursday, August 30, 2007
<br /><br />



<h2>Match summary</h2>

<p>

Coders from Russia dominated this round, occupying the top 3 spots in the final table.
Rating favorite <tc-webtag:handle coderId="10574855" context="algorithm"/> easily won this round, 
followed by TCO07
finalists  
<tc-webtag:handle coderId="21971539" context="algorithm"/> and <tc-webtag:handle coderId="21822659" context="algorithm"/>.
</p>

 

<H1>

The Problems

</H1>

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=4516&amp;rd=10897" name="4516">Popularity</a></b>

</font>

<A href="Javascript:openProblemRating(4516)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517209" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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

      465 / 510 (91.18%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      420 / 465 (90.32%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>misof</b> for 248.57 points (2 mins 9 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      196.33 (for 420 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
In this problem we need to sort an array of Strings. To do that, we must
<ul>
<li>compute the popularity of each of the names</li>
<li>sort the array to arrange the popularities in non-increasing order</li>
<li>make sure that our sorting method is stable (that it preserves the order of the names of the same popularity)</li>
</ul>

To compute the popularity of each of the names, we first find the first name for each of the invitation letters.
Then we create an array, with the i-th element storing the popularity of the i-th input name, and sort it according to the popularities.
To make sure the sort algorithm is stable, we'll implement a simple bubble-sort. Please find a simple java-solution below 
(since the input array is at most 50 elements, we can compute all popularities from the scratch any time we need them):

<pre>
    public String[] sort(String[] data) {
        for (int i = 0; i < data.length; i++)
            for (int j = 0; j < data.length - 1; j++) {
                int a1 = 0;
                for (int k = 0; k < data.length; k++)
                    if (data[k].split(" ")[0].equals(data[j].split(" ")[0]))
                        a1++;
                for (int k = 0; k < data.length; k++)
                    if (data[k].split(" ")[0].equals(data[j + 1].split(" ")[0]))
                        a1--;
                if (a1 < 0) {
                    String v = data[j];
                    data[j] = data[j + 1];
                    data[j + 1] = v;
                }
            }
        return data;
    }

</pre>


</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7811&amp;rd=10897" name="7811">MutateTree</a></b>

</font>

<A href="Javascript:openProblemRating(7811)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517209" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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

      266 / 510 (52.16%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      176 / 266 (66.17%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Soultaker</b> for 424.32 points (12 mins 27 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      277.53 (for 176 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
This problem can be solved in a number of ways. For example, you can transform the input into a tree structure 
(storing a father and a couple of children for each of the nodes), swap the subtrees and return a String representation 
of the resulting tree. Since all these algorithms are classical, we'll explain another approach.
</p>
<p>
In fact, to return the representation of the tree after the swap we don't need to construct the tree itself.
We will find two substrings of the input, which completely describe the subtrees rooted with root1 and root2 respectively.
Then we'll check whether the substrings intersect (checking for an overlap), swap them in the string and return the result. 
</p>
<p>
If the input string represents a valid tree, then for each index K you can find another index L such that the substring between 
indices L and K will represent a subtree rooted at the vertex at position K. 
We'll create an array (<b>first</b> in the code below) and the i-th element of this array will represent the 
first character of the subtree rooted at vertex number i. This value can be easily found in the following way:
<ul>
<li>If the i-th character of the input is an uppercase letter, then first[i] = i.</li>
<li>Otherwise, the (i-1)-th character represents the right child of the i-th vertex, string between first[i - 1]-th and (i-1)-th characters
represents the string rooted at the (i-1)-th vertex, and string between first[first[i - 1] - 1]-th and (first[i - 1] - 1)-th characters represent
the subtree rooted at the left child of the i-th vertex. Therefore, first[i] = first[first[i - 1] - 1].</li>
</ul>
As we find that, the solution becomes quite obvious. We compute the elements of <b>first</b> iterating through the input string
and checking whether the input tree is valid.
If the input represents a valid tree, checking whether two input trees intersect is easy, as well as swapping the corresponding substrings in the output:
</p>
<pre>
    public String newTree(String tree, int r1, int r2) {
        if (r1 > r2) {
            int tmp = r1;
            r1 = r2;
            r2 = tmp;
        }
        int n = tree.length();
        int[] first = new int[n];
        for (int i = 0; i < n; i++) {
            if (tree.charAt(i) >= 'A' && tree.charAt(i) <= 'Z') {
                first[i] = i;
                continue;
            }
            if (i - 1 < 0) return "BADTREE";
            int j = first[i - 1] - 1;  //j is last in i's lc
            if (j < 0) return "BADTREE";
            first[i] = first[j];
        }
        if (first[n - 1] != 0) return "BADTREE";  //(fix)
        int f1 = first[r1], f2 = first[r2];
        if (f2 <= r1) return "OVERLAP";
        return tree.substring(0, f1) + tree.substring(f2, r2 + 1) +
                tree.substring(r1 + 1, f2) + tree.substring(f1, r1 + 1) + tree.substring(r2 + 1);
    }
</pre>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7846&amp;rd=10897" name="7846">MarbleTop</a></b>

</font>

<A href="Javascript:openProblemRating(7846)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517209" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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

      102 / 510 (20.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      21 / 102 (20.59%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Petr</b> for 864.90 points (11 mins 36 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      644.16 (for 21 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
The first thing to observe in this problem is that the orders of length <b>k</b> are special ones - first, we can get plenty of 
them as a side effect of others orders, and, second, we can cut at least one marble of length <b>k</b> out of any stock marble of length > <b>k</b>.
Therefore it might be a good idea to fill other orders first.
</p>
<p>
Obviously, if we can use several marbles from the stock to get a marble of some length m, 
the best way is to use the shortest available marble. This gives us a very simple algorithm to check the availability
for all orders (except for those of length k) - sort all stock marbles, iterate through all orders. 
For each order[i], find the shortest stock marble of size (order[i] + i * <b>k</b>) and remove this marble from the stock.
Of course, if there is no such marble for at least one order, the method should return -1. 
Also, count how many marbles of length <b>k</b> you cut during the process.
</p>
<p>
Now we need to fulfill the orders for the marbles of length <b>k</b>. First, compute the number of marbles of length <b>k</b>
you already have (those you had in stock plus those you might have gotten some while fulfilling other orders). 
If you already have enough marbles, the process is over. Otherwise, you need to cut more marbles of length <b>k</b> from 
longer ones. The last trick to note is that cutting marbles of length divisible by <b>k</b> is better than others, so you should
cut marbles of lengths i * <b>k</b> first. The implementation of this algorithm should be pretty easy; 
see <tc-webtag:handle coderId="10574855" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=266057&rd=10897&pm=7846&cr=10574855">solution</a> as an example.
</p>
<br /><br />



<div class="authorPhoto">
    <img src="/i/m/Olexiy_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/><br />
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
