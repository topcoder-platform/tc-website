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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/stat?c=round_overview&er=5&rd=10667">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506233" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 343</span><br>Thursday, March 22, 2007
<br><br>



<h2>Match summary</h2> 

<p>

In one of the final warmups before TCO qualifications, 1127 competitors showed up to battle it out in SRM 343.  In Division 1, competitors were greeted with a reasonable easy problem.  <tc-webtag:handle coderId="7446789" context="algorithm"/> was the first to submit, followed shortly thereafter by <tc-webtag:handle coderId="10574855" context="algorithm"/> and <tc-webtag:handle coderId="21468741" context="algorithm"/>.  Shortly thereafter, the points began to fly.
<br /><br />

As several competitors began working on the medium problem, a few brave souls jumped ahead to the 1000 point problem, and discovered a very simple solution that had been overlooked during testing.  As a result, many competitors quickly submitted this problem for very high point values, allowing <tc-webtag:handle coderId="2058174" context="algorithm"/> and <tc-webtag:handle coderId="301395" context="algorithm"/> to temporarily take the lead.  As more people realized this, many competitors went after the hard next, followed by the medium.  At the end of the coding phase, <tc-webtag:handle coderId="19849563" context="algorithm"/> held a strong lead behind a very fast 1000 point problem.  Close behind was a large pack within striking distance.  The challenge phase was eventful, with <tc-webtag:handle coderId="19849563" context="algorithm"/> picking up four successful challenges, and <tc-webtag:handle coderId="10574855" context="algorithm"/> and <tc-webtag:handle coderId="7390224" context="algorithm"/> picking up two each.  As the dust cleared from system tests, <tc-webtag:handle coderId="19849563" context="algorithm"/> emerged unscathed as the leader, with <tc-webtag:handle coderId="10574855" context="algorithm"/>, <tc-webtag:handle coderId="7390224" context="algorithm"/> and <tc-webtag:handle coderId="2058177" context="algorithm"/> rounding out the top four.
<br /><br /> 

The problem set for Division 2 turned out to be a bit more standard.  The 250 and 500 gave coders plenty of opportunity to score quick points before running into a difficult 1000 point problem.  At the end of the coding phase, <tc-webtag:handle coderId="22663778" context="algorithm"/> held the lead, followed by <tc-webtag:handle coderId="21945864" context="algorithm"/>, <tc-webtag:handle coderId="22269850" context="algorithm"/> and <tc-webtag:handle coderId="20036294" context="algorithm"/>.  The challenge phase turned out interesting, especially for <tc-webtag:handle coderId="22663778" context="algorithm"/>, whose random Mafia solution survived three successful challenges before finally being taken down.  After system tests had finished, <tc-webtag:handle coderId="21945864" context="algorithm"/> emerged with his first SRM win, followed by <tc-webtag:handle coderId="20101969" context="algorithm"/>, and <tc-webtag:handle coderId="22672999" context="algorithm"/> as the only three competitors to finish all three problems successfully.

<br /><br />

</p>

 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7533&amp;rd=10667" name="7533">PersistentNumber</a></b>
</font>
<A href="Javascript:openProblemRating(7533)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506233" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      535 / 561 (95.37%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      448 / 535 (83.74%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>notme</b> for 249.45 points (1 mins 20 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      212.43 (for 448 correct submissions) 
    </td>
  </tr>
</table></blockquote>

<p>
The persistence of a number was first defined by <a href="http://en.wikipedia.org/wiki/Neil_Sloane">Neil Sloane</a> in 1973.  It turns out that there is no number less than 10<sup>3000</sup> with a persistence greater than 11 (in fact, it's postulated that there is no number with persistence greater than 11), and a maximum persistence of 9 within the constraints of this problem.  Thus, to calculate the persistence, we can simply calculate the product of digits until we get a single digit number, with no fear of timeout.  Java code follows:

<pre>
public int getPersistence(int n)
{
 int ret = 0;
 while(n > 9)
 { ret++;
  int temp = 1;
  while(n > 0)
  {
   temp *= n%10;
   n/=10;
  }
  n = temp;
 }
 return ret;
}

</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7476&amp;rd=10667" name="7476">CDPlayer</a></b> </font> <A href="Javascript:openProblemRating(7476)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506233" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      307 / 561 (54.72%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      140 / 307 (45.60%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>LiYongchuan</b> for 489.59 points (4 mins 9 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      293.64 (for 140 correct submissions) 
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
      442 / 458 (96.51%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      326 / 442 (73.76%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>JongMan</b> for 246.29 points (3 mins 29 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      198.07 (for 326 correct submissions) 
    </td>
  </tr>
</table></blockquote>

<p>
This problem was inspired by the CD player in my car, which seems to have an algorithm similar to that described in the problem statement.  In order to check whether the CD player uses the algorithm, we can simply check all possible starting points.  For each starting point j (with c songs on the CD), we check that two conditions:  the first j letters contain no repeats, and that all substrings starting at j+i*c (where i=0,1,2...) contain no repeats.  Within the constraints, it is easily possible to try all values of j between 0 and c-1, inclusive.  If any work, we return it right away; otherwise, we return -1.  Java code follows: 

<pre>

public int isRandom(String[] songlist, int n)
{
 String s = "";
 for(int i=0; i < songlist.length; i++)
  s += songlist[i];

 int i = 0;
 for(i=0; i < n; i++)

 {
  boolean[] used = new boolean[n];
  int j;
  for(j=0; j < i; j++)   
  {
   if(used[s.charAt(j)-'A']) break;
   used[s.charAt(j)-'A'] = true;
  }
  //System.out.println(i + " " + j);
  if(j < i) continue;
  for(; j < s.length(); j++)
  {
   if(j%n == i) used = new boolean[n];
   if(used[s.charAt(j)-'A']) break;
   used[s.charAt(j)-'A'] = true;
  }
  if(j < s.length()) continue;
  return i;
 }
 return -1;

}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7509&amp;rd=10667" name="7509">Mafia</a></b> </font> <A href="Javascript:openProblemRating(7509)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506233" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      54 / 561 (9.63%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      7 / 54 (12.96%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>MGLC</b> for 597.10 points (27 mins 37 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      504.52 (for 7 correct submissions) 
    </td>
  </tr>
</table></blockquote>

<p>
The game of <a href="http://en.wikipedia.org/wiki/Mafia_Game">Mafia</a> is a fun party game played regularly among my group of friends.  Often times, players will have predetermined biases of guilt prior to the start of the game, and this problem was an attempt to model this.  The constraints indicate that the problem can be solved through dynamic programming, storing whether players are still in the game ("alive"), or removed from the game ("dead").  Unfortunately, the way in which the game is played prevents this from working; a death during the night changes the state differently than a death during the day, which means that simply keeping track of who is alive is insufficient.  
<br /><br />

It turns out that there is a much simpler solution.  Due to the alternating day/night rules, the Mafia will (in the worst case with 16 players) have to select a player to remove at most 8 times.  Since the Mafia would never kill him or herself, this means that there are only 15<a href="http://en.wikipedia.org/wiki/Double_factorial#Double_factorial">!!</a> = 2,027,025 possible states, which can be brute forced with care.  Each night, the Mafia tries to remove each person that is still alive, and we keep track of the maximum depth that can be reached from removing that person.  The maximum of these values is what we return.  If running into issues on time, optimizations can be included to return if at any point the Mafia wins the game, since there cannot be any other nights.  Java code (which also prints out an optimal order in which to remove players in the night) follows:

<pre>

int N, me;
int[] curguilt;
int[] best;
int[] status;
int[][] reactions;
int[] curkills;
int bestlength;
int maxf;
boolean flag;

public int daykill()
{
 int kill = 0;
 while(status[kill] > 0) kill++;
 for(int i=0; i&lt;N; i++)
  if(status[i] ==0 && curguilt[i] > curguilt[kill]) kill = i;
 return kill;
}

public int doit(int cur)
{
 if(cur > bestlength) // Save the best depth reached
 {
  best = curkills.clone();
  bestlength = cur;
  if(bestlength==maxf) flag = true;   // if the Mafia win, stop caring
 }

 if(status[me] > 0) return 0;

 for(int i=0; i&lt;N; i++)
 {
  if(i==me || status[i] > 0) continue;

  status[i] = 2;
  curkills[cur] = i;
  for(int j=0; j&lt;N; j++)
   curguilt[j] += reactions[i][j];

  int daydie = daykill();
  status[daydie] = 1;
  
  doit(cur+1);
  if(flag) return 0;
  for(int j=0; j&lt;N; j++)
   curguilt[j] -= reactions[i][j];
  status[daydie] = 0;
  status[i] = 0;
 }
 return 0;
}

public int play(int [] guilt, String[] responses, int n)
{
 N = guilt.length;
 maxf = N / 2;   // the maximum number of nights
 me = n;
 curguilt = guilt.clone();
 status = new int[N];
 reactions = new int[N][N];
 for(int i=0; i &lt; N; i++)   
 for(int j=0; j &lt; N; j++)
  reactions[i][j] = responses[i].charAt(j) > 'Z'  

   ? -1*(responses[i].charAt(j) -'a' + 1)

   : responses[i].charAt(j) - 'A'+1;

 best = new int[N];
 curkills = new int[N]; 
 bestlength = 0;

 if(N%2 == 1)
  status[daykill()] = 1;
 flag = false;
 doit(0);

 for(int i=0; i &lt; best.length; i++) // print out the 
  System.out.println(best[i]);      // optimal removals

 return bestlength;
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6802&amp;rd=10667" name="6802">MoneyGame</a></b> </font> <A href="Javascript:openProblemRating(6802)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506233" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      146 / 458 (31.88%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      100 / 146 (68.49%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 425.33 points (12 mins 21 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      273.41 (for 100 correct submissions) 
    </td>
  </tr>
</table></blockquote>

<p>
This is a game that was introduced to me by a friend, using pennies, nickels, and dimes.  Due to the fact that you lose money every turn (since you take back less money than you put in), the game must eventually terminate, and one player will win.  The decision of what coins to retrieve does not seem to follow an empirical formula, and so it is best to try making all possible moves.  As the goal of the game is to maximize the money Lenny wins (and thus minimize Fred's winnings), this falls into the category of a <a href="http://en.wikipedia.org/wiki/Minimax">minimax</a> search.  When it is Lenny's turn, we try all possibilities, and store the best possible score that Lenny will make.  On the other hand, Fred will try all possibilities, attempting to minimize Lenny's score.
<br /><br />

To efficiently code this, memorization is important; if we've already considered a game state, we don't want to have to recompute all of its children.  Since a player can hold at most 10 coins at any time (each player starts with 5), we can represent the gamestate for a player using a integer between 0 and 11^3, as <tc-webtag:handle coderId="20315020" context="algorithm"/>'s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=264053&rd=10667&pm=6802&cr=20315020">solution</a> shows.  Alternatively, we can have a 6-dimensional memoization table, like <tc-webtag:handle coderId="19849563" context="algorithm"/> used.  Furthermore, each player wants to maximize his own score; thus, we can simply swap Lenny's and Fred's coins after each play, and play to maximize Lenny's score (rather than writing two separate functions, one for Lenny and one for Fred).  See <tc-webtag:handle coderId="19849563" context="algorithm"/>'s <a href="http://www.topcoder.com/stat?c=problem_solution&rm=264055&rd=10667&pm=6802&cr=19849563">solution</a> for a very clear implementation of this. 
<br /><br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6784&amp;rd=10667" name="6784">RefactorableNumber</a></b>
</font>
<A href="Javascript:openProblemRating(6784)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506233" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      222 / 458 (48.47%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      184 / 222 (82.88%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 995.17 points (1 mins 59 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      772.19 (for 184 correct submissions) 
    </td>
  </tr>
</table></blockquote>

<p>
Refactorable numbers, originally discovered by Cooper and Kennedy in 1990 under the name of "Tau numbers", were among the first sequences (re)discovered by a computer (by Colton).  This problem turned out to be far easier than it had been thought during testing, as many competitors (including <tc-webtag:handle coderId="19849563" context="algorithm"/>) proved with their high submission rate.  The strategy involves using a number sieve to count the factors of each number, similar to the <a href="http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes">Sieve of Eratosthenes</a>.  We create an array called tau, where tau[n] stands for the number of divisors of n.  We then go from 1 to n, and for each number, increment the count of all multiples of that number.  Once this is done, we can simply loop through all of the numbers from low to high, and pick up any values that were missed.  The <a href="http://www.topcoder.com/stat?c=problem_solution&rd=10667&rm=264055&cr=19849563&pm=6784">solution</a> by <tc-webtag:handle coderId="19849563" context="algorithm"/>serves to run very quickly, and is sufficient for the constraints.  Similarly, one can use the strategy employed by <tc-webtag:handle coderId="10574855" context="algorithm"/>.  Using some basic information on <a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=primeNumbers">prime numbers</a>, he <a href="http://www.topcoder.com/stat?c=problem_solution&rm=264049&rd=10667&pm=6784&cr=10574855">calculates</a> the number of factors based on the prime factorization.  A modification to his solution can count all refactorable numbers under 10 million in 1 second.
<br /><br />
</p>





<div class="authorPhoto">
    <!-- <img src="/i/m/Kawigi_big.jpg" alt="Author" /> -->
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7296000" context="algorithm"/><br />
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
