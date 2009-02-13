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
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
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
    <tc-webtag:forumLink forumID="516138" message="Discuss this article" />
</div>

<span class="bigTitle">TCO Preview: Meet Team Ukraine</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/Nickolas_big.jpg" alt="Author" /> &#160; <img src="/i/m/aussie_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="15635590" /> &amp; <tc-webtag:handle coderId="284038" /><br />
      <em>TopCoder Members</em>
</div>

<br clear="all">

<p>The 2007 TopCoder Open will host six Algorithm semifinalists from Ukraine, with "Team Ukraine" including the six highest rated Algorithm competitors from the country. This is quite an achievement since, at TopCoder's last major tournament (the 2006 Collegiate Challenge) there were only two semifinalists, <tc-webtag:handle coderId="9927526" /> and <tc-webtag:handle coderId="8518361" />, and, prior to that, it had been either <tc-webtag:handle coderId="311170" /> or nobody.</p>

<p>How do they do it? I asked some of the Ukrainian coders who advanced onsite this year about their training schedules and the most common obstacles they encounter. But first, here's a brief look at some of the statistics behind the Ukraine coders.</p>

<p align="center"><strong>Record Book</strong> (as of May 7th 2007)</p>
<div align="center">
   <table cellpadding="0" cellspacing="0" class="stat" style="width:450px; margin-bottom: 30px;">
   <tbody>
        <%boolean even = false;%>
         <tr class="<%=(even ? "dark" : "light")%>">
            <td class="value">First member to reach blue:</td><td class="value"><tc-webtag:handle coderId="279506" /></td><td class="valueC">&#160;</td><td class="valueC" nowrap="nowrap">SRM 85</td>
        </tr>
        <%even = !even;%>
        <tr class="<%=(even ? "dark" : "light")%>">
            <td class="value">First member to reach yellow:</td><td class="value"><tc-webtag:handle coderId="278460" /></td><td class="valueC">&#160;</td><td class="valueC" nowrap="nowrap">SRM 104</td>
        </tr>  
        <%even = !even;%>
        <tr class="<%=(even ? "dark" : "light")%>">
            <td class="value">First member to reach red:</td><td class="value"><tc-webtag:handle coderId="311170" /></td><td class="valueC">&#160;</td><td class="valueC" nowrap="nowrap">SRM 148</td>
        </tr>  
        <%even = !even;%>
        <tr class="<%=(even ? "dark" : "light")%>">
            <td class="value">Highest rating achieved:</td><td class="value"><tc-webtag:handle coderId="311170" /></td><td class="valueC">3025</td><td class="valueC" nowrap="nowrap">TCO'05 R1</td>
        </tr>  
        <%even = !even;%>
        <tr class="<%=(even ? "dark" : "light")%>">
            <td class="value">Max number of consecutive rating increases:</td><td class="value"><tc-webtag:handle coderId="10288909" /></td><td class="valueC">9</td><td class="valueC" nowrap="nowrap">SRM 270-283</td>
        </tr>  
        <%even = !even;%>
        <tr class="<%=(even ? "dark" : "light")%>">
            <td class="value">Max submission accuracy:</td><td class="value"><tc-webtag:handle coderId="311170" /></td><td class="valueC">91.15%</td><td class="valueC">&#160;</td>
        </tr>  
        <%even = !even;%>
        <tr class="<%=(even ? "dark" : "light")%>">
            <td class="value">Max room wins:</td><td class="value"><tc-webtag:handle coderId="311170" /></td><td class="valueC">35</td><td class="valueC">&#160;</td>
        </tr>  
        <%even = !even;%>
        <tr class="<%=(even ? "dark" : "light")%>">
            <td class="value">Most impressive debut:</td><td class="value"><tc-webtag:handle coderId="7428266" /></td><td class="valueC">1910</td><td class="valueC">&#160;</td>
        </tr>  
        <%even = !even;%>
        <tr class="<%=(even ? "dark" : "light")%>">
            <td class="value">Max number of consecutive room wins:</td><td class="value"><tc-webtag:handle coderId="311170" /></td><td class="valueC">5</td><td class="valueC" nowrap="nowrap">SRM 183-190</td>
        </tr>  
        <%even = !even;%>
        <tr class="<%=(even ? "dark" : "light")%>">
            <td class="value">Max rating point gain:</td><td class="value"><tc-webtag:handle coderId="9927526" /></td><td class="valueC">525</td><td class="valueC" nowrap="nowrap">SRM 195</td>
        </tr>  
        <%even = !even;%>
        <tr class="<%=(even ? "dark" : "light")%>">
            <td class="value">Max challenge success (overall):</td><td class="value"><tc-webtag:handle coderId="311170" /></td><td class="valueC">75.56%</td><td class="valueC">&#160;</td>
        </tr>  
        <%even = !even;%>
        <tr class="<%=(even ? "dark" : "light")%>">
            <td class="value">Max challenge success (single match):</td><td class="value"><tc-webtag:handle coderId="278460" /></td><td class="valueC">14</td><td class="valueC" nowrap="nowrap">SRM 217</td>
        </tr>  
        <%even = !even;%>
        <tr class="<%=(even ? "dark" : "light")%>">
            <td class="value">Most rated events:</td><td class="value"><tc-webtag:handle coderId="311170" /> and <tc-webtag:handle coderId="9927526" /></td><td class="valueC">100</td><td class="valueC">&#160;</td>
        </tr>  
        <%even = !even;%>
        <tr class="<%=(even ? "dark" : "light")%>">
            <td class="value">Consecutive SRM appearances:</td><td class="value"><tc-webtag:handle coderId="7448904" /></td><td class="valueC">20</td><td class="valueC" nowrap="nowrap">SRM 177-197</td>
        </tr>  
        <%even = !even;%>
   </tbody>
   </table>
</div>

<p>
<div class="authorPhoto">
    <img src="/i/m/bladerunner_big2.jpg" alt="Author" />
</div><br><br>
<tc-webtag:handle coderId="311170" /><br>
Google employee<br><br>
Other achievements:
<ul>
	<li>ACM ICPC 2003 Bronze</li>
	<li>TCO'03 Algorithm Semifinalist</li>
	<li>TCCC'04 Algorithm Semifinalist</li>
	<li>TCO'06 Algorithm Semifinalist</li>
</ul>
</p>

<p><tc-webtag:handle coderId="311170" /> has been the #1 Ukrainian coder for years. Ukraine owes its place in the Top 10 Countries list (since September 2003 until now) to his performance. </p>

<br>
<p>
<div class="authorPhoto">
    <img src="/i/m/dmytro_big4.jpg" alt="Author" />
</div><br><br>
<tc-webtag:handle coderId="7546003" /><br>
Student of Vinnytsia National Technical University<br><br>
Other achievements:
<ul>
	<li>placed 38 at Google Code Jam 2005</li>
	<li>ACM ICPC 2006 Finalist</li>
</ul>
</p>

<p>Vinnytsia National Technical University is the Ukrainian center of the ACM ICPC tournament, and a school with a longstanding tradition of student competitions (though it has experienced some short-term problems due to team turnover). <tc-webtag:handle coderId="7546003" /> gratefully mentions being able to stay late in the school's computer lab for night SRMs, which he used at the beginning of his TC career. Now he repays his school working with younger students, giving lectures and tutorials on solving contest-specific problems - and on how to receive a USA visa.</p>

<p>As for his TCO success, <tc-webtag:handle coderId="7546003" /> admits that he didn't train for it specially. "I did lots of training during last summer, but I couldn't advance to GCJ or TCCC onsite, perhaps because of overtraining, so I took a break until the TCO. During the tournament itself I tried not to think about it and even didn't read the odds to feel less nervous. I believe that staying calm and having fun is the main thing for succeeding in TopCoder."</p>

<br>
<p>
<div class="authorPhoto">
    <img src="/i/m/Gluk_big.jpg" alt="Author" />
</div><br><br>
<tc-webtag:handle coderId="8433628" /> <br>
Student of Kiev National University<br><br>
Other achievements:
<ul>
	<li>bronze at IOI 2004, gold at IOI 2005</li>
	<li>ACM ICPC 2006 Finalist</li>
</ul>
</p>

<p>After three years of IOI and ACM finals attendance, <tc-webtag:handle coderId="8433628" /> is an experienced contestant, so he owes his recent rating increase not so much to practice but rather to learning to adapt to the TopCoder competitions format (and, of course, a healthy amount of luck). He has tried all the competition tracks offered by TopCoder, but he prefers the Algorithm one as the fastest and the most thrilling. He's also a 100% reliable developer, but doesn't enjoy Development as much because, in his opinion, it requires more effort and less creativity.</p>

<p><tc-webtag:handle coderId="8433628" /> seems to be one of the few Ukrainian coders who has never had any problems with network issues (except for holidays), getting a USA visa, or making the tough choice between "studies or SRMs." With one more try at the ACM finals with <tc-webtag:handle coderId="9906220" /> as a teammate, and four more years of TCCC eligibility, he has every chance to succeed.</p>

<br>
<p>
<div class="authorPhoto">
    <img src="/i/m/Vasyl(alphacom)_big3.jpg" alt="Author" />
</div><br><br>
<tc-webtag:handle coderId="13351270" /><br>
Student of Lviv National University
</p>

<p><tc-webtag:handle coderId="13351270" /> wrote his first SRM less then 18 months ago, so he's the least experienced of the Ukrainian semifinalists. He admits he was really surprised to advance onsite, even though by the TCO qualifications he was ranked among the Top 30 Algorithm competitors (and several SRMs later he outrated <tc-webtag:handle coderId="311170" /> ). <tc-webtag:handle coderId="13351270" /> owes his recent progress to permanent practice: he spends most of his leisure time on training, and misses contests only in very special cases, like when he had an exam scheduled for the same day.</p>

<p>Unlike other Ukrainian advancers, <tc-webtag:handle coderId="13351270" /> received his USA visa for the first time this year. He met a traditional obstacle at the embassy - his interview was arranged for June at first, and it took a letter from TC to rearrange it.</p>

<br>
<p>
<div class="authorPhoto">
    <img src="/i/m/Vedensky_big2.jpg" alt="Author" />
</div><br><br>
<tc-webtag:handle coderId="9927526" /><br>
Student of NTUU "KPI"<br><br>
Other achievements:
<ul>
	<li>TCCC'06 Algorithm semifinalist</li>
	<li>ACM ICPC 2007 Finalist</li>
</ul>
</p>

<p><tc-webtag:handle coderId="9927526" /> is a student of Physical-Technical Institute, a relatively young department of NTUU "KPI". PTI has two decent ACM teams, in spite of the fact that students can't use computer labs for contests, and that they offer no instruction on contest-specific problems. <tc-webtag:handle coderId="9927526" /> is planning to organize a course on solving ACM-specific problems for younger students during next year.</p>

<p><tc-webtag:handle coderId="9927526" /> gives credits for his progress to six months of intense practice before the ACM World Finals. "Our team was lucky to be invited to Petrozavodsk winter training camp, training with best Russian teams has been a useful experience."</p>

<p>"The worst thing about writing TopCoder in Ukraine is low network quality", says <tc-webtag:handle coderId="9927526" />. "I write SRMs from home, and I usually get short disconnects about once in every four SRMs, but even a 10-minutes-long disconnect can be fatal. Disconnects in the last rounds ruined my performance in the last two Google Code Jam tournaments."</p>

<br>
<p>
<div class="authorPhoto">
    <img src="/i/m/xOberon_big.jpg" alt="Author" />
</div><br><br>
<tc-webtag:handle coderId="9906220" /><br>
Student of Kiev National University<br><br>
Other achievements:
<ul>
	<li>placed 12 at Google Code Jam 2006</li>
	<li>first place at IOI 2005</li>
	<li>ACM ICPC 2006 Finalist</li>
</ul>
</p>

<p>Having finished only his second year in university,  <tc-webtag:handle coderId="9906220" /> is already probably the most all-around TopCoder member in Ukraine: he succeeds in Software Development and Assembly, problem writing and component review, Marathon Matches and, of course, his favorite -- Algorithm Competitions. Such diversity of interests leaves little time for non-TopCoder affairs, says <tc-webtag:handle coderId="9906220" />.</p>

<p>"I devoted most of this term to TopCoder instead of my studies, and now I'm having hard times with my examinations, but getting to the TCO was worth it!" He is going to neglect his studies for a little bit longer to train for TCO.</p>

<p>As for his future, <tc-webtag:handle coderId="9906220" /> is planning to start with an internship at "some respectable company" using one of the opportunities TopCoder offers. He tried to arrange one with Google at GCJ06, but was unable to do so due to visa problems, so this year he will enjoy "an internship-free summer."</p>

<br>
<p>
<div class="authorPhoto">
    <img src="/i/m/Klinck_big.jpg" alt="Author" />
</div><br><br><br>
<tc-webtag:handle coderId="7428266" /><br><br>
Other achievements:
<ul>
	<li>placed 8 at Google Code Jam Europe 2006</li>
	<li>Grand First Prize IMC 2000, Grand First Prize IMC 2001</li>
	<li>First Prize IMC 1999, First Prize IMC 2002 (and more)</li>
</ul>
</p>

<p><tc-webtag:handle coderId="7428266" /> is the least TopCoder-addicted of the Ukrainian members. <tc-webtag:handle coderId="7428266" /> takes a post-graduate course in Max Planck Institute for Mathematics, in Bonn, and so far is planning to devote his life to science. He has participated in no SRMs (except for tournaments time) since 2004, and still managed to advance to the semifinals, though he chose not to make the trip to Las Vegas.</p>

<p>"I'm currently at a conference in Trieste, Italy, and it will last until June 1. To come onsite I need to get a USA visa before May 18, and therefore I would have to come to Frankfort to get it. It would have taken a lot of bother - and money - and distracted me from work. If it weren't for this conference, I would surely have chosen to come."</p>

<p>Problems with getting a visa to travel to the USA are common for TopCoder members from all over the world (except for those from the USA, of course), but this year the Ukrainians had a very special time with it. Most of them have already been to the USA, and were thus able to use a simplified procedure for getting a new visa. The only problem was that applications for this procedure are accepted on Wednesdays only, and this year the only two Wednesdays between Round 4 and the visa deadline happened to be national holidays. </p>

<p>Despite the difficulties, though, this year a significant team of Ukrainians will face the TopCoder Open's challenges in Las Vegas. Good luck to all!</p>

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
