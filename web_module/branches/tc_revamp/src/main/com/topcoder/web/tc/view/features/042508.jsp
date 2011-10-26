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
    <tc-webtag:forumLink forumID="520918" message="Discuss this article" /><br />
    <a href="/tc?module=Static&amp;d1=help&amp;d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Meet the March 2008 Coders of the Month: Wendell &amp; PE</span>
<br /><br />
<br clear="all">
<p><em>We caught up with <tc-webtag:handle coderId="8544935" context="design" />, March's Design Coder of the Month, and <tc-webtag:handle coderId="9998760" context="development" />, March's Development Coder of the Month, to learn a little bit more about them, their proudest TopCoder moments, and anything else they wish to share with the community.</em></p>

<p><div class="authorPhoto">
    <img src="/i/m/Wendell_big2.jpg" alt="Wendell, March's Design Coder of the Month" />
</div>
<a href="/tc?module=COMHistory&amp;achtid=6">Design</a>: <tc-webtag:handle coderId="8544935" context="design"/><br />
Three 1st place finishes<br />
One 3rd place finish<br /><br />
</p>

<p><strong>What brought you to TopCoder?</strong><br />
I heard about TopCoder in 2004, but I didn't start competing until <tc-webtag:handle coderId="10336829" context="development" /> told me more about the details in 2005, which brought a big change to my career.</p>
 
<p><strong>What is your proudest TopCoder moment?</strong><br />
There are many such moments. But if I have to choose one I'll say it's the first time that I won a development competition. I got several 2nd places before I got my first winning and that winning really cheered me up.</p>
 
<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
Having to work on weekends, which is also the time I want to share with my family.</p>
 
<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
Never stop learning.</p>
 
<p><strong>What advice would you give to someone just starting out?</strong><br />
<ol>
    <li>Read the review scorecards carefully before competing.</li>
    <li>Learn from the top developers/designers submissions.</li>
    <li>Better find an experienced TopCoder member that you can ask questions, this would be really helpful. :)</li>
</ol></p>

<p><strong>What is the biggest contributor to your progress this month?</strong><br />
The desire to be one of the TCO 08 finals. :)</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
Having to solve a difficult problem in a very limited timeline. I used to work on several TopCoder internal projects and I had many such moments that time.</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
Read novels, watch movies and do some sports.</p>

<p><strong>What sights are there to see in your area?</strong><br />
There are many sights which you can find <a target="_blank" href="http://www.asiarooms.com/travel-guide/china/guangzhou/sightseeing-in-guangzhou/index.html">here</a>. The GuangZhou Baiyun Mountain is a very famous one.</p>

<p><strong>What foods are there to taste in your area?</strong><br />
Roast Goose, Gold Medal Sulking Pig, Salted Chicken, etc....</p>
<br />

<p><div class="authorPhoto">
    <img src="/i/m/PE_big.jpg" alt="PE, March's Development Coder of the Month" />
</div>
<a href="/tc?module=COMHistory&amp;achtid=7">Development</a>: <tc-webtag:handle coderId="9998760" context="development"/><br />
Four 1st place finishes<br /><br /><br />
</p>

<p><strong>What brought you to TopCoder?</strong><br />
I got to know the website <a target="_blank" href="http://acm.zju.edu.cn">http://acm.zju.edu.cn</a> by accident in my second year at university and found it was very interesting to solve such algorithm problems with computer programs. I began the coding life from that time, to be more precise, the time after I joined the ACM-ICPC team of my university. In that team, there are a lot of TC members, like <tc-webtag:handle coderId="286907" context="algorithm"/>, <tc-webtag:handle coderId="286911" context="algorithm"/>, <tc-webtag:handle coderId="287568" context="algorithm"/>, <tc-webtag:handle coderId="302053" context="development"/>, <tc-webtag:handle coderId="10526732" context="algorithm"/> and so on. They brought me to the TopCoder.</p>
 
<p><strong>What is your proudest TopCoder moment?</strong><br />
Win both the TCCC06 and TCCC07</p>
 
<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
My English is not very good. I found it will be a bit overloaded when I try to do the design competitions - writing the CS is really a headache.</p>
 
<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
As said by <tc-webtag:handle coderId="14788013" context="development"/>: Make everything perfect.</p>
 
<p><strong>What advice would you give to someone just starting out?</strong><br />
I think a good coder should have a background for good knowledge of algorithm and data structure, and we can see many good designers also have a very high rating in algorithm part. So I recommend to take part in every SRM if possible.</p>
 
<p><strong>What is the biggest contributor to your progress this month?</strong><br />
My PM, he did not assign me much work this month, haha.</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
I think it should be the TCO07. I was beaten by <tc-webtag:handle coderId="15214882" context="development"/> with very very small gap.</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
Watch movies, play games, and play cards with my friends.</p>

<p><strong>What sights are there to see in your area?</strong><br />
Beautiful Hangzhou and beautiful West Lake.</p>

<p><strong>What foods are there to taste in your area?</strong><br />
Dongpo pork, Beggar's chicken, fried shrimps with Longjing tea, West Lake fish.</p>
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
