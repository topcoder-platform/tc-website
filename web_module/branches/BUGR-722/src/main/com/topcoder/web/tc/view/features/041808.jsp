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
 
<span class="bigTitle">Meet the March 2008 Coders of the Month: PaulJefferys &amp; oton</span>
<br /><br />
<br clear="all">
<p><em>We caught up with <tc-webtag:handle coderId="7394165" context="algorithm" />, March's Algorithm Coder of the Month, and <tc-webtag:handle coderId="22076237" />, March's Studio Designer of the Month, to learn a little bit more about them, their proudest TopCoder moments, and anything else they wish to share with the community.</em></p>

<p><div class="authorPhoto">
    <img src="/i/m/PaulJefferys_big.jpg" alt="PaulJefferys, March's Algorithm Coder of the Month" />
</div>
<a href="/tc?module=COMHistory&achtid=5">Algorithm</a>: <tc-webtag:handle coderId="7394165" context="algorithm"/><br />
SRM 394: 2938<br />
SRM 393: 2854<br />
TCO08 Rd 4: 2763<br />
SRM 392: 2658<br />
<span style="padding-left:68px;">TCO08 Rd 3: 2576</span></p>

<p><strong>What brought you to TopCoder?</strong><br />
I actually found it via googling for coding competitions. I got interested in coding competitions as a result of doing some Informatics contests in school, looked for some other contests on the internet, and TC ended up being the first google hit for whatever it was I was searching for!</p>
 
<p><strong>What is your proudest TopCoder moment?</strong><br />
Winning Marathon match round 3 of the TCCC last year was fairly neat. Also, back in the days when everything was at 9p.m. Eastern, I think it must have been TCO '06, I went out clubbing in the evening, came back for the 2a.m. start, spent most of the match sobering up, and qualified with 3 semi-blind challenges. That was pretty awesome too.</p>
 
<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
I really struggled with those old 2:30 a.m. matches; I think one summer there were matches on Monday(GCJ), Wednesday (TCCO) and Thursday(GCJ), and I had to go into work on the Friday after failing my GCJ 500 because I'd typed long Methodname(params...) rather than long long Methodname(params...). I don't think that was a very productive day.</p>
 
<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
TC competitions definitely incentivise you to write bug-free code, which helps massively any time you're writing code ever really. I did particularly well in the informatics olympiad in '04 mainly because all my code worked in the way that I intended it to work, whereas in previous years it just didn't.</p>
 
<p><strong>What advice would you give to someone just starting out?</strong><br />
Practice loads, and look at other guys' code. They often have neat ways to use the STL to really cut down on the number of characters you have to type. I also reckon that trying to learn millions of algorithms really isn't the way forward- I always feel that using DP is much more about having the right mindset than having learnt some CS definition that doesn't really make sense anyway, and most of the graph algorithms that people use are just a case of doing the natural thing. Sure, you can look at some algorithms, but try and understand how they work, rather than memorize one implementation of them. Then, when the time comes to use them you'll understand them well enough to be able to see how they relate to the particular question at hand, rather than trying to figure out how your one particular implementation of this thing which you don't really understand anyway, is going to relate to the thing you're trying to do now.</p>

<p><strong>What is the biggest contributor to your progress this month?</strong><br />
Probably the fact that I was coming back from a blip in the previous months helped. As did getting some challenges in:) And my girlfriend is very understanding of my TC habit, which certainly helps.</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
Any time my code fails is pretty stressful, particularly when I reckon it'll work. TCCC Algo round 3 last year was fairly horrible, I pasted in some bipartite matching code for the 250 but then passed it the wrong arguments, and then on the 500, enumerating through all bitmasks of length 3, I wrote for(i=0; i&lt;7, i++). I mean, how stupid do you have to be? I was also fairly unimpressed when I deleted a line of code without realizing it in the process of commenting out the debug output on my 500 in SRM 397.  Oh, and I also hate it when I'm debugging the 1k with 15 minutes to go; with high probability I'll get nowhere for 14.5 minutes, and then get somewhere (but not all the way there) with 30 seconds to go.</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
Other coding contests? I'm really looking forward to this year's IPSC. Seriously, in real life I'm doing a grad course in Mathematics at the University of Cambridge, and trying to decide whether I want to do a PhD or become an algorithmic trader next year. I also play Eton Fives (a very random English game) tolerably badly:)</p>

<p><strong>What sights are there to see in your area?</strong><br />
Well, like there's Cambridge. I've attached some shots of Trinity College.</p>
<p align="center"><a target="_blank" href="/i/education/feature041808_pj01.jpg"><img style="border:1px #cccccc solid;" src="/i/education/feature041808_pj01thumb.jpg" alt="Trinity College thumbnail" /></a>&nbsp;<a target="_blank" href="/i/education/feature041808_pj02.jpg"><img style="border:1px #cccccc solid;" src="/i/education/feature041808_pj02thumb.jpg" alt="Trinity College thumbnail" /></a></p>

<p><strong>What foods are there to taste in your area?</strong><br />
Britain isn't really famed for its cuisine. But my mum makes the best Fajitas in the world, and her marinade for Barbecue chicken is pretty awesome.</p>
<br />

<p>
<div class="authorPhoto">
    <img src="/i/m/oton_big.jpg" alt="Author" />
</div>
Studio Design: <tc-webtag:handle coderId="22076237" /><br />
Won $2,100 in three contests<br />
<br /><br /><br />
</p>

<p><strong>What brought you to TopCoder?</strong><br />
I knew TopCoder from a news that featured <tc-webtag:handle coderId="7459080" context="algorithm"/> as a winner of Google Code Jam India. I joined as a member on 2006, but realized not having good time (and skills) to compete. Later, when Studio is being introduced, that's the time.</p>
 
<p><strong>What is your proudest TopCoder moment?</strong><br />
It is when I won the first wireframe design contest of <a href="http://studio.topcoder.com/?module=ViewContestResults&amp;ct=2059">TopCoder Registration Tool Wireframe</a> and later when I won <a href="http://studio.topcoder.com/?module=ViewContestResults&amp;ct=2192">TopCoder Icon Design Contest Phase III</a>. The first is because my first winning on TC. The second is because I finally grabbing TCO08 point from design track and save my position on the leaderboard.</p>
 
<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
First, I was not a true designer. I realized that. I was a programmer, but in my work, I was much in trouble with design job. I think I should learn and exercise more to being a designer at heart.</p>
 
<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
Competing with other good and talented people. It's like to set yourself into a world standard, and it's very challenging because its push you to be at your best. And, as far as I know, the communities proves that we all became our best on every tracks we did.</p>
 
<p><strong>What advice would you give to someone just starting out?</strong><br />
I felt I was not a good person to give advice. But, let's face this. Never give up. When you are loses, don't feel you are wasted your effort (and time). Being a competitor is a good way to learn (and exercise your skills), and have a chance to get real cash.</p>
 
<p><strong>What is the biggest contributor to your progress this month?</strong><br />
My wife, Yani. She was very supported to give me the time to do projects I involved.</p>

<p><strong>What is your most stressful TopCoder moment?</strong><br />
It was when I did and won the <a href="http://studio.topcoder.com/?module=ViewContestResults&amp;ct=2106">triple</a> <a href="http://studio.topcoder.com/?module=ViewContestResults&amp;ct=2105">Event &amp; Athlete Database</a> <a href="http://studio.topcoder.com/?module=ViewContestResults&amp;ct=2107">Prototype contest</a>. You got two weeks to prototype 100 pages with so detailed and complex user interface. Not only the prizes is very very good. But, I think you will never meet such opportunities again in TC. And, nobody submit the complete solution but  me :-)</p>

<p><strong>What do you do for fun outside of TopCoder?</strong><br />
Because I was fulltime to TopCoder, doing work at home is very challenged, because my daughter Sofia always trying to steal a moment sneaking into my room, and ask me to play with her. When this happened, I got no choice other than playing Dora's game, watching her baby's videos with iMac remote on hand. And, after some minutes, my wife saved me by bringing out the fun out of my 'cave' :-)</p>

<p><strong>What sights are there to see in your area?</strong><br />
<a target="_blank" href="http://www.flickr.com/photos/arw/2385780223/">Ulun Danu Temple, Bali</a><br />
<a target="_blank" href="http://www.flickr.com/photos/arw/2385785535/">Tanah Lot Temple, Bali</a><br />
<a target="_blank" href="http://www.flickr.com/photos/arw/307535256/">Bontang Koala, East Kalimantan</a>, a village above <a target="_blank" href="http://www.flickr.com/photos/arw/307545676/">the sea</a></p>

<p><strong>What foods are there to taste in your area?</strong><br />
Indonesia is a heaven of tasty food, although for some western that will be some troubles because spicy and hot tastes. And, with the near availability of fresh ingredients and indigenous techniques, our diverse cuisine is worthed to try. My favorite food is <em>pecel pincuk</em>, some fresh and boiled vegetables served with peanut sausage, it is eaten on banana leaves (pincuk). See <a target="_blank" href="http://www.flickr.com/photos/pinodita/1406928847/in/set-72157600854594857/">photos</a>, courtesy of <a target="_blank" href="http://last-bite.blogspot.com/">last-bite.blogspot.com</a>.</p>
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
