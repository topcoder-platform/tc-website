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
<span class="bigTitle">Wildcard Wars, episode 4: A New Hope, or The Empire Strikes Back?</span><br>
11.17.06 2:00 PM
<br><br>
<img src="/i/m/Churchillio_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="21181561" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>

The wildcard round has had some contestants eagerly waiting for their second chance since 11 AM Wednesday morning. For each of the competitors who placed 3rd through 6th of the first three rounds, this was their chance to claim one of the top 2 spots in this 12 man wildcard round for a spot in the 8 person finals. There are some very strong seeds in this round with the top rated being <tc-webtag:handle coderId="8357090" context="algorithm"/>, <tc-webtag:handle coderId="260835" context="algorithm"/> and <tc-webtag:handle coderId="8355516" context="algorithm"/>. Nobody has a clue what the problems are going to be like, since in the wildcard round anything can happen.
<br /><br />
As people head into the arena just minutes before the configuration phase is about to begin at 3:30 PM, the Norton Ghost utility has just finished copying the Windows XP: TopCoder Edition onto all of the machines. This image includes Windows XP, the TopCoder Arena, various text editors, and the Java API. At this point in the competition, only one competitor was left who used Java.
<br /><br />
The configuration round started, and many of the competitors seemed much more relaxed the second time around. <tc-webtag:handle coderId="8355516" context="algorithm"/> once again put up his trademark "//hey what are you lookin at?" comment, while all of the contestants copied out their templates from memory. I don’t think anyone changed their templates from their previous versions, so they all finished fairly quickly. A few even had a chance to stretch their legs before getting down to the coding phase.
<br /><br />
At 4:00 when the coding phase began, everyone initially seemed more relaxed than the first time they had competed. Eleven of the contestants opened up the 250 point question first, while only <TC-WEBTAG:HANDLE CODERID="15805598" CONTEXT="ALGORITHM"/> opened up the 1000 point question first. <tc-webtag:handle coderId="260835" context="algorithm"/> stunned the crowd with the fastest submission of the tournament so far. Within minutes he had submitted the 250 point question for 248.51 points. Most people were commenting on how they didn’t even get a chance to read the entire problem statement before he had submitted his answer. Within the next 15 minutes there were 3 more submissions of problem 1, and 5 minutes after that there were 3 more.
<br /><br />
The action was then fairly slow as no submissions were made until 4:28 when <tc-webtag:handle coderId="8357090" context="algorithm"/> submitted his second problem, the 1000 point question for 799 points. Seven minutes later <tc-webtag:handle coderId="260835" context="algorithm"/> submitted his problem 2 for 285 points, now taking 2nd place. <tc-webtag:handle coderId="20635649" context="algorithm"/> then took over second place with a submission of problem 2 for 320. People in the chat room were buzzing over <tc-webtag:handle coderId="8357090" context="algorithm"/>’s solution to problem 3, wondering if he had submitted just to throw other competitors off, and just as they were saying this he suddenly began recompiling, and at 4:42 he made a re-submission.
<br /><br />
<tc-webtag:handle coderId="7459080" context="algorithm"/> and vedensky then turned some heads as their same-minute submission of problem 2 left <tc-webtag:handle coderId="7459080" context="algorithm"/> with a 0.34 point lead, and 3rd place. Ten submission-less minutes pass until kia submits his third problem for a whopping 814 points and pulls into the current lead. There is buzz of solutions and possibly wrong answers in the chat room the entire time, as some of the live spectators comment on the atmosphere of the room, such as the newly installed cameras, or the strange techno music which was now playing in the room.
<br /><br />
With 5 minutes left in the round, <tc-webtag:handle coderId="8357090" context="algorithm"/> finally submits problem 2 and retakes the lead. There are no more submissions until the end of the round, when with <tc-webtag:handle coderId="8357090" context="algorithm"/> re-submits problem 3 for a huge point loss with only 7 seconds remaining. With the coding phase done, here is what the standings looked like:
<br /><br />
<div align="center"><img src="/i/tournament/tccc06/blogs/wildcardone.jpg" alt="wildcardone.jpg" /></div>
<br /><br />
The challenge phase was crazy. I tried writing down the times and challenges like I did for previous rounds, but there were far too many challenges early on for my pen to handle. You can check out the results of the challenges on the TopCoder arena or on the match summary page. After the challenges it was apparent that this entire round was going to be won or lost by the challenges, as points had shifted so dramatically. The score board changed to this:
<br /><br />
<div align="center"><img src="/i/tournament/tccc06/blogs/wildcardtwo.jpg" alt="wildcardtwo.jpg" /></div>
<br /><br />
Then we all learned a new algorithm:
<br /><br />
<tt>while(true) { wait for system tests; }</tt>
<br /><br />
The system test wait reached approximately 20 minutes when a TopCoder sys admin came out. We all expected to hear the results, instead we actually told that we would not hear the results ‘for some significant period of time’. What was going on? Nobody knew for sure, but then the 12 wildcards were pulled aside for a moment and explained the situation. Apparently what had happened was that the problem statement for the 500 point question, which the competitors could see live, said the maximum size for the power of 2 would range from 1-16. Talking to <tc-webtag:handle coderId="20635649" context="algorithm"/>, he said that he tried to test this question for n=16, but for some reason the test cases would only accept input of up to n=8. He called over a TopCoder judge and showed him the problem, who then ran out of the room to inform the rest of the judges. Seeing this error <tc-webtag:handle coderId="20635649" context="algorithm"/> then went on to work with problem 3 as he thought problem 2 was probably broken. By the time he was able to rethink to test problem 2 the contest was over.
<br /><br />
Talking to one of the TopCoder admins later on, I found out that the rumors circulating that even the judges' solution to the 500 point question was not correct, were true. In the worst case, the solution which the judges were using on system tests would take between 3 and 4 seconds to run, not the 2 seconds required by the rules. He claimed that with some further optimization that the 2 seconds would be reachable, but it was not ready at the time of system tests. What does this all mean for competitors? Were they screwed, or was it just unfortunate? Were they asking a problem that could not be solved? The way I look at it, some coders were very unlucky to have chosen problem 2 instead of problem 3 to work on. Although problem 3 was in theory a harder problem, no solution existed at that time for problem 2 which ran in 2 seconds. I think the real question is: Besides the obvious fact that there was an error, did it unfairly bias anyone? I think the answer to this is no. Yes people who chose problem 2 got hit hard, but unfortunately everyone was still equal in the eyes of this mistake. A workaround to the n=8 input size limit for testing could have been to hard code n=16 no matter what the input was, then test to see if your program ran in time. But if a competitor made a solution run in 2.5 seconds, how could they penalize them if their own solution couldn’t meet this benchmark? Many people thought a re-wildcard round would have been the only fair choice, but there simply was not time to do it. It’s a live competition after all, and the schedule is just too tight.
<br /><br />
We were told that the results would be announced at laser tag later that night. And they were. Nobody had passed problem 2. <tc-webtag:handle coderId="8357090" context="algorithm"/> slipped out of the top spot, and <tc-webtag:handle coderId="7459080" context="algorithm"/> an <tc-webtag:handle coderId="8355516" context="algorithm"/> were going on to the finals. It really sucks when problems like this happen, however the judges thought it over, and their word is final. Congrats go to <tc-webtag:handle coderId="7459080" context="algorithm"/> and <tc-webtag:handle coderId="8355516" context="algorithm"/> who made it through.
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
