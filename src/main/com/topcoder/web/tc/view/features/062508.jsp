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
    <a href="/tc?module=Static&amp;d1=features&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <tc-webtag:forumLink forumID="521831" message="Discuss this article" /><br />
    <a href="/tc?module=Static&amp;d1=help&amp;d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Meet the May 2008 Coders of the Month</span>
<br /><br />
<br clear="all">
<p><em>We caught up with <tc-webtag:handle coderId="159100" context="algorithm" />, May's Algorithm Coder of the Month, <tc-webtag:handle coderId="22655076" context="development" />, May's Development Coder of the Month, and <tc-webtag:handle coderId="22682305" />, May's Studio Designer of the Month to learn a little bit more about them, their proudest TopCoder moments, and anything else they wish to share with the community.</em></p>
<br />


<p><div class="authorPhoto">
    <img src="/i/m/Googly_big.jpg" alt="Googly, May's Algorithm Coder of the Month" />
</div>
<strong><a href="/tc?module=COMHistory&amp;achtid=5">Algorithm</a></strong>: <tc-webtag:handle coderId="159100" context="algorithm" /><br />
SRM 403: 2128<br />
SRM 402: 2022<br />
SRM 401: 1957<br />
SRM 400: 1838
</p>

<p><strong>What brought you to TopCoder?</strong><br />
<tc-webtag:handle coderId="112441" context="algorithm" /> and <tc-webtag:handle coderId="112438" context="algorithm" /> introduced me to TopCoder back in 2001. We were students at the University of Michigan.  A few months later, I started competing. I was new to Java at the time, and had a lot to learn.</p>
 
<p><strong>What is your proudest TopCoder moment?</strong><br />
Probably when I advanced to Online Round 4 of the 2003 TopCoder Open. Back then, only 50 coders made it to Round 4, and the top 16 would advance to onsite. I didn't do well in Round 4 though. It seemed like everyone else in my room was Red.</p>
 
<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
I don't feel like I've had to overcome any obstacles at TopCoder. Everything I do here is for fun.</p>
 
<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
Since joining TopCoder, I feel more confident writing code quickly and having it work the first time.</p>
 
<p><strong>What advice would you give to someone just starting out?</strong><br />
Make sure you're having fun.</p>

<p><strong>What is the biggest contributor to your progress this month?</strong><br />
Solving the Division 1 Easy and Medium for three consecutive SRMs (401-403) gave me a rating boost.</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
Competing in the 7am SRMs (4am local time). I wake up at 1am to register (before the registration limit can be reached), go back to sleep, wake up at 4am, compete while half-asleep, go back to sleep for a few more hours, then go to work. Why do I do this to myself? I'm addicted to TopCoder :(</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
I like to play chess and play basketball.</p>

<p><strong>What sights are there to see in your area?</strong><br />
Since I live in Arizona (USA), here are some pictures of the <a href="http://upload.wikimedia.org/wikipedia/en/8/88/Saguaro_Forest_-_Tucson_Arizona_-_Relic38.JPG">desert</a> and the <a href="http://upload.wikimedia.org/wikipedia/commons/f/f9/USA_09847_Grand_Canyon_Luca_Galuzzi_2007.jpg">Grand Canyon</a> that I found on the web.</p>

<p><strong>What foods are there to taste in your area?</strong><br />
There are all kinds of food here. In particular, there are many Mexican restaurants, since we are close to Mexico.</p>
<br />


<p><div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="liuliquan, May's Development Coder of the Month" />
</div>
<strong><a href="/tc?module=COMHistory&amp;achtid=7">Development</a></strong>: <tc-webtag:handle coderId="22655076" context="development"/><br />
Five submissions &amp; five wins<br /><br /><br /><br />
</p>

<p><strong>What brought you to TopCoder?</strong><br />
Friends introduced me to TC.</p>
 
<p><strong>What is your proudest TopCoder moment?</strong><br />
The first competition win.</p>
 
<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
Language. Sometimes it cause misunderstood and confusion.</p>
 
<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
When facing problem, think again, there should always be some other way out.</p>
 
<p><strong>What advice would you give to someone just starting out?</strong><br />
Try best and have a fun.</p>
 
<p><strong>What is the biggest contributor to your progress this month?</strong><br />
I feel energetic this month.</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
Everytime wating the review score.</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
Watch movie, read book, sleep.</p>

<p><strong>What sights are there to see in your area?</strong><br />
West Lake, Break Bridge.</p>

<p><strong>What foods are there to taste in your area?</strong><br />
Long Jin Tea, Dong Po Meat.</p>
<br />


<p><div class="authorPhoto">
    <img src="/i/m/sweetpea_big.jpg" alt="sweetpea, May's Studio Designer of the Month" />
</div>
<strong>Studio</strong>: <tc-webtag:handle coderId="22682305" /><br />
Won $2250 &amp; Won 1st Place <br />in 3 big contests!<br /><br /><br />
</p>

<p><strong>What brought you to TopCoder?</strong><br />
I knew TopCoder from my boyfriend,algorithm member <tc-webtag:handle coderId="7459080" context="algorithm" />.</p>
 
<p><strong>What is your proudest TopCoder moment?</strong><br />
It was <a target="_blank" href="http://studio.topcoder.com/?module=ViewContestResults&amp;ct=2089">The Ball T-Shirt Design Competition</a>, my first-time and first-winning competition in TopCoder Studio.</p>
 
<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
Lack of knowledge in graphic design techniques :(</p>
 
<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
Helping hands from other TopCoder members,regardless they are also competing for the same contest.I was amazed when first time posting question to the forum some members helped me and gave me guidelines.What a very nice community!</p>
 
<p><strong>What advice would you give to someone just starting out?</strong><br />
Don't think about winning.Just try your best and do it for fun.</p>
 
<p><strong>What is the biggest contributor to your progress this month?</strong><br />
Support from many people around me :)</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
When I need to finish my work in the office while there are many interesting contests posted in studio's website :'(</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
Playing piano with my duet-couple <tc-webtag:handle coderId="7459080" context="algorithm" />,windows shopping and watching movies :D.</p>

<p><strong>What sights are there to see in your area?</strong><br />
<a target="_blank" href="http://en.wikipedia.org/wiki/Esplanade_Concert_Hall">Esplanade -Theaters on the Bay</a>.</p>

<p><strong>What foods are there to taste in your area?</strong><br />
Yong Tau Fu,Chicken Rice and <a target="_blank" href="http://en.wikipedia.org/wiki/Fried_carrot_cake">Fried Carrot Cake</a>.</p>
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
