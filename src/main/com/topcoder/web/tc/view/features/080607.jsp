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
    <tc-webtag:forumLink forumID="516867" message="Discuss this article" />
</div>

<span class="bigTitle">An Interview with kalinov</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/rajeshrathod_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="21620711" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>The first thing that I decided to do when I heard about the TCO blogging contest earlier this year was to contact <tc-webtag:handle coderId="310333" context="algorithm"/> and request an interview. I did have a chance to converse with him on <a href="http://0nlyhuman.blogspot.com/2006/12/there-is-difference-between-knowing.html">my blog</a> before, but this time I wanted to get a little more in-depth. While the shorter version of this interview didn't win the blog contest, I hope that you find the full interview enjoyable, at least &ndash; without further delay, here are some insights into <tc-webtag:handle coderId="310333" context="algorithm"/>&rsquo;s life, both in TopCoder and in general.</p>
<p><strong>Q: Tell me a little about yourself and your background. </strong></p>
<p>A: Well, it's very hard to put your life in few sentences, and to speak about yourself in general. I was born and raised in Zagreb, Croatia in an average non-wealthy family. I spent most of my childhood playing football (soccer) and all the other sports and games in the nearby park, and even in that early time of my life I was never good at school (except in math) because it was boring and I was lazy. I also trained in judo for two years and played field hockey for four years in that period of my life. </p>
<p>I started programming in BASIC at the age of 13, mostly some simple programs and games. I entered my first informatics contest in 8th grade (which is quite late nowadays for contestants in Croatia; they start much earlier now). In high school I met my first friends for life and I enjoyed many great moments with them. I got even worse in school,  with teachers always accusing me of being lazy, but I didn't really care about my grades and they were always a low priority for me. At that time I started to solve algorithmic problems, and it was really fun and challenging, so it became my primary hobby. I also started to play guitar and started going to rock concerts. Because of the change in lifestyle (I stopped doing sports and spent most of my time sitting at my computer,  playing guitar or just hanging out) I gained a lot of weight. :-) </p>
<p>While I was in high school I always expected that college would be something great and interesting , but when I got there it seemed like pretty much the same as high school and I didn't like it. Well, I guess I got disappointed, so I stopped attending classes and exams and I spent that year just enjoying life and blowing off steam. That brings us to the present day. You could say I've gotten a little bit more serious. I'm in my fourth semester and I'm passing my courses with no problem -- I even have good grades for the first time in my life! Nowadays I enjoy riding a bike and I go everywhere with it, and I even lost some weight recently. I still try to spend as much time with my friends as much as I can, because that's the most important thing in life for me.<br />
  <br />
<strong>Q: Many must consider you a national hero. How does it feel to represent your country at such a level?</strong></p>
<p>A: I'm very far from being a national hero. I'm always proud to represent my country, but I'm really not widely recognized for what I am. </p>
<p><strong>Q: When did you write your first computer program? What made you get started?</strong></p>
<p>A: I wrote my first program when I was about 13 years old. My dad showed me some basics, and the rest I learned mostly on my own by experimenting.<br />
  <br />
<strong>Q: What's your approach to an SRM?</strong></p>
<p>A: I try to get as calm as I can, and not to be hasty when reading the problem. I usually take a quick look at my problem before submitting, and then one more look after submitting. I often challenge some solutions just because the problem was hard for me, so I hope it was also hard for others.</p>
<p><strong>Q: What are your favorite types of problems, or the particular problems you've enjoyed the most? </strong></p>
<p>A: I guess my favorite types of problems are the ones that require a bit of insight and then a lot of code to make it work. I like <tc-webtag:handle coderId="269554" context="algorithm"/>'s <a href="/tc?module=ProblemArchive&sr=&er=&sc=&sd=&class=&cat=&div1l=&div2l=&mind1s=&mind2s=&maxd1s=&maxd2s=&wr=Yarin">problems</a> the most. My favorite TopCoder problem is <a href="/stat?c=problem_statement&pm=2940">StarAdventure</a> because it gave me my first SRM win, and the favorite problem that I have created is probably Connect from CEOI 2006.</p>
<p><strong>Q: What would you say your biggest strengths and biggest weakness are, both as a person and a coder ?</strong></p>
<p>A: I guess my biggest strength is that I learned to remain reasonably calm in stressful situation. My biggest weakness is my laziness.</p>
<p><strong>Q: What are your favorite areas in CS and Math?</strong></p>
<p>A: I like computational geometry and number theory.</p>
<p><strong>Q: What websites do you visit most often?</strong></p>
<p>A: I go to <a href="http://www.last.fm">last.fm</a> to see what music my friends are listening to at the moment, and <a href="http://www.teamliquid.net">teamliquid.net</a> to see what's new on the Korean Starcraft pro scene.</p>
<p><strong>Q: What kind of music do you listen to? For that matter, what's your favorite movie, and favorite food? </strong></p>
<p>A: I listen to various types of music and my favorite artist changes quite often. Right now I prefer some light jazzy music in the background with a soft female voice in the front (Norah Jones and Katie Melua, for example). Check out my last.fm account <a href="http://www.last.fm/user/kalinov">here</a>. My favorite movies are "Forrest Gump" and "La vita e Bella," and my favorite food is <a href="http://en.wikipedia.org/wiki/Sarma_(food)">Sarma</a>.</p>
<p><strong>Q: Except for a few technical posts, you don't seem to participate too much in the TopCoder forums. Any reason why?</strong></p>
<p>A: That's correct. Although I read the TopCoder forums often, I rarely post there. I guess I have nothing to say, or when I would like to say something I don't feel like translating it in English, so I just give up. You can also say I am a bit of silent person; I prefer to listen , and I don't usually discuss my views openly in bigger groups , I guess.</p>
<p><strong>Q: What are your hobbies apart from programming?</strong></p>
<p>A: Riding my bike, listening to music, reading some forums and chatting with friends, and going out sometimes.</p>
<p><strong>Q: What do you daydream about?</strong></p>
<p>A: I don't know &ndash; there's nothing particularly interesting about my daydreams. I think about things like traveling the world, meeting people and exploring cultures. It's not all about TopCoder &ndash; I don't fantasize about beating targets at the TCO.</p>
<p><strong>Q: OK &ndash; but if there was one person that you really would love to beat at an SRM, or an on-site event, who would it be?</strong></p>
<p>A: It's <tc-webtag:handle coderId="10574855" context="algorithm"/>, of course. :-) <br />
</p>
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
