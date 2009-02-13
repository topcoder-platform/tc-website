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
    <a href="/tc?module=Static&amp;d1=features&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <tc-webtag:forumLink forumID="520544" message="Discuss this article" /><br />
    <a href="/tc?module=Static&amp;d1=help&amp;d2=writeForTC">Write for TopCoder</a
</div>

<span class="bigTitle">Meet the February 2008 Coders of the Month: oninkxronda</span>
<br /><br />
<%--
<div class="authorPhoto">
    <img src="/i/m/kzimmerman_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="21196141" /><br />
      <em>TopCoder Member</em>
</div>
--%>
<br clear="all">

<p><em>We caught up with <tc-webtag:handle coderId="22418135" />, February's Studio Designer of the Month, to learn a little bit more about him, his proudest TopCoder moments, and anything else he wishes to share with the community.</em></p>


<p>
<div class="authorPhoto">
    <img src="/i/m/oninkxronda_big.jpg" alt="Author" />
</div>
Studio Design: <tc-webtag:handle coderId="22418135" /><br />
Won $1,400 in four contests<br />
<br /><br />
</p>

<p><strong>What brought you to TopCoder?</strong><br />
A friend of mine introduced the site 2 years ago, I browsed it and I was amazed by the competition and the prizes of course. :)  I felt so excited by then, I registered and joined the contest.</p>
 
<p><strong>What is your proudest TopCoder moment?</strong><br />
I think being a TopCoder Studio Designer of the Month in February 2008 and hopefully being one of the Top12 who will compete to Las Vegas for the Championship round. It's a very exciting event, competing to some of the best designers in the world is a great experience.</p>
 
<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
Having a regular 8 hours job but then was able to manage my time and had a winning entry here in TopCoder.</p>
 
<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
Never give up!</p>
 
<p><strong>What advice would you give to someone just starting out?</strong><br />
You have to love what you do, never give up joining every contest; you have to be proud with every single design you make. Give time working with it and do your best shot in every designs you're creating. Never feel desperate if you are not winning. Push yourself for more.</p>
 
<p><strong>What is the biggest contributor to your progress this month?</strong><br />
My family, their support and prayers.</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
Working with storyboard designs at limited timeframe.</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
Photography (having my daughter as my subject) and also playing games in my PSP especially FightNight3 with Manny Paquio. :)</p>

<p><strong>What sights are there to see in your area?</strong><br />
Beach resorts like <a target="_blank" href="http://www.lakbaypilipinas.com/images/boracay_palm_trees1.jpg">Boracay</a>, <a target="_blank" href="http://farm1.static.flickr.com/164/342010348_6e904b8efa.jpg">Pagudpod</a>, <a target="_blank" href="http://www.elnidoresorts.com/">El Nido</a> and <a target="_blank" href="http://diariofilipino.50webs.com/2005/elnido_feature.html">more</a>. :)</p>

<p><strong>What foods are there to taste in your area?</strong><br />
Pork Adobo, Balot (duck egg fetus) :)</p>
<br />



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
