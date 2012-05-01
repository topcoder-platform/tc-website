<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="../links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="onsite_events"/>
<jsp:param name="tabLev3" value="blogs"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">

<div style="float:right;">
<tc-webtag:forumLink forumID="505975" message="discuss this" />
</div>

<%-- anchor link from bloggers page --%>
<a name="001"></a>
<span class="bigTitle">Petr takes the lead</span><br>
05.05.06 9:00 PM
<br><br>
<img src="/i/m/Kawigi_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="8416646" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
It was time to prepare for the final round of the TopCoder Open.  Everything was on the line.  The clear favorites among the spectators were <tc-webtag:handle coderId="144400" darkBG="true" /> and <tc-webtag:handle coderId="10574855" darkBG="true" />, although several others definitely had a good chance.  Perhaps now was the time for <tc-webtag:handle coderId="10574855" darkBG="true" /> to avenge his <a target="_blank" href="/?t=sponsor&c=link&link=http://icpc.baylor.edu/past/icpc2003/Finals/Standings03.pdf">loss</a> to <tc-webtag:handle coderId="144400" darkBG="true" /> and <tc-webtag:handle coderId="8355516" darkBG="true" />'s team in ICPC 2003.  Perhaps it was a time for <tc-webtag:handle coderId="144400" darkBG="true" /> to show once and for all that he hasn't lost his touch.  Perhaps it's <tc-webtag:handle coderId="8357090" darkBG="true" />'s turn to dominate the tournament.  Only the next few hours would tell. <br/><br/>
As the competitors prepared for the final round of the TopCoder Open, it's funny to watch all the spectators and those who have been previously eliminated watching the monitors of the finalists as they simply type in templates and macros and whatnot.  There was a bit of action going on around <tc-webtag:handle coderId="270505" darkBG="true" />'s monitor, and it turned out that he had messed up his for loop macros. <br/><br/>
He typed in a typical FORI, FORJ and FORK macro, except that he used the wrong letters in all but the FORI version.  After typing the macros in wrong, he tested a bit with the FORI macro, and finally tested the FORJ macro with it as well.  He got a compiler error and figured out what he messed up, and fixed it for cheers from the peanut gallery.  Then he wrote next to the fixed macros "<em>I'm glad I found that</em>".  Of course, he deleted the comment afterwards, or else the code after the macros when he used them would be commented out (and we can't expect him to put stuff on a different line, after all). <br/><br/>
The coding phase started with <tc-webtag:handle coderId="7346876" darkBG="true" />'s Mortal Kombat voice saying, "The Coding Phase of the 2006 TopCoder Open Final Round is beginning.  Fight!!!" <br/><br/>
As the coding phase started, everyone started out on the easy problem.  Other strategies had basically completely failed so far in the tournament, and this 250 was somewhat more straightforward to figure out than the ones in the semifinals.  <tc-webtag:handle coderId="144400" darkBG="true" /> submitted pretty quickly for 244.55 points, and <tc-webtag:handle coderId="10574855" darkBG="true" /> followed by just a few minutes.  With little delay, <tc-webtag:handle coderId="8357090" darkBG="true" /> and <tc-webtag:handle coderId="16056363" darkBG="true" /> also added their submissions, followed by <tc-webtag:handle coderId="11829284" darkBG="true" /> and <tc-webtag:handle coderId="270505" darkBG="true" />.  <tc-webtag:handle coderId="270505" darkBG="true" /> didn't open another problem for a couple minutes, and he quickly resubmitted and opens the 1000. <br/><br/>
<tc-webtag:handle coderId="309982" darkBG="true" /> and <tc-webtag:handle coderId="10599449" darkBG="true" /> also eventually submit the 250 and everyone (except <tc-webtag:handle coderId="270505" darkBG="true" />) is simultaneously working on the 500. <br/><br/>
All of a sudden, <tc-webtag:handle coderId="16056363" darkBG="true" /> surprised everyone by being the first to submit the 500.  <tc-webtag:handle coderId="144400" darkBG="true" /> and <tc-webtag:handle coderId="10574855" darkBG="true" /> submitted quickly afterwards, and then <tc-webtag:handle coderId="144400" darkBG="true" /> resubmitted. <br/><br/>
<tc-webtag:handle coderId="10599449" darkBG="true" /> joins the 500 club and things get quiet for a few minutes. <br/><br/>
With a full 26 minutes left in the contest, <tc-webtag:handle coderId="144400" darkBG="true" /> submits a solution to the 1000 and <tc-webtag:handle coderId="10574855" darkBG="true" /> followed within 10 seconds.  In the remaining time, <tc-webtag:handle coderId="309982" darkBG="true" /> finished his 500, <tc-webtag:handle coderId="10574855" darkBG="true" /> resubmitted his 500, and <tc-webtag:handle coderId="10599449" darkBG="true" /> and <tc-webtag:handle coderId="16056363" darkBG="true" /> surprised the field by submitting high-scoring solutions to the 1000. <br/><br/>
After the coding phase ended, the spectators crowded around the leader board to watch the challenge phase, as the challenge phases have been increasingly exciting throughout the tournament.  Before the challenge phase, the standings looked like this: <br/><br/>
<table border="1" cellspacing="0" cellpadding="3" class="bodyText"><tr><th>Handle</th><th>Points</th></tr> <tr><td><tc-webtag:handle coderId="10599449" darkBG="true" /></td><td Align="Right">1253.89</td></tr> <tr><td><tc-webtag:handle coderId="144400" darkBG="true" /></td><td Align="Right">1240.71</td></tr> <tr><td><tc-webtag:handle coderId="10574855" darkBG="true" /></td><td Align="Right">1163.77</td></tr> <tr><td><tc-webtag:handle coderId="16056363" darkBG="true" /></td><td Align="Right">1078.96</td></tr> <tr><td><tc-webtag:handle coderId="270505" darkBG="true" /></td><td Align="Right">505.18</td></tr> <tr><td><tc-webtag:handle coderId="309982" darkBG="true" /></td><td Align="Right">439.86</td></tr> <tr><td><tc-webtag:handle coderId="8357090" darkBG="true" /></td><td Align="Right">236.46</td></tr> <tr><td><tc-webtag:handle coderId="11829284" darkBG="true" /></td><td Align="Right">232.91</td></tr> </table> <br/><br/>
The competitors were ready to impress, and <tc-webtag:handle coderId="10574855" darkBG="true" /> in particular came to entertain. The challenge phase began and the Quake 3 Arena / Unreal Tournament voice in my head began to announce the action.  <tc-webtag:handle coderId="10574855" darkBG="true" /> killed <tc-webtag:handle coderId="270505" darkBG="true" />'s 500 in 10 seconds. <h3>First Blood!!!</h3> After another 10 seconds, <tc-webtag:handle coderId="16056363" darkBG="true" />'s 500 was similarly fragged. <h3>Double Kill!  You have taken the lead!</h3> With another 10 seconds, <tc-webtag:handle coderId="10574855" darkBG="true" /> attempted a third challenge, but failed on <tc-webtag:handle coderId="10599449" darkBG="true" />'s 500. <h3><tc-webtag:handle coderId="10599449" darkBG="true" /> has ended <tc-webtag:handle coderId="10574855" darkBG="true" />'s killing spree.  You have lost the lead.</h3> Almost immediately, <tc-webtag:handle coderId="309982" darkBG="true" /> lost his 500 to <tc-webtag:handle coderId="10574855" darkBG="true" />'s challenging finger as well.
<h3>You have taken the lead!</h3> 
After another 2 minutes, <tc-webtag:handle coderId="16056363" darkBG="true" /> successfully challenged <tc-webtag:handle coderId="10599449" darkBG="true" />'s 1000-pointer and moves into 3rd place.  After another minute and a half, he repeated the action on <tc-webtag:handle coderId="144400" darkBG="true" />'s 1000 and the underdog replaced <tc-webtag:handle coderId="144400" darkBG="true" /> in 2nd place on the standings. <br/><br/>
Soon after that, we reached the half-way point of the challenge phase.  At the six-minute mark, and for most of the rest of the challenge phase, all eyes were looking at the two remaining 1000's and <tc-webtag:handle coderId="144400" darkBG="true" />'s 500 (possibly because the code was so impossibly long that they just hadn't finished reading it, possibly because it was the other solution that could fall the hardest).  <tc-webtag:handle coderId="10574855" darkBG="true" /> took a shot and failed against <tc-webtag:handle coderId="144400" darkBG="true" />'s 500. <br/><br/>
Right before the end, <tc-webtag:handle coderId="10599449" darkBG="true" /> made failed challenges against both of the remaining 1000-pointers, correctly predicting that the loss of 50 points wouldn't affect his final rank. <br/><br/>
After the challenge phase ended, TopCoder kept us waiting for a bit while they prepared the results for the component competitions.  The results came up one component at a time, starting with the dev competition, and after the results of the third component came up, the crowd applauded <tc-webtag:handle coderId="7548200" darkBG="true" /> 's brilliant win. <br/><br/>
The same operation followed for the Design finals, and <tc-webtag:handle coderId="293874" darkBG="true" /> looked like the favorite until the results of the very last component were shown.  <tc-webtag:handle coderId="119676" darkBG="true" /> won the tournament with an outstanding score on the last two components. <br/><br/>
Finally, we got to watch the results of the algorithm final system tests come in.  With anticipation, we sweat while the hourglasses formed over each remaining solution, waiting to see what would happen. <br/><br/>
Starting at the bottom of the list, <tc-webtag:handle coderId="270505" darkBG="true" />, <tc-webtag:handle coderId="309982" darkBG="true" />, <tc-webtag:handle coderId="11829284" darkBG="true" /> and <tc-webtag:handle coderId="8357090" darkBG="true" /> each passed system tests on their 250s.  The cheers got louder as <tc-webtag:handle coderId="10599449" darkBG="true" /> and <tc-webtag:handle coderId="144400" darkBG="true" /> both passed their remaining two problems.  The results of the entire tournament now rested on the results of the final two competitors.  The difference between victory and defeat for each of them as well as <tc-webtag:handle coderId="144400" darkBG="true" /> rested in the 1000-point problems which they allegedly solved. <br/><br/>
The results for <tc-webtag:handle coderId="16056363" darkBG="true" /> came up and he failed his 1000.  Keeping his 250, he fell to fourth behind <tc-webtag:handle coderId="10599449" darkBG="true" /> and <tc-webtag:handle coderId="144400" darkBG="true" />.  Time seemed to slow to a crawl as we waited to see the results of <tc-webtag:handle coderId="10574855" darkBG="true" />'s solutions, all three of which were still standing after the challenge phase. <h3>Vengeance!!!</h3> The crowd clapped and cheered as <tc-webtag:handle coderId="10574855" darkBG="true" /> passed all three problems.  What an amazing performance - the same kind of performance we saw in his best matches, but combined with the difficulty, pressure, and all-star competition of the World Finals.  <tc-webtag:handle coderId="144400" darkBG="true" /> kept his cool as he watched his name stay in the second slot, probably already thinking about next year. <br/><br/>
All the winners and some of the sponsors got situated for a short press conference, and answered a few short questions.  The question asked of <tc-webtag:handle coderId="10574855" darkBG="true" /> seemed a little strange - it was something along the lines of, "What was your strategy that helped you to win?"  He replied just like I would have, which was that his strategy was to solve the hardest problem correctly.  I can't think of a better way to win by such a large margin. <br/><br/>
<tc-webtag:handle coderId="10574855" darkBG="true" /> was also asked to say something to the community and to his friends and family at home, whether in English or in Russian.  He started by instructing all of us on how to pronounce his name (it sounded something like "Perter" to me).  Then he said a few things in Russian, which prompted smiles and chuckles from all those who understood.  <tc-webtag:handle coderId="144400" darkBG="true" /> and <tc-webtag:handle coderId="309982" darkBG="true" /> appeared to understand what he was saying as well, and it was clear that there were no negative feelings between the competitors at the end of the day, and that everyone enjoyed the event as a whole.  Congratulations to the winners, the finalists, and everyone else that participated and competed.
<br/><br/>
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="/foot.jsp" />

</body>

</html>
