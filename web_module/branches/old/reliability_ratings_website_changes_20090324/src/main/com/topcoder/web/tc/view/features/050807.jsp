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
    <tc-webtag:forumLink forumID="515651" message="Discuss this article" />
</div>

<span class="bigTitle">Belarus All College Programming Event</span>
<br /><br />
<%--
<div class="authorPhoto">
    <img src="/i/m/dcp_big2.jpg" alt="Author" />
</div>
--%>

<div class="authorText">
  By&#160;<tc-webtag:handle coderId="8365955" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>On the 26th of April about 80 coders from Belarusian colleges simultaneously pressed the "open a problem" button to start All Belarus Programming Event sponsored by TopCoder. For a great deal of them it was their first competition with TopCoder and actually their ever first contest of the kind. The contest sites were set at two Minsk leading Computer Science universities  - the Belarusian State University and the Belarusian State University of Informatics and Radioelectronics. The students from other Belarusian colleges were invited to compete at the BSU.</p>

<p>So who are the winners of the All Belarus Programming Event? The first place prize went to <tc-webtag:handle coderId="21659750" />. The second came <tc-webtag:handle coderId="10651823" />. <tc-webtag:handle coderId="22668451" /> turned out to be the third place finisher. And the best first time contestant in Belarus All College Programming Event is <tc-webtag:handle coderId="22679722" />. All of them got their prizes and recognition.</p>

<p><tc-webtag:handle coderId="21659750" />: "I find it really amazing that TopCoder is touring Eastern Europe. Even more amazing is that they've visited Belarus at last. It was great to meet some of the TopCoder people in person and they appeared to be very friendly and sociable, with an excellent sense of humor."</p>

<p>"For me Belarus All College Programming Event appeared to be a tough contest I should say. I was really agitated especially in the last minutes of the challenge phase when I couldn't find a piece of code worth trying to challenge in my room. And HeaDacHe who was just a few points behind me needed only to make one successful attempt to win. So I got really excited when they announced the final results. When it's a special contest like that it's even more frustrating to make a silly mistake and lose that at a regular SRM. Before the contest I promised to myself that if I win I'll give the prize to my girl-friend so I managed to keep my promise."</p>

<p>"I'm also thankful to Belarusian universities that did a great job to make this event happen."</p>

<p>The most important outcome of the event is the new TopCoder members from Belarus. If you look up their profiles, you will see that most of the newbies went on with programming competition at SRM 347 a few days ago having colored their white TC handles. That's what is really awesome about the Belarus All College Programming Event.</p>

<div align="center"><img src="/i/education/050807_01.jpg" alt="" border="0" style="margin: 10px;" /><br clear="all"></div>
<blockquote>The competition gets underway in Room 1 at BSU</blockquote>

<div align="center"><img src="/i/education/050807_02.jpg" alt="" border="0" style="margin: 10px;" /><br clear="all"></div>
<blockquote>Dr. Prof. Pavel Mandrik, Dean of the Faculty of Applied Mathematics and Computer Science, addresses the contestants at the prize awards ceremony.</blockquote>

<div align="center"><img src="/i/education/050807_03.jpg" alt="" border="0" style="margin: 10px;" /><br clear="all"></div>
<blockquote>Post-competition pizza party reception at BSU</blockquote>

<div align="center"><img src="/i/education/050807_04.jpg" alt="" border="0" style="margin: 10px;" /><br clear="all"></div>
<blockquote><tc-webtag:handle coderId="10481120" /> congratulates <tc-webtag:handle coderId="10651823" /></blockquote>

<div align="center"><img src="/i/education/050807_05.jpg" alt="" border="0" style="margin: 10px;" /><br clear="all"></div>
<blockquote>TopCoder College Tour Poster</blockquote>

<div align="center"><img src="/i/education/050807_06.jpg" alt="" border="0" style="margin: 10px;" /><br clear="all"></div>
<blockquote>First place winner <tc-webtag:handle coderId="21659750" /> is congratulated by <tc-webtag:handle coderId="10481120" /></blockquote>

<p><br></p>
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
