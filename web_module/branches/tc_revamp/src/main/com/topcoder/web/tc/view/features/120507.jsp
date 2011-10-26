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
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <tc-webtag:forumLink forumID="518456" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Know your hero: myprasanna</span>
<br /><br />
<div class="authorPhoto">
    <img src="/i/m/marutib_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="22685759" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>This issue of the 'Know Your Hero' interview series features M.Y. Prasanna (TopCoder handle: <tc-webtag:handle coderId="13366203" context="algorithm"/>). Prasanna has a credit of becoming the third Indian to have ever become a red-rated member in TopCoder. He joined TopCoder in 2005 for Algorithm Competitions and has never looked back since then. His dream run of becoming a red, the best rating in TopCoder, started from <a href="/stat?c=round_overview&er=5&rd=10765">SRM 356</a> and he paved his way to his dream constantly since then. His dream came true with <a href="/stat?c=round_overview&er=5&rd=10781">SRM 366</a>. He is currently credited with being the third highest rated Indian in TopCoder and he was also the TopCoder Algorithm Coder of the Month for August 2007.</p>

<br />
<p><strong>Q: When did this programming bug bite you? </strong><br />
A: I didn't code much during 11th grade and all that, in fact I failed very often. :) I wasn't very interested as it all looked very artificial. I had then read a library book called <em>Writing TSR through C</em>, which was my first ever computational book, and it had used an extremely appealing delivery tone, and was about "mysterious" things as the author claims. It was too heroic and appealing to a 16-year old. I read it all night and finished that book and I somehow found I could relate stuff across the book. And this made me think systems are more to do with logical "guessing" (as none cannot know all) and they have hidden things to hunt for, much the way the real world has. The better part is that these things are completely created by humans, that guessing is much like "Had I written it, how would I have done it?". It had me very interested, and for the next year, I spent time without any general "goal". I broke copyright notices of various software, I wrote multi-tasking API's on top of DOS, and even fixed parts of the DOS kernel to let it be re-entrant. I read huge documentation of how the Pentium processors managed to do interleaved execution. All without any purpose.</p>
<p><strong>Q: What attracts you in TopCoder? </strong><span style="float:right; padding:10px;"><img style="height:140px; width:126px; border:1px solid #cccccc;" src="/i/m/myprasanna_big2.jpg" /><br /><span style="padding-left:25px"><tc-webtag:handle coderId="13366203" context="algorithm"/></span></span><br />
A: TC as it claims, makes coding a sport. A quick sport. Though the claim by itself increases high dependence on odds, or luck, or form that day, it's beautiful in its own way. And as odds raise, more have chances, which makes competition more interesting. Also 75 minutes a week never hurts, even in the busiest weeks, so that's what TC has been doing very very well.</p>
<p><strong>Q: What is your proudest moment in TopCoder? </strong><br />
A: Both the Google International CodeJams are great moments for me. In fact in first year of college, I took part in Google India CodeJam and that's when I knew about TC. That was my first "online programming contest" and had made a decent rank of #121 in India. I was encouraged, thinkging that I can somehow make it into the top 50 the next time. Then there was International CodeJam coming; I took it for practice but well I was so excited when I made it onsite. I had to write BFS for the first time, I had heard of it but never written it before. For a problem which seems much simple now, I had then written <strong>queue &lt; vector &lt; string &gt; &gt;</strong> when I am using <strong>queue</strong> for the first time. The code was at least 200+ lines which involved so much copy and paste. I didn't expect it to pass, but well it did. I was very focussed when I wrote that. More amazing than the contest itself were the VISA procedures, etc. I didn't have even a passport then. In fact, I got my VISA stamped 3 hours before the flight! All exciting times then. One other interesting fact was that the age cut-off date for GCJ was my birthday! That makes me sure I'm one of the youngest ever to make it onsite (18 years 0 days old). Some strange kind of luck running there. The Second CodeJam was interesting as well. I had ended up messing up in the contest, though my 500 was a quick submit and then the challenge phase got my first successful challenge (I guess in my TC history). And that was three good challenges. It put me back and I was #107. I had been the last guy to be invited and received my invite a day before the CodeJam. All amazing.</p>
<p><strong>Q: What other hobbies do you have besides programming? </strong><br />
A: I watch movies, so many movies. Last year when the International Film Festival came to Chennai, we watched movies all week, from 8 AM to 10 PM straight. And on campus, movies keep running in our rooms a minimum of twice a week. I also enjoy playing Age Of Empires over LAN. We play cricket, basketball, and table tennis at times.</p>
<p><strong>Q: How did it feel to be the numero uno of India ? </strong></p>
<p>A: I'm really amazed by the amount of life TC can add to these numbers. No one else I've seen can make people take it so serious and that's really great. I ve been floating with performances well above (even my current) rating when my match was good, and below the blue line if I had a bad day. I am very volatile I suppose and hence I don't see these ratings to fit me very well. If not I can't climb so much in so little time. I am nevertheless happy that I am surfing on the high tide. One in India sounded great to me now, though I didn't hold it for as long as I would have liked.</p>
<p><strong>Q: What, according to you, is the future of Indian programmers in TopCoder? </strong><br />
A: India has simply "great" top coders. I don't think a lot of them spend so much time on TC. In particular, the best institutes of India, like the IITs, by themselves are very interesting, intellectually satisfying, and demanding. They are more mathematically inclined, rigorous and do not enjoy writing a lot of code. Also much more opportunities lie on the academic side, when compared to other regions of the world, in my humble opinion.<br /><br />
Naturally men in CMI, IIT, etc, tend to be less involved as they should be. This is the current stand, but anyways i think they can (as they do) make an impact even with little participation over a period of four years. And any extra bit of practice by them can add a lot to our country ranking :)<br /><br />
Also if I am right, India has a large number of TopCoders, much more than any other country. But most of them are low rated. In my humble opinion, there isn't very good algorithmic education in some of the mediocre institutions and most of them got attracted by word of mouth or Google CodeJam. They remain because TC is an interesting sport. They might need to put a lot of time outside the contests to read up on others' code, take the "pain", and slowly improve.</p>
<p><strong>Q: So how do you practice to improve your programming skills? </strong><br />
A: I usually read a lot of code. I practice writing elegant code, and try as much as possible to avoid a copy and paste. I put that extra effort during non-contest times to avoid adding output statements and tracing code. Instead, I read code repeatedly to spot the bug. In my opinion, that habit helps me write large pieces of code at once, which will compile and run fine.</p>
<p><strong>Q: What kind of questions do you like the most? </strong><br />
A: I like a lot of problems that are completely "new" in idea and not "created" with underlying concepts in mind. Such problems stand out, and when you see them, you know that the author has written the problem and then he had been wondering long for its solution. Such are really beautiful to solve and creating them can give an amazing satisfaction.</p>
<p><strong>Q: Do you suggest some tips for beginners? </strong><br />
A: I beleive for beginning in TC and other algorithm contests, the book <em>Cormen/Leiserson/Rivest/Stein: Introduction to Algorithms</em> is a great resource. Other small stuff like STL can be picked up as you keep competing and reading others' code. Yes, the quickest way to improve is to spend time outside the contests reading others' code. Focusing on knowing stuff and programming accuracy can come over time. You don't have to put nor allocate a lot of time for this regularly; when you really have the interest, then a 12 hour strip of work can improve yourself a lot. Interest is the key. Take regular breaks or these things can get monotonous because the amount of improvement in creativity is high during the early learning stages and the learning curve begins to saturate afterwards.</p>
<p><strong>Q: What are your plans for the future? </strong><br />
A: I intend to join Google-MTV in California. I find Google to be a great place for programmers, with so many layers of heuristics operating as daemons, each performing an independent task. Amazing environment for programming, debugging, tracing etc. (Forget the work environment, that's great anyway.) I guess I'll work there, until I think an extra degree is compelling.</p>



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
