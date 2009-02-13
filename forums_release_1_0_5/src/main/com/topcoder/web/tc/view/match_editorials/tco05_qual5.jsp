<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statisics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<%--
<tc-webtag:forumLink forumID="505014" message="Discuss this match" /></div>
--%>
<A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505014">Discuss this match</A></div>
<span class="bodySubtitle">TCO05 - Qualification 5</span><br>August 16-17, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
In my opinion, this was the second easiest set.  The easy, RecipeFraction, required some simple
string parsing.  The hard, CheatABit, required careful coding as opposed to inspiration.  11 coders were
able to score above 900. JongMan and lars, who took first and second respectively, both scored over 950.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4638&amp;rd=8026" name="4638">RecipeFraction</a></b>
</font>
<A href="Javascript:openProblemRating(4638)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>

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
      324 / 346 (93.64%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      307 / 324 (94.75%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>nicka81</b> for 246.94 points (2 mins 32 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      202.70 (for 307 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
First, we parse each entry of the recipe to compute the total amount of ingredients used.  This will
function as the denominator of our returned result.  Then, for
each supplied ingredient, we check how much of it is used in the recipe, and add this to a second
total.  This functions as the numerator.  Java code follows:
<pre>

public double getFraction(String[] recipe, String[] ingredients) {
   int tot = 0, num = 0;
   for (int i = 0; i < recipe.length; i++) 
      tot += Integer.parseInt(recipe[i].split(" ")[0]);
   for (int i = 0; i < ingredients.length; i++) 
      for (int j = 0; j < recipe.length; j++)
         if (ingredients[i].equals(recipe[j].split(" ")[1])) 
            num += Integer.parseInt(recipe[j].split(" ")[0]);
   return num*1.0/tot;
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4673&amp;rd=8026" name="4673">CheatABit</a></b>
</font>
<A href="Javascript:openProblemRating(4673)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      750
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      251 / 346 (72.54%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      208 / 251 (82.87%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      <b>JongMan</b> for 715.18 points (5 mins 3 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      468.67 (for 208 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
In this problem we have the luxury of trying every possible option.  Given the list of participating
chess programs we try every possible way of inserting ourself into the list.  An easy method is to
place ourselves at the beginning, and then repeatedly swapping with the next player.  For each position we
simulate the tournament, and count how many times we had to "cheat".  The simulation is performed by
taking the original array, and using it to build a secondary array containing the winners.  This is
repeated until only we are left.  Java code follows:
<pre>
//Number of cheats given we begin in position pos
int simulate(int[] rats, int pos) {
   int ret = 0;
   while (rats.length > 1) {
      int[] next = new int[rats.length/2];
      for (int i = 0; i < rats.length; i+=2) {
         next[i/2] = Math.max(rats[i],rats[i+1]);
         if (i == pos || i+1 == pos) { //check our match
            if (next[i/2] != rats[pos]) ret++;
            next[i/2] = rats[pos];
            pos = i/2;
         }
      } rats = next;
   } return ret;
}
public int enterCodes(int[] ratings, int yourRating) {
   int[] rat = new int[ratings.length+1];
   rat[0] = yourRating;
   for (int i = 1; i < rat.length; i++) rat[i] = ratings[i-1];
   int best = 1000;
   for (int i = 0; i < rat.length; i++) {
      best = Math.min(best, simulate(rat,i));
      if (i+1 < rat.length){
         int t = rat[i+1]; 
         rat[i+1] = rat[i];
         rat[i] = t;
      }
   } return best;
}
</pre>
</p>

<p>
<img src="/i/m/brett1479_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251317" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>
