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
<tc-webtag:forumLink forumID="505001" message="Discuss this match" /></div>
--%>
<A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505391">Discuss this match</A></div>
<span class="bodySubtitle">SRM 262</span><br>Friday, September 9, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
Friday's early SRM featured something not seen in quite a while, precomputation.  marian and Petr,
who finished second and third respectively, both submitted precomputed solutions to the Div 1 hard.
Despite this sturdy opposition, kalinov's precomputation-free solution earned him the first place
crown.  In Division 2, dynamitehacker and pashka took first and second place with scores over 1350.
pashka, who made 2 successful challenges, fell short of first by 6.9 points.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4556&amp;rd=7996" name="4556">DivToZero</a></b>
</font>
<A href="Javascript:openProblemRating(4556)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      279 / 301 (92.69%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      251 / 279 (89.96%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>meisterT</b> for 247.60 points (2 mins 48 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      208.62 (for 251 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Here we try every possible two-digit ending, and take the first one that works.  The solution
featured here loops through the possibilities for each digit separately.  The constraints guarantee
that some two-digit suffix will work.  Java code follows:
<pre>

public String lastTwo(int num, int factor) {
  String val = (num+"").substring(0,(num+"").length()-2);
  for (char t = '0'; ; t++) {
    for (char on = '0'; on <= '9'; on++) {
      String curr = val+t+""+on;
      int f = Integer.parseInt(curr);
      if (f % factor == 0) return t+""+on;
    }
  } 
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4557&amp;rd=7996" name="4557">SortBooks</a></b>
</font>
<A href="Javascript:openProblemRating(4557)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      220 / 301 (73.09%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      136 / 220 (61.82%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>isv</b> for 474.92 points (6 mins 35 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      338.32 (for 136 correct submissions)
    </td>
  </tr>
</table></blockquote>


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
      235 / 242 (97.11%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      210 / 235 (89.36%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>lovro</b> for 247.55 points (2 mins 50 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      204.48 (for 210 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

Here we must determine if something is detectably a title.  This can be done in an auxiliary
function check.  To utilize the library effectively, I surround the string with spaces, and then
search for possible substrings.  To count the number of words, I use a tokenizer and split by
spaces.  Once check is written, we simply loop through the input and compare each pair.  Java code
follows:
<pre>
boolean check(String s) { 
  String t = " "+s.toUpperCase()+" ";
  return s.split(" +").length > 3 || t.indexOf(" THE ") > -1 || 
         t.indexOf(" AND ") > -1 || t.indexOf(" OF ") > -1;
}
public int[] checkManually(String[] field1, String[] field2) {
  ArrayList<Integer> al = new ArrayList();
  for (int i = 0; i< field1.length; i++) {
    if (check(field1[i]) == check(field2[i])) {
      al.add(i);
    }
  }
  int[] ret = new int[al.size()];
  for (int i = 0; i < ret.length; i++) {
    ret[i] = al.get(i);
  }
  return ret;
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4800&amp;rd=7996" name="4800">YahtzeeBestScore</a></b>
</font>
<A href="Javascript:openProblemRating(4800)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1100
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      54 / 301 (17.94%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      9 / 54 (16.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>dynamitehacker</b> for 716.53 points (23 mins 37 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      589.19 (for 9 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The solution to this problem consists of two very distinct parts.  The core algorithm runs through
each permutation of the hands.  Once a permutation is chosen, you have a mapping between rolls and
score types.  Then you check if each roll matches the corresponding score type, and if it does, add
that to the total score.  The largest return is kept.  In the following code, rec recursively
generates permutations.  The pair of score functions handle the Yahtzee specific information.  Java
code follows:
<pre>
int score(String[] hands, int[] order) { 
  int ret = 0;
  for (int i = 0; i < order.length; i++) ret += score(hands[order[i]],i);
  return ret;
}
//Given the hand and hand type, determines the score
int score(String hand, int pos) {
  int cnts[] = new int[6], p = 1, M = 0, s = 0;
  for (int i = 0; i < hand.length(); i++) cnts[ hand.charAt(i) - '1' ]++;
  for (int i = 0; i < cnts.length; i++) if (cnts[i] > 0) {
    p *= cnts[i]; 
    s += cnts[i]*(i+1);
    if (cnts[i] > M) M = cnts[i];
  }
  if (M == 5 && pos == 0) return 50;
  if (M == 5 && pos == 1) return 25;
  if (p == 6 && pos == 1) return 25;
  if (M >= 4 && pos == 2) return s; 
  if (M >= 3 && pos == 3) return s; 
  if (p == 1 && (cnts[0] == 0 || cnts[5] == 0) && pos == 4) return 40;
  if (p == 1 && (cnts[0] == 0 || cnts[5] == 0) && pos == 5) return 30;
  if (p == 1 && (cnts[1] == 0 || cnts[4] == 0) && pos == 5) return 30; 
  if (p == 2 && (cnts[0]+cnts[1])*(cnts[4]+cnts[5])*(cnts[0]+cnts[5]) == 0 
             && pos == 5) return 30;
  if (pos == 6) return s;
  return 0;
}
int rec(String[] hands, int pos, boolean[] mark, int[] order) {
  if (pos == hands.length) return score(hands,order);
  int ret = 0;
  for (int i = 0; i < mark.length; i++) {
    if (mark[i]) continue;
    mark[i] = true;
    order[pos] = i;
    ret = Math.max(rec(hands,pos+1,mark,order),ret);
    mark[i] = false;
  } 
  return ret;
}
public int bestLowerScore(String[] hands) { 
  return rec(hands,0,new boolean[hands.length],new int[hands.length]); 
}

</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4797&amp;rd=7996" name="4797">BestYahtzeeScore</a></b>
</font>
<A href="Javascript:openProblemRating(4797)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      160 / 242 (66.12%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      57 / 160 (35.62%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>monsoon</b> for 416.43 points (13 mins 17 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      294.06 (for 57 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
To solve this Yahtzee problem, we compute every possible way of keeping/rolling the dice.  For each
way, we compute the score, and take the best value.  The scoring method is similar to the div 2
hard, and will not be discussed.  The core choosing code can be implemented recursively by storing
how many rolls have been used, how many dice have been used, and what the current hand is.  Every
possible subset of the 5 dice can be removed and replaced with new dice.  The code here runs through
each subset, and then recursively determines what to do next.  Java code follows containing
everything but the Yahtzee score computation function:
<pre>
//Compute score of hand
int score(String hand);
int solve(String rolls, String hand, int pos, int num) {
  int best = score(hand);
  if (num == 3) return best;
  //Test each subset
  for (int i = 1; i < 1 << 5; i++) {
    char[] h = hand.toCharArray();
    int p = pos;
    for (int j = 0; j < 5; j++) {
      if ( ((1 << j) & i) == 0) continue;
      h[j] = rolls.charAt(p++);
    } 
    best = Math.max(best, solve(rolls,new String(h),p,num+1));
  } 
  return best;
}
public int bestScore(String rolls) { 
  return solve(rolls,rolls.substring(0,5),5,1); 
}
</pre>
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=932&amp;rd=7996" name="932">MagicBoxes</a></b>
</font>
<A href="Javascript:openProblemRating(932)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      63 / 242 (26.03%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      11 / 63 (17.46%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>kalinov</b> for 682.52 points (21 mins 36 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      527.53 (for 11 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
To solve this problem, we first compute how many boxes can be placed if only area considerations are
taken into account.  Starting with this upper limit, we try each number of boxes separately.  When a quantity
works, we return.  When trying to place k actual boxes, we would like to try every possible position
and recurse, but this type of implementation is too naive to run in time.  Fortunately, a relatively
simple optimization works.  For each box, starting with the largest, we try all possible placements
with the following restriction: one vertical side and one horizontal side must lay against the
container or another box.  This does not hamper our ability to place the maximum number of boxes,
and allows our algorithm to easily finish in time.
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
