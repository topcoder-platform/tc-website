<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
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
   background-color: #EEEEEE;
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
    <tc-webtag:forumLink forumID="516364" message="Discuss this article" />
</div>

<span class="bigTitle">An Interview with Team V. Gimnazija</span>
<br /><br />
<div class="authorPhoto">
    <img src="/i/m/lovro_big3.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="7390467" /><br />
      <em>TopCoder Member</em>
</div>
<br clear="all">

<div style="float: right; padding: 20px 20px 20px 20px;">
<table class="formFrame" width="170" cellpadding="6" cellspacing="2">
   <tr class="GAtableText" nowrap="nowrap">
      <td>Watch for interviews with the winners of last week's TCO, coming soon!</td>
   </tr>
</table>
</div>

<p>The team portion of the TCHS 2007 tournament was won by the V. [fifth] Gimnazija team. I sat down and talked with the three winning members, Petar Sirkovic [<tc-webtag:handle coderId="21507690" />], Ivo Sluganovic [<tc-webtag:handle coderId="15604398" />], Goran Zuzic [<tc-webtag:handle coderId="11972352" />], as well as their chaperone, Predrag Brodanac.</p>

<p><strong>To start off, what was your overall impression of the TCHS finals?</strong></p>
<p><tc-webtag:handle coderId="15604398" />: It was great. I would have liked it to have lasted longer and if the two competitions weren't on the same day, but I really enjoyed it.</p>
<p><tc-webtag:handle coderId="11972352" />: I was delighted with the effort TopCoder staff put into the tournament! You guys rock!</p>

<p><strong>I understand you had a bit of trouble catching a flight.</strong></p>
<p><tc-webtag:handle coderId="11972352" />: Yes. As a sign of good luck to come, we missed our transfer flight in Chicago -- they closed the door right on us. But we had more than enough time. Our luggage was delayed and came next morning, except for <tc-webtag:handle coderId="15604398" />'s, which was mysteriously delayed for the entire duration of the tournament.</p>
<p><tc-webtag:handle coderId="15604398" />: Having a single shirt of my own and a pair jeans for the 3 days, I was thrilled with every sponsor shirt I got!</p>

<p><strong>What would you say contributed most to the development of your skills? How did your school contribute?</strong></p>
<p><tc-webtag:handle coderId="21507690" />: Hanging out with people at school (especially <tc-webtag:handle coderId="11972352" />) and learning from them helped a lot. Participating in TopCoder competitions and reading educational content also helped.</p>
<p><tc-webtag:handle coderId="15604398" />: The school sponsors our trips and also helps by making sure the teachers don't put too much pressure on us when we get back and have a backlog of schoolwork to do (sometimes to the point of it being embarassing in front of my classmates). Our teacher/coach is also great, in that he does everything he can to help us, while not pretending to know everything. As for programming and algorithms, I learned most from senior contestants (mostly <tc-webtag:handle coderId="310333" /> and you) and younger contestants I compete against and practice with (mostly <tc-webtag:handle coderId="11972352" /> and <tc-webtag:handle coderId="12005484" />). Granted, all of it took a lot of practice and will.</p>

<p><strong>During the Championship Round, all of you submitted solutions to the hardest problem very quickly, for high scores. None of those first submissions stood and each of you has a different story to tell. What happened?</strong></p>
<p><tc-webtag:handle coderId="11972352" />: I quickly solved the first two problems. After reading the hard, I realized I knew how to solve it and coded it for 860 points. I was happy, thinking all three of my solutions would pass, but realized after half an hour that I had if ( something ) instead of if ( i != j && something ) in one place. I resubmitted and my solution passed. It didn't cause the team much damage because few people solved the problem.</p>
<p><tc-webtag:handle coderId="15604398" />: After reading the problem and coming up with a solution, I thought that there was a chance it would work, but I was skeptical. I decided to code it really fast, submit, and keep working on it. Shortly after submitting I realized it was indeed wrong. I was happy to see other competitors with fast submissions, hoping that they had the same wrong solution I could take out in the challenge phase with cases I was preparing. Meanwhile, I came up with the correct approach, but decided to be careful and not to resubmit too eagerly, so that I wouldn't prompt others to revisit their solution. In the end I was left with about ten minutes to implement the correct solution, which wasn't enough. However, in the challenge phase, I succesfully challenged 9 solutions, which was enough for third place.</p>
<p><tc-webtag:handle coderId="21507690" />: I was suspicious of my solution. When drawing on paper and thinking, I made conclusions too hastily and failed to think twice about it. This is not the first time that impatience has backfired on me. Luckily, it didn't cost us the win.</p>

<p><strong>After winning the TCHS, you proceeded to compete in another tournament in the US before flying back home. How did that go and how was your success received back home?</strong></p>
<p><tc-webtag:handle coderId="11972352" />: After the TCHS we went to Houston where we met up with another 7 people from our school and participated in the American Computer Science League finals, which we won as well. The competitions were closely followed by media back home. There was actually a bus full of people who came to the airport to welcome us! We appeared in every newspaper I checked.</p>
<p><tc-webtag:handle coderId="21507690" />: We became very popular, even went on TV. The school is very proud of us and the media attention we have been getting. Our families were also very happy. Still, I'm happiest to have made it back in one piece.</p>
<p><tc-webtag:handle coderId="15604398" />: We were in every newspaper, on radio and on TV for three days straight. People kept calling home and congratulating.</p>

<p><strong>You won a hefty amount of prize money in scholarships. How will you be spending it?</strong></p>
<p><tc-webtag:handle coderId="15604398" />: All three of us plan to go to the same school in Zagreb. College is free of tuition in Croatia, so we still have to see how we will be getting our prizes. I have plenty of things I would like to spend it on, including buying a new laptop and spending time abroad learning a foreign language.</p>

<p><strong>The IOI is taking place in August in your hometown, Zagreb. Will you be participating?</strong></p>
<p><tc-webtag:handle coderId="11972352" />: Yes, I will be part of the first Croatian team.</p>
<p><tc-webtag:handle coderId="15604398" />: I didn't qualify for the first team, but I hope to be part of a local team.</p>
<p><tc-webtag:handle coderId="21507690" />: Unfortunately, I won't be participating.</p>

<p><strong>Predrag, you are the team's teacher in school and chaperoned them to the TCHS onsite finals. How did you find the event? Was this the first time you were exposed to TopCoder?</strong></p>
<p><strong>Predrag</strong>: I was impressed with the organization; transportation arrangements, accomodation, the competition itself, food; everything was at an exceptional level. Each contestant got a welcome gift which, although small, was a very nice gesture and they appreciated it.</p>
<p>It is true that I hadn't known much about TopCoder up until the tournament, so I spent some time getting informed. Apart from the organization of the TCHS event, I very much like TopCoder's approach to building software.</p>
<p>We had some trouble getting sponsors for this event as it was the first time TopCoder has organized a high-school event, but I'm confident it will be much easier in the future.</p>
<br>

<p>&nbsp;</p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
