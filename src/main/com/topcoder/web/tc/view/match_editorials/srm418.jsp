<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 418 Problem Set &amp; Analysis</title>

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
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=13509">Match Overview</a><br />
    <tc-webtag:forumLink forumID="523422" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 418</span><br />Saturday, September 20, 2008
<br /><br />



<h2>Match summary</h2> 

<p> During SRM 418, Division One coders were presented with a straightforward easy problem which gave them more time for very technical and time-consuming medium. Those who managed to finish (or skipped) 500-pointer faced a tricky 900-pointer with some tempting but incorrect solutions. Entering the challenge phase, there were 86 hard and almost 220 medium submissions. Unfortunately, most of them turned out to be wrong and only 7 coders were left with three problems solved. After all, <tc-webtag:handle coderId="19849563" context="algorithm"/> was on top with an excellent performance on the 500 and 200 points earned in challenge phase. <tc-webtag:handle coderId="10574855" context="algorithm"/> and <tc-webtag:handle coderId="15803924" context="algorithm"/> took second and third place respectively.</p>

<p>Division 2 saw quite difficult 250-pointer and simplified 900-pointer from Division 1. Solid submission on hard problem with three successful challenges won <tc-webtag:handle coderId="22722059" context="algorithm"/> the division by a comfortable margin. He was followed by <tc-webtag:handle coderId="22629791" context="algorithm"/> and <tc-webtag:handle coderId="22654093" context="algorithm"/>. <tc-webtag:handle coderId="15624945" context="algorithm"/> proved to be a fine coder as well. His 1000-pointer solution passes 234 from 235 tests of 900-pointer from Division 1.</p>
 
<h1> 
The Problems 
</h1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9945&amp;rd=13509" name="9945">Towers</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9945)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523422" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      627 / 752 (83.38%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      369 / 627 (58.85%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>dogbox</strong> for 246.14 points (3 mins 34 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      172.59 (for 369 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
To solve this problem all we have to do is to keep destroying towers, one after another. The best way to do it is to count overall sum of towers' hit points (<strong>hpT</strong>*<strong>numT</strong>) and use integer division. However, we should be careful to avoid integer overflow. Here goes a sample solution:
<pre>
<font color="#298a52"><strong>int</strong></font> attack(<font color="#298a52"><strong>int</strong></font> myUnits, <font color="#298a52"><strong>int</strong></font> hpT, <font color="#298a52"><strong>int</strong></font> attackT, <font color="#298a52"><strong>int</strong></font> numT){
  <font color="#298a52"><strong>int</strong></font> all = hpT*numT, ret=<font color="#ff00ff">0</font>;
        
  <font color="#a52829"><strong>while</strong></font>(all><font color="#ff00ff">0</font> &amp;&amp; myUnits><font color="#ff00ff">0</font>){
    ret++;
    all -= myUnits;
    <font color="#a52829"><strong>if</strong></font>(all&lt;=<font color="#ff00ff">0</font>) break;   <font color="#0000ff">// without it the next line may cause integer overflow</font>
    myUnits -= attackT*((all+hpT-<font color="#ff00ff">1</font>)/hpT);
  }
        
  <font color="#a52829"><strong>if</strong></font>(myUnits><font color="#ff00ff">0</font>) <font color="#a52829"><strong>return</strong></font> ret;
  <font color="#a52829"><strong>else return</strong></font> <font color="#ff00ff">-1</font>;
}
</pre>
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10071&amp;rd=13509" name="10071">TwoLotteryGames</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10071)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523422" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      245 / 752 (32.58%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      185 / 245 (75.51%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Lack.RP</strong> for 474.75 points (6 mins 37 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      315.50 (for 185 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

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
      573 / 616 (93.02%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      531 / 573 (92.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Petr</strong> for 248.80 points (1 mins 58 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      208.99 (for 531 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 


<p>
In many countries, it is not rare to see lottery advertisements like 'choose 6 numbers out of 45 numbers, blah blah...' or 'take 5 numbers out of 39 numbers, blah blah...'. When you pass by the newsstand near your home, school, or work, you might compute the winning probability, from time to time. <br />
In New York, USA, for instance, there is this lottery game called 'TAKE 5' where you choose 5 numbers between 1 and 39, inclusive. The winning probability (where you get all 5 numbers that will be chosen later) is easy to compute: 1 / Binom(39, 5) = 1 / 575757. Now there could be a second place where you get only 4 numbers correctly, and it is not very hard to compute. Out of 5 numbers that you choose, 4 numbers MUST BE chosen by the organizers and the other number MUST NOT BE chosen: Binom(5, 4) * Binom(39-5, 5-4) / Binom(39, 5) = 5 * 34 / 575757. <br />

Now it can be generalized. the probability that you get exactly x numbers correctly is Binom(m, x) * Binom(n-m, m-x) / Binom(n, m). Thus, for the given problem, where it states 'at least k numbers', we can just sum up the probabilities for evrey x between k and m, inclusive. <br />
See <tc-webtag:handle coderId="22694926" context="hs_algorithm"/><a href="/tc?module=HSProblemSolution&amp;cr=22694926&amp;rd=13526&amp;pm=10071">solution</a> as a reference to this approach. <br />
It is worth to note that this problem can be solved by brute-force approach as well since n is small enough. Since there can be at most 8 numbers from which you can choose, you can try all possible combinations of m numbers chosen out of 1..n, inclusive. Without loss of generality, we can assume that the organizers will choose m numbers (1, 2, ..., m). Then, we can easily count the number of permutations that contain more than or equal to k numbers between 1 and m, inclusive. Take an example with n = 5, m = 3, k = 2. Then, there are 5C3 = 10 possible combinations:<br />
(1, 2, 3) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1, 2, 4) <br />
(1, 2, 5) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1, 3, 4) <br />
(1, 3, 5) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1, 4, 5) <br />
(2, 3, 4) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (2, 3, 5) <br />
(2, 4, 5) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (3, 4, 5) <br />
Out of these 10 combinations, there are only 7 combinations that contain 2 or more numbers between 1 and 3, inclusive: <br />
(1, 2, 3) <br />
(1, 2, 4)  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1, 2, 5) <br />
(1, 3, 4)  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1, 3, 5) <br />
(2, 3, 4)  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (2, 3, 5) <br />
This approach will take roughly O(n!). n is fairly small so that this approach would not cause a time-out.<br />
Solutions with brute-force approach can be shorter than the classic binomial, probability approach. Because, at the end of the day, what we want to achieve during the competition is get a high score one each problem, you might better off writing a inefficient, short solution than a very elegant solution. <br />
</p>



<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10073&amp;rd=13509" name="10073">BarracksEasy</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10073)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523422" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      105 / 752 (13.96%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      13 / 105 (12.38%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>lebed</strong> for 738.89 points (18 mins 18 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      545.47 (for 13 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>The hardest thing in this problem was to resist temptation of using (more or less sophisticated) strategy and simulate the battle. Only two non-DP solutions passed system cases.</p>

<p>Low constraints allow this problem to be solved by dynamic programming. Suppose we have <strong>i</strong> soldiers, barracks has <strong>z</strong> hit points, and our opponent has <strong>j</strong> soldiers. Then <strong>dp[i][j][z]</strong> is the minimum number of rounds we need to win the battle (or infinity if it is impossible). To compute <strong>dp[i][j][z]</strong> check each possible assignment of damage to the barracks and enemy soldiers. It seems not so hard, but there are some things we should be careful about:</p>

<ul>
<li>Don't consider triples (<strong>i</strong>,<strong>j</strong>,<strong>z</strong>) with <strong>j</strong>&gt;100.</li>
<li>Don't consider assignment of all damage to enemy soldiers while the barracks hasn't been destroyed yet. It's pointless and could cause infinite recursion if <strong>myUnits</strong> = <strong>unitsPerRound</strong>.</li>
<li>When computing <strong>dp[i][j][z]</strong> we may need <strong>dp[i'][j'][z']</strong> with <strong>j'</strong>&gt;<strong>j</strong>. Make sure that you have computed all <strong>dp[i'][j'][z']</strong> with <strong>i'</strong>&lt;<strong>i</strong> and <strong>z'</strong>&lt;<strong>z</strong> before or choose memoization approach.</li>
</ul>

<p>For a better understanding look at the sample solution:

<pre>
<font color="#a52829"><strong>for</strong></font>(<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">1</font>;i&lt;=myUnits;i++) <font color="#a52829"><strong>for</strong></font>(<font color="#298a52"><strong>int</strong></font> z=<font color="#ff00ff">0</font>;z&lt;=barHp;z++) <font color="#a52829"><strong>for</strong></font>(<font color="#298a52"><strong>int</strong></font> j=<font color="#ff00ff">0</font>;j&lt;=<font color="#ff00ff">100</font>;j++){
  <font color="#a52829"><strong>for</strong></font>(<font color="#298a52"><strong>int</strong></font> k=<font color="#ff00ff">0</font>;k&lt;=i;k++){
    <font color="#298a52"><strong>int</strong></font> bH = max(<font color="#ff00ff">0</font>,z-k);    <font color="#0000ff">// barracks' hit points</font>
    <font color="#298a52"><strong>int</strong></font> op = max(<font color="#ff00ff">0</font>,j-i+k);  <font color="#0000ff">// number of enemy soldiers</font>
    <font color="#298a52"><strong>int</strong></font> mine = max(<font color="#ff00ff">0</font>,i-op); // <font color="#0000ff">number of our soldiers at the end of the round</font>
                
    <font color="#a52829"><strong>if</strong></font>(bH><font color="#ff00ff">0</font>) op+=unitsPerRound;
    <font color="#a52829"><strong>if</strong></font>(k==<font color="#ff00ff">0</font> &amp;&amp; bH&gt;<font color="#ff00ff">0</font>) continue; 
    <font color="#a52829"><strong>if</strong></font>(op&lt;=<font color="#ff00ff">100</font>) dp[i][j][z] = min(dp[i][j][z],dp[mine][op][bH]+<font color="#ff00ff">1</font>);
  }
}
</pre></p>
<p>It is a simplified 900-pointer from Division 1. Have a look at description of Barracks for a better solution.</p>


<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9886&amp;rd=13509" name="9886">StampsCollection</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9886)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523422" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      219 / 616 (35.55%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      75 / 219 (34.25%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>ACRush</strong> for 379.47 points (17 mins 11 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      236.74 (for 75 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>Let <strong>G</strong> be an undirected graph where vertices are the buyers with an associated value. There is an edge between two buyers if they share at least one stamp in their demand. It's easy to see that we have to find independent set of maximum value in <strong>G</strong>. The assumption about number of elements in <strong>demand</strong> and buyers who want to buy the same stamp makes <strong>G</strong> special - each vertex has at most two adjacent vertices. Because of that, each connected component is either cycle or simple path. Both of these cases can be solved with standard dynamic programming approaches. For clean solution you can take a look at <tc-webtag:handle coderId="21822659" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=298690&amp;rd=13509&amp;pm=9886&amp;cr=21822659">solution</a></p>

<p>Note that if we allowed buyers who want to buy 3 stamps and for each stamp no more than 3 who want to buy it, problem would become NP-complete.</p>

<p>The hardest thing in this problem was to code flawless solution. For most coders coding part took more than 30 minutes. Although examples cover most of boundary cases, success rate was rather low. </p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8211&amp;rd=13509" name="8211">Barracks</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8211)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523422" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      900 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      86 / 616 (13.96%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      20 / 86 (23.26%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Soultaker</strong> for 669.54 points (18 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      503.20 (for 20 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>Assume that an optimal solution requires to kill <strong>x</strong> enemy soldiers before we destroy the barracks. It's easy to show that to achieve best result we have to kill <strong>x</strong> soldiers as soon as they appear. So, if we knew <strong>x</strong>, we could follow simple greedy strategy. It turns out that we don't have to guess or compute <strong>x</strong> - we could try all possible <strong>x</strong>'s and choose the best result. Unfortunately, straightforward simulation for each possible <strong>x</strong> will time out. We need to make some adjustments.</p>

<p>First of all, if <strong>myUnits</strong>&le;<strong>unitsPerRound</strong> straightforward simulation won't definitely time out so let's assume that <strong>myUnits</strong>&gt;<strong>unitsPerRound</strong>.</p>

<p>Choose <strong>x</strong> big enough. We may see that simulation consists of 4 phahes:</p>
<ol>
<li>First round - we inflict <strong>myUnits</strong> hit points of damage to the barracks.</li>
<li>We kill all enemy soldiers and inflict (<strong>myUnits</strong>-<strong>unitsPerRound</strong>) hit points of damage to the barracks each round.</li>
<li>We inflict hit points of damage only to the barracks and let our opponent to produce soldiers.</li>
<li>Barracks is destroyed and all we have to do is to kill enemy soldiers.</li>
</ol>
<p>It turns out that second phase takes most of the rounds, so all we have to do is to process it in constant time.</p>

<p>Exercises:</p>
<ol>
<li>What is the complexity of above approach?</li>
<li>Many coders were checking only <strong>x</strong>'s which are divisible by <strong>unitsPerRound</strong>. Prove or disprove this approach.</li>
<li>Suppose that <strong>k</strong> is the smallest number such that we kill <strong>k</strong> enemy soldiers before we destroy the barracks and win the battle. It's enough to check <strong>x</strong>'s from <strong>[k,k+myUnits]</strong> - try to prove or disprove this approach.</li>
<li>Suppose that approaches above are correct - does it mean that it is enough to check <strong>x</strong>'s from <strong>[k,k+myUnits]</strong> which are divisible by <strong>unitsPerRound</strong>? Try to prove or disprove this approach.</li>
</ol>

<br />


<div class="authorPhoto">
    <img src="/i/m/weds_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="21157942" context="algorithm"/><br />
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
