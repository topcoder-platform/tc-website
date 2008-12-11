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

<tc-webtag:forumLink forumID="506025" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 3</span><br>Monday, June 19, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>
The 1,000-point problem turned out to be easy in this match, with 40 coders successfully solving it.
<strong>Weiqi</strong> took the lead after the coding phase but, thanks to two +75s in challenge phase,
<b>Burunduk1</b> got up to the first place and won his third HS SRM in a row.
<b>Weiqi</b> finished second, third place went to <b>Loner</b>, and fourth and
fifth went to newcomers <b>rlp</b> and <b>ilyakor</b> respectively.
</p>
 
<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6440&amp;rd=10021"
name="6440">BestSeller</a></b>
</font>
<A href="Javascript:openProblemRating(6440)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506025"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Level One: <blockquote><table cellspacing="2">
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
      110 / 123 (89.43%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      98 / 110 (89.09%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Zuza</b> for 249.38 points (1 mins 25 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      221.30 (for 98 correct submissions) 
    </td>
  </tr>
</table></blockquote>

<p>
This problem asked for a value that occurs most times in
the given array. Constraints were so low that it was not neccessary
to use any sophisticated data structure; you could just iterate
values and, for each value, count the amount of times it occurs in
the array, then choose the best according to the criteria described in the problem.
Java code follows:
<pre>
public String findBestSeller(String[] items) {
   int n, i, j, best, cur;
   String ret;
   n = items.length;
   best = -1;
   ret = "";
   for (i = 0; i < n; i++) {
      cur = 0;
      for (j = 0; j < n; j++) if (items[j].compareTo(items[i]) == 0) cur++;
      if (cur > best || (cur == best && items[i].compareTo(ret) < 0)) {
         best = cur;
         ret = items[i];
      }
   }
   return ret;
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5989&amp;rd=10021"
name="5989">KidsWordGame</a></b>
</font>
<A href="Javascript:openProblemRating(5989)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506025"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Level Two: <blockquote><table cellspacing="2">
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
      90 / 123 (73.17%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      63 / 90 (70.00%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>MB__</b> for 426.66 points (6 mins 43 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      320.85 (for 63 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
First of all let's write a function which will be able to say whether
the word <i>b</i> might be obtained from word <i>a</i> without violating
the rules (i.e. without cheating). Java code of this function follows:
<pre>
boolean ok(String a, String b) {
   if (b.length() == a.length() + 1 && b.indexOf(a) != -1) return true;
   else return false;
}
</pre>
Now we can write the solution itself:
<pre>
public int getCheater(String[] first, String[] second, String[] third) {
   int n, i, j;
   String s;
   s = first[0]; // The original word
   n = Math.max(first.length, Math.max(second.length, third.length));
   for (i = 0; i < n; i++) {
           if (i == first.length) break;
      // Notice that there is no previous move for the first move in the game
           if (i == 0 || ok(s, first[i])) s = first[i];
           else return 3;
           if (i == second.length) break;
           if (ok(s, second[i])) s = second[i];
           else return 1;
           if (i == third.length) break;
           if (ok(s, third[i])) s = third[i];
           else return 2;
   }
   return -1;
}
</pre>
<p>If some player saw a word that could not be obtained from the previous word, it would indicate that the previous palyer is a cheater.
  </p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=5987&amp;rd=10021"
name="5987">BestDecomposition</a></b>
</font>
<A href="Javascript:openProblemRating(5987)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506025"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Level Three: <blockquote><table cellspacing="2">
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
      56 / 123 (45.53%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      40 / 56 (71.43%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Weiqi</b> for 992.28 points (2 mins 30 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      723.05 (for 40 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Here you were asked to find such <i>f<sub>1</sub>, f<sub>2</sub>,
..., f<sub>m</sub></i>, that they sum up to <i>n</i> and their product is maximal.
Let's forget that all <i>f</i>'s must be integers. Suppose that they may be float,
but don't forget that they must be non-negative.
Now let me prove, that all <i>f</i>'s must be equal in order to maximize their
product. Let's take some two of these numbers, say <i>f<sub>i</sub> = a</i> and
<i><sub>j</sub> = b</i>. Then:<br>
ab <= ((a + b) / 2)<sup>2</sup><br>
ab <= (a<sup>2</sup> + 2ab + b<sup>2</sup>) / 4<br>
4ab <= a<sup>2</sup> + 2ab + b<sup>2</sup><br>
0 <= a<sup>2</sup> - 2ab + b<sup>2</sup><br>
0 <= (a - b)<sup>2</sup><br>
Now we know that all <i>f</i>'s must be equal. Let's call it <i>x</i>.
So we need to find this <i>x</i>.
It's obvious that <i>x</i> > 1, and <i>x</i> < 5 (because we can decompose 5 to
2 + 3, so 2 * 3 = 6, which is more than 5 itself). More definitely <i>x</i> is
even less than 4, beacuse 4 = 2 + 2, 2 * 2 = 4, which is not less than 4 itself.
So, because 2 and 3 are the only integer numbers which satisfy condition
1 < <i>x</i> < 4, we can just check them both and find out, that 3 is better.
Nice and fast C++ code of <b>Weiqi</b> follows (original code is a bit changed):
<pre>
struct BestDecomposition {
   int maxProduct(int n) {
      int i, j, k;
      k = 1;
      while (n > 4)
      {
         k *= 3;
         k %= 10007;
         n -= 3;
      }
      k *= n;
      k %= 10007;
      return k;
   }
};
</pre>
</p>

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
