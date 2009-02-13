<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="../../../script.jsp" />
<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="../links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="onsite_events"/>
<jsp:param name="tabLev3" value="blogs"/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<div style="float:right;">
<tc-webtag:forumLink forumID="506180" message="discuss this" />
</div>

<%-- anchor link from bloggers page --%>
<a name="001"></a>
<span class="bigTitle">Final Round - FIGHT!</span><br>
11.17.06 7:30 PM
<br><br>
<img src="/i/m/Churchillio_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="21181561" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>

When the coding phase starts at 1:30 pm the crowd, including myself is surrounding the 3 side-by-side monitors of <tc-webtag:handle coderId="10157606" context="algorithm"/>, <tc-webtag:handle coderId="10574855" context="algorithm"/> and <tc-webtag:handle coderId="251074" context="algorithm"/>. <tc-webtag:handle coderId="251074" context="algorithm"/> reads problem one then opens up the Start menu, going for the good ol’ calculator. He does a few quick calculations then begins coding. This is a pretty common strategy used by competitors to see whether or not certain easier brute forth implementations will be able to run in time. If it takes more than a certain number of calculations, around the tens of millions for most cases, you will have to find a different solution to the problem.
<br /><br />
Much discussion of the first problem is going on involving <tc-webtag:handle coderId="8357090" context="algorithm"/> and <tc-webtag:handle coderId="7295710" context="algorithm"/> as <tc-webtag:handle coderId="10574855" context="algorithm"/> sneaks in a very quick solution at 1:40, ten minutes into the first round. He continues to run some custom tests cases checking worst case scenarios before he moves on. Five minutes later <tc-webtag:handle coderId="19849563" context="algorithm"/> submits the first problem for 17 less than <tc-webtag:handle coderId="10574855" context="algorithm"/>. Then <tc-webtag:handle coderId="7459080" context="algorithm"/> submits problem 1 as well, for 4 less than <tc-webtag:handle coderId="19849563" context="algorithm"/>. By 1:50 only <tc-webtag:handle coderId="10574855" context="algorithm"/>and <tc-webtag:handle coderId="7459080" context="algorithm"/> have opened the second problem, with <tc-webtag:handle coderId="19849563" context="algorithm"/> still testing his 250 point solution. At the same time, <tc-webtag:handle coderId="8357090" context="algorithm"/> comes in close to the monitors and starts pointing out how problem 2 should be solved, giving us the play by play on how he agrees with <tc-webtag:handle coderId="10574855" context="algorithm"/>’s solution up to this point. Two minutes later <tc-webtag:handle coderId="10157606" context="algorithm"/> submits his first problem for 166 points, and immediately goes for the 1000 point problem.
<br /><br />
At 2:00, Sarah from TopCoder (aka <tc-webtag:handle coderId="153650" context="algorithm"/>) pulls me aside to get interviewed by the live AOL broadcast. I say, "sure, why not" and head over to the cameras. They ask me some questions about how I came to be a blogger and what the most fun parts of the trip were so far. I mention how I was so surprised at how easy going and relaxed the guys were, seeing as how they were at the world finals. I half expected them to be intensely cramming for hours beforehand, but instead they were literally playing pool or foosball up until the minute the round began. After my interview, at 2:04, I check the board and there are now a total of 7 problem 1 submissions.
<br /><br />
At 2:09 <tc-webtag:handle coderId="10574855" context="algorithm"/> is the first to submit problem 2. He passes the test cases and submits immediately, but some people are worried because he has not yet tested a worst case running time example. He does this about 2 minutes later and everyone is relieved -- now that’s confidence. For ten minutes after this there isn’t really much action until <tc-webtag:handle coderId="8355516" context="algorithm"/> submits problem two and moves into second place behind <tc-webtag:handle coderId="10574855" context="algorithm"/>. The next problem 2 solutions are presented by <tc-webtag:handle coderId="262056" context="algorithm"/> at 2:25, followed by <tc-webtag:handle coderId="251074" context="algorithm"/> at 2:31.
<br /><br />
<tc-webtag:handle coderId="10574855" context="algorithm"/> has compiled what he believes to be the solution to problem 3. He begins testing, passing 2 of the 5 given test cases but getting an array index error (I think) on the third. He looks over his code and fixes this with a quick check for string length, which may have been returning 0 when he didn’t have a case for it. He retests, but now case 5 yields an incorrect solution. He makes an if statement change to his solution, which passes case 5 and submits. I have an uneasy feeling about this... 9 minutes later, with only 3 minutes left in the competition, he stops all his testing, pushes the chair back, and stands up. Cameras are on him from here on.
<br /><br />
In a dramatic finish, <tc-webtag:handle coderId="10157606" context="algorithm"/> manages to pass all 5 test cases for problem 3 with 40 seconds left. He then goes back to his code and starts removing his debug statements for some reason. Everyone around his monitor is screaming at him “SUBMIT!!”, but he keeps going, systematically removing every single cout statement. With 25 seconds left he goes over all five tests again -- he is insane. With everyone stressing out he finally submits with 17 seconds left in the round, he is not in 2nd place by 31 points over 3rd.
<br /><br />
After the coding phase here is how the scoreboard looks:
<br /><br />
<div align="center"> <img src="/i/tournament/tccc06/blogs/finals_one.jpg" alt="finals_one.jpg"> </div>
<br /><br />
The five minute break before the challenge phase has everyone clamoring to try and get a spot at the front of the room. I grab a bean bag chair and walk up in front of <tc-webtag:handle coderId="8357090" context="algorithm"/> sitting at a table talking to one of the TopCoder guys about the round. The challenge phase begins, and everyone can see the only real important thing on the board: if <tc-webtag:handle coderId="8355516" context="algorithm"/> gets a successful challenge, he will be in second place by just a hair. Only 30 seconds pass before <tc-webtag:handle coderId="8355516" context="algorithm"/> gives this a shot, but he fails. He slips out of challenge range of first place, and there are no other challenges until 1 minute left when <tc-webtag:handle coderId="251074" context="algorithm"/> tries two quick challenges of <tc-webtag:handle coderId="10574855" context="algorithm"/> and <tc-webtag:handle coderId="7459080" context="algorithm"/>’s 500 point problem, but fails both.
<br /><br />
The scoreboard after the challenge round looks like this:
<br /><br />
<div align="center"> <img src="/i/tournament/tccc06/blogs/finals_two.jpg" alt="finals_two.jpg"> </div>
<br /><br />
You can see by the board above that the big buzz now is that, if <tc-webtag:handle coderId="10157606" context="algorithm"/> has a correct problem 3, but <tc-webtag:handle coderId="10574855" context="algorithm"/>’s fails, he will win the competition by just 1.5 points. System tests take the normal amount of time, about 10 minutes, and the judges walk out to announce the winners. They first do the component winners, who you can see by reading <tc-webtag:handle coderId="344462" context="development"/>’s component finals blog, then they do the system test rundown. Not much changes in the first few tests, then they get up near the top. A few people end up failing problem 2, but it does not change the top 2 standings. With <tc-webtag:handle coderId="19849563" context="algorithm"/> currently in third place, <tc-webtag:handle coderId="10157606" context="algorithm"/> fails his problem 3 but stays just ahead in 2nd place. <tc-webtag:handle coderId="10574855" context="algorithm"/>’s scores update, he has failed problem 3, but still has enough points to hang on to the lead and become the 2006 TopCoder Collegiate Challenge Champion! 
<br /><br />
Congratulations to all of the competitors who made it this far -- you guys did an awesome job to make it to San Diego in the first place. There were some big upsets and some big surprises, but in the end <tc-webtag:handle coderId="10574855" context="algorithm"/> came out on top when it counted most. He’s going home with a huge $25,000 check for first place, and the pride of being the champion.
<br /><br />

       </div>
      </td>
        
         
<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="../right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../../foot.jsp" />
</body>

</html>
