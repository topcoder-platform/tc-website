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
    <tc-webtag:forumLink forumID="517344" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">An interview with fabrizyo</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/fabrizyo_big.jpg" alt="Author" />
</div>
<div class="authorText">
  <%--By&#160;--%><tc-webtag:handle coderId="21926605" context="design" /><br />
      <em>TopCoder Member</em>
</div>
<br clear="all">


<p><em>While a few final fixes are still pending, and a few scores may yet move, it appears that somebody has finally broken the hold of <tc-webtag:handle coderId="287614" context="design" /> on the <a href="/tc?module=LeaderBoard&ph=112&sc=&sd=&staid=5&nr=50&sr=">Digital Run Design Cup</a>. With 18,515 points in Stage 1 of the 2007.5 DR, Fabrizio Lovato, 27, brings Digital Run bragging rights -- and more than $80,000 in total prizes -- to his home in Italy.</em></p>
<p><em>Over the course of the stage, <tc-webtag:handle coderId="21926605" context="design"/> competed on a total of 39 designs. He finished in the money in all but three of them, taking first place 25 times and coming in second on another 11. Thanks to his steady performance, he also earned more than $8,000 in reliability bonuses during the stage. (For more detailed data, check out his <a href="/tc?module=CompetitionHistory&ph=112&cr=21926605">competition history</a>.)</em></p>
<p><strong>Q: You climbed from a respectable ninth place in Stage 4 of the '07 Digital Run to a very strong first-place finish. What did you do differently?</strong></p>
<p>A: It was a set of things. When I saw that I could take a good spot in this DR, I used all my free time to work and improve my skills.</p>
<p><strong>Q: How much of your day did you devote to competing, on average?</strong></p>
<p>A: I have a normal job, which takes up 8 hours a day, so I spent all my free hours after work on the Digital Run &ndash; from after 5:00 PM to around midnight, or 1:00 AM, or 3:00 AM, or 6:00 AM (though I only did that twice).</p>
<p><strong>Q: How did you choose components?</strong></p>
<p>A: I chose the components with the fewest competitors, in order to collect as many points as I could. Generally, these were the more &quot;difficult&quot; components, but &quot;difficult&quot; is sometimes just a matter of perspective. If you read the Requirement Specification a few times, and keep working to improve your skills and learn new technologies, then the component may not be so difficult.</p>
<p><strong>Q: You stepped on the gas in August, entering 19 competitions and winning 10. How'd you do it?</strong></p>
<p>A: In August, I used up my holidays to compete -- ALL my holidays -- so I had more time to devote to competing. I had to commit, just to keep up a lead. In fact, in the last weeks I competed on almost every Java component that was posted, just to stay ahead of second place.</p>
<p><strong>Q: You joined TopCoder in July, 2006. What brought you to the site?</strong></p>
<p>A: It was an article on Google Code Jam. I really like algorithms, actually, so I joined to improve my skills in the algorithm matches.</p>
<p><strong>Q: What attracted you to component design?</strong></p>
<p>A: The possibility to learn new technologies, and get paid! You learn technologies and you are also paid (and very well) with the competitions. I improved my skills for my job, and my work improved my skills for the competitions. Plus I improved my English. But the most attractive thing, really, was the money.</p>
<p><strong>Q: How do you balance competing and your career?</strong></p>
<p>A: They complement each other. I started at a job, then I began to compete in TopCoder. In April I found a better job, thanks in part to things I learned through competing. Now I'm working on a European project on semantic web technology. I am the architect/designer/developer and, with my colleagues, we are working to link together European universities. With this job, I get to travel around Europe, and during this work I did TopCoder contests. So I used the technologies and the methodologies learned from competitions in my work, and vice-versa.</p>
<p><strong>Q: What's your educational background?</strong></p>
<p>A: I went to the <a target="_blank" href="<tc-webtag:linkTracking link='http://en.wikipedia.org/wiki/University_of_Padua' refer='feature_091307'/>">University of Padova</a> [a.k.a. Padua]. It's an old university, not far from Venice. It's very old, actually &ndash; it was founded in 1222. I got the five-year &quot;laurea.&quot; It's sort of equivalent to a combined bachelor's and master's degree in the US. I studied computer engineering, which included computer theory, programming, algorithms, and so on, but also electronic and digital systems. My thesis was about AI and natural language processing.</p>
<p><strong>Q: And where do you live now?</strong></p>
<p>A: After university, I moved to Milano (Milan in English) for work. During the week I work there, but on the weekend I return to Arzignano, where I'm from, since living in Milan is so expensive. (Traveling back and forth also gives me time to work on my laptop.) From my room in Arzignano I have a view of the <a target="_blank" href="<tc-webtag:linkTracking link='http://www.tourism.verona.it/_vti_g2_cen3.aspx?rpstry=27_' refer='feature_091307'/>">Romeo and Giulietta</a> (Romeo and Juliet) castles.</p>
<p><strong>Q: Italy is known for its food. What's your favorite?</strong></p>
<p>A: In the DR weeks I didn't have time to prepare food, so I always went to restaurants for dinner. I tried all kind of foods, but my Italian food is always the best. The specialty of my region is &quot;<a target="_blank" href="<tc-webtag:linkTracking link='http://www.foodnetwork.com/food/recipes/recipe/0,1977,FOOD_9936_15871,00.html' refer='feature_091307'/>">baccala' all vicentina</a>,&quot; but I also like all the foods from the south of Italy and Sicily.</p>
<p><strong>Q: Part of your prize is a trip to the TCO. Do you plan to travel to it next year?</strong></p>
<p>A: Yes, I would like to meet more members of TopCoder. This is a great community, and all the people have the same interests. Reading the forum I find many friends &ndash; sometimes enemies, but mostly friends :-) &ndash; and the wishes and objectives seem to be the same in China, or in Russia, or in Italy, USA or other parts. It's the power of TopCoder that people come learn, but also to enjoy interacting with other similar people.</p>
<p><strong>Q: Are you planning to compete in the next stage?</strong></p>
<p>A: Now I need a vacation. I'm a little tired. It was a wild ride, like people have said. In these weeks, I removed my social relationships with my friends. I had contact only with my colleagues and my parents. Usually in summer in Italy the people go to the sea. It's not far from Arzignano &ndash; just 100 km to the Adriatic, or closer to &quot;Venice's Lido&quot; &ndash; but this summer I didn't go to sea.</p>
<p>But I'm happy with this choice. All my friends told me, &quot;You are crazy to use your holiday to work.&quot; Now they don't think that I'm so crazy, and some of them will probably start competing in the near future.</p>
<p><strong>Q: Anything else you'd like to say?</strong></p>
<p>A: I would like to thank my girl, who waited for me all these weeks during this Digital Run. I haven't had time for her, so I owe her!</p>
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
