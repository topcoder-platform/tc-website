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
<span class="bigTitle">The WildCard <em>seemed</em> easy... at first</span><br>
05.05.06 2:00 AM
<br><br>
<img src="/i/m/Kawigi_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="8416646" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
The WildCard problem set seemed much more accessible than the previous ones on first glance, but not everything is as easy as it seems.  One thing that was entertaining is that there was a couple of sponsor representatives who were hanging around the monitors, and we were discussing the 500 while looking at some of the example cases on <tc-webtag:handle coderId="7462740" darkBG="true" />'s monitor while he was working things out on paper.  The part that was entertaining about that was the fact that they would make observations on the answers to the example cases and make these broad (read: wrong) generalizations on the pattern to solve the problem.  I think by discussing it we had made some valid observations as well, but nothing like an implementation that I was satisfied would work.  <br/><br/>
Toward the finish of the coding phase, the standings showed <tc-webtag:handle coderId="11829284" darkBG="true" /> and <tc-webtag:handle coderId="260835" darkBG="true" /> in the lead, both submitting all three problems.  <tc-webtag:handle coderId="272072" darkBG="true" /> was out a few hundred points with the easy and hard problems, probably praying that either of the other two would drop their 1000's so he could make it to the final.  Toward the end of the coding phase, <tc-webtag:handle coderId="260835" darkBG="true" /> resubmitted his 500 for just enough points so that his total score going into the challenge phase was 1000.00.  Some people say he planned it ;-)  After the top three, there were five people with the first two problems and the other five had just the level 1 problem submitted. <br/><br/>
Although the challenge phase could have been intense (because it's the last chance for all of the competitors to make it to the finals), but it was a little less action-packed than some of the previous rounds because the scores were so much more spread out.  Still, only the system tests will show how close or far apart everyone really was. <br/><br/>
Possibly remembering semifinal 3, the challenge phase starts out with some hits, as <tc-webtag:handle coderId="7433858" darkBG="true" /> challenged <tc-webtag:handle coderId="11829284" darkBG="true" /> and <tc-webtag:handle coderId="10157606" darkBG="true" /> challenged <tc-webtag:handle coderId="7433858" darkBG="true" />.  Both challenges failed (when will people learn to stop challenging <tc-webtag:handle coderId="7433858" darkBG="true" />'s 500s?) and things got quiet for awhile. <br/><br/>
During the quieter part of the challenge phase, it seemed like the most people were looking at <tc-webtag:handle coderId="11829284" darkBG="true" />'s hard, since the prospect of that submission failing had the most severe potential effect on the standings. <br/><br/>
With about 4 minutes left, we saw the first successful challenge, as <tc-webtag:handle coderId="7462740" darkBG="true" /> took down the 500 that <tc-webtag:handle coderId="260835" darkBG="true" /> resubmitted toward the end (note to self: if I'm ever in a room with <tc-webtag:handle coderId="260835" darkBG="true" /> where he resubmits at the last second, he's not resubmitting because he has it right now). <br/><br/>
After a few more uneventful minutes, <tc-webtag:handle coderId="10157606" darkBG="true" /> failed a challenge on <tc-webtag:handle coderId="10599449" darkBG="true" />'s 500 with about a minute left.  Then we were surprised to see <tc-webtag:handle coderId="7462740" darkBG="true" /> strike again on <tc-webtag:handle coderId="7446789" darkBG="true" />'s 500 with 30 seconds left.  Somehow <tc-webtag:handle coderId="7462740" darkBG="true" /> managed to break his streak as both he and <tc-webtag:handle coderId="293874" darkBG="true" /> failed challenges in the last seconds of the challenge phase. <br/><br/>
As the last couple seconds counted down, we helped Kawigi to write his blog entry by typing some strange text on his laptop. <br/><br/>
Hey, who did that!  You forgot the handle tags! <br/><br/>
After a few minutes, the system test results started coming in.  In dramatic bottom-up fashion, we watched the results roll in. <br/><br/>
<tc-webtag:handle coderId="10157606" darkBG="true" />, <tc-webtag:handle coderId="311170" darkBG="true" />, <tc-webtag:handle coderId="293874" darkBG="true" />, <tc-webtag:handle coderId="7446789" darkBG="true" />, and <tc-webtag:handle coderId="261024" darkBG="true" /> hold on to their 250s in order. <br/><br/>
<tc-webtag:handle coderId="113178" darkBG="true" /> keeps both problems alive with clapping from the audience, which changed to "ooohs" as <tc-webtag:handle coderId="7433858" darkBG="true" /> drops both problems like a bottle of water next to <tc-webtag:handle coderId="275071" darkBG="true" /> (ok, to be fair, the water didn't reach my laptop). <br/><br/>
<tc-webtag:handle coderId="7462740" darkBG="true" /> lost his 500 and fell down the standings. <br/><br/>
<tc-webtag:handle coderId="10599449" darkBG="true" /> keeps both his submissions, and it's clear that just a few things need to happen to the top three contestants for him to slip in. <br/><br/>
Then it actually happens; <tc-webtag:handle coderId="272072" darkBG="true" /> and <tc-webtag:handle coderId="260835" darkBG="true" /> both lose their 1000's and drop down the list.  <tc-webtag:handle coderId="10599449" darkBG="true" /> is officially in.  The question is whether the room leader, <tc-webtag:handle coderId="11829284" darkBG="true" /> could actually have successfully solved all three problems.  He didn't - but he only lost his 500, which left him with more than enough points to stay on top.
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
