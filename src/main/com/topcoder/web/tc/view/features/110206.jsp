<%@ page contentType="text/html;charset=utf-8" %> 
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>

<style type="text/css">
div.photo
{
border: 1px solid #CCCCCC;
float: left; 
margin: 0px 10px 10px 0px;
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
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="506168" message="Discuss this article" />
</div>

<span class="bigTitle">TCCC Preview: China Steps Up</span>
<br><br>

<div class="authorPhoto">
    <img src="/i/m/kzimmerman_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="21196141" /><br />
      <em>TopCoder Staff</em>
</div>

<br clear="all">

The 2006 Collegiate Challenge will play host to 13 coders from China, occupying seven slots among the Algorithm semifinalists, one in the Design finals, and six in the Development finals (with <tc-webtag:handle coderId="10425804" context="algorithm"/> competing in both Design and Algorithms). This number is not just greater than the number of Chinese coders at the 2005 TCCC; it's 30% more than the number of Chinese coders at the 2005 TCCC, 2005 TCO and 2006 TCO combined. 
<br />
<br />
How did they do it? We asked some of the Chinese coders coming to the TCCC for their insights into what's working  how their schools and peers have helped, and why their numbers are up so much this year. We also asked what they would like to see change, if anything, in the way their schools prepare coders for competition. Here are their answers, along with a brief look at the universities they call home: <br />
<br />
<span class="subtitle">TsingHua University</span><br />
Founded in 1911, the original mission of TsingHua University was to prepare Chinese students for continuing study at American colleges. Now it's preparing them to beat students at American colleges, and just about everywhere else, without having to leave Beijing (except, that is, for tournaments). With a school rating over 2250, TsingHua is the second-highest ranked school in TopCoder, behind only Warsaw University. Situated on former royal gardens of the Qing Dynasty in northwest Beijing, Tsinghua University is home to roughly 20,000 students, including 12,000 undergraduates, 6,200 master's degrees candidates and 2,800 doctoral candidates. Competitors from TsingHua include:
<br /><br />
<div class="photo"><img src="/i/m/OpenGL_big2.jpg"></div><tc-webtag:handle coderId="15206296" context="algorithm"/><br />
Algorithm semifinalist<br />
TsingHua University
<br /><br />
<tc-webtag:handle coderId="15206296" context="algorithm"/> credits his schools participation in, and training for, the ACM/ICPC tournament with helping to jumpstart TopCoder participation. He also points out a practical reason for why Chinese coders may be doing better:
<br /><br />
"The network. There is a really poor network in China (especially in universities). We always used to get dropped just when we wanted to submit&#8230; but now, is there an TopCoder web server in China? It's gotten a little better."
<br />
<br />
<div class="photo"><img src="/i/m/Macsy_big.jpg"></div><tc-webtag:handle coderId="11771960" context="algorithm"/><br />
Algorithm semifinalist<br />
TsingHua University
<br /><br />
Like many competitors, <tc-webtag:handle coderId="11771960" context="algorithm"/> got his start thanks to a friend. "I was referred by my schoolmate, <tc-webtag:handle coderId="7433858" context="algorithm"/>. He told me what TopCoder is and how to compete." 
<br /><br />
Regarding the number of Chinese coders at the TCCC, <tc-webtag:handle coderId="11771960" context="algorithm"/> credits it to better awareness of TopCoder, in general: "I think it is because of more and more Chinese students knowing about TopCoder algorithm competition."
<br />
<br />

<span class="subtitle">The Institute of Software, Chinese Academy of Sciences</span><br />
The Institute of Software at the Chinese Academy of Science (ISCAS) is a leading research institute in China, focused on the fundamental theories of computer science as well as software technologies and their applications. ISCAS offers Ph.D. and master programs in computer science and software technology, as well as master program in pure mathematics. Currently, there are about 400 graduate students.
<br /><br />
<div class="photo"><img src="/i/m/kakarotto_big.jpg"></div><tc-webtag:handle coderId="20256177" context="development"/><br />
Development finalist<br />
Institue of Software, Chinese Academy of Sciences 
<br /><br />
What would <tc-webtag:handle coderId="20256177" context="development"/> change about his university? "I'd like it to reduce the quantity of homework and exams! I think students should have more time to think by themselves freely; I feel limited and uncomfortable when there are so many exams."
<br /><br />
When asked why Chinese student have performed better in this year's TCCC, <tc-webtag:handle coderId="20256177" context="development"/> shows his true colors  TsingHua purple and white. "I think it is mainly because there are many students from Tsinghua University, which is the best university in China, joining the TCCC this year. They have done a great job. I am also a graduate of Tsinghua, though I am now taking my Master's study at Chinese Academy of Sciences."
<br />
<br />

<span class="subtitle">Zhejiang University</span><br />
Seven hundred miles away from Beijing, in the coastal city of Hangzhou, is Zhejiang University. Founded in 1897, it is one of the oldest institutions of higher education in China and has consistently ranked among the top universities in the country. More than 40,000 full-time students attend the university, including roughly 25,000 undergraduates, 12,000 students pursuing masters degrees, and 6,000 doctoral candidates. Among them are more than 100 affiliated TopCoder members, who have performed well enough to make ZheJiang the 10th-highest performing school in TopCoder's rankings.
<br />
<br />
<div class="photo"><img src="/i/m/maone_big.jpg"></div><tc-webtag:handle coderId="10425804" context="algorithm"/><br />
Algorithm semifinalist<br />
Design finalist<br />
ZheJiang University
<br /><br />
"I think my schoolmates help me a lot in TopCoder things. We discuss algorithms and components in our campus BBS, and even sometimes have dinner together and talk to each other about TopCoder. There is a TopCoder atmosphere around me, and that makes me not alone. And especially, I want to mention <tc-webtag:handle coderId="286907" context="algorithm"/> at TopCoder. He is the pioneer, and he is our pilot. Although he didn't teach me much hand on hand, I really learn a lot from him, both in knowledge and spirit."
<br />
<br />
We can see Chinese coders play much better and better. The most important reason is that more and more Chinese coders participate in the competitions. Currently, TopCoder's Chinese collegiate members are mainly from Zhejiang University, Zhongshan University, and Tsinghua University. This is only a small part of Chinese universities. And even from just these three universities, there are still many good coders that haven't registered at TopCoder. For example, there are many IOI gold medal winners studying at THU, but as far as I know only a few of them have joined TopCoder."
<br /><br />
<div class="photo"><img src="/i/m/vividmxx_big.jpg"></div><tc-webtag:handle coderId="8375801" context="development"/><br />
Development finalist<br />
ZheJiang University
<br /><br />
"A lot of my classmates helped me, especially <tc-webtag:handle coderId="13324255" context="algorithm"/> who is the monitor of our class. When I started to compete in Component Development contest, I asked him a lot of questions about the contest procedure, the code convention and dependent components' detail (I was too lazy to read the component doc), and he gave me great help. He is my torchbearer on TopCoder Component Development contest."
<br />
<br />
Would he change anything about his education if he could? &quot;I would choose College of Computer Science, Zhejiang University again!"
<br />
<br />
<div class="photo"><img src="/i/m/PMH_big.jpg"></div><tc-webtag:handle coderId="302501" context="algorithm"/><br />
Algorithm semifinalist<br />
ZheJiang University
<br /><br />
"My university, and especially my ICPC teammates, has helped me a lot in succeeding at TopCoder. Actually, it was my teammates who told me about TopCoder in 2002. Later in that year, I registered my topcoder handle&#8230; Pity that there were already no prizes for SRMs at that time&#8230;
<br /><br />
"You may see from my rating history that I participated quite often in the year of 2003. So did my teammates. After each SRM, we discussed the problems and the mistakes we made in that match. It really helped a lot in making rapid progress. Though this happened quite a time ago, my achievement could not have been done without the solid foundation set at that time."
<br /><br />
"Though I don't have the statistics and can't say for certain, I think Chinese students have done better this year mainly because the first Google Code Jam China was held this January. In GCJC, competitors got to know that TopCoder, the provider of the competition platform, is also holding contests on its own website. As a result, many of them (especially those who are or had been IOI or ICPC competitors) began to participate in SRMs. The more Chinese competitors there are, the higher the chances for finalists to be Chinese."
<br />
<br />
<div class="photo"><img src="/i/m/zjq_big5.jpg"></div><tc-webtag:handle coderId="10526732" context="development"/><br />
Development finalist<br />
ZheJiang University
<br /><br />
"My university has a very good history in ICPC contest, and also has our own online judging system (<A href="http://acm.zju.edu.cn">http://acm.zju.edu.cn</A>), which is one of the most successful OJ systems. Many of my schoolmates, and not just those from Computer Science, are very willing to practice their programming skills. That is a part of the reason why there are so many people from our University competing in TopCoder&#8230; There have always been many talented college students here, but they just haven't known that there was a contest like the TCCC. "
<br /><br />
<div class="photo"><img src="/i/m/daiwb_big3.jpg"></div><tc-webtag:handle coderId="8347577" context="algorithm"/><br />
Development finalist<br />
ZheJiang University
<br /><br />
"I'm member of the ACM/ICPC team of our school. My teammates introduced TopCoder to me and taught me how to compete in SRM, and that's where I started my TopCoder life. When I was trying to learn how to compete in component contests, they also offered me a lot of help, or else I would not have known how to get started."
<br /><br />
"In China, there are lots of very very good programmers. You can see that in every year's IOI, as the Chinese team will almost always be the top. This year TCCC has more Chinese coders because more Chinese coder are now familiar with it&#8230; I hope TopCoder holds more activities in China so it will become more and more popular."
<br><br>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170"id="onRight">
         <div id="onBottom">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </div>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
