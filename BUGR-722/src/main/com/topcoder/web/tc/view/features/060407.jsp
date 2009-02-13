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
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="516083" message="Discuss this article" />
</div>

<span class="bigTitle">An Interview with Burunduk2</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/Katya_Lazareva_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="8436401" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p><strong>How long have you been engaged in programming? How did you start?</strong><br>
As I remember I started programming when I was 9 years old in my third year at school. My first programming language was Basic. One day I found an old book describing the principles of solving differential equations. I didn't understand them at all but the examples were given in Basic and I began learning the language. </p>

<p>When I had grasped the fundamentals, I started coding. First I wrote programs just for mastering the language and then went on with the ones closer to real life problems. During the first year of my self-education I tried to write small games - mathematical and arcades mainly. Later I wrote editors, image viewers, and code-helping utilities. (My own 3-D shooter game I left unfinished.)</p>

<p>I participated in my very first programming contest in the sixth form. It was the Saint-Petersburg School Olympiad where I got the last but one of the third category certificates for solving several problems. By that time I had been already attending a special programming group for kids. At such circles children had an opportunity to study Logo, Pascal, C, Basic and learn how to solve algorithm problems. Thus by the time when I started taking part in real programming contests, I'd already had some programming skill.</p>

<p><strong>Did you like solving algorithm problems? Did you practice a lot? </strong><br>
Yes. They seemed rather interesting. But I was not seriously focusing at them after my first official contest. I was writing non-algo problems for my own purposes. I studied C++. </p>

<div style="float:right; margin:20px;"><img src="/i/m/burunduk2_060407.jpg" alt="TCHS07 Champion Burunduk2" /><br>
<span class="smallText">TCHS07 Champion <br>Burunduk2</span></div>

<p>After the next contest -- the City School Olympiad again -- I started to train seriously. </p>

<p>I used Pascal for solving contest problems. It was very popular among us. I could write in C or C++ but didn't know them that well at the time.</p>

<p><strong>Tell us a little about your contest-solver career start.</strong><br>
Since the 7th form I had been taking part in ACM-type school contests. In the 9th form, thanks to Andrew Lopatin (<tc-webtag:handle coderId="15805598" />) we were invited to the Winter Petrozavodsk Training Camp. This was the place where the "Burunduchki" team came into existence (note: "Burunduchki" means "Chipmunks" in English). Since that year we have tried not to miss a single contest.</p>

<p><strong>How was the "Burunduchki" team built? And why "Burunduchki"?</strong><br>
I met Sergey Kopeliovich, one of the future "Burunduchki" team members, after I had changed my previous school for Saint-Petersburg Physics & Math Lyceum #30. We both started preparing for the next All-City school contest at the IFMO Training Center (note: IFMO is Saint-Petersburg State Institute of Fine Mechanics and Optics). </p>

<p>For that year's Petrozavodsk Training Camp we had to think of our team registration name. Sergey offered "Burunduchki" and we all accepted it. So Sergey is now <tc-webtag:handle coderId="15868491" />, and I am <tc-webtag:handle coderId="21111148" />. </p>

<p>We picked up our third member, Oleg Davidov (<tc-webtag:handle coderId="21468741" />), after the All-Russia Olympiad in Novosibirsk in 2005. The Summer Petrozavodsk Training Camp was the first event in which all three of us took part. </p>

<p><strong>How did you get involved in TopCoder?</strong><br>
Our coaches and teachers had been keen on TopCoder contests for a sufficiently long time before we came here. Everyone knew about <tc-webtag:handle coderId="10574855" /> Mitrichev and his success. We were told  about TopCoder and everything seemed very tempting. We saw how Andrew Lopatin (<tc-webtag:handle coderId="15805598" />) and Andrew Stankevich (<tc-webtag:handle coderId="11829284" />) were solving SRMs. They shared their impressions and discussed it.</p>

<p>It was in February 2006 when we decided to solve TopCoder contests ourselves. We didn't compete right after registration and started only in March. We kept our "Burunduchki" nicknames for TC as well. So now I'm known as Burunduk2. </p>

<p><strong>What do you like the most about Single Round Match rules?</strong><br>
First, the duration of contest is less than an ACM or IOI event. I like blitz-style contests most. Second, it is unusual that the points gained for solution depend on the time. The participants actually have only one submit per problem. Also I like to view solutions of my rivals. </p>

<p>But, in fact, I do not use Challenge Phase opportunities very often. This is probably because my challenging skills are not very good. I'm going to improve it. I see that it can be very useful.</p>

<p>Moreover I like that people from the whole world come to compete. International contests are always wonderful.</p>

<p><strong>Have you ever tried any other type of competitions at TopCoder in addition to Algorithm?</strong><br>
I didn't try development and design but did participate in Marathon Match. I should admit that the marathon format is too long for me and I don't have enough patience for it. But I hope I'll try it again soon. </p>

<p><strong>What kind of problems do you like to write or solve most of all?</strong><br>
Oh, it depends. The main thing is to develop a "beautiful" solution. </p>

<p>I like problems that require data type manipulations. But unfortunately they are not frequently found at TopCoder.</p>

<p>Actually the type of a problem doesn't matter. I tend getting pleasure from each contest.</p>

<p><strong>What do you consider the main incentive for competing in algorithm contests? </strong><br>
First I must admit that they are interesting and amazing. They have given me an opportunity to travel around the world. I have already visited many Russian cities - from Novosibirsk to Petrozavodsk. TopCoder gave me an opportunity to see America. </p>

<p>And this is good training for the brain.</p>

<p><strong>Does practicing take a lot of time? Don't you have any problems at school because of it?</strong><br>
Usually teachers are understanding, but sometimes I forget to provide explanatory letters about why I miss so many classes :). Teachers don't like this but they do forgive me.</p>

<p><strong>Are you planning to continue programming in the future?</strong><br>
Yes. There are a lot of job opportunities in this field.</p>

<p><strong>Have you already chosen a university? </strong><br>
I think my choice is the Saint-Petersburg State University. All the "Burunduchkis" are going there, so we are looking forward to the ACM ICPC World Finals as a team :).</p>

<p><strong>What are your other interests?</strong><br>
I like read fantasy and philosophy books.  I like listening to music. I prefer rock and metal, and I even try to play the guitar sometimes. </p>

<p><strong>Tell us about your impressions of the TCHS tournament.</strong><br>
They are very positive! I enjoyed meeting people who share my interests. We were talking a lot. It was a very useful experience. The organizational side was perfect. But it is a pity that not everyone had settled their financial affairs. Since the travel arrangements to Indianapolis, Indiana, USA were the responsibility of each competitor some advancers could not come. Fortunately our delegation had no problems thanks to Andrew Lopatin, our coach, who also accompanied us during all trip.</p>

<p>I'd like to thank the problem writers for short and clear statements. And special thanks for the dynamic programming problems. They don't come easy to many people and I can say I like them.</p>

<p>As for the contest itself I should say that the Coding Phase was very exciting. I successfully did the Easy but bugged in the Medium. Later I resubmitted it for fewer points. At that moment all my hopes were for the Hard. I submitted my first solution for about 900 points (just for high points, hoping for the best and without any checking). After some fixes I resubmitted the Hard. I thought I'd take one of the last places. During the Challenge Phase I realized that <tc-webtag:handle coderId="10039742" />'s solution would fail. My own challenge hunting appeared to be unprofitable. </p>

<p>Among the informal events I remembered a cool fountain. I even freshened up in it a little!</p>

<p><strong>What did you feel when realized that you are a winner?</strong><br>
At last! Actually I don't like coming in second, even when you are after a fairly strong TopCoder :). </p>

<p><strong>How are you going to use your prize?</strong><br>
First of all I'm going to get it. It seems it will not be so easy and fast. I hope to get a free higher education, thus I'm open for a lot of ideas. I'm not sure, maybe a car... :) </p>

<p><strong>What do you think is the main key for success? </strong><br>
Having a good teacher.</p>

<p><strong>Can you give a piece of advice on how to succeed in a contest?</strong><br>
Fight with the problems, not with people!</p>

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
