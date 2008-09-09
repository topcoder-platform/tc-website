<%@ page contentType="text/html;charset=utf-8" %> 
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>

<style type="text/css">
.GAtableText
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE
}
</style>

</head>

<body>

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>


<div class="linkBox">
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="506177" message="Discuss this article" />
</div>

<span class="bigTitle">TCCC Preview: Meet the bloggers</span>
<br><br>

<div class="authorPhoto">
    <img src="/i/m/RRLevering_big.jpg" alt="Author" />
    <img src="/i/m/Churchillio_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="344462" /> &amp; <tc-webtag:handle coderId="21181561" /><br />
      <em>TopCoder Members</em>
</div>

<br clear="all">
<i>The winners of this year's TopCoder Collegiate Challenge <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=blogger_winners">"Pick Me" contest</A>, RRLevering and Churchillio will be blogging about the TCCC from San Diego later this week. Read about their expectations for the tournament below, and look for the first of their blog entries on Wednesday morning at <A href="http://www.topcoder.com/tccc06">www.topcoder.com/tccc06</A>.</i>
<br><br>
<span class="subtitle">RRLevering</span><br>
It's really amazing to think that in just a couple days I'll be sitting in a room with some of the best programmers in the world, and it won't be a chat room. I've been competing in TopCoder development competitions for almost three years now and I must admit a feeling of curiosity with regards to the people behind the handles that strive alongside me every week.
<br><br>
Component competitions are a whole different world than TopCoder algorithm SRMs - a dilated time scale with a more diverse set of mental pressures. It's like a cold, silent battlefield – every moment for a week I wonder what the "enemy" is doing and whether he's better or more prepared than me. The need for directness and clarity when questioning a detail of a component typically turns the component forum into a very formal, terse communication chain. This differs from a lot of the pre/post-round banter that often surrounds the chat rooms in SRMs. It turns many moments of a week that I'm not working on the current TC project into a feeling of guilt and of time wasted. But at the end of this conflict I'm left with a great respect for my competitors and a greater understanding of real-world programming, especially when the competition is close and the design more complex than expected.
<br><br>
So I'm looking forward to meeting the designers that have impressed me with their ability to see all sides of the design, and the developers who write code that has formed the way that I write code myself. I'm impressed with all the component competitors in general for being able to put up with the demands of the competition, while carrying on an academic life. Hopefully, I'll even pick up some time-saving tips to help me in future competitions.
<br><br>
I'm sure that most people will be tuning in to the TCCC for the algorithm competition, because it's real-time and has more competitors. And in some ways, the component side is a lot more pre-determined, with the majority of the work already done offsite. However, I've seen my component score go up almost 10 points based on a series of appeals to a weak reviewer, so I know that appeals can definitely change the face of the competition. And with some of the great talent that is going to be there, I'm looking forward to seeing a lot of appeal-based leapfrogging in the higher score ranges. It also remains to be seen if some of the competitors that managed to squeak by with lots of non-contested submissions will be able to really polish a particular component when score and not placement is the deciding factor. 
<br><br>
I'd love to see some upsets this week. Though in the development arena, China is looking like a safe bet for winning country -- 6 out of 7 competitors; not to mention, three of them came from the same university. On the design side, there are a lot of newcomers who are definitely at a disadvantage against the more experienced antimatter, nicka81, and sql_lall. However, in component competitions, everyone follows a pretty steep curve in the beginning as they learn the ropes for pleasing reviewers, so I wouldn't count anyone out yet.
<br><br>
From a behind-the-scenes point of view, the onsite events, activities, and the general ambience of the area seem really exciting. Programmers in large groups (or even programmers not alone in dark rooms/cubicles) are a rare sighting and it should be fun to see – and report on -- the mayhem that results. This being my first TC onsite event, I'm interested in the way in which TopCoder (and the sponsors, for that matter) keep the very intelligent, multi-lingual audience amused for several days in a row.
<br><br>
In the end, hopefully the competitors (and me) will be able to kick back and relax a bit and get to know the people who we normally only have online relationships with. If you're onsite, come chat with me (I'm a big, bald guy – hard to miss). And if you're keeping tabs from wherever in the world you log into TopCoder, look forward to seeing the human level of the competition from the eyes of the two bloggers, beyond the posted scores and the pictures of people with big checks.
<br><br>
<span class="subtitle">Churchillio</span><br>
Well, I'm starting to get nervous. The 2006 TopCoder Collegiate Challenge is being held in San Diego and, having only participated live in local / regional ACM programming competitions myself, I imagine that the feelings I am having about this competition as a blogger pale in comparison to what the competitors are feeling at this point.
<br><br>
This year's bracket is extremely fierce, with over 80% of the competitors having a red rating, with nobody rated below 1950&#8230; oh, and if this wasn't enough, 7 of the top 10 algorithms members will be attending. With the ratings of the bracket so close, will one be able to gain a mental edge on the competition? Will the latest SRM win by Petr play an intimidation role for the other competitors heading into the TCCC? Coupling this win with the #1 ratings spot would make Petr a big favorite going into the TCCC, but we will see what happens when the live pressure starts piling up.
<br><br>
This year is also going to be a truly international competition. In case any of you haven't done the math already, in the algorithm competition alone there are representatives from 17 countries, including 16 people from Russia, 6 from China, 5 from Poland, 4 from the US, 2 from Canada, Netherlands, Ukraine, Spain, as well as single competitors from each of Germany, Indonesia, Japan, Romania, Slovakia, Norway, Sweden, South Africa, and Sweden! Competitors from Russia will make up exactly 1/3 of the algorithm competition -- will the rest of the world be able to keep up? Whoever ends up winning this thing will no doubt be deserving of the title&#8230;
<br><br>
So in one short, nerve-filled day I'll be hopping on a plane to San Diego, California to report on the algorithm competition. I can't wait to arrive and see the competition area setup, and don't worry&#8230; I'll be sure and take plenty of photos for those who couldn't attend. Depending on hardware availability I hope to even post a few movies of the event for you to see.
<br><br>
Being a huge gaming / poker fan, I'm also anxious to see what kind of drama the side events will produce! From the games room, to the poker tournament -- which they probably won't let the bloggers play, in order to give the competitors a fighting chance :-) -- to all the sponsors in attendance, it'll be an awesome time to say the very least.
<br><br>
I never thought I'd be taking a week off of school in the middle of exams&#8230; but this will definitely be more than worth it.
<br><br>
See you in San Diego!
<br><br>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170"id="onRight">
         <div id="onBottom">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </div>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
