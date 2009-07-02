<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 408 Problem Set &amp; Analysis</title>

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
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=12180">Match Overview</a><br />
    <tc-webtag:forumLink forumID="521928" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 408</span><br />Tuesday, July 1, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
SRM 408 brought 1305 brave competitors together in coding combat.  The competitors faced a grueling, greedy set that tempted them with points, only to pull them away during the challenge and system test phases if they hadn't coded carefully.  The 250 was reasonably straight forward, but the 500 had a couple of tricky corner cases and the 1000 required very careful coding to implement.  In the end, <tc-webtag:handle coderId="22629574" context="algorithm"/> regained his red color as the only competitor able to find the greedy solutions to all three problems.  Second and third place went to <tc-webtag:handle coderId="20867024" context="algorithm"/> and <tc-webtag:handle coderId="15868491" context="algorithm"/>, with <tc-webtag:handle coderId="14970299" context="algorithm"/> being the only other competitor to successfully solve the 1000.
</p><p>
Division 2 coders faced two greedy problems in the 250 and 500, and a 1000 that forced them to conserve memory in order to successfully pass.  <%---Newcomer <tc-webtag:handle coderId="22740438" context="algorithm"/> was victorious, followed closely by <tc-webtag:handle coderId="22661563" context="algorithm"/> and <tc-webtag:handle coderId="22740359" context="algorithm"/>.--%>
<tc-webtag:handle coderId="22661563" context="algorithm"/> was victorious followed closely by <tc-webtag:handle coderId="22740359" context="algorithm"/>.
</p> 
 
<H1> 
The Problems 
</H1>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9822&amp;rd=12180" name="9822">TournamentJudging</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9822)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=521928" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
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
      622 / 654 (95.11%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      598 / 622 (96.14%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>xgd_sixth</strong> for 249.33 points (1 mins 28 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      217.33 (for 598 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem has a reasonably straightforward solution.  In order to round each quotient to the nearest integer, several paths are available.  Some competitors used pre-built libraries, while others simply added 0.5 to the raw score after division and before rounding.  As some people worry about double imprecision when doing this, one can instead use only integers by adding conversionFactor/2 to the raw score prior to division; this guarantees that the result will round correctly.

<pre>
public int getPoints(int[] rawScore, int[] cF)
{

int ret = 0;
for(int i=0; i &lt; cF.length; i++)
    ret += (rawScore[i] + cF[i]/2)/cF[i];
return ret;
}
</pre>

</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8467&amp;rd=12180" name="8467">OlympicCandles</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8467)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=521928" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
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
      525 / 654 (80.28%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      362 / 525 (68.95%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>xgd_fifth</strong> for 495.54 points (2 mins 42 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      341.66 (for 362 correct submissions) 
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
      530 / 538 (98.51%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      447 / 530 (84.34%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>ahmed_aly</strong> for 248.32 points (2 mins 20 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      220.30 (for 447 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
In order to maximize the number of days that one can light the candles, it is sufficient to take the k tallest candles on day k and light them.  The proof for this is reasonably straightforward.  Assume on day k you choose to light a candle A but not B (and A's height is less than B).  If on some following day we light B but not A, then we can simply switch which days we use A and B, and this will be equivalent to our algorithm.  On the other hand, if the rest of the time we light B and A at the same time, then it still acceptable to light B on day k instead of A (since B is taller than A).  Thus, each day we light the k tallest candles remaining, and we stop when we cannot light k candles.  The most common error on this problem was people forgetting to break out of their loops if the number of days exceeded the number of candles.

<pre>
public int numberOfNights(int[] candles)
{
int ret = 1;
int N = candles.length;
while(true)
{
    Arrays.sort(candles);
    for(int i=0; i &lt; ret; i++)
        if(N-1-i &lt; 0 || candles[N-1-i]==0)
            return ret-1;
    else candles[N-1-i]--;
    ret++;
}

}
</pre>

</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9754&amp;rd=12180" name="9754">MarblesInABag</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9754)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=521928" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
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
      151 / 654 (23.09%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      26 / 151 (17.22%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>flashfox</strong> for 752.61 points (17 mins 32 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      467.69 (for 26 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Assume that we currently have <strong>b</strong> blue marbles and <strong>r</strong> red marbles, and that it is our turn.  You may draw a red marble from the bag; this will happen with probability <strong>r</strong>/(<strong>r</strong>+<strong>b</strong>), and after Sid's turn will leave you at the state (<strong>r-1</strong>, <strong>b-1</strong>).  Similarly, if you instead draw a blue marble, you will move to the state (<strong>r</strong>, <strong>b-2</strong>), with probability <strong>b</strong>/(<strong>b</strong>+<strong>r</strong>).  This sets up a nice DP relation that normally would work well, but for the fact that the table will take up too much room in memory.  Thus, we need to find a way to conserve memory.  
</p><p>
In the above recursion, you can see that there will always be <strong>b</strong>+<strong>r</strong>-2 marbles after Sid's next turn.  Thus, we can change the state to (total_marbles, red_marbles).  We win if we reach any state (n, 0), and lose if we get to a state of (n, n); this is our base case.  Since all calculations of n marbles are based only on the calculations from states involving n-2 marbles, we can use O(n) memory by keeping two arrays; one containing the answers from the n-2 marble state, and another where we build our answers for the n marble state.  After building each row, we can swap the arrays, and compute the following step.  Thus, our answer will be (<strong>b</strong>+<strong>r</strong>, <strong>r</strong>).  See <tc-webtag:handle coderId="278145" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rm=297909&amp;rd=12180&amp;pm=9754&amp;cr=278145">solution</a> for a clean implementation of this approach.
</p><p>
An interesting observation was that the cases that forced memory errors had return values of much less than 10<sup>-9</sup> (as the probability of victory is so small).  A couple of competitors took advantage of this, including <tc-webtag:handle coderId="22710563" context="algorithm"/>'s <a href="/stat?c=problem_solution&amp;rm=297906&amp;rd=12180&amp;pm=9754&amp;cr=22710563">solution</a> that caught the memory error and returned 0 if the memorization table would be too large.

</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8462&amp;rd=12180" name="8462">CandyGame</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8462)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=521928" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
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
      342 / 538 (63.57%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      128 / 342 (37.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>crazyb0y</strong> for 448.68 points (9 mins 50 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      235.24 (for 128 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
First of all, if the graph is not strongly connected, then we can place an infinite number of candies on the nodes that have no path to the <strong>target</strong>, so we return -1 there.  In all other cases, the graph that we have can be pictured as a tree; let us arbitrarily arrange that tree so that the root node is our <strong>target</strong>.  We can show that any maximal arrangement of candy that cannot reach the goal must have a sequence of moves leading to an arrangement with exactly 1 piece of candy on each node (proof left for the reader).  We can consider each piece of candy individually.  To maximize the candy we put on the graph, we want to move each piece of candy as far away from the target as possible without moving it towards the target.  If we move it from a depth of <em>d1</em> to <em>d2</em>, then we can add 2<sup><em>d2</em>-<em>d1</em></sup> candies to that node (removing the candy from the original node).  Once we have done this for each node, we simply return the sum (or -1 if the sum is too large).

<pre>
int[] depth;
String[] g;

void dfs(int cur, int d)
{
    if(depth[cur] &gt; -1) return ;
    depth[cur] = d;

    for(int i=0; i &lt; g.length; i++)
        if(g[cur].charAt(i)=='Y' &amp;&amp; depth[i]==-1)
            dfs(i, d+1);
}

int maxdepth(int cur)
{
    int ret = depth[cur];

    for(int i=0; i&lt;g.length; i++)
        if(g[cur].charAt(i)=='Y' &amp;&amp; depth[i] &gt; depth[cur])
            ret = Math.max(ret, maxdepth(i));
    return ret;
}

public int maximumCandy(String[] graph, int t)
{

g = graph;
depth = new int[g.length];
Arrays.fill(depth, -1);
dfs(t, 0);

long ret = 0;
for(int i=0; i &lt; g.length; i++)
    if(i==t) continue;
    else if(depth[i] == -1) return -1; // Not connected
    else ret += 1l &lt;&lt; (maxdepth(i) - depth[i]);

if(ret &gt; 2000000000) return -1;
else return (int)ret;



}
</pre>

</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9802&amp;rd=12180" name="9802">TournamentSeeding</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9802)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=521928" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
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
      5 / 538 (0.93%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      2 / 5 (40.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Smylic</strong> for 454.57 points (44 mins 33 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      441.88 (for 2 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
To solve this problem, we can attempt to simulate the tournament.  In each round, we have a list of teams that are currently in the round.  Assume that we are in round R (indexed from 0).  Let us sort the teams alphabetically, and go through in order.  If a team has greater than R wins, then they played against their opponent that had R wins and 1 loss; if there is not exactly one such team, then the game list is invalid.  We take the winner from that game and advance them to the next round (and remove the loser).  Eventually we will be left with several teams that have R or less wins in the game list and no losses.  Here there are several ways to arrange these teams, but in the lexicographically earliest seeding, the lowest seeded team among these teams must be the lexicographically first team, and the highest seed must be the last team.  We pair these two teams, advance the lower seed, and continue.
We can apply this algorithm repeatedly until we are left with only one team.  That team is the team with seed 0, and we can work backwards from there to determine all seeds.  C++ code follows:

<pre>
int played[512][512];
vector&lt; string &gt; INVALID(0);

vector&lt; string &gt; getSeeds(vector&lt; string &gt; _team, vector&lt; string &gt;_game,
              vector&lt; int &gt; seeds)
{
                // Parse teams
vector&lt; string &gt; teams;
string t;    
for(int i=0; i &lt; _team.size(); i++)
    t += _team[i];

stringstream s1(t);

while(!s1.eof() )
{
    string temp;
    s1 &gt;&gt; temp;
    teams.push_back(temp);
}

sort(teams.begin(), teams.end() );

map&lt; string, int &gt; teamtable;
int N = teams.size();
for(int i=0; i&lt;N; i++) teamtable[teams[i]] = i;
                // Parse games
string g;
for(int i=0; i&lt;_game.size(); i++)
    g += _game[i];
vector&lt;int&gt; wins(N, 0), loss(N, 0);
            
stringstream s2(g);
string winner, loser;
s2 &gt;&gt; winner;
while(!s2.eof() )
{    s2 &gt;&gt; loser;
    wins[teamtable[winner]]++;
        // If team already lost, invalid set
    if(loss[teamtable[loser]] &gt; 0) return INVALID;
        // Otherwise update win-loss records
    loss[teamtable[loser]] = 1;
    played[teamtable[winner]][teamtable[loser]] = 1;
    played[teamtable[loser]][teamtable[winner]] = -1;
    s2 &gt;&gt; winner;
}

vector&lt; int &gt; current(N, 0);
for(int i=0; i &lt; N; i++) current[i] = i;
vector&lt; vector&lt; int &gt; &gt; gamesplayed(N);

int r = 0;
while(current.size() &gt; 1)    // Determine games in current round
{
sort(current.begin(), current.end() );
vector&lt; int &gt; advancers;
for(int i=0; i &lt; current.size(); i++)
{
if(wins[current[i]] &gt; r)    // if the game is defined in games
{
    int j;
    for(j=0; j &lt; N; j++)
        if(played[current[i]][j]==1 &amp;&amp; wins[j]==r) break;
    // If no opponent has a record of r wins and 1 loss then INVALID
    if(j==N) return INVALID;
        // Otherwise the current team wins
    advancers.push_back(current[i]);
    gamesplayed[current[i]].push_back(j);
    gamesplayed[j].push_back(current[i]);
}
else if(loss[current[i]] == 0 &amp;&amp; gamesplayed[current[i]].size()==r)
{    // otherwise if the opponent is not yet defined
    int j;
    for(j=current.size()-1; j &gt; -1; j--)
        if(loss[current[j]]==0 &amp;&amp; wins[current[j]] &lt;=r) break;
    if(j &lt; 0) return INVALID;
        // Greedily assign teams to games
    advancers.push_back(current[i]);
    gamesplayed[current[i]].push_back(current[j]);
    gamesplayed[current[j]].push_back(current[i]);
    loss[current[j]]++;
}
// in all other cases the team loses; those cases are above

}

current = advancers;
r++;

}

// The winner is seed 0, now assign seeds
vector&lt; string &gt; finalSeeds(N, "");
queue&lt; int &gt; q;
q.push(current[0]);
finalSeeds[0] = teams[current[0]];

while(!q.empty() )
{
    int cur = q.front();
    q.pop();
    int seed = 0;
    while(teams[cur]!=finalSeeds[seed]) seed++;
    int N1 = N;
    for(int i=0; i &lt; gamesplayed[cur].size(); i++, N1/=2)
    {
        if(finalSeeds[N1-1-seed]=="")
        {
            finalSeeds[N1-1-seed] = teams[gamesplayed[cur][i]];
            q.push(gamesplayed[cur][i]);
        }
    }
}
// Get return vector and return it
vector&lt;string&gt; ret = vector &lt; string &gt; (seeds.size());
for(int i=0; i &lt; seeds.size(); i++)
    ret[i] = finalSeeds[seeds[i]];
return ret;

}
</pre>

</p>


<br /><br />


<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7296000" context="algorithm"/><br />
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
