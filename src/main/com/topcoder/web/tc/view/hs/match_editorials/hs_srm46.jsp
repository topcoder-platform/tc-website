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
    <A href="/tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/tc?module=HSRoundOverview&rd=10801&snid=2&er=5">Match Overview</A><br />

<tc-webtag:forumLink forumID="516572" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 46</span><br />Wednesday, November 28, 2007
<br /><br />


<h2>Match summary</h2>

<p>

The match attracted 97 registrants, 19 of them newcomers. Coders faced a tricky medium and not so difficult hard - it resulted in 9 people getting all three problems correct and 7 with easy and hard. <br><br>
In a tough race, thanks to fast solutions for all problems, <tc-webtag:handle coderId="20812309" context="hs_algorithm"/> won the match, followed by <tc-webtag:handle coderId="22653715" context="hs_algorithm"/> with less than 4 points behind and <tc-webtag:handle coderId="22627975" context="hs_algorithm"/> who took the third place. 

</p>

 

<H1>

The Problems

</H1>

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8108&amp;rd=10801" name="8108">Pawns</a></b>

</font>

<A href="Javascript:openProblemRating(8108)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516572" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      66 / 84 (78.57%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      59 / 66 (89.39%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Quelloquialism</b> for 247.61 points (2 mins 47 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      201.21 (for 59 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

This was a pretty straighforward problem. All we have to do is iterate through all pawn positions and mark the squares that are threatened. Then, we just need to count the number of empty and marked squares on the board. Here goes a sample Java solution:<br>
 <pre>
public int pawnsAttack(String[] pawns){
  
  int [][] attack = new int[10][10];
  
  for(int i = 0; i < pawns.length; i++){
    int x = pawns[i].charAt(0) - 'a' + 1;
    int y = pawns[i].charAt(1) - '0';
    // mark occupied squares
    attack[x][y] = -100;  
    // mark threatened squares
    attack[x-1][y+1]++;
    attack[x+1][y+1]++;
  }
        
  int res = 0;
  
  for(int i = 1; i &lt;= 8; i++)
    for(int j = 1; j &lt;= 8 ;j++) if(attack[i][j] &gt; 0) res++;
        
  return res;
}
</pre>
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8239&amp;rd=10801" name="8239">FoodCollecting</a></b>

</font>

<A href="Javascript:openProblemRating(8239)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516572" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      34 / 84 (40.48%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      13 / 34 (38.24%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>spencer</b> for 492.37 points (3 mins 32 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      353.13 (for 13 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

This task turned out to be the most difficult one, although it has a simple greedy solution.<br><br>

Suppose we want to finish gathering food with <b>n</b>+x workers. It is easy to see that to collect most units of food, we have to hire x workers as quickly as possible. So, the best solution, with <b>n</b>+x workers at the end, consists of two parts:<br><br>

1. In first rounds, if you have enough food and less than x extra workers - hire new ones<br>
2. When you have x extra workers just collect food till you get enough units.<br><br>

Clearly, we will never need to use more than <b>neededFood</b> workers, so we can try every possible value of x. Simple simulation for every possible x was enough to pass all the system tests (see <tc-webtag:handle coderId="22653715" context="hs_algorithm"/>'s fastest <a href="/tc?module=HSProblemSolution&cr=22653715&rd=10801&pm=8239">solution</a>). We can also solve this task in linear time using results for x to x+1 and integer division.<br><br>

Some coders tried dynamic programming as well. There is also other greedy approach - see <tc-webtag:handle coderId="22700760" context="hs_algorithm"/>'s <a href="/tc?module=HSProblemSolution&cr=22700760&rd=10801&pm=8239">solution</a> for clean implementation of this idea.

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8109&amp;rd=10801" name="8109">KingsTour</a></b>

</font>

<A href="Javascript:openProblemRating(8109)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516572" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      29 / 84 (34.52%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      16 / 29 (55.17%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>momtchil</b> for 874.64 points (11 mins 5 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      667.58 (for 16 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

Another chess problem, but this time a more complicated one. At first, this problem seems to have O(1) solution. Unfortunately, it could be too complicated to implement without any mistakes. Instead of this, we will use simple BFS procedure.<br><br>

Let's denote king's starting position with K, pawn A's starting position with PA and pawn B's starting position with PB. Let's assume we have an optimal king's path. There are 2 possibilities:<br><br>

1. The king doesn't capture B. Then, he moves to A's square as quick as possible, avoiding squares threatened by either of the pawns.<br>
2. The king captures B. In this case, the king moves to B's square as quick as possible, avoiding squares threatened by either of the pawns. Then, he captures B and moves to A's square as quick as possible, avoiding squares threatened by A.<br><br>

It's easy to see that the king can always follow at least one of this two possibilities. So, all we have to do is to take better result from BFS(X, PA) and BFS(X, PB)+BFS(PB, PA) (remember to avoid appropriate threatened squares). <br><br>

Nevertheless, most coders used dynamic programming to solve this task. For a reference, see <tc-webtag:handle coderId="20812309" context="hs_algorithm"/>'s <a href="/tc?module=HSProblemSolution&cr=20812309&rd=10801&pm=8109">solution</a>.


</p>
<p>&nbsp;</p>
 

<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="21157942" context="algorithm"/><br />    <em>TopCoder Member</em>
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
