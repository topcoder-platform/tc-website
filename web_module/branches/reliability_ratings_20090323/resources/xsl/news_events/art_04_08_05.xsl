<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/pr_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>Press Room</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<!-- Header begins -->
<xsl:call-template name="Top"/>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="bodyText" width="99%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">press_room</xsl:with-param>
                <xsl:with-param name="title">&#160;</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                        <div align="center">
                        <p><span class="bodyTitle">Code Warriors</span><br/>
                        <span class="bodySubTitle"><em>Young computer programmers battle for fame, money, and the love of algorithms</em></span><br />
                        <span class="bodySubTitle"><em>By Jennifer Jacobson<br />Chronicle of Higher Education</em></span></p>
                        </div>

<p>
SANTA CLARA, CALIF. - April 8, 2005 - The nerds have taken over the Marriott. On a Thursday morning in March, eight college students stand shoulder to shoulder in a brightly lit conference room, readying their brains for battle. Seconds from now, they will sit down at computers and fill their screens with lines of code that few other mortals could comprehend. 
<br /><br />
So begins the fifth annual TopCoder Collegiate Challenge, a computer-programming tournament in which contestants write algorithms to solve complicated problems while racing the clock. To survive, contestants need to master geometry, number theory, and for al proofs. For academe's cyber set, this is March Madness. 
<br /><br />
Run by TopCoder, Inc., a Connecticut-based software company, and sponsored by Yahoo, the contest and its $20,000 prize for first place brings together some of the world's top young programmers. The two-day event, one of several programming contests held each year, also attracts recruiters from leading technology companies, who come to dangle lucrative offers for jobs and internships before young computer jocks.
<br /><br />
After all, it is not easy to find students who can write a super-fast computer program to solve a problem like this: "Determine how many different character strings of a given length can be created using the letters A, B, or C."
<br /><br />
Nearly 1,300 students entered the competition, the first two rounds of which took place online in January. Only 24 finalists earned a trip here to Silicon Valley. Some have come from the nearby California Institute of Technology, others from as far away as Poland.
<br /><br />
As the first group of eight contestants prepares for combat this morning, a computer-generated voice introduces each of them to a small crowd of spectators. One by one the students step forward, smile at the applause, then walk to the stage, where desktop computers await. "The semifinal competition is about to begin," says the voice, programmed to sound like a British woman. "Good luck."
<br /><br />
The challengers here will need plenty of luck to beat Tomasz Czajka, the tournament's reigning champion and No. 1 seed. A 23-year-old doctoral candidate in Purdue University's computer-science program, he won three major tournaments last year, two of which were open to professional programmers. He has earned nearly $100,000 on the contest circuit and feels as mighty as a mainframe.
<br /><br />
Mr. Czajka (pronounced chee-ka) believes that his ability to relax during the contest gives him an edge over more stressed out competitors. "This is really like a holiday to me," he says.
<br /><br />
Still, during the competition he seems a bit hyper. He walks fast and talks faster. As the contest begins, his rivals show little, if any, emotion, but Mr. Czajka tries to psych them out by flashing a big grin and pumping his right fist into the air.
<br /><br />
In his native Poland, Mr. Czajka is a superstar. He has swigged coffee with Aleksander Kwasniewski, the Polish president, and garnered plenty of attention from the nation's press. In his homeland, he says, people treat him like a star athlete.
<br /><br />
Tall and thin, Mr. Czajka liked to play volleyball in high school, but he admits he was not very good. In coding contests, however, "he is scarily good," says James McKeown, TopCoder's director of communications. "He is the man."
<br /><br />
<span class="bodySubtitle">PROGRAMMED FOR VICTORY</span><br />
The son of two computer programmers, Mr. Czajka grew up in Stalowa Wola, a town east of Krakow. After his parents bought him a computer for his 10th birthday, he and his father would sit and write programs together. At 13 he started entering math competitions and attending science camps, where he learned the mathematical roots of computer science, like algorithms and beat structures. 
<br /><br />
At 14 Mr. Czajka entered his first high-school computing contest, in which students had to solve three problems in five hours. He didn't win, but the competition thrilled him. He knew then that he was hard-wired for cerebral combat. "It's like sports," he says. "You either run fast or you don't."
<br /><br />
He won several computing contests and TopCoder events before graduating from Warsaw University last year with a bachelor's degree in computer science. Upon earning a Ph.D. from Purdue, he might seek a job at a research laboratory. Perhaps he will return to Poland. Who knows? For now, his passion is cranking out code at warp speed. 
<br /><br />
On the first day of competition, Mr. Czajka ? better known by his nickname, Tomek ? sits at his computer, alternately chewing on his pencil, scribbling calculations, and typing furiously. He and the seven other contestants have been given three problems to answer in 85 minutes. Points are awarded for the accuracy of their code as well as for speed. 
<br /><br />
The remaining 16 contestants, who will compete later today, huddle at the edge of the stage, watching a computer monitor that displays what Mr. Czajka has typed. The room is silent, save for the click-clacking of keyboards.
<br /><br />
One of today's problems asks contestants to write an algorithm with which to calculate how much water would spill out of an x-sized container if a y-sized object (that may or may not float) were dropped into it. 
<br /><br />
To get started, students must work out some basic geometry. Mr. Czajka types, s=waterH++objW+11(wid*len).
<br /><br />
The waiting contestants are so transfixed that they do not dig into the dishes of candy and potato chips scattered throughout the room. They have no time to ogle Nalu, a curvaceous green-eyed mermaid who swims on a computer screen in a corner of the room, courtesy of Nvidia, a Santa Clara-based computer-graphics company. Nobody plops down on the big, comfy purple couch that Yahoo provided.
<br /><br />
Among the contestants watching Mr. Czajka's code unfold is Ralph Furmaniak, a mathematics major at the University of Waterloo, in Ontario. Mr. Furmaniak, the 39th seed in the tournament, jots down his own calculations to the problems on a pad of paper, for practice. 
<br /><br />
He concludes that he could write the proper programs for each of the problems, but plans to return to his hotel room and code them on his computer, just to be sure. He hopes that such geeky diligence will pay off ? and that Mr. Czajka is beatable. "No one can deny that he is consistent," Mr. Furmaniak says.
<br /><br />
Only halfway through the round, the champion needs a bathroom break. A "minder" escorts Mr. Czajka to and from the men's room. A few minutes later he hurries back to the stage. 
<br /><br />
After a sweat-inducing hour, it is time to see whether Mr. Czajka's codes work. The disembodied voice of the MC announces that the coding phase has ended. Now comes the challenge phase, in which the eight contestants can win points by finding flaws in each other's solutions. The catch: If their challenge is wrong, they lose points.
<br /><br />
Mr. Czajka submits one challenge that fails, then a second. The crowd gasps. "He's in trouble," says a spectator.
<br /><br />
The challenge phase drops Mr. Czajka to second place, at least momentarily. The champion looks frazzled. His alarm clock did not go off this morning, he says. He paces as he waits for the results of a computerized "systems test," the final analysis of the competing codes.
<br /><br />
A few minutes later, a TopCoder employee announces that all three of Mr. Czajka's codes were successful, giving him enough points to win the round. He grins and punches the air. He is going to the finals.
<br /><br />
Moments later, a petite blonde woman named Laura Bohland strolls over to chat with him. She is a recruiter from Yahoo who knows how to flatter. "You are one of the greatest engineers," she tells him, and "you have a great personality on top of that." 
<br /><br />
For several minutes she describes the joys of interning at Yahoo. Working for the company, she tells him, would be like extending his college years. She mentions that Sugar Ray, the pop-music group, played at the company's 10th-anniversay party. Before she leaves, Ms. Bohland asks him, "You have my contact information, right?"
<br /><br />
Mr. Czajka nods. "They've been trying to hire me for a long time," he says later. "They always hit on me."
<br /><br />
Yahoo representatives, he says, have told him that if he worked there this summer, he could do whatever he wanted while earning about $7,000 a month. But Mr. Czajka is not sure about the offer. For one thing, he has never heard of Sugar Ray. For another, he is waiting on an internship offer from his first choice, Yahoo's chief rival, Google.
<br /><br />
<span class="bodySubtitle">'YOU HAVE FAST HEADS'</span><br />
That night Yahoo recruiters take the contestants on a tour of the company's headquarters, a few miles away in Sunnyvale, where they hobnob with senior vice presidents over plates of roast beef and ice-cream sundaes. 
<br /><br />
The next morning, a few contestants are up early enough to watch the wild-card round; the winner will compete in this afternoon's finals. After lunch all of the students get a pep talk from Steven S. Skiena, a professor of computer science at the State University of New York at Stony Brook and one of the authors of Programming Challenges: The Programming Contest Training Manual (Springer-Verlag, 2003).
<br /><br />
Mr. Skiena believes that programming contests are valuable learning experiences, even for the contestants that do not reach the finals. "Programmers have to learn skills as opposed to facts," he says. "Thinking algorithmically is very, very hard. You learn it by doing and practicing."
<br /><br />
In his talk, he tells the contestants how "awesome" they are, cracking them up when he says: "You have fast heads. You have fast hands. You have balls." It is a reference to the fact that these students thrive under pressure ? and that every last one of them is male.
<br /><br />
A half-hour later, the laughing has stopped and the lights have dimmed. The four finalists are battling for the coding crown. 
<br /><br />
Some students not in the finals gather around the monitor displaying Mr. Czajka's progress. One of them snaps a photograph of it. The onlookers see that the champion has not attempted the most difficult of the three problems. There is talk of an upset. 
<br /><br />
"My money is on the Dutchman," says Mr. Skiena, referring to Mathijs Vogelzang, a student from the University of Groningen, in the Netherlands, who has taken the lead. "He is not afraid of Tomek."
<br /><br />
When the round ends, Mr. Czajka realizes that his only hope for victory is to find bugs in his competitors' codes. He dashes off three challenges. 
<br /><br />
As they wait for the results, Mr. Czajka and Mr. Vogelzang stand next to each other, all nerves. "Maybe mine is wrong," Mr. Vogelzang says. "Yeah, that would be great," Mr. Czajka replies. They both laugh.
<br /><br />
A few minutes later, a TopCoder employee proclaims Mr. Vogelzang the winner. Mr. Czajka's challenges have failed. He looks surprised. Still, he smiles and congratulates his rival. 
<br /><br />
The new champion walks to the front of the room, where he receives a game-show-size check, nearly as long as he is tall, for $20,000. Contests like this, Mr. Vogelzang says, make him doubt his plan to become a doctor.
<br /><br />
Mr. Czajka says he is satisfied with second place. He has just won $10,000 after all. But he vows to return to the next tournament, in the fall. "To win," he says.
</p>
                        <p><br /></p>
                        

                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="pr_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>

</html>

  </xsl:template>
</xsl:stylesheet>
