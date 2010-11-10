<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles: Meet the June 2008 Coders of the Month</title>
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
    <tc-webtag:forumLink forumID="522204" message="Discuss this article" /><br />
    <a href="/tc?module=Static&amp;d1=help&amp;d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Meet the June 2008 Coders of the Month</span>
<br /><br />
<br clear="all">

<p><em>This month we caught up with <tc-webtag:handle coderId="22653044" context="algorithm" />, June's Algorithm Coder of the Month, <tc-webtag:handle coderId="9981727" context="design"/>, June's Design Coder of the Month, <tc-webtag:handle coderId="22630348" context="development" />, June's Development Coder of the Month, and <tc-webtag:handle coderId="22690288" context="development" />, June's Studio Designer of the Month, to learn a little bit more about them, their proudest TopCoder moments, and anything else they wish to share with the community.</em></p>

<p><div class="authorPhoto">
    <img src="/i/m/jbernadas_big.jpg" alt="jbernadas, June's Algorithm Coder of the Month" />
</div>
<a href="/tc?module=COMHistory&amp;achtid=5">Algorithm</a>: <tc-webtag:handle coderId="22653044" context="algorithm" /><br />
SRM 407: 2760<br />
SRM 406: 2588<br />
SRM 404: 2458
</p>

<p><strong>What brought you to TopCoder?</strong><br />
Since three years ago, I had been participating in the ACM-ICPC and practicing exclusively at UVa. Two years ago, two friends and I were having an after-lunch conversation:<br /><br />
<tc-webtag:handle coderId="8497166" context="algorithm" />: Do you know Dynamic Programming?<br />
<tc-webtag:handle coderId="22653044" context="algorithm" />, <tc-webtag:handle coderId="22679947" context="algorithm" />: Yes, of course, we know Longest Increasing Subsequence, Longest Common Subsequence, Matrix Chain Multiplication, ...<br />
<tc-webtag:handle coderId="8497166" context="algorithm" />: Then, given a matrix A of NxN elements, with N &lt;= 16, how would you find a permutation P such that sum{i=0..N-1} A[i][P[i]] is minimized?<br />
<tc-webtag:handle coderId="22679947" context="algorithm" />: **thinking**<br />
<tc-webtag:handle coderId="22653044" context="algorithm" />: Just try each possible permutation and keep the one that returns the minimum answer.<br />
<tc-webtag:handle coderId="8497166" context="algorithm" />: That gives TLE, you have to use DP.<br />
<tc-webtag:handle coderId="22653044" context="algorithm" />: How?<br />
<tc-webtag:handle coderId="8497166" context="algorithm" />: Use a bitmask to memorize the previously calculated values.<br />
<tc-webtag:handle coderId="22653044" context="algorithm" />: Wow.<br />
<tc-webtag:handle coderId="22679947" context="algorithm" />: Makes sense.<br />
<tc-webtag:handle coderId="8497166" context="algorithm" />: Go to <a href="/">TopCoder</a>, and you will learn real DP.<br /><br />
Since that moment, <tc-webtag:handle coderId="22679947" context="algorithm" /> and me had been practicing in TopCoder, and our abilities have increased fast (and now we really know DP).</p>

<p><strong>What is your proudest TopCoder moment?</strong><br />
Winning <a href="/stat?c=round_overview&amp;er=5&amp;rd=12179">SRM 407</a>, I managed to solve three problems very fast and make two successful challenges, and then resisted the urge to make an unsuccessful challenge for eight minutes. It was a very nice moment, too much tension together (I can bet that it was more intense than my Bachelor's graduation will be).</p>

<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
Lazyness. I am a lazy person, sometimes it is very hard for me to start something and keep doing it. Fortunately, Computer Science and Programming Contests are interesting enough to keep me motivated and practicing.</p>

<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
I have learned to code faster and with less bugs, and also learned many things about the STL I did not know before, which allows me to code simpler and faster at my work. Also, I have learned some mathematic stuff I did not know before, which helps me understand many algorithms. Finally, TopCoder had help me to be more focused when doing things, because when you are in a competition you have to be really focused to obtain good results (as everything in the life).</p>

<p><strong>What advice would you give to someone just starting out?</strong><br />
Here are some advices I would give:
<ul>
    <li>Try some practice problems first, the mechanic of TopCoder is very different from other competitions (in fact, it is easier).</li>
    <li>Try the plugins offered in the site. It is a lot more comfortable to code, compile, test and try things at a local enviroment suited to you than in the arena. I personally use FileEdit + CodeProcessor2 + moj, use Visual Studio 2008 Express IDE and compiler, and use the STLport library when running in Release mode (the STL included with VS is a bit slow).</li>
    <li>Practice a lot, but practice well. If you can solve all DIV2 Easy and Mediums but fail to do the Hards, do not fear them, try to solve them in the practice room, and if you get stuck, see other coders solutions or the match editorial (but always try it first for yourself, and if you are going to try another coder's solution, try to understand the logic behind it and why it works).</li>
    <li>The challenge phase is nice and cool, but that does not mean that you have to challenge. If you are not sure about what you are doing, just skip the challenge phase, and try them in the practice rooms.</li>
    <li>Finally, compete in many SRMs as you can. You lose nothing by participating, and allows you to compare yourself against other people.</li>
</ul></p>

<p><strong>What is the biggest contributor to your progress this month?</strong><br />
I have been organizing a local contest, and by writing and testing some problems I have improved my ability to prove solutions, find bugs, and corner cases, etc.. Also, I finished my bachelor's seminar this month, and that allowed me to study and practice more for TopCoder and the Google CodeJam. Finally, my girlfriend have been very suportive with TopCoder and Programming Contests, she is always willing to hear about why my 500 pointer failed and my failed challenges, to the point of receiving calls at 11pm to speak with her about the last SRM.</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
When I make a failed challenge, and then my solutions get challenged or fail the system tests. At that point, I have a negative value and nothing to do to fix it (except practicing more to prevent that to happen again).</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
I work at a Computer Graphics Center in my university, play Guitar Hero III against my "little" brother (which I will never defeat, he is too good for me), visit my aunt and grandparents, and hang out with my girlfriend and friends. It is very important to always have contact with other humans, being in front of a computer too much time is not healthy.</p>

<p><strong>What sights are there to see in your area?</strong><br />
In Venezuela we have mountains, plains, beaches, deserts, a lot of beautiful places to travel. Unfortunately, I had no camera until 2 years ago, and since 2 years ago I had been unable to travel outside the city and take photos.</p>

<p><strong>What foods are there to taste in your area?</strong><br />
Food, I should have included that in the "fun outside of TopCoder" question. Here, in Venezuela, we have a lot of different, delicious food, but it is very hard to explain that in english, people would have to come and taste it to know.</p>
<br />


<p><div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="woodjhon, June's Design Coder of the Month" />
</div>
<a href="/tc?module=COMHistory&amp;achtid=6">Design</a>: <tc-webtag:handle coderId="9981727" context="design" /><br />
Four 1st places wins<br />
One 2nd place win<br />
&nbsp;
</p>

<p><strong>What brought you to TopCoder?</strong><br />
My friend introduced me to TopCoder.</p>

<p><strong>What is your proudest TopCoder moment?</strong><br />
My first development competition win.</p>

<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
The timezone. USA and China have different timezones(12 hours).</p>

<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
Try to make things perfect and you might win.</p>

<p><strong>What advice would you give to someone just starting out?</strong><br />
Learn from experienced designers and try best.</p>

<p><strong>What is the biggest contributor to your progress this month?</strong><br />
Spend much more time on less design components.</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
When I am wating the review score or when my reviewers are late:).</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
Swimming, travelling</p>

<p><strong>What sights are there to see in your area?</strong><br />
West Lake</p>

<p><strong>What foods are there to taste in your area?</strong><br />
Beggar's Chicken and DongPo Pork</p>
<br />


<p><div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="BeBetter, June's Development Coder of the Month" />
</div>
<a href="/tc?module=COMHistory&amp;achtid=7">Development</a>: <tc-webtag:handle coderId="22630348" context="development" /><br />
Five 1st places wins<br />
Five 2nd place wins<br />
&nbsp;
</p>

<p><strong>What brought you to TopCoder?</strong><br />
Found TopCoder by accident when I tried to search some sites on algorithms</p>

<p><strong>What is your proudest TopCoder moment?</strong><br />
Not yet arrived :)</p>

<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
N/A</p>

<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
There is always something you can learn.</p>

<p><strong>What advice would you give to someone just starting out?</strong><br />
Don't be afraid to lose and try it out first.</p>

<p><strong>What is the biggest contributor to your progress this month?</strong><br />
My family supported/allowed me to spend a little bit more time on this month which gave me chance to do more.</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
Lost a competition by one careless mistake.</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
Watch football and play basketball.</p>

<p><strong>What sights are there to see in your area?</strong><br />
DC museums, the White House, Great Fall and a lot others.</p>

<p><strong>What foods are there to taste in your area?</strong><br />
I just stick to some Asia food. I would recommend spicy SiChuan food and Thai food or some Korea BBQ.</p>
<br />


<p><div class="authorPhoto">
    <img src="/i/m/djackmania_big.jpg" alt="djackmania, June's Studio Designer of the Month" />
</div>
Studio Design: <tc-webtag:handle coderId="22690288" /><br />
Won 8 contests, for a<br />
total of $3950! <br />
&nbsp;
</p>

<p><strong>What brought you to TopCoder?</strong><br />
<tc-webtag:handle coderId="22076237" /> brought me to TopCoder. Thanks bro :)</p>

<p><strong>What is your proudest TopCoder moment?</strong><br />
TCO'08 finalist and got the email: <strong>Congratulations From TopCoder Studio!</strong></p>

<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
Lack in coding and scripting, maybe next time :)</p>

<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
Do everything as soon as possible... If you don't you will have lost the great chance (TC version: Error - Inactive contest specified.)</p>

<p><strong>What advice would you give to someone just starting out?</strong><br />
3P+p: <strong>Practice</strong> make <strong>Perfect</strong> with <strong>Passion</strong> and don't worry you'll get <strong>paid :)</strong></p>

<p><strong>What is the biggest contributor to your progress this month?</strong><br />
TC admins, other TC members, thanks all</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
Email subject in my inbox: <strong>Your TopCoder(R) Studio submission failed review</strong> :(</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
Keep browsing around</p>

<p><strong>What sights are there to see in your area?</strong><br />
All of Indonesia is <a target="_blank" href="http://www.my-indonesia.info/">dangerously beautiful</a>... </p>

<p><strong>What foods are there to taste in your area?</strong><br />
<a target="_blank" href="http://didats.net/page/makan-bebek-goreng-kayu-tangan/">Bebek Goreng</a>, Rawon Setan, Soto Ambengan, Sate ... </p>
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
