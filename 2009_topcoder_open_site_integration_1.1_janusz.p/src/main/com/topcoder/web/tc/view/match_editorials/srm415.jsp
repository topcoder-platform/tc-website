<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 415 Problem Set &amp; Analysis</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>



<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=13506">Match Overview</a><br />
    <tc-webtag:forumLink forumID="523058" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 415</span><br />Tuesday, August 26, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
In Div1 coders faced quite straightforward easy problem. Medium problem appeared to be not that simple and brought lots of challenges. 9 coders successfully
solved the hard, what helped them to get top 9 places. The division was won by <tc-webtag:handle coderId="10574855" context="algorithm"/> who had not very 
high scores for all three problems, but got +125 on challenges. <tc-webtag:handle coderId="7459080" context="algorithm"/> became the second and 
<tc-webtag:handle coderId="15492890" context="algorithm"/> took the third place.<br /><br />
In Div2 the hard appeared to be quite simple for some of the coders and many fast submissions passed system tests. The first place was taken by <tc-webtag:handle coderId="22717703" context="algorithm"/>, he was followed by <tc-webtag:handle coderId="22727735" context="algorithm"/>. 
<tc-webtag:handle coderId="22748412" context="algorithm"/> became third in his first SRM.
</p>  
 
<h1> 
The Problems 
</h1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9978&amp;rd=13506" name="9978">CollectingUsualPostmarks</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9978)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523058" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      403 / 507 (79.49%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      307 / 403 (76.18%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>dogbox</strong> for 248.62 points (2 mins 7 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      198.89 (for 307 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The first and the main thing the competitor had to think about was "What do I have to do with the postmarks which I already have ?". And the answer
was quite clear. As sell and buy prices for each postmark are equal you can initialy sell all the postmarks you have and maybe buy some of them later.
After realizing that the problem becomes really simple. All you have is to sell all postmarks you initially have and then buy them in the increasing 
order of prices while you have enough money.

</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9954&amp;rd=13506" name="9954">ThreePhotos</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9954)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523058" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      167 / 507 (32.94%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      113 / 167 (67.66%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>zx19890827</strong> for 454.91 points (9 mins 7 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      292.95 (for 113 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Let's remove all small cubes and then try to put as many of them as possible to their initial places. If for some cube with coordinates 
(<strong>x</strong>,<strong>y</strong>,<strong>z</strong>) it turns that <strong>A</strong>[<strong>x</strong>][<strong>y</strong>]='Y' and <strong>B</strong>[<strong>x</strong>][<strong>z</strong>]='Y' and <strong>C</strong>[<strong>y</strong>][<strong>z</strong>]='Y' 
than it's clear that we can put this cube on its place. If any of the conditions is false we can't leave the cube on its place, so we will have to remove
it. Placing cubes in such a way we will leave as many cubes as possible. But don't forget about the case, when
all three photos can't be valid. So we have to make some additional checks. If after such a placement it exists such <strong>x</strong> and <strong>y</strong> that <strong>A</strong>[<strong>x</strong>][<strong>y</strong>]='Y' but for any <strong>z</strong> cube with coordinates (<strong>x</strong>,<strong>y</strong>,<strong>z</strong>) has to be removed than there is no way to make
the photos valid so -1 has to be returned. The same checks have to be done for <strong>B</strong> and <strong>C</strong>. You can find a clear implementation of this idea in this <a href="/stat?c=problem_solution&amp;rm=298500&amp;rd=13506&amp;pm=9954&amp;cr=22723672">solution</a> by 
<tc-webtag:handle coderId="22723672" context="algorithm"/>.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9934&amp;rd=13506" name="9934">CardsCheating</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9934)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523058" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      124 / 507 (24.46%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      70 / 124 (56.45%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>dogbox</strong> for 901.23 points (9 mins 37 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      632.60 (for 70 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem appeared to be quite easy for some division 2 competitors. The main question that appeared was "How big can the answer be ?". Let's look 
on the deck shuffle as on the permutation of length <strong>N</strong>. The period of a permutation is the minimum number of repeated invokations required to get 
back to start. It's clear that the answer can't be equal or greater than the period of this permutation. So the question transforms into "How big
can the period of permutation of length <strong>N</strong> be ?". Looking at any permutation you can notice that it can be broken into some cycles. The least 
common multiple of the lengths of these cycles is the period of the permutation. For example let's look on the permutation {1,4,0,3,2,5}. 
It has two cycles: 0->1->4->2->0 and 3->5->3. Their lengthes are 4 and 2, so the period of permutation will be lcm(4,2) = 4. After some additional
calculations you can see that the permutation of length 50 can't have it's period greater than 180180. Knowing this fact the solution becomes really short:
apply the shuffle to the deck until you get the required order of cards or you make more than 180180 shuffles.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9933&amp;rd=13506" name="9933">ShipLoading</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9933)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523058" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      373 / 384 (97.14%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      294 / 373 (78.82%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>msg555</strong> for 246.64 points (3 mins 19 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      187.42 (for 294 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Let's assume we can use each crane only once. Then it will be possible to load all boxes to the ship if the crane with the greatest weight limit is 
able to move the heaviest box, the crane with the second greatest weight limit is able to move the second heaviest box and so on. Now if we can spend
<strong>X</strong> minutes to load the ship, then we can use each crane <strong>X</strong> times. It is the same as we have each crane cloned <strong>X</strong> times and after that
we can use each crane once. So the solution is to find the minimum <strong>X</strong> such that it will be possible to load the ship when each crane is cloned
 <strong>X</strong> times and each of them can be used once. -1 is possible only if there exists such a box which can't be moved by any of the cranes. You can find a
clear implementation of this idea in this <a href="/stat?c=problem_solution&amp;rm=298463&amp;rd=13506&amp;pm=9933&amp;cr=22663117">solution</a> 
by <tc-webtag:handle coderId="22663117" context="algorithm"/>.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9958&amp;rd=13506" name="9958">CollectingPostmarks</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9958)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523058" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      210 / 384 (54.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      56 / 210 (26.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Burunduk1</strong> for 440.04 points (10 mins 47 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      277.91 (for 56 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The first quiestion which appeared was "What do I have to do with the postmarks which I already have ?". And the answer was quite clear. As sell and buy
prices for each postmark are equal you can initialy sell all the postmarks you have and maybe buy some of them later. So now we can assume that we have
no postmarks and need to find the set of postmarks with total value not less than <strong>K</strong> and total price as small as possible. Let's divide all the 
postmarks into two groups of equal sizes (if the number of postmarks is odd one of the groups will have 1 more element than the other). Each group will 
have not more than 16 postmarks and the number of subsets of postmarks of each group will be not greater than 2<sup>16</sup>. So we can list all subsets 
of postmarks of first and second group and call the lists <strong>A</strong> and <strong>B</strong> respectively. It is also clear than if for some two subsets of first group 
numbered <strong>i</strong> and <strong>j</strong> it appears that <strong>A</strong>[<strong>i</strong>].cost &gt;= <strong>A</strong>[<strong>j</strong>].cost and <strong>A</strong>[<strong>i</strong>].value &lt;= <strong>A</strong>[<strong>j</strong>].value
then subset <strong>A</strong>[<strong>i</strong>] is useless (it will be always better to use subset <strong>A</strong>[<strong>j</strong>] than subset <strong>A</strong>[<strong>i</strong>]). The same is correct
for list <strong>B</strong>. Now let's assume that both list are ordered in such way that for any <strong>i</strong>: <strong>A</strong>[<strong>i</strong>].value &lt; <strong>A</strong>[<strong>i</strong>+1].value, <strong>A</strong>[<strong>i</strong>].cost &lt; <strong>A</strong>[<strong>i</strong>+1].cost, <strong>B</strong>[<strong>i</strong>].value &lt; <strong>B</strong>[<strong>i</strong>+1].value and <strong>B</strong>[<strong>i</strong>].cost &lt; <strong>B</strong>[<strong>i</strong>+1].cost. Now for each <strong>i</strong> we can find such <strong>j</strong> that <strong>A</strong>[<strong>i</strong>].value+<strong>B</strong>[<strong>j</strong>].value &gt;= <strong>K</strong> 
and <strong>B</strong>[<strong>j</strong>].cost is as small as possible. The pair with the smallest total cost will be the answer. Using the order of elements in <strong>A</strong> 
and <strong>B</strong> all this pairs can be checked in linear time. You can see a clear implementation of this idea in this very fast 
<a href="/stat?c=problem_solution&amp;rm=298462&amp;rd=13506&amp;pm=9958&amp;cr=15868491">solution</a> 
by <tc-webtag:handle coderId="15868491" context="algorithm"/>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9877&amp;rd=13506" name="9877">AlienDictionary</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9877)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523058" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      24 / 384 (6.25%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      9 / 24 (37.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>jbernadas</strong> for 721.55 points (19 mins 17 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      562.28 (for 9 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
First of all you have to generate the set of all invalid substrings. All of them have equal length, let's call it <strong>L</strong>. All strings of length <strong>L</strong>
can be ordered lexicographically and numbered from 0 to 2<sup><strong>L</strong></sup>-1. Using dynamic programming you can simply generate values <strong>r</strong>[<strong>i</strong>][<strong>j</strong>] for each <strong>i</strong> and <strong>j</strong>, where <strong>r</strong>[<strong>i</strong>][<strong>j</strong>] is equal to the number of valid alien words of length <strong>i</strong> starting with substring of length <strong>L</strong> numbered <strong>j</strong>. Having these values the generation of valid alien word of length <strong>N</strong> numbered 
<strong>x</strong> is quite simple. Example java code follows:
<pre>
int mask;
for (mask = 0; mask &lt; (1 &lt;&lt; L); mask ++) {
    if (r[N][mask] &gt; x)
        break;
    x -= r[N][mask];
}

if (mask == (1 &lt;&lt; L)) {
    result = "NO PAGE";
    continue;
}

for (int j = L - 1; j &gt;= 0; j --)
    if ((mask & (1 &lt;&lt; j)) != 0)
        result+="B";
    else
        result+="A";

for (int step = 1; step + L &lt;= N; step ++) {
    int move1 = (mask % (1 &lt;&lt; (L - 1))) * 2;
    int move2 = move1 + 1;

    if (r[N - step][move1] &gt; x) {
        result += "A";
        mask = move1;
    } else {
        result += "B";
        mask = move2;
        x -= r[N - step][move1];
    }
}
</pre>
You can see the example of the implementation of this idea in this 
<a href="/stat?c=problem_solution&amp;rm=298471&amp;rd=13506&amp;pm=9877&amp;cr=310333">solution</a> by 
<tc-webtag:handle coderId="310333" context="algorithm"/>.
</p>
<br />


<div class="authorPhoto">
    <img src="/i/m/Gluk_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8433628" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
