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
<span class="bigTitle">Behind the scenes with the component reviewers</span><br>
11.16.06 8:30 PM
<br><br>
<img src="/i/m/RRLevering_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="344462" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
One of the perks of being a blogger is that you have a reason to get behind the scenes.  So I was able to sit with the reviewers for a little bit today to get some inside scoop on the whole process from their side.  The reviewer room is in a separate room in the ballroom area of the hotel.  When I got there early I found <tc-webtag:handle coderId="286907" context="design"/> sitting alone in the room, working on some other TopCoder projects.  I knew he was dedicated, but that wowed me a bit.  I also discovered that his Master's degree has taken him four years, mainly because of TopCoder.  That sucks, but he sure has a lot to show for it -- with one of the highest earning totals of any TopCoder member (that's a vote for reviewing).
<br /><br />
I talked with him a bit about the differences between the TCCC and normal review.  As expected, he told me that the competitors tended to appeal many more decisions.  This unfortunately has the effect of dragging the appeals phase out really long.  This also means that the phase here onsite can't really be completed in the two-hour timeframe.  In the last round <tc-webtag:handle coderId="10348862" context="design"/> faced many appeals.  This often has to do with the verbosity of the review comments and how quickly they are able to respond to earlier appeals.  <tc-webtag:handle coderId="275071" context="design"/> explained that he submitted so many because he still hadn't heard back from an earlier appeal that had cascaded into several review points.  Some possible solutions to this issue would be 1) starting the appeals phase behind the scenes, so that it can wrap up on time, or 2) giving competitors a penalty for weak appeals.  I like the second idea, but I could see people being very against it.
<br /><br />
At this point, the rest of the reviewers began to filter in.  The second round was about to start and they came in early to get their laptops set up.  *ivern* explained that in theory, they were in a room together to be able to converse on general component issues that would affect them all or discuss minute points of interpretation.  However, in reality there wasn't much talk - the room was eerily silent as the reviewers began answering appeals.  Also, though I'm not sure this was purposeful or not, they couldn't see the overall scores from the room like spectators could in the main room.  This led to a feeling of practically not even being onsite.  Reviewers spent most of their time on the scorecard, reading appeals, writing responses and interpreting the precise wording of a review point.  The rest of the time was spent with text or Poseidon windows open, examining the issues in question.
<br /><br />
<div align="center"> <img src="/i/tournament/tccc06/blogs/review_board.jpg" alt="review_board.jpg"> </div> 
<br /><br />
I didn't last very long in the room, but I checked back later at the end of the round.  The design reviewers were still very much at work, frantically answering frantic appeals (ok, maybe not frantic appeals, but definitely urgent).  The development reviewers had already finished and had left, having less overall appeals and a more objective process to review.  Supposedly, I've heard that they have a much more strict deadline tomorrow to get the results back sooner, so it'll be interesting to see if they can come through.
<br /><br />
It would be kinda neat to see more direct reviewer involvement, instead of them sitting off in a side room -- something to drum up the conflict and create some tension for the audience.  But then I guess I wouldn't get to feel special, going "behind the scenes."
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
