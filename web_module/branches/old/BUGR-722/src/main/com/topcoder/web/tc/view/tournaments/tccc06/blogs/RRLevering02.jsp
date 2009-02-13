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
<span class="bigTitle">Component Competitions Round 1</span><br>
11.15.06 6:30 PM
<br><br>
<img src="/i/m/RRLevering_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="344462" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
After this morning's intense first semifinals match, with <tc-webtag:handle coderId="144400" context="algorithm"/> getting knocked out and <tc-webtag:handle coderId="10157606" context="algorithm"/> challenging his way to the top, I was looking forward to an interesting component competition.  Perhaps not as intense, but interesting in a more subtle way.  In particular, I wanted to see from a higher level how reviewers scored and answered appeals.  In addition, I wanted to see the process by which competitors went about researching the appeals.
<br /><br />
Normally, the process isn't quite as transparent.  I talked to <tc-webtag:handle coderId="14940443" context="design"/> a bit about this, as he sat watching on the sidelines.  He didn't have time to submit the first component, so was sitting on bean bags watching the action on the big screen.  I was personally of the belief that being able to see how close you were to your opponents would spur you on to more appeals.  He didn't seem to think it would affect his process.  However, there are definitely more appeals in this contest than in a typical component.  <tc-webtag:handle coderId="305384" context="algorithm"/> mentioned that it was mostly due to the high stakes and the fact that they have nothing else to do, sitting in front of the computer for two hours.
<br /><br />
Strangely, the most important part of the component competitions happens very quietly in the first minute: the scores are posted, pre-appeal.  This essentially lays the landscape for the entire two hours.  While appeals can result in some score changes, score changes of more than a couple points, especially with a good set of reviewers, are infrequent.
<br /><br />
On the design side, the component in question was the previously mentioned AJAX component, the AutoComplete text box.  China's <tc-webtag:handle coderId="10425804" context="design"/> started out with an incremental lead, but was quickly ousted from the spot by a quick appeal by the second place Russian, <tc-webtag:handle coderId="293874" context="design"/>.  While <tc-webtag:handle coderId="10425804" context="design"/> came back with his own successful appeal, <tc-webtag:handle coderId="293874" context="design"/> widened the lead, making it tougher for a comeback in the end.  The only other spots in contention were 4 and 5, with <tc-webtag:handle coderId="10028010" context="design"/> and <tc-webtag:handle coderId="275640" context="design"/> leapfrogging several times during appeals.  Unfortunately, with so many appeals on the design side, it was impossible to conclude final placement at the time of this writing.  Ironically, just when it was starting to get exciting, the TV was turned off to get ready for the algorithm competition.  Those of us who actually care more about the component side will just have to wait for the stunning conclusion to this first round.
<br /><br />
Development was a surprise, in that the scores were ranging across the board.  With the high level of the competitors in this Rename Package component, I was expecting a real tight finish.  However, <tc-webtag:handle coderId="299979" context="development"/> had been particulary harsh in his review scores, which definitely dropped the average down and opened things up a bit.  In addition, <tc-webtag:handle coderId="20076717" context="development"/> had favored <tc-webtag:handle coderId="9998760" context="development"/>'s submission relatively speaking, which made him hard to catch at the top.  While there were several successful appeals, there wasn't much movement throughout the phase.
<br /><br />
Here are <tc-webtag:handle coderId="14788013" context="development"/> and <tc-webtag:handle coderId="9998760" context="development"/>, hard at work:
<br /><br />
<div align="center"><img src="/i/tournament/tccc06/blogs/RRLevering_2_1.jpg" name="blogs"> </div> 
<br /><br />
The real magic -- which we have to wait to see -- is in the unknown phase of the contest, where competitors wager on their relative performance.  With <tc-webtag:handle coderId="293874" context="design"/> the favorite in design, taking the lead on the first component would put him where he wants to be.  It's only if the leader falls behind on one component that an opponent weighted very highly that he stands a chance of losing.  Second place, according to several of the designers, should be a much more interesting contest.  In development, I still think things can go in a lot of directions, with such closely ranked competitors near the top.  I'm not making a personal prediction until at least tomorrow's scores are final.
<br /><br />
Now, I'm looking forward to tonight's relaxation.  There's much talk about the poker tournament and a much more relaxed energy in the air, despite the background techno beat in the room.
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
