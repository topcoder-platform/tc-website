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
    <tc-webtag:forumLink forumID="518008" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a>
</div>

<span class="bigTitle">TCCC07 Preview: The Studio competition</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/ali_raza_shaikh_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="20641048" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<h3>Competition Overview:</h3>
<p>For the very first time in TopCoder Collegiate Challenge history, a competitor will compete to become a Studio Design Champion. The Studio Design competition was already a part of TCO07 and turned out to be a big success. Studio Design, along with Marathon Matches, are brand new tracks for TCCC this year.</p>
<p>Inspiration, Uniqueness, Creativity and Perspective are the main focus of TopCoder Studio. It challenges top creative minds around the world to present their best graphics and web design concepts. The members are required to take their imagination to the next level to design Web Interfaces, Visualizations, Prototypes, T-Shirts, Storyboards, Programs and Presentations.</p>
<p>The format of the TCCC Studio Competition qualifying round is similar to that used during the TCO qualification round. This time the online portion of the tournament consisted of 10 individual design competitions, and here are some statistics:</p>
<table align="center" class="stat" style="width: 450px;" cellpadding="0" cellspacing="0">
    <thead>
        <tr>
            <td class="headerC">TCCC Contest Name</td>
            <td class="headerC">Submissions</td>
            <td class="headerC">Submissions<br />Passed<br />Screening</td>
            <td class="headerC">Unique<br />Submitters</td>
            <td class="headerC">Unique<br />Submitters<br />Passed<br />Screening</td>
        </tr>
    </thead>
    <tr class="light">
        <td>REPOST: TSM Presentation Contest</td>
        <td align="center">4</td>
        <td align="center">1</td>
        <td align="center">1</td>
        <td align="center">1</td>
    </tr>
    <tr class="dark">
        <td>TCCC07 Program Design Contest</td>
        <td align="center">24</td>
        <td align="center">7</td>
        <td align="center">12</td>
        <td align="center">6</td>
    </tr>
    <tr class="light">
        <td>TopCoder CPP Storyboard Design Contest</td>
        <td align="center">7</td>
        <td align="center">6</td>
        <td align="center">7</td>
        <td align="center">6</td>
    </tr>
    <tr class="dark">
        <td>TCCC07 T-Shirt Design Contest</td>
        <td align="center">42</td>
        <td align="center">32</td>
        <td align="center">21</td>
        <td align="center">21</td>
    </tr>
    <tr class="light">
        <td>Equitrader EAPTS Prototype Contest</td>
        <td align="center">8</td>
        <td align="center">2</td>
        <td align="center">2</td>
        <td align="center">2</td>
    </tr>
    <tr class="dark">
        <td>REPOST: ESD Prototype Design Contest</td>
        <td align="center">0</td>
        <td align="center">0</td>
        <td align="center">0</td>
        <td align="center">0</td>
    </tr>
    <tr class="light">
        <td>Historical Stock Performance Visualization Competition</td>
        <td align="center">15</td>
        <td align="center">8</td>
        <td align="center">8</td>
        <td align="center">6</td>
    </tr>
    <tr class="dark">
        <td>World Stock Markets Visualization Competition</td>
        <td align="center">28</td>
        <td align="center">6</td>
        <td align="center">11</td>
        <td align="center">4</td>
    </tr>
    <tr class="light">
        <td>TCCC '07 Invitation Design Contest</td>
        <td align="center">35</td>
        <td align="center">17</td>
        <td align="center">11</td>
        <td align="center">10</td>
    </tr>
    <tr class="dark">
        <td>Thyche Corporation Plan Library Redesign Contest</td>
        <td align="center">7</td>
        <td align="center">1</td>
        <td align="center">3</td>
        <td align="center">1</td>
    </tr>
</table>
<p>As <tc-webtag:handle coderId="15635590" /> <a href="/tc?module=Static&d1=features&d2=061107">already</a> discussed about the submission procedure and how rating works for the Studio design competitions, a member could be given points for multiple similar submissions. Everything remains same, except now points were awarded up to 7 top designs as follows:</p>
<ul>
    <li>1st Place - 17 points</li>
    <li>2nd Place - 15 points</li>
    <li>3rd Place - 12 points</li>
    <li>4th Place - 10 points</li>
    <li>5th Place - 7 points</li>
    <li>6th Place - 5 points</li>
    <li>7th Place - 4 points</li>
    <li>8th Place (and lower) - 0 points</li>
</ul>
<p>One thing I'd like to mention is that now we have a Studio Design Review Board and Studio competitions have improved a lot since its inception. This was something not implemented for the TCO. The process follows the Component Design and Development guidelines to make the process crystal clear. How does it work? After the submission phase, a design is screened to see whether it meets the client requirements; if it does then it is ready for Online Review. The review board is composed of three experienced designers who review the design and in the end three scores from the review board are averaged to produce the competitor's final score. Can you keep the top Studio members away from review? No chance, Studio Admins looked for reviewers from the current Studio member base who can give excellent feedback and fair reviews. So, congratulations to <tc-webtag:handle coderId="22076237" /> &amp; <tc-webtag:handle coderId="22658469" /> as the first reviewers in Studio!</p>
<p>Here are some more TCCC facts:</p>
<ul>
    <li>This year a total of 69 competitors registered for the Studio Design Competition.</li>
    <li>Out of 69 competitors, 42 registered for at least 1 contest.</li>
    <li>There were 10 contests in total that fell under TCCC07.</li>
    <li>170 submissions were made by 76 unique submitters.</li>
    <li>A total of 80 submissions passed screening out of 170. So, the success rate is less than 50%, which makes screening one of the deadly phases.</li>
    <li>69 competitors represented 24 countries, which makes Studio participation very diverse.</li>
    <li>20% of the participants represent Indonesia, which clearly shows why we have 3 Finalist from Indonesia. Are we going to see a champion from Indonesia?</li>
    <li>5 of the current finalists already competed with each other during TCO07 onsite finals: <tc-webtag:handle coderId="13358674" />, <tc-webtag:handle coderId="15006955" />, <tc-webtag:handle coderId="22076237" />, <tc-webtag:handle coderId="22626864" />, and <tc-webtag:handle coderId="22673857" />. Time to take some revenge. :-)</li>
    <li><tc-webtag:handle coderId="22626864" /> and <tc-webtag:handle coderId="13298470" /> are the sole registrants from Italy and Romania who are able to make it to the onsite finals.</li>
    <li>Are we going to see a Female Champion? Perhaps, since 3 of the 8 finalists are female.</li>
</ul>
<p>Here are the top eight countries, ranked in order by number of competitors:</p>
<table align="center" class="stat" style="width: 450px;" cellpadding="0" cellspacing="0">
    <tr class="light">
        <td>Indonesia</td>
        <td>14</td>
    </tr>
    <tr class="light">
        <td>India</td>
        <td>10</td>
    </tr>
    <tr class="dark">
        <td>United States</td>
        <td>9</td>
    </tr>
    <tr class="light">
        <td>China</td>
        <td>6</td>
    </tr>
    <tr class="dark">
        <td>Ukraine</td>
        <td>6</td>
    </tr>
    <tr class="light">
        <td>Argentina</td>
        <td>3</td>
    </tr>
    <tr class="dark">
        <td>Philippines</td>
        <td>3</td>
    </tr>
    <tr class="light">
        <td>Poland</td>
        <td>2</td>
    </tr>
</table>
<p>The remaining 16 countries have one competitor each: Bosnia and Herzegovina, Bulgaria, Canada, Georgia, Italy, Jordon, Kyrgyzstan, Mexico, Morocco, Pakistan, Peru, Romania, Russian Federation, Slovakia, Slovenia and Turkey.</p>

<h3>The Finals and the Finalists</h3>
<p>We already know, competitors with the highest scores will be invited to attend the onsite finals in Orlando, Florida. Highest score? Who said that? You also need a visa, so visa problems continued this year, with broken hearts for some while others enjoyed a trip they weren't expecting. That brings an interesting question to my mind: should TopCoder tournaments be held outside the USA? What do you people think? My vote goes to Dubai, maybe China.</p>
<p>So, just like TCO07, Finalists competing onsite will be presented with their final design challenge during the welcome reception of the tournament. They will receive a packet of information describing the challenge in detail and will have 36 hours to define their approach before the 8 hour challenge during the day of competition.</p>
<p>We are still a few days away for finding the Studio Design Champion. So, what are they thinking now?  Let's have them onboard!</p>
<br />

<p><strong>So, when did you start participating in Studio Contests? How did you get involved?</strong></p>
<p><tc-webtag:handle coderId="13298470" />: After I turned 18. I wanted to participate earlier, but I had to wait until 18.</p>
<p><tc-webtag:handle coderId="15006955" />: I knew about TopCoder from my friend. I signed up in May 2005 to participate in logo contests for big tournaments. Over a year later, TopCoder launched Studio, and I felt that it would be a perfect place for me. I started to participate in several contests and I liked it so much that I participate nowadays and I'll surely participate in future!</p>
<div align="center"><img style="border:1px solid #000000;" src="/i/education/feature102607/Tricia_Tjia.png" /><br /><tc-webtag:handle coderId="22673857" /></div>


<p><strong>Tell us about your designing background and experience.  Do you have any professional training or are you just a hobbyist?</strong></p>
<p><tc-webtag:handle coderId="22677185" />: I haven't had any professional training yet, it started out as a hobby. From traditional artwork on paper, I moved on to graphic design. I've always been torn between my technical and creative aspirations, so digital art seemed to make room for both. I do intend to make it a profession eventually.</p>
<p><tc-webtag:handle coderId="22076237" />: At first, I was just a programmer. Then, there was a project that required design skills. I tried it and did it successfully. Since then, I have been in love with design projects.</p>

<p><strong>What are your other interests?</strong></p>
<p><tc-webtag:handle coderId="22626864" />: I like doing sports, in particular swimming. In the last period, I'm also trying to use my spare time to learn some new basic algorithms that I didn't study at university.</p>
<p><tc-webtag:handle coderId="13358674" />: Well, programming. I'm working on some games and on a e-learning website right now, but I'm really passionate about sports, especially tennis and soccer.</p>

<p><strong>Why did you think that you should participate in the TCCC07?</strong></p>
<p><tc-webtag:handle coderId="22677185" />: I had been participating in TCCC-eligible contests and seeing the TCCC logo everywhere I decided why not just register for it. And after that point I didn't give it much thought, I just continued participating in contests as always.</p>
<p><tc-webtag:handle coderId="22673857" />: It's good for my experience because I haven't been there (Orlando) before, so I think this is my chance.  Besides, it's so interesting to see a lot of talented people there.  That's great. :)</p>
<div align="center"><img style="border:1px solid #000000;" src="/i/education/feature102607/amiune.png" /><br /><tc-webtag:handle coderId="13358674" /></div>

<p><strong>How much time do you usually spend on Studio contests?</strong></p>
<p><tc-webtag:handle coderId="22626864" />: It depends mostly on the kind of contests that are posted in a specific week. I usually take part in storyboard and print contests. For sure, designing a web page takes many more hours than designing a t-shirt.</p>
<p><tc-webtag:handle coderId="15006955" />: It's hard to tell... I participated in about 4-5 contests but in some of them I didn't pass the screening and in the others I didn't manage to submit my work before the deadline. In total it was a little more than one week.</p>

<p><strong>Has this affected your studies?</strong></p>
<p><tc-webtag:handle coderId="22673857" />: This is the easiest question because I'll definitely say yes, but I think in a positive way: I learn a lot of things from Studio.</p>
<p><tc-webtag:handle coderId="15006955" />: No, it hasn't</p>
<div align="center"><img style="border:1px solid #000000;" src="/i/education/feature102607/CoralBlue.png" /><br /><tc-webtag:handle coderId="22677185" /></div>

<p><strong>What type of contests do you like the most? Why?</strong></p>
<p><tc-webtag:handle coderId="22626864" />: In general I like web page design contests. I believe it is the kind of contest where my creativity is really put to the test. There are many more elements that I have to design than in other competitions and I haven't so many constraints to take in consideration.</p>
<p><tc-webtag:handle coderId="13358674" />: T-shirt design because that is where I can be more creative.</p>

<p><strong>What type of contests do you like the least? Why?</strong></p>
<p><tc-webtag:handle coderId="22677185" />: Anything involving prototyping, because my code never seems to render properly in Internet Explorer.</p>
<p><tc-webtag:handle coderId="15006955" />: I don't like prototypes because they are very time consuming and work is done rather from the backside and you can't see the visual effect of it very well.</p>
<div align="center"><img style="border:1px solid #000000;" src="/i/education/feature102607/Maraqja.png" /><br /><tc-webtag:handle coderId="15006955" /></div>

<p><strong>Did you ask your friends to participate? Any help provided by your college?</strong></p>
<p><tc-webtag:handle coderId="13358674" />: I always invite my colleagues to try these contests at TopCoder.</p>
<p><tc-webtag:handle coderId="22076237" />: Yes, one is very successful: <tc-webtag:handle coderId="22690239" />.  He came from my high school too.</p>
<div align="center"><img style="border:1px solid #000000;" src="/i/education/feature102607/oton.png" /><br /><tc-webtag:handle coderId="22076237" /></div>

<p><strong>Your favorite software?</strong></p>
<p><tc-webtag:handle coderId="22677185" />: Adobe Photoshop, always! Starting to get the hang of Illustrator; and Dreamweaver and/or ImageReady+Notepad for prototyping.</p>
<p><tc-webtag:handle coderId="22626864" />: I love traveling, so when I can't I like using Google Earth to visit new places.</p>

<p><strong>Where do you do most of your design work? Home? College?</strong></p>
<p><tc-webtag:handle coderId="13358674" />: At home when I have a free time, sometimes on the bus.</p>
<p><tc-webtag:handle coderId="22076237" />: Home</p>

<p><strong>Did you expect to get onsite?</strong></p>
<p><tc-webtag:handle coderId="13298470" />: No, because I didn't score so well, because of my laziness.</p>
<p><tc-webtag:handle coderId="22673857" />: Nope, other competitors are too good... :P</p>
<div align="center"><img style="border:1px solid #000000;" src="/i/education/feature102607/SIGCHLD.png" /><br /><tc-webtag:handle coderId="22626864" /></div>

<p><strong>Who do you think will win? Who are your Top 3?</strong></p>
<p><tc-webtag:handle coderId="22677185" />: I'm not sure, since I haven't had a chance to look at the other participants' designs. But the Top 3 would be The Best, The Second Best and the Third Best. =)</p>
<p><tc-webtag:handle coderId="13298470" />: Tough question. We will see.</p>
<p><tc-webtag:handle coderId="22626864" />: I think <tc-webtag:handle coderId="22689218" /> and <tc-webtag:handle coderId="22673857" /> are the favorites.</p>
<p><tc-webtag:handle coderId="13358674" />: If you see the leader board, <tc-webtag:handle coderId="22689218" /> is the big favorite but I met the other guys and girls at the TCO and they are amazing: <tc-webtag:handle coderId="22673857" /> won the logo contest, <tc-webtag:handle coderId="22076237" /> is unbeatable on prototype contests and web design, <tc-webtag:handle coderId="15006955" /> is an incredible designer and you must see her amazing work as a photographer, and <tc-webtag:handle coderId="22626864" /> has a natural talent.  So the winner will depend very much on the contest type.</p>
<p><tc-webtag:handle coderId="22673857" />: My top 3 are <tc-webtag:handle coderId="22689218" />, <tc-webtag:handle coderId="22076237" />, and  <tc-webtag:handle coderId="22626864" /></p>
<p><tc-webtag:handle coderId="15006955" />: Hmm... in the interview for TCO07 I wrote that yiming will win and he did. So this time I'll write that I will win and I hope I will. :) Top 3... I'll stand for the ladies so <tc-webtag:handle coderId="15006955" />, <tc-webtag:handle coderId="22673857" /> and <tc-webtag:handle coderId="22677185" /> ;)</p>
<p><tc-webtag:handle coderId="22076237" />: I don't know. All competitors seem very creative. I think the contest will be very challenging.</p>
<div align="center"><img style="border:1px solid #000000;" src="/i/education/feature102607/abedavera.png" /><br /><tc-webtag:handle coderId="22689218" /></div>

<p><strong>Any advice for other Studio Members?</strong></p>
<p><tc-webtag:handle coderId="22677185" />: Live life to the fullest, and keep up the good work!</p>
<p><tc-webtag:handle coderId="13298470" />: Studio Members: don't be lazy.</p>
<p><tc-webtag:handle coderId="22626864" />: Just continuing to do what you are doing. You are great.</p>
<p><tc-webtag:handle coderId="15006955" />: From the beginning of Studio there have been so many improvements made that all I have to say is: Keep up the GREAT work :)</p>
<p><tc-webtag:handle coderId="22076237" />: Keep up your good work :-)</p>
<div align="center"><img style="border:1px solid #000000;" src="/i/education/feature102607/vlad_D.png" /><br /><tc-webtag:handle coderId="13298470" /></div>


<br /><br />
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
