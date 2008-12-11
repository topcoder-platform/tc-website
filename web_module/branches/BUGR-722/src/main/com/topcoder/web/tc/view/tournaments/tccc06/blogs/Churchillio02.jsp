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
<span class="bigTitle">Meet and Greet</span><br>
11.15.06 1:15 AM
<br><br>
<img src="/i/m/Churchillio_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="21181561" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
The meet and greet started at 7 PM, when everyone got to mingle amongst each other and share some pretty funny stories of previous competitions. There was also a 'how long did it take you to get here' contest, which <tc-webtag:handle coderId="251074" context="algorithm"/>  took the informal prize for, since it took him, and I quote “30 something hours” to get to San Diego from South Africa. 
<br /><br />
I also had a fairly lengthy conversation with <tc-webtag:handle coderId="8357090" context="algorithm"/>, <tc-webtag:handle coderId="251074" context="algorithm"/>, <tc-webtag:handle coderId="344462" context="algorithm"/>  and <tc-webtag:handle coderId="307060" context="algorithm"/> about previous competitions and some tricks they have seen used in the past… such as the famous <tc-webtag:handle coderId="144400" context="algorithm"/>  trick where he purposely posted a quick, incorrect solution to a 1000 point problem just to lure everyone else into thinking it was easy. The story goes, <tc-webtag:handle coderId="144400" context="algorithm"/> opened the hard problem first, and noticed that it had a very easy, but incorrect solution to which very tricky test cases would make it fail. Seeing this, he submitted the problem incorrectly for ~950 points, which made everyone else in the room think it was easy. They then -- mostly incorrectly -- wrote the easy solution due to his ruse. With just a few minutes left in the round, <tc-webtag:handle coderId="144400" context="algorithm"/> then submitted the correct solution, and proceeded to challenge everyone else's during the challenge phase… brilliant.
<br /><br />
The TopCoder people then got up on stage and gave some introductions as well as some instructions about the first rounds to come in the morning. I then ran into <tc-webtag:handle coderId="7295710" context="algorithm"/>  and <tc-webtag:handle coderId="263396" context="algorithm"/> , the two Canadians who were competing in the algorithm competition. <tc-webtag:handle coderId="7295710" context="algorithm"/>  and I discussed the current state of incentive to do programming competitions  in Canada, which even at schools like Waterloo are largely student driven, with not much faculty or departmental input. 
<br /><br />
It basically comes down to the fact that people on TopCoder really love to code and solve problems. Nobody goes into it just to win the prize money. Sure, winning thousands of dollars would be nice, but it is the love of algorithms and solving difficult problems that drives the competitors to do what they do in the first place. By walking around and talking with several of the competitors tonight, I could tell that, win or lose, their experience was going to be amazing. In the pamphlet given out on site, many people listed that simply being able to compete in the TCCC06 live semifinals was their best TopCoder moment. Some members were already coming up with funny comments they would paste into their code so the people watching them would be able to laugh while they watched. <tc-webtag:handle coderId="7295710" context="algorithm"/> in particular said he was going to go with hilarious variable names to ease the tension and create a few laughs. As cliché as it sounds at this point… for these guys, it really is about being the top coder, and having as much fun as possible doing it. 
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
