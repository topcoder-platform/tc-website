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
    <A href="/stat?c=round_overview&er=5&rd=10731">Match Overview</A><br>
    <tc-webtag:forumLink forumID="514899" message="Discuss this match" />
</div>
<span class="bodySubtitle">2007 TopCoder Open <br> Qualification Round 2 </span><br>Saturday, March 31, 2007
<br><br>


<h2>Match summary</h2> 

This Saturday's qualification round attracted most of the high-rated coders who needed to compete for a spot in Round 1, and most of them easily advanced. Since most of the sports champions will be crowned during the next couple of months (NBA, NHL, TCO), the problems today 
were sports-oriented, with <tc-webtag:handle coderId="7269339" context="algorithm"/>, 
<tc-webtag:handle coderId="21749340" context="algorithm"/> and 
<tc-webtag:handle coderId="22673803" context="algorithm"/> finishing in the top three.
Congratulations to them, and to the other 547 coders who were able to move on to Round 1, and good luck to everybody who is going to participate in the last Qualification Round!
<br />
<br />
 
<H1> 
The Problems 
</H1>
</p> 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7627&amp;rd=10731" name="7627">BuildATeam</a></b> 
</font> 
<A href="Javascript:openProblemRating(7627)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514899" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      1163 / 1250 (93.04%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1104 / 1163 (94.93%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>sason</b> for 249.36 points (1 mins 26 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      203.77 (for 1104 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 


This problem checks your ability to quickly implement the algorithm given in the statement.
First you need to create an array, with the i-th element of the array corresponding to the 
i-th team. Then, add the strengths of all the players to the teams corresponding to those players 
(read "to the corresponding elements of the array"). The maximal element of the array
will be the strength of the strongest team.
<br />
<br />

C++ code follows:
<pre>
int maximalStrength(vector &lt;int> skills, int teams) {
    vector&lt;int> v(teams, 0);
    sort(skills.begin(), skills.end());
    for (int i = 0; i < skills.size(); i++) {
        int a = i % (2 * teams);
        v[a < teams ? a : 2* teams - a - 1] += skills[i];
    }
    return *max_element(v.begin(), v.end());
}
</pre>


<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7538&amp;rd=10731" name="7538">BasketballStandings</a></b> 
</font> 
<A href="Javascript:openProblemRating(7538)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514899" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
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
      804 / 1250 (64.32%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      729 / 804 (90.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>radeye</b> for 425.11 points (6 mins 57 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      276.99 (for 729 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

The solution to this problem consists of 3 parts - parsing the input, sorting the teams and 
constructing the output.
<br /><br />

The parsing is quite easy since the team name, its numbers of wins and its number of losses are all separated by a single space.
Sorting teams can be more difficult, since we need to compare each team separately.
We can use a standard routine to do the sorting for us, though, if we use a small trick.
As you can see from the statement (and easily prove), adding k to the team's number of wins and 2*k to team's 
numbers doesn't change the gap between this team and any other team, nor does it affect the team's position in the standings.
Therefore, we can calculate the number of wins each team would have won if it would play, say, 1000 games,
and sort the results according to this number. 
<br />
<br />

For example, if a team has W wins and L losses, it needs to play (1000 - W - L) games more.
We think it will win (1000 - W - L)/2 of them, making its total wins count equal to (W + (1000 - W - L)/2).
To make sure we won't have any bugs with floating point precision, we multiply this number 
by 2 for all teams:

<pre>
vector <string> constructTable(vector <string> teams) {
    vector<pair<int, string> > data;
    for (int i = 0; i < teams.size(); i++) {
        int n1 = teams[i].find(' ');
        int n2 = teams[i].find(' ', n1 + 1);
        int wins = atoi(teams[i].substr(n1 + 1, n2 - n1 - 1).c_str());
        int losses = atoi(teams[i].substr(n2 + 1).c_str());
        data.push_back(make_pair(-(2 * wins + 1000 - (wins + losses)), teams[i].substr(0, n1)));
    }
    sort(data.begin(), data.end());
    for (int i = 0; i < data.size(); i++)
        data[i].first *= -1;
    vector<string> res;
    for (int i = 0; i < data.size(); i++) {
        char buf[50];
        int gap = data[0].first - data[i].first; // The gap between the best and the i-th teams
        sprintf(buf, "%s %i.%i", data[i].second.c_str(), gap/2, (gap % 2) * 5);
        res.push_back(string(buf));
    }
    return res;
}
</pre>


<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7641&amp;rd=10731" name="7641">BuildTheBestTeam</a></b> 
</font> 
<A href="Javascript:openProblemRating(7641)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514899" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      174 / 1250 (13.92%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      59 / 174 (33.91%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>simonenko</b> for 790.87 points (15 mins 29 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      556.64 (for 59 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<i>During this overview, "captain" will mean "a captain which is not a captain of the powerplay team", "captains" will mean "all captains except the powerplay captain", and I will
refer to the captain of the powerplay team explicitly.</i><br/>
<br />

To be able to solve this problem we need to predict the behavior of the 
captains.
To make this easier, we will sort all players in the order preferred by these captains (players with higher usual skills first, with powerplay skills as a tiebreaker).
After sorting the players in this order, a captain will always pick the first player among those who were not yet picked.
As a consequence, if at some moment player i was not yet picked, then any player j (j > i)
was either picked by the powerplay captain or was not picked at all (Statement 1).
<br />
<br />
Statement 2. 
The players of the optimal powerplay team can be picked in the order they would be picked by captains. <br/>
Proof. Let players P1 and P2 be chosen to the powerplay team and P2 be more preferred by captains.
Let the powerplay captain choose those players in rounds R1 and R2 respectively, and R1 < R2.
We will prove the powerplay captain can swap his picks and pick P2 in round R1 and P1 in round R2.
The fact that player P2 was picked in round R2 means player P1 also wasn't picked until that round (see Statement 1), so the powerplay captain can pick him in round R2.
Player P2 was not picked until round R2, therefore he obviously was not picked in any of the previous rounds, including round R1.
Therefore, the powerplay captain would be able to pick him in round R1.
<br />
<br />

After the boring theoretical part we move to the implementation part.
We suppose the powerplay captain will pick players in the order they are preferred by other captains.
Therefore, if he picks player i in round j, then he can pick only players with indices less than i in all the following rounds.
If f(a, b) is equal to the total powerplay strength of all players chosen to the powerplay team 
starting from round b, if player a was the last powerplay captain's pick.
Then f(a, b) = Maximum of (powerplaySkills[i] + f(i, b + 1)) for all i > a. 
Also, we need to make sure that player i wasn't picked by the captains earlier. 
To do this we need to calculate the number K of picks made by all captains before the b-th pick of the powerplay captain, 
and make sure i is bigger than or equal to K. The java implementation of this approach follows:

<pre>
<i>(we suppose the players are already sorted)</i>
    int f(int pos, int round) {
        if (round >= T) return 0;
        if (pos >= N) return -100000;
        int res = memo[pos][round];
        if (res != -1)
            return res;
        int q = minPicks(round);
        if (q > pos)
            return memo[pos][round] = f(q, round);
        res = 0;
        for (int i = pos; i < N; i++)
            res = Math.max(res, powerplaySkills[i] + f(i + 1, round + 1));
        return memo[pos][round] = res;
    }
    int minPicks(int round) {
        int res = 2 * teams * (round / 2);
        if (round % 2 == 1)
            res += (2 * teams - ind - 1);
        else
            res += ind;
        return res;
    }
</pre>
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
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
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
