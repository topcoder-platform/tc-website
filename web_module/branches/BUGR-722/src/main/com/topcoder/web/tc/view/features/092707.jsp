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
    <tc-webtag:forumLink forumID="517603" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Know your hero: marek.cygan</span>
<br /><br />
<div class="authorPhoto">
    <img src="/i/m/jakubr_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="8472826" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>This issue of the 'Know Your Hero' interview series features Marek Cygan (TopCoder handle: <tc-webtag:handle coderId="7442498" context="algorithm"/>). <tc-webtag:handle coderId="7442498" context="algorithm"/> has recently become a target in Algorithm competition and, after <a href="/stat?c=round_overview&er=5&rd=10781">SRM 366</a>, he has become the highest rated coder from <a href="/tc?module=AlgoRank&cc=616">Poland</a> (breaking <tc-webtag:handle coderId="144400" context="algorithm"/>'s long-standing domination). He's also currently in the <a href="/tc?module=AlgoRank">top four overall</a> for all Algorithm competitors. This wasn't the first big achievement for <tc-webtag:handle coderId="7442498" context="algorithm"/>, however. His first great success was winning the Google Code Jam 2005. Since then he has qualified for four onsite rounds of TopCoder tournaments, including this year's <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=bracket">TCO</a> and <a href="/tc?module=TCCC07AlgorithmAdvancers">TCCC</a>. He was also a member of the Warsaw University team (together with <tc-webtag:handle coderId="15616795" context="algorithm"/> and <tc-webtag:handle coderId="7300191" context="algorithm"/>) that won this year's ACM ICPC World Finals held in Tokyo.</p>
<p><strong>Q: When did you start programming? </strong></p>
<p>A: I wrote my first program in Pascal when I was 15, just before I went to high school. After that I started writing some very simple programs. Two years later I started participating in computer science classes, where I learned some simple algorithms, basics of graph theory, etc. At that time I also competed for the first time in the Polish Olympiad in Informatics.</p>
<p><strong>Q: How did you learn about TopCoder? When did you start competing? </strong><span style="float:right; padding:10px;"><img style="height:140px; width:126px; border:1px solid #cccccc;" src="/i/m/marekdotcygan_big.jpg" /><br /><span style="padding-left:25px"><tc-webtag:handle coderId="7442498" context="algorithm"/></span></span></p>
<p>A: One day when I was still in high school I accidentally saw <tc-webtag:handle coderId="144400" context="algorithm"/>'s CV, where he wrote about his TopCoder achievements. Thanks to this I registered at TopCoder. When I opened some TopCoder problems I saw that all submissions were using classes and I was still programming in pure C at that time, so I gave up on TopCoder for some time. About a year later, when I was a student at Warsaw University, I talked to <tc-webtag:handle coderId="309982" context="algorithm"/>, who told me that I didn't have to be very good at object oriented programming to participate in TopCoder contests. With his instructions I managed to successfully participate in the qualification round of <a href="/tc?module=SimpleStats&c=tccc04_alg_adv_overview&trans=true">TCCC 2004</a>, with my <a href="/stat?c=problem_solution&cr=7442498&rd=5001&pm=1758">submissions</a> being really pure C code with one class and one method inside. From that point I could start improving.</p>
<p><strong>Q: You recently became a target and got to the top four in the Algorithm rankings, beating <tc-webtag:handle coderId="144400" context="algorithm"/> - that's a big thing. Was that a milestone in your career, or a goal that you've been trying to achieve? How did you feel? </strong></p>
<p>A: In May, 2006 my rating grew to over 2900. At that time I thought that I would get past 3000 sooner or later, and I made it just a small goal for myself. It proved not to be that easy, however, as I dropped back to below 2700 due to some small bugs in my submissions, encountering precision errors with doubles, etc. Even the 2007 TCO did not help me get my rating back to the higher level. That is why I decided to prepare well for TCCC 2007 and got back to the 2900 level before the tournament began. Since then my rating was oscillating at about that level and I lost some chances to cross the 3000 border. Finally, when I got the second place at <a href="/stat?c=round_overview&er=5&rd=10780">SRM 365</a> and eventually gained a rating of 3009, I wasn't even really all that excited about it, since I had been waiting so long for it to happen. But then came <a href="/stat?c=round_overview&er=5&rd=10781">SRM 366</a> (preceded by a good result I got at <a href="/stat?c=round_overview&er=5&rd=10908">TCCC Round 3</a>), after which I sorted all coders' ranking by ratings and was surprised to see that I was just 1 rating point ahead of <tc-webtag:handle coderId="272072" context="algorithm"/> and 2 points ahead of <tc-webtag:handle coderId="7433858" context="algorithm"/>, with <tc-webtag:handle coderId="144400" context="algorithm"/> (unfortunately) losing many points. I was very happy, but also somewhat intimidated with what I had achieved at that moment.</p>
<p><strong>Q: So what are your next goals? </strong></p>
<p>A: My main goal is to always concentrate on practice and step-by-step improvement of my skills. This, however, includes some sub-goals. From the rating point of view, I would like to get to the Algorithm top three again, which is in other words equivalent to beating <tc-webtag:handle coderId="251074" context="algorithm"/>. ;-)</p>
<p>I'm not really looking higher than that now, as there is a huge rating gap between me and the top two. Particular competitions are more important for me than my rating. That is why I will stay focused on TCCC 2007, with the <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=onsiteSchedule">onsite finals</a> coming in a month's time. The tournament finals coincide with regional eliminations to ACM ICPC team contest, so at the same time I will be preparing with my team to defend the championship title from last year.</p>
<p><strong>Q: What was the proudest moment of your programming career? </strong></p>
<p>A: Certainly the most surprising moment for me was winning Google Code Jam 2005. I had some luck at the final, the problems suited me well and the challenge phase was very fruitful for me. This success, however, turned out to be somewhat of a bad influence. The problem was that I like to do step-by-step improvement, and this was more of a 'jump' kind of improvement. Because of that my expectations for myself grew too big, which caused me some frustration and problems at subsequent contests.</p>
<p>Probably winning the ACM ICPC 2007 finals was the proudest moment for me. My team was training a lot for the finals (thanks to <tc-webtag:handle coderId="11829284" context="algorithm"/>'s invitation we could participate in the Summer Programming Camp in Petrozavodsk) and both our skills and our results in training were systematically improving. When we went to the ICPC finals and won, we were very happy.</p>
<p><strong>Q: What did you do to improve your programming skills over time? What advice would you give to newcomers? </strong></p>
<p>A: I probably won't surprise anyone when I say that practice is the best thing for improvement. This isn't as easy as it seems, though, because you can get a different quality of results depending on how you actually practice. Some time ago <tc-webtag:handle coderId="11829284" context="algorithm"/> gave me good advice on that, saying: &quot;Train well, not hard.&quot; So you first need a good theoretical background and then need to gain some programming expertise by solving problems -- only combining the two factors will give you the expected results.</p>
<p><strong>Q: What type of problems do you like the most, and why? </strong></p>
<p>A: First of all, I like problems with short and clear statements. I'm not very strong at geometrical problems, but all others are fine for me. And most of all, the solution of the best problem should involve some clever ideas.</p>
<p><strong>Q: Do you compete in any TopCoder competitions apart from Algorithm? </strong></p>
<p>A: I tried to compete in Marathon Match competition, mostly at <a href="/tc?module=TCCC07MarathonAdvancers&sc=&sd=&full=&ha=marek.cygan&nr=50&sr=1&nameSubmit=submit">TCCC07</a>. It was a valuable experience for me, because I first thought that MM shouldn't be very hard for Algorithm competitors. I then realized that quite different abilities are needed to be successful in it. I also started getting into the <a href="/tc?module=ViewActiveContests&ph=112">Design</a> and <a href="/tc?module=ViewActiveContests&ph=113">Development</a> categories some time ago (mainly Development, as I don't have much experience in designing software), but I didn't have enough time for it yet, so I'm planning to try it in future.</p>
<p><strong>Q: What are your hobbies apart from programming? </strong></p>
<p>A: My hobbies are mainly sports. Before I went to university I trained in rowing for 7 years. Now I most often go to the gym, swimming or rock climbing.</p>
<p><strong>Q: What are your plans for the future? </strong></p>
<p>A: This year I'm graduating from Warsaw University. After that I will probably start doing a Ph.D. there. I like programming very much, so I will also try to start some projects or maybe go for some internships to learn more about practical programming. And I'm getting married in June 2008.</p>
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
