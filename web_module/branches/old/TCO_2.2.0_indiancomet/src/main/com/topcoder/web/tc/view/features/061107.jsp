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
    <tc-webtag:forumLink forumID="516149" message="Discuss this article" />
</div>

<span class="bigTitle">TCO Preview: The Studio Design Competition</span>
<br /><br />
<div class="authorPhoto">
    <img src="/i/m/Nickolas_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="15635590" /><br />
      <em>TopCoder Member</em>
</div>
<br clear="all">

<p><span class="bodySubtitle">Competition Overview</span><br />
This year's TopCoder Open included a completely new competition track, which may turn out to be as exciting as any of the other ones - the Studio Design Competition.</p>

<p>Studio contests are intended not for algorithm experts, or software designers and developers, but for graphics and web designers. The members can be asked to design anything one could imagine - a logo or a set of icons, a web page or a brochure, a t-shirt or a banner, and all kinds of things that require inspiration and creativity.</p>

<p>The format of the TCO Studio Competition qualifying rounds was very similar to the Component process. During an eight-week period, Studio members could submit in the usual ongoing Studio contests to score points in the TCO. The scoring system is partly borrowed from the Component Competition: 10 points for winning the contest, and 7, 5 and 4 points for second, third and fourth places respectively.</p>

<p>However, there is one subtle but significant difference. In Component Competition one member can submit (and get points) only once for each component, while in the Studio contests a member could get points for multiple similar submissions ranked among the top four designs for a contest. This undoubtedly influenced the results: thus, oton gained 16 of his 20 points by occupying three out of the four top spots in the TopCoder Registration Tool Storyboards Contest.</p>

<p>Furthermore, several top spots were occupied by Studio members who weren't registered for the TCO, and thus didn't play their part in the struggle. For example, <tc-webtag:handle coderId="22665210" /> won theTopCoder Web Video Identity &amp; Logo Design Contest, but didn't get the competition points for it, which gave him no chance of advancing to finals.</p>

<p>Due to these wrinkles, and plentiful visa-related travel problems, one didn't really need to win a contest to get onsite: only three of the eight finalists won a contest outright during the TCO qualification rounds. Favorites such as maxsense, for example -- who won two contests and gained an impressive total of 60 points -- are out of the final race now. Hopefully, in time, as the Studio Competition becomes more popular and the contestants become more prudent about planning for travel, the threshold for making it on-site will be higher, but this time around it's quite low. In fact, it turned out to be enough to take a third place once (5 points), and get a visa, in order to make it to Las Vegas this time.</p>

<div align="center">
   <table cellpadding="0" cellspacing="0" class="stat" style="width:300px; margin-bottom: 30px;">
   <tbody>
        <%boolean even = false;%>
         <tr class="<%=(even ? "dark" : "light")%>">
            <td class="value">Registrants</td><td class="value">277</td>
        </tr>
        <%even = !even;%>
        <tr class="<%=(even ? "dark" : "light")%>">
            <td class="value">Contests</td><td class="value">17</td>
        </tr>  
        <%even = !even;%>
        <tr class="<%=(even ? "dark" : "light")%>">
            <td class="value">Total submissions</td><td class="value">847</td>
        </tr>  
        <%even = !even;%>
   </tbody>
   </table>
</div>

<p>During the competition itself, members were provided with a wide variety of contests to show off their creative skills of all kinds. They had a chance to design a number of entities to be used during TCO'07, TCCC'07 and Equitrader Collegiate Challenge events, as well as other TopCoder projects like TC Channel and UML Tool.</p>

<p>The race started with the shortest contest, TopCoder Web Video Identity & Logo Design Contest, which lasted only four days but produced the biggest number of submissions (166). A week later TopCoder Homepage Design Contest attracted a record number of more than 200 registrants but turned out to be too complicated for most of them. Part way through, the contestants had two busy weeks with up to six active contests weekly, including the T-Shirt contests, which brought a total of 49 points to five of the finalists. The struggle continued until the final week, with maxsense getting 21 points in the last two contests.</p>

<p><span class="bodySubtitle">The Finals and the Finalists</span><br />
As mentioned above, many of the best-performing Studio members will not compete in the finals mainly due to visa problems. However, I believe the competition will still be interesting - depending on the task the finalists will get.</p>

<p>Unlike the Component Competition, the finalists will receive the description of their task only in Las Vegas, at the Welcome Reception on Tuesday, and they will have from then until Thursday to think it over. On Thursday they will have nine hours to realize their designs, get feedback from the judges and incorporate it into their final submissions. After the round is over, the final submissions will go to the community for a 24-hour vote.</p>

<p>We were able to talk to most of the Studio Design Competition finalists about their preferences, strengths, and expectations. Here's what they had to say:</p>
<br>

<p>
<div class="authorPhoto">
    <img src="/i/m/amiune_big3.jpg" alt="Author" />
</div>
<tc-webtag:handle coderId="13358674" />, Argentina<br>
23 years, student of Universidad Catolica de Cordoba studying Systems Engineering<br>
Interests: graphic design (esp. 3D), tennis, soccer<br>
TCO achievements:	5 points (1 third place)
</p>

<p><strong>How long have you been taking part in Studio contests?</strong><br>
Since the first logo competition, when the Studio didn't exist yet.</p>

<p><strong>What type of contests do you prefer?</strong><br>
Logo, T-shirt and those contests where you can free your creativity.</p>

<p><strong>How much time do you spend on a typical contest?</strong><br>
It varies. The hardest thing is to have a good idea that fits the contest requirements, after that the embodiment takes about 5 days.</p>

<p><strong>Was it easy to find the time to take part in Studio contests?</strong><br>
It was really hard because I'm working on my final project to finish my university studies, but when I was tired of coding I relaxed a little doing some sketches.</p>

<p><strong>Your favorite design in the online rounds?</strong><br>
The simplest idea (and the winning one) - the Algorithm T-shirt with words "Passed System Test".</p>

<p><strong>Was there a contest that you'd like the chance to do over?</strong><br>
All of them, I think I didn't do my best in any of them.</p>

<p><strong>Did you expect to get onsite?</strong><br>
Not even in my dreams :)</p>

<p><strong>Can you draw?</strong><br>
Yes, but after 5 years at the keyboard I'm rusty a little.</p>
<br>

<p>
<div class="authorPhoto">
    <img src="/i/m/FMX_big3.jpg" alt="Author" />
</div>
<tc-webtag:handle coderId="20781137" />, India<br>
student of Netaji Subhas Institute of Technology<br>
TCO achievements:	10 points (1 win)<br>
Pre-TCO achievements:	1 win, 1 third place
</p>

<p><strong>What type of contests do you prefer?</strong><br>
I prefer contests where creativity and intelligence play a more important role than your Photoshop skills. That is I prefer logos, T-shirts , splash screens, Posters. I loathe website wireframes, prototypes, icons, and storyboards, where you lose because a less-creative competitor knows more photoshop effects. </p>

<p><strong>Was it easy to find the time to take part in Studio contests?</strong><br>
That's a very painful question. Though I have ample time for the studio contests, which generally give a week to do your work, but I (being a really lazy and crazy fellow) waste my time in useless activities. Then suddenly, while browsing the TopCoder Studio forums, I realize that the deadline is over in 4 hours. The speed designing process starts and half of the time I make it, half of the time I miss the deadline by a couple of minutes. Then there is a fruitless appeal to jwlms to accept the submission, who refuses everytime, destroying my chance to be $1,000 richer.</p>

<p><strong>Your favorite design in the online rounds?</strong><br>
My best work, I would say, was the Algorithm T-shirt. Though it didn't win in the voting, the unanimous support for it in the forums really pleased me. </p>

<p><strong>Was there a contest that you'd like the chance to do over?</strong><br>
The "UML Tool Splash Screen" contest. My entry was competitive but failed screening not due lacking something in the design, but because of a document that was to be sent along with it that I missed. </p>

<p><strong>Who do you think will win?</strong><br>
It really depends on the work. If it is more creativity-based, I think I stand a strong chance. <tc-webtag:handle coderId="10481546" /> or <tc-webtag:handle coderId="22076237" /> stand a better chance if it requires more technical design skills.</p>
<br>

<p>
<div class="authorPhoto">
    <img src="/i/m/mahestro_big.jpg" alt="Author" />
</div>
<tc-webtag:handle coderId="22673573" />, Venezuela<br>
22 years, student of Universidad de Oriente studying Computer Engineering<br>
Interests: playing guitar, composing<br>
TCO achievements:	10 points (1 win)<br>
Pre-TCO achievements:	1 fourth place
</p>

<p><strong>How long have you been taking part in Studio contests?</strong><br>
Since February. I placed 4th at my first contest (TopCoder Member Badges Design), and since then I've always participated in the contests.</p>

<p><strong>How did you learn about Studio?</strong><br>
I was referred by my friend <tc-webtag:handle coderId="22671975" />.</p>

<p><strong>What type of contests do you prefer?</strong><br>
I like unusual contests, where I can create great graphics and use all the powerful tools of software design.</p>

<p><strong>How much time do you spend on a typical contest?</strong><br>
About 3 or 4 hours, sometimes more. It depends on the difficulty of the task.</p>

<p><strong>Your favorite design in the online rounds?</strong><br>
My Equitrader Brochure &amp; Poster design, but unfortunately I didn't submit it on time.</p>

<p><strong>Was there a contest that you'd like the chance to do over?</strong><br>
Yes - the TC Channel logo contest.</p>

<p><strong>Did you expect to get onsite?</strong><br>
Of course not. It was very difficult.</p>

<p><strong>Who do you think will win?</strong><br>
I don't know. Everybody is very creative - anything can happen.</p>
<br>

<p>
<div class="authorPhoto">
    <img src="/i/m/Maraqja_big.jpg" alt="Author" />
</div>
<tc-webtag:handle coderId="15006955" />, Poland<br>
21 years, student of Military University of Technology studying Management<br>
Interests: design, photography (fashion, glamour, portrait - more at www.maraqja.com)<br>
TCO achievements:	5 points (1 third place)
</p>

<p><strong>How long have you been taking part in Studio contests?</strong><br>
From the very beginning of Studio.</p>

<p><strong>How did you learn about Studio?</strong><br>
My friend takes part in Algorithm competitions, so I was familiar with TopCoder. When Studio was launched I just read an announcement on the homepage.</p>

<p><strong>What type of contests do you prefer?</strong><br>
I prefer pure design contests, like brochures, posters, T-shirts.</p>

<p><strong>How much time do you spend on a typical contest?</strong><br>
It's hard to tell&#8230; sometimes only 3-4 hours, but sometimes much more.</p>

<p><strong>Was it easy to find the time to take part in Studio contests?</strong><br>
It's hard to find time for me. I often start work on a contest just one or two days before the deadline and so I'm often not happy with my submissions.</p>

<p><strong>Your favorite design in the online rounds?</strong><br>
My TC Homepage designs and maybe TC Web Video Identity &amp; Logo ones.</p>

<p><strong>Was there a contest that you'd like the chance to do over?</strong><br>
Equitrader Brochure &amp; Poster Design Contest.</p>

<p><strong>Did you expect to get onsite?</strong><br>
No. I was sure I wouldn't get onsite.</p>

<p><strong>Who do you think will win?</strong><br>
I think almost all of the finalists have the chance to win. Maybe yiming has a little more chance then others, though&#8230;  : )</p>

<p><strong>What do you think about the finals format?</strong><br>
I think it is a little unfair to know the theme so long before the competition starts. Some of the competitors can bring laptops and make some sample designs, check things on the internet or even ask someone else to do the design for them and than just copy it. If we knew the theme just before the competition starts, it would give a real view of our skills and knowledge.</p>
<br>

<p>
<div class="authorPhoto">
    <img src="/i/m/oton_big.jpg" alt="Author" />
</div>
<tc-webtag:handle coderId="22076237" />, Indonesia<br>
27 years, freelance web developer and web designer<br>
Interests: writing (published in local paper)<br>
TCO achievements:	20 points (1 second, 1 third and 2 fourth places)
</p>

<p><strong>How did you learn about Studio? How long have you been taking part in Studio contests?</strong><br>
I learned about TopCoder from a mailing list; several people mentioned Indonesian winners at GCJ in India. I registered not long after it, and found that I have no capabilities to participate. That was before I found Studio in late 2006, and I've taken part in it since then.</p>

<p><strong>What type of contests do you prefer?</strong><br>
I prefer contests in which the winning design is defined by the judges, not the community voting. As for the type, I like wireframe design, prototype, and storyboard design.</p>

<p><strong>How much time do you spend on a typical contest?</strong><br>
It takes typically a week, but not full-time: a day or two to read the specifications and clarify everything which is not clear, and then several days to do the rest, sometimes more if the project is complicated, like HTML prototyping.</p>

<p><strong>Where do you get your ideas and inspiration?</strong><br>
Books and websites. Going to a bookstore or public place if I really get bored helps.</p>

<p><strong>Was it easy to find the time to take part in Studio contests?</strong><br>
I prefer to enter a contest if the task seems to be doable for me, and I have time to work on it (i.e. if I have no deadline on my freelance projects). Regardless, it requires a scheduling effort - I often work overnight to submit in time.</p>

<p><strong>Why are you so skeptical about defining the winner by community voting?</strong><br>
My designs are typically clear and clean in their layout, so they are unlikely to catch the voters' eyes. Besides, I think Studio can be rich beyond repeating the same designs with the same styles, layouts, and tricks designed to attract votes. In real life, if my employer knew that I had proposed him a design which is similar to an existing one, they would reject it at once, even if it was really cool!</p>

<p><strong>Did you expect to get onsite?</strong><br>
At first I didn't, but after getting to the top four in several contests at the beginning, I understood that I really had a chance, and pushed hard to earn some additional points. Partway through I realized that I was stuck with a freelance project, so I stopped. I was lucky my points were enough to get onsite.</p>

<p><strong>Who do you think will win?</strong><br>
I think the competitors who have a decent chance are (in no particular order) <tc-webtag:handle coderId="10481546" />, <tc-webtag:handle coderId="22673857" /> and me, if I am lucky. : )</p>
<br>

<p>
<div class="authorPhoto">
    <img src="/i/m/SIGCHLD_big.jpg" alt="Author" />
</div>
<tc-webtag:handle coderId="22626864" />, Italy<br>
22 years, student of Universit_ di Bologna, studying Computer Engineering<br>
Interests: swimming<br>
TCO achievements:	5 points (1 third place)
</p>

<p><strong>How long have you been taking part in Studio contests?</strong><br>
Since it was born, and even before - in logo design tournaments.</p>

<p><strong>What type of contests do you prefer?</strong><br>
Logo design.</p>

<p><strong>How much time do you spend on a typical contest?</strong><br>
A day per logo.</p>

<p><strong>Your favorite design in the online rounds?</strong><br>
My UML Tool Splash Screen designs - for the idea.</p>
<br>

<p>
<div class="authorPhoto">
    <img src="/i/m/yiming_big.jpg" alt="Author" />
</div>
<tc-webtag:handle coderId="10481546" />, China<br>
26 years, programmer<br>
Interests: astronomy, classical music<br>
TCO achievements:	40 points (3 second, 3 third and 1 fourth places)<br>
Pre-TCO achievements:	4 wins, 1 third and 1 fourth
</p>

<p><strong>How long have you been taking part in Studio contests?</strong><br>
About nine months.</p>

<p><strong>What type of contests do you prefer?</strong><br>
Logo and icon.</p>

<p><strong>How much time do you spend on a typical contest?</strong><br>
About ten hours.</p>

<p><strong>Where do you get your ideas and inspiration?</strong><br>
The sky and listening to music.</p>

<p><strong>Can you draw?</strong><br>
Yes.</p>

<p><strong>Your favorite design in the online rounds?</strong><br>
The Ball Logo & Icons design.</p>

<p><strong>Did you expect to get onsite?</strong><br>
Certainly, yes.</p>

<p><strong>Who do you think will win?</strong><br>
I hope I can&#8230; : )</p>
<br>

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
