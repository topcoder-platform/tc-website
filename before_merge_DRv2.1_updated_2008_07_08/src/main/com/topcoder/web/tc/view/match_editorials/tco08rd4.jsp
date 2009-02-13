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
    <A href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&amp;er=5&amp;rd=12014">Match Overview</A><br />
    <tc-webtag:forumLink forumID="520246" message="Discuss this match" />
</div>
<span class="bodySubtitle">2008 TopCoder Open<br />Online Round 4</span><br />Saturday, March 8, 2008
<br /><br />



<h2>Match summary</h2> 

<p>
Round 4 of the 2008 TopCoder Open saw 147 of the best competitors battling for 72 spots at the onsite finals in Las Vegas. Excitement was high. There were at least twice as many observers as coders in the Arena – some rooting for the their fellow countrymen, some for their favorite coder.
</p>
<p>
The contest began slowly. Unlike the other online rounds, no one solved the easy problem quickly, with the first submission coming from <tc-webtag:handle coderId="8355516" context="algorithm"/> in a little less than 12 minutes. </p>
<p>
As solutions to the easy trickled in, <tc-webtag:handle coderId="22663781" context="algorithm"/>, who had skipped the easy to work directly on the medium, submitted the medium to take the lead with 50 minutes of coding time left. Soon after <tc-webtag:handle coderId="10574855" context="algorithm"/>, to the cheers and adulation of his massive fan club in the Arena, jumped to first with a rapid submission of the medium after resubmitting the easy.
</p>
<p>
A bunch of medium solutions soon followed. With 20 minutes remaining, about 25-30 coders were working on the hard problem, and it seemed as if at least a couple people would solve it. However, only <tc-webtag:handle coderId="22641704" context="algorithm"/> submitted a solution to the hard before the contest phase came to an end.
</p>
<p>
In the first few mintues of the challenge phase, <tc-webtag:handle coderId="22641704" context="algorithm"/>'s hard went down and <tc-webtag:handle coderId="10574855" context="algorithm"/> jumped back into the lead by a sizeable margin with a string of challenges on top of his fast time for the medium. Observers watched as a few targets and high ranking reds lost their easy and medium solutions, and fell out of contention. System tests took out more solutions and the cut-off for the onsite round fell to 153.18 points.
</p>
<p>
In the end, <tc-webtag:handle coderId="10574855" context="algorithm"/> came out ahead and went above a 3700 rating for the first time since last June. He was followed by first-time target <tc-webtag:handle coderId="14886245" context="algorithm"/>, <tc-webtag:handle coderId="9906197" context="algorithm"/>, <tc-webtag:handle coderId="7442498" context="algorithm"/>  and <tc-webtag:handle coderId="20812309" context="algorithm"/>.
</p>
<p>
A few observations about the upcoming TCO onsites:
</p>

<ul>
<li>10 out of the current 11 targets will be there (<tc-webtag:handle coderId="272072" context="algorithm"/> overslept the first round). </li>

<li>The lowest rated coder will be <tc-webtag:handle coderId="22663763" context="algorithm"/>, who started the tournament seeded 742.</li>

<li>There are 4 coders who will compete in both the TCHS and TCO finals: <tc-webtag:handle coderId="22285847" context="algorithm"/>, <tc-webtag:handle coderId="10574855" context="22656813"/>, <tc-webtag:handle coderId="10574855" context="14768757"/>, and <tc-webtag:handle coderId="20812309" context="algorithm"/>. </li>
</ul>

<p>Congratulations to all the advancers!</p>

 

<H1> 

The Problems 

</H1>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8676&amp;rd=12014" name="8676">MagicLabeling</a></b> 

</font> 

<A href="Javascript:openProblemRating(8676)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520246" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      140 / 146 (95.89%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      106 / 140 (75.71%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Eryx</b> for 215.07 points (11 mins 51 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      159.49 (for 106 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
This problem looks deceptively easy, but it actually takes quite a bit of time and focus to create a working solution.
</p>
<p>
First, count the number of vertices with 0 edges. These vertices can be labeled with any number between 1 and M. Next, look at each connected component. By the restrictions, all the vertices connected to any single vertex must have the same label. This means, for each independent component, there is either 1 or 2 distinct numbers which label all the vertices. Deciding whether or not a component can have two labels is the same as deciding whether or not it can be two-colored, which is an easy problem to solve by DFS.
</p>
<p>
Once we have the number of solitary nodes, the number of two-colorable components, and the number of mono-color components, we can find the solution by iterating through each possible edge sum and calculating the number of labeling possibilities for each component based on that sum. Code below:
</p>

<pre>
const int MOD = 1000003;
int color[55], visit[55];
int G[55][55];
int N;

int dfs(int a, int col)
{
  if(visit[a])
  {
    if(color[a] != col) return 0;
    else return 1;
  }
  visit[a] = 1;
  color[a] = col;
  int ok = 1;
  for(int i = 0; i &lt; N; i++)
  {
    if(G[a][i])
    {
      if(!dfs(i,1-col)) ok = 0;
    }
  }
  return ok;
}


class MagicLabeling {
public:
  int count(vector&lt;string&gt; a, int M)
  {
    N = a.size();
    memset(visit,0,sizeof(visit));
    
    int solitary = 0, two_color = 0, one_color = 0;
    for(int i = 0; i &lt; N; i++)
    {
      int edges = 0;
      for(int j = 0; j &lt; N; j++)
      {
        if(a[i][j] == 'Y') 
        {
          G[i][j] = 1;
          edges++;
        }
        else G[i][j] = 0;
      }
      if(edges == 0) 
      {
        solitary++;
        visit[i] = 1;
      }
    }
    if(solitary == N)
    {
      int res = 1;
      for(int i = 0; i &lt; N; i++) res = (res * M) % MOD;
      return res;
    }
    
    //find the components
    for(int i = 0; i &lt; N; i++)
    {
      if(visit[i] == 1) continue; 
      if(dfs(i,0)) two_color++;
      else one_color++;
    }
    
    long long res = 0;
    for(int edge_sum = 2; edge_sum &lt;= 2*M; edge_sum++)
    {
      if(one_color &gt; 0 &amp;&amp; edge_sum % 2 == 1) continue;
      long long pairs = 0, labels = 1;
      for(int label = 1; label &lt;= M; label++)
      {
        if(edge_sum &lt;= label || (edge_sum - label &gt; M)) 
          continue;
        pairs++;
      }
      for(int i = 0; i &lt; two_color; i++) 
        labels = (labels * pairs) % MOD;
      for(int i = 0; i &lt; solitary; i++)
        labels = (labels * M) % MOD;
      res = (res + labels) % MOD;
    }
    return res;
  }
};</pre>


<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8610&amp;rd=12014" name="8610">OlympicGames</a></b> 

</font> 

<A href="Javascript:openProblemRating(8610)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520246" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      91 / 146 (62.33%)  

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      39 / 91 (42.86%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Petr</b> for 411.10 points (13 mins 50 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      271.29 (for 39 correct submissions)  

    </td> 

  </tr> 

</table></blockquote> 

<h4> Solution #1: Dynamic Programming </h4>
<p>
To me, this problem suggests a Dynamic Programming solution. In the beginning, we find the number of teams already beating team 0, after all remaining gold medals are added to team 0, and then look for the optimal placement of the remaining silver and bronze medals. When we are looking for parameters to recurse on, the first thing that comes to mind is a DP that looks like this:
</p>
<p>
<pre>dp[M][N] = max # of teams that beat team 0 with M silver medals assigned and N bronze medals assigned.</pre>
</p>
<p>
However, because M and N can be as great as 10,000, this gives a total state space of up to 100,000,000 – which is about an order of magnitude more memory than allowed in the Arena. So we have to look for an optimization. 
</p>
<p>
Consider reordering the three numbers related to each other by the above DP. We saw that dp[M][N] = MAX, didn't work, so what about dp[M][MAX] = N? In other words this would be a dp such that
</p>
<p>
<pre>dp[M][T] = Minimum # of bronze medals needed to have T teams beat team 0 after M silver medals are assigned. </pre>
</p>
<p>
This would give us a state space of up to 10,000 * 50 = 500,000, well within our limits.
</p>
<p>
See <tc-webtag:handle coderId="10574855" context="algorithm"/>'s <a target="_blank" href="/stat?c=problem_solution&rm=269375&rd=12014&pm=8610&cr=10574855">code</a> for a clear implementation.
</p>
<h4> Solution #2: Greedy Approach </h4>

<p>
By reading the forums, I discovered that there is also a greedy solution to this problem, based on the observation that you can sort all teams 1…N first on silver[0]-silver[i] and then on bronze[0] – bronze[i]. Then, when deciding if M teams can beat team 0, we choose the first M teams of our sorted array. 
</p>
<p>
To show why this works: Consider M teams that can beat team 0, but are not the first M teams of the array. If any skipped team p has an equal difference in silver medals with any team q, then it is better to include p than q (p has a smaller difference in bronze medals). Otherwise, if skipped team p has a smaller difference in silver but a greater difference in bronze than added team q, then add all the extra silver medals q needs more than p, to p. This arrangement would require p to have 0 bronze medals, as team p would beat team 0 on silver medals alone, which is at least as good as the assignment where q is included and p is not. 
</p>
<p>Once we have this figured out, the solution follows:</p>

<pre>
class OlympicGames {
public:
  int worstPlace(vector&lt;string&gt; T, int games)
  {
    int N = T.size();
    int g[N], s[N], b[N];
    
    int res = 1;
    vector&lt;pair&lt;int,int&gt; &gt; medals;
    for(int i = 0; i &lt; N; i++)
    {
      sscanf(T[i].c_str(),"%d %d %d",&g[i],&s[i],&b[i]);
      if(i==0) g[i] += games;
      else
      {
        if(g[0] &lt; g[i]) 
        { 
          res++; 
          continue; 
        }
        if(g[0] &gt; g[i]) 
          continue;
        if(s[0] &lt; s[i] || (s[0]==s[i] &amp;&amp; b[0] &lt; b[i])) 
        { 
          res++; 
          continue; 
        }
        
        int sdiff = s[0]-s[i], bdiff = b[0]-b[i];
        if(sdiff &gt; games || (sdiff == games &amp;&amp; bdiff &gt; 0)) 
          continue;

        medals.push_back(make_pair(sdiff,bdiff));
      }
    }
    sort(medals.begin(),medals.end());
    for(int beat = medals.size()-1; beat >= 0; beat--)
    {
      int silver = 0, bronze = 0;
      vector&lt;int&gt; need;
      for(int i = 0; i &lt;= beat; i++)
      {
        if(medals[i].second + medals[i].first == games)
        {
          silver += medals[i].first + 1;
          continue;
        }
        silver += medals[i].first;
        if(medals[i].second >= 0)
        {
          bronze += medals[i].second+1;
           need.push_back(medals[i].second+1);
        }
      }
      if(silver &gt; games) continue;
      
      sort(need.begin(),need.end());
      while(silver &lt; games &amp;&amp; need.size())
      {
        silver++;
        bronze -= need.back();
        need.pop_back();
      }
      
      if(bronze &lt;= games) return res + beat + 1;
    }
      
    return res;
  }
};</pre>


<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8616&amp;rd=12014" name="8616">Collect</a></b> 

</font> 

<A href="Javascript:openProblemRating(8616)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520246" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      1 / 146 (0.68%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      0 / 1 (0.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      No correct submissions

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      No correct submissions 

    </td> 

  </tr> 

</table></blockquote> 

<p>
Primarily, this problem was a test of optimization skills. To find a solution which passes system tests under the time limit, there are a variety of approaches.
</p>

<h4> Lookup table </h4>

<p>The idea behind a lookup table is to pre-calculate the answers to all possible combinations of inputs (in this case, 1000) and store them in an array to overcome time constraint issues.
</p>

<p>
<tc-webtag:handle coderId="10574855" context="algorithm"/> almost finished <a target="_blank" href="/stat?c=problem_solution&rm=269375&rd=12014&pm=8616&cr=10574855">this</a> lookup table before the coding phase ended. 
</p>

<h4>DP with pruning and locking </h4>
<p>
Consider some roll R – what are the parameters we need to describe the state? Well, the value of each die, and the number of rolls remaining. This leads to state space of 7^10 *  100 = ~28,000,000,000 – more than we can map to memory.
</p>
<p>
However, we can also define the state space by the number of dice = 1..6, leading to a state space of 11^6 * 100 = 177,156,100, still more memory than we can allocate. We can get this down further to 2*1,777,156 by considering one roll at a time. However, the challenge is still to make the code run in time, which requires pruning and other optimizations.
</p>
<p>
There is a good discussion in this <a target="_blank" href="http://forums.topcoder.com/?module=Thread&threadID=606357&start=0&mc=5">thread</a> about possible optimizations for a dynamic programming solution. Read it, and be enlightened.
</p>

<br /><br />


<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="20635649" context="algorithm"/><br />
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
