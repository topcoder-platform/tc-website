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
<span class="bigTitle">Final thoughts</span><br>
11.17.06 8:30 PM
<br><br>
<img src="/i/m/RRLevering_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="344462" darkBG="true" /><br />
<span class="smallText"><em>TopCoder Member</em></span>
<br clear="all" />
<br>
Things around here have quieted down a lot in the last few minutes. It's amazing how quickly things can go from an intense peak to a "pack it up and leave" mentality. I've heard that while it takes three days to set this place up, it takes less than one to bring it down. Kind of like an algorithm competition... all that work, and one test case can bring a submission right down. We do still have the awards reception in a couple hours, but barring something crazy there, this will probably be my last blog entry. Somehow, in this entry, I have to not only sum up the entire component competition, but also wrap up my thoughts on what is needed to make this competition more interesting as well give a parting word on the tournament experience overall.
<br /><br />
To give a summary of the final results is not that hard, as there were no major surprises. If you don't understand the wagering system, basically each competitor had the chance to essentially bet on how well they performed, relatively speaking, on each component. Therefore, it's possible for someone with one first place finish out of three to win the competition, given he has a strong enough wager. In hindsight, things were always pretty close and one extra appeal with a poor wager could have changed a lot of results. <tc-webtag:handle coderId="14788013" context="development"/> had the right idea with his wager on the second component where he risked the most (60%), but <tc-webtag:handle coderId="9998760" context="development"/> hadn't risked enough there himself (25%) to give up the top spot with his 2nd place finish there.  In both competitions, no one had made a really bad wager and everyone being omniscient really wouldn't have changed the final placements much. It raises the argument that maybe the wagering system isn't quite the interest-builder it was meant to be.
<br /><br />
On that note, there are many things that can still be done to make this competition more interesting in the future. I find it so ironic that TopCoder's financial success rests on the component side of the company and yet I think I'm the only one here -- besides staff and the actual competitors -- that cared about the outcome of the component event. I was dying to get excited about it and it was an uphill battle. One of TopCoder's main goals here should be to sensationalize the component competition in order to drive programmers from the algorithm side into component development. And, regardless of the underlying motives, I think everyone would like to see a more interesting event.  So how do they do that? They've tried other things in the past (component enhancements, final fixes, etc.) and it just didn't seem to work. I'm not sure if I totally agree with abandoning that approach, but let's say that we want to keep the same format as the current competition. There's still so much that can be improved:
<br /><br />
1) Build up to the release of the scores for each component. THAT is where the actual end result is mostly determined.  Yet there isn't even really an announcement of what is going on, the scores just randomly appear on the screen and the competitors scurry off to their computers.
<br /><br />
2) There needs to be more audience involvement/knowledge with the event. Finding some way to summarize the scorecards and what is actually at stake during an appeal is paramount. People don't understand what the appeals are, how much they are worth, what can happen. Put some work into a better UI that's actually made for this.
<br /><br />
3) Have better commentary on the process, more specific than general blogging. I actually am slightly ashamed of the job that I did in the details on the component side, but that's not really what I was meant to be doing, specifically. Some of these appeals are really interesting issues that are core design/development problems that would really spawn audience discussion and interest. Just look at the chat room during the algorithm event. People traded back comments on solutions and what they thought competitors were doing wrong. In the component competition, putting the scorecards up on the screens just overwhelms anyone who doesn't actually do the design/development. Heck, I didn't even want to look at them most of the time. The interesting things need to be pulled out for people to see.
<br /><br />
I have several other ideas actually that are more controversial, but any good communicator knows that people have short attention spans and more ideas means less impact per idea. So I'll stop there. I just look forward to a day when I don't feel like component competitors are the undercard of the event, even though they put in at least as much time and energy than the algorithm competitors.
<br /><br />
The last few days have been somewhat of a blur. It might be the lack of sleep, it might be the constant stimulus, or it might be the drugs that they put in the water to keep the programmers calm. But regardless, it's going to be quite a shock when I'm catching up on schoolwork in a couple of days, sitting in my office in cold, wet Binghamton, New York. My impression of the experience in general has been quite good and I'm a pretty jaded judge. It's definitely made it very likely that I will find my way back to future events -- I'll just have to work on trying to be the subject of these blogs and not the author.
<br /><br />
I hope you guys, both onsite and offsite, got something from my experiences. It's really been a pleasure.
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
