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
<span class="bigTitle">Down to the wire</span><br>
05.05.06 7:00 PM
<br><br>
<img src="/i/m/davidyang_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="21471147" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
One could definitely sense the excitement and tension building in the crowd as the final countdown began to the TopCoder 2006 Open Algorithm Finals.  Ten minutes before the end of the coding phase, a rising murmur started spreading among the spectators about the fast finishes of <tc-webtag:handle coderId="10574855" darkBG="true" />, <tc-webtag:handle coderId="144400" darkBG="true" /> on the hard problem.   The rumor going around at the time was that the problem was very similar to a regional ACM problem from a previous year.  
<br><br>
When the Challenge phase started, <tc-webtag:handle coderId="10574855" darkBG="true" /> wowed the crowds with almost three immediate successful challenges of the medium problem.  Even two unsuccessful challenges later, <tc-webtag:handle coderId="10574855" darkBG="true" /> had established a commanding lead over <tc-webtag:handle coderId="16056363" darkBG="true" /> and had enough room to even fail his hard problem and still come out 2.25 points ahead of <tc-webtag:handle coderId="144400" darkBG="true" />.  With 5 minutes left, <tc-webtag:handle coderId="16056363" darkBG="true" /> quickly downed <tc-webtag:handle coderId="144400" darkBG="true" /> and <tc-webtag:handle coderId="10599449" darkBG="true" />’s 1000 point problem – unfortunately, the good money was on <tc-webtag:handle coderId="16056363" darkBG="true" />’s hard problem also failing system test due to a very specific edge case detected by observing TopCoders.  I asked <tc-webtag:handle coderId="16056363" darkBG="true" /> after the contest about his thought process on the hard problem, he told me that after the coding phase was complete, he wasn’t sure that his 1000 point was correct and submitted it hoping for some luck.  As soon as he saw <tc-webtag:handle coderId="10574855" darkBG="true" />’s 1000 point problem he knew his own had an error and soon used that knowledge to win two successful challenges. 
<br><br>
As the dust settled, <tc-webtag:handle coderId="10574855" darkBG="true" /> was pretty much the sure bet for winner and <tc-webtag:handle coderId="144400" darkBG="true" /> was heavy favorite for finishing second with his ultra-fast easy/medium problems.  A big surprise during system test was <tc-webtag:handle coderId="16056363" darkBG="true" />’s medium solution not passing, moving him down in the finish order.  <tc-webtag:handle coderId="10574855" darkBG="true" />’s three solutions all ran successfully marking his as the first contestant to solve all three problems in a round (and earning him a loud round of applause).  <tc-webtag:handle coderId="16056363" darkBG="true" />’s move allowed <tc-webtag:handle coderId="144400" darkBG="true" /> to take second place.
<br><br>
At the Press conference, <tc-webtag:handle coderId="10574855" darkBG="true" /> received his $20,000 check with a smile and wave to the camera (perhaps he’ll have to use some of his prize money to buy an additional plane seat to carry it home).  Asked about what critical decision he made in order to win, his answered with a smile, “the critical decision was to code the right solution to the hard problem.”  He also had this message to send to TopCoders and his friends back in Russia: “I would like to say that my name/handle is pronounced Piotr and I would like to thank everyone in Russia who believed in me, especially my girlfriend.” [this is a rough translation, apologies to <tc-webtag:handle coderId="10574855" darkBG="true" /> for any inaccuracies]
<br><br>
The sponsors also expressed a lot of excitement about the competition and all agreed that the talent and skill level of the contestants was inspiring.  nsajim also voiced a sentiment of mine when he said that his favorite aspect of the TopCoder Open is the collegiality and collaboration of the contestants.  He said, “What I find amazing is that all these folks come from all over the world who might only know each other through online competition; they now come here for the first time to meet each other and it’s just great to see how well they all get along.  Even with the significant cash prizes on the line, contestants are sharing ideas and explaining solutions to each other.”  
<br><br>
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
