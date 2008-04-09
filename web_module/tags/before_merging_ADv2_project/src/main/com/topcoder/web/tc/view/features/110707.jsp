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
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <tc-webtag:forumLink forumID="518073" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a
</div>

<span class="bigTitle">Meet the October 2007 Coders of the Month</span>
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

<p><em>We caught up with October's "coders of the month," to learn a little bit more about them, their proudest TopCoder moments, and more...</em></p>


<p>
<div class="authorPhoto">
    <img src="/i/m/dcp_big2.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&achtid=7">Development</a>: <tc-webtag:handle coderId="21684580" context="development" /><br />
A 1st &amp; 2nd place win<br />
including a win over 14 members<br /><br />
</p>

<p><strong>What brought you to TopCoder?</strong><br />
I was browsing through a book at the bookstore nearly two years ago and the book mentioned TopCoder as a great way to keep your programming skills sharp.  I program for a living, but I knew nothing about competitive programming or that such a thing even existed.  But I decided to check out the site and was very impressed.  After some basic arena practice for a few weeks I participated in my first SRM and performed dismally, and I discovered quickly that there was (and still is) a tremendous amount I needed to learn.  But even though I performed badly, a spark was ignited and I knew that I had found something that I really enjoyed and had a passion for.  I just wish I had started sooner!  I've found that even though I don't excel at the algorithm competitions, I keep doing them because they're fun and I enjoy learning.  And I owe the community a great debt for the many answers to my questions they have provided and continue to provide.  I always know when I'm stuck that there's help, and that's a testament to how truly great the folks here are. As for development competitions, I decided to try it to see how I liked it.  I took quite a bit of time to learn how the development process worked, because the learning curve is a bit steep if you are not familiar with the style of development TopCoder requires.  I discovered that development competitions reward those who work hard and pay attention to details, and that turned out to be a good fit for me.</p>
 
<p><strong>What is your proudest TopCoder moment?</strong><br />
Winning a development competition last month was definitely an exciting and fulfilling moment.  Also, solving a div 2 hard in an SRM is always a good feeling as well, even though it's very rare for me.</p>
 
<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
Time is always my biggest obstacle.  Trying to balance TopCoder with a full time job and other responsibilities is not always easy, but I've learned to try to make the best use of my time.  For example, I use lunch breaks at work to do TopCoder stuff (either SRM practice or component development).  Also, I try to maximize the time on the weekends, by working on things late at night (or early in the morning, depending on how you look at it) when everyone else is asleep.</p>
 
<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
The component competitions taught me a tremendous amount about how to write quality software, and follow good standards.  I've carried a lot of those practices, like using C# XML documentation in code, over to my full-time job.  And doing SRMs frequently always makes me question the code I write for a living and ask, "Is there a more efficient way to do this"?  Sometimes I even find myself wondering if it will run in under 2 seconds. :)</p>
 
<p><strong>What advice would you give to someone just starting out?</strong><br />
As for development, I'm still learning myself, but here are some things that helped me:
<ol>
    <li>Take time to learn the tools and coding style <em>before</em> starting your first competition.   You don't want to be in the middle of a competition and discover that you don't know how to use ant/nant.</li>
    <li>I picked a component that someone had already done, and I just tried to do it myself.  When I would get stuck, I would look at the winning submission to see what that coder did.  I also studied the review scorecards to see what people were being scored down on, because as <tc-webtag:handle coderId="8357090" context="algorithm" /> said in his <a href="/tc?module=Static&d1=tutorials&d2=integersReals">Representation of Integers and Reals</a> article, "it is always less painful to learn on the mistakes of other people made than to learn on your own mistakes".</li>
    <li>Don't be afraid to ask questions in the forums, but be sure to search the forums first to make sure someone else hasn't already asked it.</li>
    <li>Pay attention to details!  Everything is important in development competitions, such as documentation, unit tests, and avoiding redundant code, and you really have to watch closely to avoid mistakes in each area.  Mistakes can really cost you in a review.</li>
    <li>Don't make the same mistake twice.  In other words, when you are scored down in a review for something, use it as a learning experience, and don't make the mistake again.</li>
</ol></p>
 
<p><strong>What is the biggest contributor to your progress this month?</strong><br />
I was able to take some days off from work to do the component competitions, so that allowed me the time I needed to do a decent job on them.  I'd also like to thank <tc-webtag:handle coderId="8544935" context="development" />, who was very helpful in answering questions I had about various aspects of component development.  I'm really grateful to him for his help.</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
Trying to decide whether or not to register for a component when the registration deadline is rapidly approaching.  Recently I started working on a component Thursday when it was posted, but as the weekend got into full swing some personal things came up that prevented me from working on it like I needed to.  The 9am Sunday deadline was almost here, but I decided not to register for it because I didn't think I would have time to finish it due to the lack of progress I had made over the weekend.  But it was very stressful, because I hated to see all the work I did Thursday and Friday go to waste. Also, it can be stressful when you are not sure how to code something in the component or you can't get it to work, or when you are waiting for a designer's answer to a forum post. And of course, SRMs in general are pretty stressful, but that's part of the fun :)</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
I like spending time with my family, so I'm usually doing things with them.  I also teach a 9th grade Sunday School class at my church.  My other hobby is bodybuilding.</p>
<br />


<p>
<div class="authorPhoto">
    <img src="/i/m/Mingfei_Li_big.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&achtid=5">Algorithm</a>: <tc-webtag:handle coderId="20916346" /><br />
SRM 373: 1792<br />
SRM 372: 1788<br />
SRM 371: 1681
</p>

<p><strong>What brought you to TopCoder?</strong><br />
I took part in the China National Olympiad in Informatics in August, 2005. One of my teammates told me about TopCoder on the train back home and then I registered. But after that I stopped doing algorithm competitions. I began to compete in TopCoder again this spring.</p>

<p><strong>What is your proudest TopCoder moment?</strong><br />
The moment I saw my photo and my handle under the line "Coder of the Month".</p>

<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
At the very beginning I wasn't used to the style of TopCoder since I had only solved ACM-ICPC &amp; OI problems before.</p>

<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
Never give up, no matter how hard the problems are, just hold on.</p>

<p><strong>What advice would you give to someone just starting out?</strong><br />
Read more books ,practice more, and enjoy algorithms.</p>

<p><strong>What is the biggest contributor to your progress this month?</strong><br />
The practice for ACM-ICPC. In fact I've been away from algorithms for 2 years before my first SRM. I just couldn't do well in the SRMs. In my summer vacation I devoted myself to algorithms, solved many problems on <a target="_blank" href="http://acm.pku.edu.cn/JudgeOnline/">POJ</a>, and kept practicing in the practice room. Everything is better now.</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
Right now, the time I'm answering these interview questions.</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
Music &amp; soccer. I listen to a lot of music almost every second that I'm not sleeping. I also like playing guitar and singing. Soccer is another hobby of mine. I often play soccer in the weekend. Watching soccer matches is another joy of my life.</p>
<br />


<p>
<div class="authorPhoto">
    <img src="/i/m/telly12_big.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&achtid=6">Design</a>: <tc-webtag:handle coderId="10169506" context="design" /><br />
4 component<br />
competition wins<br /><br />
</p>

<p><strong>What brought you to TopCoder?</strong><br />
The algorithm competition of TopCoder.</p>
 
<p><strong>What is your proudest TopCoder moment?</strong><br />
When I win the first design competition.</p>
 
<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
Loneliness, I stay at home all the day.</p>
 
<p><strong>What advice you give to someone just starting out?</strong><br />
Just do your best, and you will win at last.</p>
 
<p><strong>What is the biggest contributor to your progress this month?</strong><br />
My girl, she always take care of me.</p>
 
<p><strong>What is your most stressful TopCoder moment?</strong><br />
When I get the 3rd place in component competition.</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
Do some sports or visit some good friends.</p>
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
