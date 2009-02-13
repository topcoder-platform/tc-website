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
    <tc-webtag:forumLink forumID="517221" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Our favorite professors: TopCoder staff look back</span>
<br /><br />
<br clear="all">
<p><em>With the 2007 TopCoder Collegiate Challenge's <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=professor&d4=description">Prestigious Professor Program</a> now underway, we asked some TopCoder staffers to reflect on their favorite and most influential professors. Who is your favorite teacher? <a href="/tc?module=TCCC07ViewProfessorNomination&eid=2999">Tell us about them</a>, and you could win a trip to the TCCC07 finals at Walt Disney World. </em></p>

<br />
<div class="authorPhoto">
    <img src="/i/m/mktong_big2.jpg">
</div>
<div class="authorText">
    <tc-webtag:handle coderId="129063" context="algorithm"/><br />
    <em>Software Developer</em>
</div>
<br clear="all">
<p>
Two of the professors who influenced and inspired me the most at Stanford were <a href="http://en.wikipedia.org/wiki/Daphne_Koller">Daphne Koller</a> and <a href="http://robotics.stanford.edu/~serafim/">Serafim Batzoglou</a>. Both are computer science professors; Dr. Koller specializes in artificial intelligence, and Dr. Batzoglou's focus is computational molecular biology. I performed research in Dr. Koller's summer program and took two courses from Dr. Batzoglou.
</p>
<p>
Dr. Koller is a world-class researcher (and recipient of the MacArthur &quot;genius&quot; fellowship). She exhibited the highest commitment to both teaching and research even at the undergraduate level, annually coordinating Stanford's summer program for undergraduate CS research. She provided a rare level of accessibility to committed students. Her research group covered interdisciplinary fields such as game theory, linguistics, gene expression, and computer vision. She also helped students connect with other luminaries in academia.
</p>
<p>
Dr. Batzoglou brought challenging concepts and models of biological computation to life during his animated lectures and intense small-group seminars. He was able to translate many algorithmic concepts - dynamic programming, suffix trees, Markov models, etc. He also emphasized that students produce notes and present lectures for the entire class to learn from and critique, an invaluable (though sometimes daunting) experience.
</p>

<br />
<div class="authorPhoto">
    <img src="/i/m/cjoakes22_big.jpg">
</div>
<div class="authorText">
    <tc-webtag:handle coderId="22686746"/><br />
    <em>Event Coordinator</em>
</div>
<br clear="all">
<p>
The best professor I ever had was Aaron Brenner. He was my English professor. Our personalities and opinions could not be any more different -- he was extremely opinionated and liberal, and I was conservative and very good at keeping my opinions to myself. He required us to keep journals, and I had never done anything like that before. Writing everyday forced me to think about things more closely, and be more creative, than I ever had before. In time, I grew to really like him as a person and to respect him as a teacher. I learned so much about the world that I would have never thought to consider before. After starting off not sure if I was in the right room, by the end of the semester I was very happy to be able to sign up for another class with him. We still chat by e-mail, more than a year later. 
</p>

<br />
<div class="authorPhoto">
    <img src="/i/m/TimStevens_big.jpg">
</div>
<div class="authorText">
    <tc-webtag:handle coderId="133700"/><br />
    <em>Component Architect</em>
</div>
<br clear="all">
<p>
My most influential professor when it comes to software engineering was Dr. Gann, not so much for what he taught me as what he didn't. The school, Hartwick College, is a small one and is focused on liberal arts. While it offered a very diverse class selection on a variety of topics, it didn't necessarily delve into every facet of coding, or at least didn't while I was there.
</p>
<p>
Since what I wanted to learn wasn't in the curriculum, Dr. Gann was very open to letting me take a string of independent studies. For example, Java was just being released by Sun when I was a sophomore, but the school was still requiring COBOL. Dr. Gann organized an independent study to learn Java, which was not only a lot of fun (my friends and I coded a Tetris-style applet) but really suited my personal learning style, since I'd taught myself C++ while in high school.
</p>
<p>
From there I went on to do a number of other independent studies in things like DirectX and the flavor of assembler used by Sega for their VMU handheld gaming system. I ultimately decided to not get into professional game development, the track I'd made for myself while I studied there, but the flexibility Dr. Gann gave me in learning new things definitely encouraged me to continue my self-starting attitude, which has been very helpful in my career.
</p>

<br />
<div class="authorPhoto">
    <img src="/i/m/jmpld40_big.jpg">
</div>
<div class="authorText">
    <tc-webtag:handle coderId="14999860"/><br />
    <em>Event Manager</em>
</div>
<br clear="all">
<p>
I had a professor in college who was awesome! The class was History and Theory of Rhetoric. Anyone looking at the title would assume it&rsquo;s a boring, ridiculous course &ndash; but, of course, it was also a required one. In the first few weeks, I was utterly lost, and my first paper was horrifyingly bad. I went to talk to her about my paper and to see how I could succeed in her class. She gave me a personal tutoring session right then and there, and somehow broke through my mental fog &ndash; I actually got it! From then on my grades got better and better. She was such an animated professor, she would literally bang her head on the chalkboard to get her point across. It was amazing how far she went to make us learn. Rhetoric may not be my strongest subject, even still, but I've never learned more in a class than I did from her.
</p>

<br />
<div class="authorPhoto">
    <img src="/i/m/kzimmerman_big.jpg">
</div>
<div class="authorText">
    <tc-webtag:handle coderId="21196141"/><br />
    <em>Editor</em>
</div>
<br clear="all">
<p>
I never took a class with my favorite professor. Instead, he was a resident professor in my dorm. Though older than us, and a professor, he was more than happy to hang out in the dining hall and talk about &ndash; well, whatever. He taught American History, and he brought an amazing intellectual spark to our conversations, about everything from politics and history to the NCAA Final Four and the early films of Arnold Schwarzenegger. Toward the end of my senior year, I took him out for coffee and talked through my dilemma &ndash; I had just realized I didn't want to go to law school, and wanted to work as a writer. And, bless him, he was honest with me: writing is hard, lonely work, and it rarely pays well (if at all). He gave it to me straight, and quickly disabused me of any romantic notions of starving-artistry that I might have had. That one conversation did more to prepare me for the real world than most of my coursework. Though I still cringe when I hear about the astronomical salaries first-year associates are making at big law firms, I'm convinced that he helped me make the right decision, and to make it with my eyes open.
</p>

<br />
<div class="authorPhoto">
    <img src="/i/m/AssertionsOn_big.jpg">
</div>
<div class="authorText">
    <tc-webtag:handle coderId="7442703"/><br />
    <em>Component Architect</em>
</div>
<br clear="all">
My favorite professor back in the good ol' days of college at Auburn University was <a target="_blank" href="<tc-webtag:linkTracking link='http://hubscher.org/roland/' refer='083107'/>">Roland H&uuml;bscher</a>. New students feared him, yet experienced students loved him because of his challenging teaching style and antics. If you messed up, he would call you out in front of everyone and make you feel ignorant, but then he would gracefully praise you once you grasped the concepts. He was always pushing the learning limits of his students and always made you think &quot;out of the box.&quot; Plus, every Friday night, he would take all the willing ACM members to the local bar to relax and get to know each other. It was nice to have such a great teacher who wasn't afraid to hang out with you and shoot the bull.
</p>

<br />
<div class="authorPhoto">
    <img src="/i/m/polgara_big2.jpg">
</div>
<div class="authorText">
    <tc-webtag:handle coderId="153650"/><br />
    <em>Project Manager</em>
</div>
<br clear="all">
<p>
It's hard to pick just one favorite teacher, especially when I think about who has influenced me the most. One of my favorite professors was definitely my Victorian English professor. He was not afraid to show emotion or be human in class -- he even sang versions of Gilbert and Sullivan's songs, including &quot;Modern Major General,&quot; to show us that Victorian prose was not a dead thing, but something that could be appreciated from both an academic perspective and a fun, artistic one. He taught me the power of words -- which is interesting to me, given the environment we all work in, where numbers, programming, and logic are seemingly given a higher priority.&nbsp; He also taught me not to be afraid to be true to myself. Unlike the stereotypical stuffy, distant professor, he was warm and down-to-earth, and was beloved by students for it.
</p>
<p>
My most influential teacher, however, was my mother, who taught me how to read and do basic math before I went to school at 5. She believed that children absorb the most between the ages of 1 and 5 &ndash; that by the time most kids began their formal education those valuable foundation-laying years were lost.&nbsp; She also made learning fun. I can still remember her button and match-box collection, which is how she taught me the basics of addition, subtraction, multiplication and division. For multiplication, for instance, I would put 3 buttons of one color into 4 boxes, then empty out all the boxes into a pile and count the total (that's right: 3 times 4 equals 12).&nbsp; It helped not only to prepare me for the multiplication tables, but it taught me to understand the concepts behind the math. To this day, I think of learning as being &quot;fun.&quot; It is the best of many gifts I've had from my mum.
</p><br />
<p>&nbsp; </p>
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
