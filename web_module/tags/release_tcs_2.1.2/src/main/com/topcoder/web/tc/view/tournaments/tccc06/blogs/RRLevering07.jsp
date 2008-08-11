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
<span class="bigTitle">Component Finals, Round 3</span><br>
11.17.06 5:00 PM
<br><br>
<img src="/i/m/RRLevering_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="344462" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
The final TopCoder component round turned out to be interesting in some respects, but only served to stabilize the results from the first two competitions.  The relative placements that were originally posted were not terribly different than the first two rounds.  However, the scores, especially in development, were lower than ever we had seen in the past two rounds.  The one thing that initially resolved some doubt on the development side was <tc-webtag:handle coderId="9998760" context="development"/>'s clear domination on the development component.  With <tc-webtag:handle coderId="14788013" context="development"/>'s win yesterday, the first place prize was in contention between these two competitors.  And while still technically undecided, it would take a high wager of both <tc-webtag:handle coderId="14788013" context="development"/> and <tc-webtag:handle coderId="9998760" context="development"/> on the second component to have any last minute surprises.
<br /><br />
The development component in question was an extension to Firefox that enabled interaction with the Orpheus game server.  The component was difficult because 1) most of the competitors had not worked with the technologies involved, 2) the component was very large and complex on its own, and 3) according to several developers there were some difficulties with designer responses on the forums where they collaborate to resolve ambiguities.  One developer (<tc-webtag:handle coderId="20256177" context="development"/>) had not even submitted the component at all and another (<tc-webtag:handle coderId="10526732" context="development"/>) had submitted a very non-working component.  In fact, only one of the developers would even pass review (a score of 75 is needed in the normal case to even be considered) for the component, which is an unexpected result for this caliber of competitors.  Things may have been much more interesting if <tc-webtag:handle coderId="9998760" context="development"/> had dropped the ball on this component, but that was not to be the case.  The appeals process did not result in much change.  <tc-webtag:handle coderId="302810" context="development"/> made a run at <tc-webtag:handle coderId="14788013" context="development"/> for a while, which with a 2nd place finish here would have practically assured him of third place in the final results.  Now with only a third place win, it depends a lot on the wagering whether he can secure the 3rd place spot, next to <tc-webtag:handle coderId="9998760" context="development"/> and <tc-webtag:handle coderId="14788013" context="development"/>.
<br /><br />
On the design side, the results were also not very atypical.  The design was actually a very important one - the next incarnation of the very used TopCoder configuration manager.  <tc-webtag:handle coderId="293874" context="design"/> started off in first place, despite a mediocre review from <tc-webtag:handle coderId="278342" context="development"/>.  Speaking with <tc-webtag:handle coderId="278342" context="development"/> afterward, he said that he felt like <tc-webtag:handle coderId="293874" context="design"/> had strayed on several important points on the requirements specification that dealt with the underlying data structures of the design.  <tc-webtag:handle coderId="293874" context="design"/>, on the other hand, felt like <tc-webtag:handle coderId="278342" context="development"/> was too inflexible with designs that were not in his style.  This disagreement didn’t serve to make enough of a difference to keep <tc-webtag:handle coderId="293874" context="design"/> from the win.  Much like on the development side, <tc-webtag:handle coderId="275640" context="design"/> in third made a run at <tc-webtag:handle coderId="10425804" context="algorithm"/> with a series of successful appeals, but it was not to be.  Overall, <tc-webtag:handle coderId="10348862" context="design"/> early on appeared to be giving up a lot of appeals and I saw several designers consider returning to more appeals when they saw this.  On the other hand, <tc-webtag:handle coderId="286907" context="design"/> was as immovable a reviewer as ever, with a very high percentage of rejected appeals.
<br /><br />
<div align="center"><img src="/i/tournament/tccc06/blogs/cddc_sql_lall.jpg" alt="wildcardone.jpg" /></div>
<br /><br />
The reviewers and competitors seemed to have a little more fun with their appeals, especially in cases where they had no chance.  <tc-webtag:handle coderId="10526732" context="development"/>, who had essentially submitted no code, argued that on the one review score for "inclusion of useless code" he should receive a very high score, since he most definitely had no useless code.  He didn't succeed in getting points, but he did get succeed in getting a chuckle from the reviewer room.
<br /><br />
So unfortunately for spectators, going into the wagering phase of the component competition we're assured that <tc-webtag:handle coderId="293874" context="design"/> is going to win the design contest and that <tc-webtag:handle coderId="10425804" context="algorithm"/> will place second.  The rest of the places are more up in the air and I'll be interested in seeing who gets third.  In development, it's more unsure, but <tc-webtag:handle coderId="9998760" context="development"/> is looking good for first place and <tc-webtag:handle coderId="14788013" context="development"/> for second.  Third place could go several ways but I'm betting on <tc-webtag:handle coderId="302810" context="design"/> with two third place finishes already.  The one thing that I'm also betting on is that finally there will be more tension and interest in the component competition as they build up the wagering phase to its stunning (ok, maybe not so stunning) conclusion.
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
