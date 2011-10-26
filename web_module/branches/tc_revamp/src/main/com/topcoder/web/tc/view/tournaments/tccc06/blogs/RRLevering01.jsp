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
<span class="bigTitle">Jetlag and swag</span><br>
11.15.06 8:00 AM
<br><br>
<img src="/i/m/RRLevering_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="344462" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
My first few hours onsite at a TopCoder competition are summed up by two words: jetlag and swag.  And I have absolutely no reason to complain about my 8 hours of travel... <tc-webtag:handle coderId="251074" context="algorithm"/> holds the currently known record, at 32 hours of travel time.  Being an incredibly dispersed international field of competitors, almost everyone has a story or two about their travel, from nights spent in airports to crazy weather delays.  But as far as I know, most of the major players seem to be here and in fairly good spirits.  This is most definitely due in part to the lavish accommodations and gifts that competitors were greeted with today.
<br /><br />
It started with the hotel, which while not being the best temporary lodging I've stayed in, is definitely an above average American establishment.  From the beautifully night-lit pool area to the excellent beds (note that for some reason, I need two of them for myself), they definitely make for a good respite for a road-weary coder.  Add to that the excellent bag of swag from AOL (memory stick, laptop bag, Sodoku book...) that was hand-delivered to my hotel room door and I was already psyched for things to start.  I was evidently not alone in my sentiments -- while wandering the halls of the hotel, trying to figure out where things were happening, I encountered many other anxious spirits longing for direction.
<br /><br />
<div align="center">
<img src="/i/tournament/tccc06/blogs/RRLevering_1_1.jpg" alt="blogs" />
</div>
<br /><br />
This direction eventually led us to the welcome reception, where we were greeted with a particularly flashy looking setup.  Most people may already be familiar with the general scene of the competition room from past event photos, but the room is centered around a raised platform with a total of 16 desks, split into two groups of 8.  I could go into details here, but I'd really advise you just to look at the pictures.  More than once, I overheard very positive comparisons with other, less funded competitive programming events.  This center area is surrounded by sponsor booths and for this evening, food and drink.  Again, the food and drink buffet was not the best I've ever seen, but it was definitely better than expected (and they were serving Maker's Mark whiskey at the bar, which is a good sign for me personally).
<br /><br />
The competitors seemed in good spirits during the reception and honestly were more social than I expected.  I believe this had a lot to do with the fact that a lot of them had met at previous events, so felt safe in certain cliques.  And cliques there were: There was the Chinese contingent, the Russian group, and so on, mainly divided by nationality, sticking to safety in numbers and common language.  However, in my opinion, those people who were bold enough to attempt to break into these conversations were greeted with friendliness. I had the advantage of not having much of an American representation (come on guys, get it together and represent! :-) ) so I mostly found myself with floaters -- people who had previous experience or didn't come with a large group.
<br /><br />
The best part of the evening for me was being able to drill some of the designers ( <tc-webtag:handle coderId="275071" context="design"/>, <tc-webtag:handle coderId="275640" context="design"/>, and <tc-webtag:handle coderId="14940443" context="design"/>) on their impressions of the design contest.  The contest had been kept private (even from me, at least up until now) so I wanted the low-down on what to expect.  I discovered that it should be a really interesting competition, because none of them were very happy with the components that they had been given them to develop.  One incredibly important difference in the final round of component development is that a designer/developer doesn't get to choose from a list of projects.  They essentially have a single option.  So regardless of how little experience they have in the area, they are stuck, with their only option setting the weight low in the onsite phase (which is still a big penalty).  For instance, one component on the Java side of design was actually a JavaScript/AJAX component, which some of the designers had no experience with.  So in addition to documenting/diagramming, they had to spend a lot of extra time just learning good JS practice and the like.
<br /><br />
I was actually amazed at the lengths to which they talked about the problems they had with the projects, considering that that knowledge could have a direct result on the weight their competitors give their components.  But, if anything, that's shaping up to be the overall theme of the competition.  Yes, there's prize money and pride at stake.  But what most coders want even more is just the chance to unwind with people who understand their woes -- the late night hours, the penalty the contests afflict on their schoolwork, the wasted time on a component not submitted.  Especially for people still in school, who maybe are not quite in a position of security with a job and family, these little tidbits of humanity give credence to the sacrifices they've tendered in the name of TopCoder.
<br /><br />
But for now, let's get back to those sacrifices and let the games begin!
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
