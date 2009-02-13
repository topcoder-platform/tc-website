<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Features</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY>
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
	<TR>
    <!-- Left Column Begins -->
		<TD WIDTH="180" VALIGN="top">
<!-- Left Column Include Begins -->	
    <!-- Global Seconday Nav Begins -->	
        <xsl:call-template name="global_left"/>
	<!-- Global Seconday Nav Ends -->	
<!-- Left Column Include Ends -->    		
	  	</TD>
	<!-- Left Column Ends -->
	<!-- Gutter Begins -->
		<TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">features</xsl:with-param>
  <xsl:with-param name="title">&#160;TopCoder Weekly Features</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="21" BORDER="0"/></TD></TR>						
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">
<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>The Women of TopCoder</B></FONT><BR/>
<I>Few in Numbers, Not in Ability</I><BR/><BR/>
Wednesday, May 1, 2002<BR/>
By&#160;Adam Loss,<I>TopCoder Staff Writer</I><BR/></P>
<P>I was walking around the mall recently and remembered that my young female cousin would be celebrating a birthday very soon.  So, I walked into a computer 
games store and thought I'd buy her present there.  Receiving at least one instant message a day from her saying "Wazzupp!!!", I know she likes to spend 
time on the computer, and buying her a game to keep her occupied, would save me from replying with a more colorful comment than my usual, "I'm working".  
Looking at such titles as: Dungeon Siege, Resident Evil, and Bloody Roar 3, I noticed that most of the games involved blood and guts, not the most 
attractive gift for a young girl.  This brought me to a stark realization, computers just aren't marketed and targeted toward girls when they are 
youngsters, which consequently has produced a very small number of female programmers.</P>
<P>"I think that a lot of women don't code because they didn't get into computers at an early age," said <B>try17</B>.  "In the past, there were not many computer 
games that were geared toward little girls; whereas, boys had choices in action/adventure games."</P>

<P><B>"Guys Don't Date Geeky Girls"</B></P>

<P><IMG SRC="/i/f/feat_050102_tn3.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="right" BORDER="0"/>Even though many of us flip the television channels when a commercial appears, it's very easy to ascertain that certain items such as: make-up kits, stuffed animals and Barbie dolls are targeted toward little girls, while sports equipment, remote control cars and action/adventure and sports computer games have little boys written all over them.  Both <B>pearl</B> and <B>polgara</B>, two of TopCoder's top-rated female members mentioned society as the main reason computers and programming aren't more prevalent in the lives of girls.  "I think girls are pushed to go into other things by society and peers," mentioned <B>pearl</B>, while <B>polgara</B> added, "Society does not encourage women to be coders".</P>
<P>"From an early age, women are discouraged from appearing to be too smart, and not encouraged to go into science, math or computing fields," continued <B>polgara</B>.  "I showed equal aptitude in arts and science areas, but was told by my high school guidance counselor to study English, because I had a better chance at getting a job, as a woman."</P>
<P>"In general, women are not encouraged to consider engineering fields whereas men are," mentioned <B>jgrau</B>.  "You always hear about how men are so good at things like math and engineering, but people don't talk about it being for women."</P>
<P>Camryn Manheim of the television show The Practice proudly exclaimed, "This is for all the fat people!" after winning the award for Best Supporting Actress in a Television Series (Drama) at the Golden Globes in 1999.  That remark sparked considerable conversation and made it very apparent that above being thin, sexy, and beautiful, talent is the key to becoming a success and being recognized and rewarded in your field.  Strangely, that same similarity seems to exist in the computer-programming world, where females were thought to be hiding behind their computers because they were assumed as ugly.  "Role models for women, shown by TV and media, are rarely ever programmers," adds <B>polgara</B>.  "Women don't see themselves as becoming programmers and still being able to retain their femininity and attractiveness.  At age 15, my friends told me that I should stop doing so well in math and science, because 'guys don't date geeky girls'.  It is difficult to ignore that message, when it is constantly reinforced - including by guys in general who don't date geeky or girls who are perceived to be more intelligent then themselves."</P>

<P><B>Not Until You're Older!</B></P>

<P>If you ask professional hockey players when they started playing, most would respond with either age three or four.  Friends of mine from Ontario and Alberta can remember learning to skate before they could walk, and playing in the so-called IHL (Infant Hockey League).  Developing your skills at a young age gives you a decided competitive advantage against your contemporaries who pick it up at an advanced age.  This is one of the predominant reasons that the majority of professional hockey players are Canadian.</P>
<P>Naturally, being led to different activities as young children, many female coders were introduced to the computer and to programming at a much older age than their male counterparts.  Whereas top male members like <B>zoidal</B> and <B>milhouse</B> began coding as soon as they got out of their diapers at ages four and five, the majority of female members had their introduction to the world of programming during their teenage years, and some didn't start until their 20's.  "At a young age, females are more intended to do different things, like dancing and painting, instead of coding," mentioned <B>Arremoon</B>.</P>
<P>"I was about 13 years old and it was in Basic," said <B>sosonel</B>.</P>
<P>"It would've been freshman year in college, so I was 18," mentioned <B>dana</B>.  "It was probably PL/I."</P>
<P>"I was 19," proclaimed <B>try17</B>.  "I wrote a 'Hello, World' program in C for class."</P>
<P>Those quotes explain the fact why there are only 10 females among TopCoder's top-500 rated members.  An encouraging sign, however, is that the highest rated female member, <B>moira</B> (1790), is ranked 100th overall, with <B>dana</B>, <B>Arremoon</B>, and <B>cleverbb</B> not that far behind in the rankings ladder.</P>
<P><B>jamieb100</B> is one of the exceptions to the female trend, as she began programming at age nine.  "In elementary school I found out that all Apple computers around had a programming environment built in if you press 'control-reset'.  The cursor would be at a little bracket (]) and you could just program in Basic.  I thought that was kind of neat."</P>
<P>The common theme for how women got involved with programming was a love for, and aptitude in, math and problem solving.  "I always loved math and solving problems, said <B>pearl</B>, while <B>jamieb100</B> mentioned, "I've always liked math, because it was more like a puzzle than any other part of academics."  <B>jgrau</B> was persuaded by a friend of her older brother to take a programming course.  "I'd always been good at things like math and puzzle solving, so it was no surprise I got hooked on programming."</P>

<P><B>From You Can't Do That to R-E-S-P-E-C-T</B></P>

<P><IMG SRC="/i/f/feat_050102_tn1.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>Discrimination often plays a factor in any subject matter that involves gender.  When it comes to female programming, however, it is surprisingly a non-issue.  "I think many of the people I've been in the same room with didn't even realize I was a girl," said <B>sosonel</B>.</P>
<P>"No" or "Absolutely not," was the reply I got when I asked <B>try17</B>, <B>dana</B>, and <B>jamieb100</B> about male-generated discrimination.  <B>jamieb100</B> added, "I think people gave me a lot of credit for being in a male dominated discipline.  In the work force, I've been told that it's harder for a female to push ahead in her career - you have to be REALLY good to get recognized comparatively.  I don't honestly think it's that big of a deal though.  I think like any discrimination, if you concentrate on it, it seems more prevalent, but if you just forget about it, it won't bother you."</P>
<P>"I've never met a good female programmer" and "women should stay home and program their kids" were some of the foul comments directed towards <B>polgara</B> in her first job out of school.  "I complained to my manager, and the comments stopped," she said.  "But it was still uncomfortable, because I knew the guys still felt the same way, even if nothing was said aloud.  It was made bearable though, by the respect and camaraderie from most of the other coders."</P>
<P><B>jgrau</B> happened to be a victim of same-sex discrimination.  "Strangely enough, the most degrading feeling I ever had came from a fellow female programmer who made the assumption that the assignments would be harder for me because I was female.  I, of course, proved otherwise."</P>

<P><B>Where Do They Find The Time?</B></P>

<P>"We do more before 9am than most people do all day" is the popular credo of the United States Army.  That statement might as well be applied to the American Woman as well.  Wake up. Shower. Get the kids up.  Get the kids dressed. Prepare breakfast. Clean-up breakfast.  Make the kid's lunch.  Drive the kids to school.  All of this usually happens before 9am, Monday through Friday, and doesn't even include: Clean the house.  Do the laundry.  Prepare dinner.  Help the kids with homework, etc...  Although there are many more Mr. Moms these days, the majority of the housework remains a responsibility of the woman.  Along with the many adjectives that can be used to describe the chore of housework, the one that sticks out is time-consuming.  Time-consuming is a common word when talking about computer-programming as well.  Just ask the TopCoder development staff, who can regularly watch CBS' The Late, Late Show and The Early Show right from the TopCoder office, or <B>dana</B>, who has been working "about 70 hours a week", or <B>pearl</B>, who besides her job, "cares for her two young sons, is a cub scout den leader, volunteers at their schools, and helps with the schools web site."  These life activities can lead to very few moments to relax and have time to yourself, let alone find the time to compete and build your rating in a TopCoder Single Round Match.</P>
<P>"Women tend to have less free time (caring for house, kids, etc.) to participate in 'Fun' stuff," mentioned polgara.  "Men are less limited by this factor.  Perhaps the chance to win a babysitting service might be effective."</P>
<P>"Once someone becomes a parent, their #1 priority becomes their children," said <B>pearl</B>.  "The reason I work only part-time is so that I can be there for my sons.  Most of the matches take place in the evenings, when I am busy helping the kids with homework, dinner, etc.  Luckily, they are great kids and are excited about me competing!  However, sometimes the scheduling will make it impossible for me to compete.  For instance, the night of Single Round Match 84 (Tuesday, April 30), my older son has an awards presentation at his school at 7.  If it runs late, I will miss the registration period and the match."</P>

<P><B>The TopCoder Experience</B></P>

<P>The reasons women get involved in TopCoder competitions?  Same as the guys.  It's fun, it's a learning experience, and it's enjoyable...oh yeah, the cash too.</P>
<P>"The problems looked interesting," said <B>Arremoon</B>.  "And looking at other people's code, I realized that there are plenty of good coders here.  It's fun to compete with good ones and get myself improved.  Also, the cash prizes are a good incentive."</P>
<P>"To try to learn more Java," proclaimed <B>try17</B>.</P>
<P>"I thought it would be a good way to practice my coding, possibly win some money if I was lucky," mentioned <B>jamieb100</B>.</P>
<P>"I would like to get more proficient in Java and C++," said <B>pearl</B>.</P>

<P><B>More, More, More</B></P>
<P>The TopCoder membership numbers continue to rise.  Professionals.  Collegians.  Citizens from the USA, Canada, India, Australia and around the world continue to join.  The thing is, most of TopCoder's new members are men.  So, how does TopCoder attract more female members?</P>
<P>Besides comments from <B>try17</B> and <B>jamieb100</B> that thought this type of feature was a good idea, and others who had no idea on how to increase the membership numbers of women, <B>polgara</B> provided perhaps the most interesting and clever idea.</P>
<P>"I enjoy shopping greatly.  Sometimes the notion of a shopping gift certificate, is more fun and a bigger incentive than money.  For those few occasions when I have won money at TopCoder, I've felt that it should be banked and something sensible done with it.  If you had given me a certificate for Zales jewelry, I could get something more frivolous.  Sometimes a nice pair of diamond earrings is more spurring (to me) than $500 - check out the success of Mary Kay.  Of course, if you do something like this, then you run the risk of being called sexist, but it would make me happy."</P>
<P>Women.</P>
<P><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Have an idea for the weekly feature?</A></P>

						</TD></TR>                                                                 
					</TABLE>
		<P><BR/></P>
					</TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>   	
				<TR>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>
			</TABLE>
		</TD>
	<!-- Center Column Ends -->
<!-- Body Area Ends -->

	<!-- Gutter -->
		<TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	<!-- Right Column Begins -->
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->       
        </TD>
	<!-- Right Column Ends -->
	<!-- Gutter -->
		<TD WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	</TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
