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
<!-- <IMG SRC="/i/f/feat_050102_tn3.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="right" BORDER="0"/> -->

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>First-Time Phenomenal</B></FONT><BR/>
<I>kpsmith Makes TopCoder History In Debut Match</I><BR/><BR/>
Wednesday, May 15, 2002<BR/>
By&#160;Adam Loss,<I>TopCoder Staff Writer</I><BR/></P>

<P><IMG SRC="/i/f/feat_051502_tn1.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="5" ALIGN="right" BORDER="0"/>
Rookies.  Showing up as a rookie can sometimes be tough.  Sure, there are those 
well-known rookies who come along with a big reputation, and are able to succeed 
right from the start of their careers.  Most, however, must go through the growing 
pains of their initial experience. The isolation, the loneliness of not knowing 
anyone, and the uncertainty of what you're supposed to do and what's expected. 
 Most often they just observe what's going on around them, quietly learn how to 
 master their domain, and make an impression sometime down the road.  While it's 
 no surprise when a known commodity achieves greatness, what if the debut performance
  by one of those unknown rookies included an all-time record such as: five home runs,
   seven touchdowns, or 101 points in a basketball game?
</P>

<P>
Simple.  They'd garner immediate attention and notoriety, which is exactly what 
has been brought upon <A HREF="/stat?c=member_profile&amp;cr=277956" CLASS="bodyGeneric">kpsmith</A>,
 who in Single Round Match 86, his initial TopCoder 
competition, earned a Division-II record 1935.74 final points.  That point total
 broke the Division-II record of <A HREF="/stat?c=member_profile&amp;cr=155069" CLASS="bodyGeneric">chi</A>,
  who earned 1898.64 final points in Single Round Match 67 in February.
</P>
<A HREF="/stat?c=highest_totals&amp;dn=2"><IMG SRC="/i/f/feat_051502_tn3.gif" HSPACE="10" VSPACE="5" ALT="" BORDER="0"/></A>
<P>
The final point total of <B>kpsmith</B> is also TopCoder's all-time point record, 8.35 
more than the 1927.39 total of <A HREF="/stat?c=member_profile&amp;cr=109965" CLASS="bodyGeneric">vulture</A>
 in Single Round Match 1, which strangely 
enough occurred exactly one year (May 8, 2001) from the date <B>kpsmith</B> broke the 
record (May 8, 2002).  <B>kpsmith</B> also broke the record for the most points earned 
in a debut match, which was held by <A HREF="/stat?c=member_profile&amp;cr=112630" CLASS="bodyGeneric">Aleksey</A>,
 who earned 1787.55 final points in 
the Second Round of the 2001 TopCoder Collegiate Challenge.  Lastly, <B>kpsmith</B> had 
a debut rating of 1894, which is the seventh highest ever.
</P><A HREF="/stat?c=impressive_debuts"><IMG SRC="/i/f/feat_051502_tn2.gif" HSPACE="10" VSPACE="5" ALT="" BORDER="0"/></A>

<P>
<B>The Match</B>
</P>

<P>
Although not cocky, <B>kpsmith</B> had a positive feeling about his first TopCoder match. 
 "I knew I had a good chance to do well, but you never know when a particular problem 
 will cause you grief.  I figured I had a 50/50 chance of winning $100."
</P>

<P>
<B>kpsmith</B> played it smart prior to his initial match.  After becoming a member 
on April 20, <B>kpsmith</B> put himself through his own version of spring training.  
"I went to the practice rooms and did some of the problems.  After doing them, 
I read other people's solutions and figured out what I could have done better. 
 Then I rewrote them.  Frankly, I didn't know anything about the C++ STL until 
 three weeks ago when I started browsing this site.  Now I know it pretty well,
  mostly from reading other people's submissions."
</P>

<P>
<B>kpsmith</B> got off to a quick start, submitting code for the Level One problem 
in 3:06 for 296.46 points.  He then spent 4:10 on the Level Two problem and 
earned 538.43 points, and finished the Coding Phase of the competition with 
1685.74 points by completing the Level Three problem in 6:53 for 850.85 points.  
That total put him in first place in Room 62, 48.97 points ahead of 
<A HREF="/stat?c=member_profile&amp;cr=282138" CLASS="bodyGeneric">ekrips</A>.
</P>

<P>
"After writing solutions for the problems, I first chatted with the system 
testers for 30 minutes, then for the next 30 minutes I chatted with other people 
in the room and tried to think of what kind of bugs I should be looking for during
 the Challenge Phase."
</P>

<P>
That must have been quite a chatting and thinking session, since in the next
 15 minutes, <B>kpsmith</B> would make TopCoder history by adding 250 points to 
 his total with five successful challenges.  <B>kpsmith</B> takes us through the 
 Challenge Phase:
</P>

<P>
"About five minutes before it (the Challenge Phase) started, one person
 asked how one of the players (<B>ekrips</B>)
  managed to get 898 points on a 900 
 point problem.  No one answered, but clearly several people realized that 
 he must have submitted empty code.  So once the Challenge Phase started, 
 we all raced to that problem and challenged it as quickly as we could. 
  Alas!  I typed in one of the inputs incorrectly, including a space where 
  they were not allowed.  By the time I had correctly formatted my challenge,
   the problem had already been challenged by someone else (<A HREF="/stat?c=member_profile&amp;cr=281606" CLASS="bodyGeneric">floris</A>)!
</P>

<P>
After that, things went uphill.  I realized with the Level One problem 
that people were unlikely to code for handling 0 properly (when looking 
for the lowest digit in a number - a typical loop might skip over the case 
of 0 completely and return some incorrect default value).  So, I managed to 
challenge three of the Level One problems quickly with that bug.  Another 
one was just completely wrong and wouldn't have passed any of the example tests.
</P>

<P>
By that time, <B>floris</B> had examined all of the Level Three problems and 
already challenged one.  I took a quick look at the others and didn't 
see anything blatant.  I then got lucky stumbling across a Level Two problem 
where the coder (<A HREF="/stat?c=member_profile&amp;cr=267903" CLASS="bodyGeneric">tzesti</A>)
 had clearly misread the problem.  If anyone else 
had gotten to it first, they would certainly have seen the problem just as
 quickly."
</P>

<P>
What makes the final point total of <B>kpsmith</B> even more impressive, is 
how much better it was than the average Division-II coder on each problem.  
For instance, the average coder earned 260.88 on the Level One problem, 35.58 
less than <B>kpsmith</B>, 463.77 on the Level Two problem, 74.66 less than <B>kpsmith</B>,
 and 566.51 on the Level Three problem, an amazing 284.34 less than <B>kpsmith</B>. 
  Even more amazing than the discrepancy in points related to the average, 
  is that he earned that many points when only 36.9% of the competitors who
   submitted code for the problem were actually correct.
</P>

<P>
"I was a little surprised, and pleased, at the margin of victory!  I 
always do better when I'm under stress and time pressure, though.  So 
even though I've never gone through three problems quite that smoothly 
in the practice rooms before, I'm not too surprised that I did particularly 
well under competitive pressure."
</P>

<P>
After the match, <B>kpsmith</B> logged off and went to bed, unaware of his 
achievements.  "My friend <A HREF="/stat?c=member_profile&amp;cr=278964" CLASS="bodyGeneric">digitalbeing</A>
 pointed it out to me the next morning.  It certainly felt good."
</P>

<P>
<B>Peer Reactions</B>
</P>

<P>
"<B>kpsmith</B> is one of the brightest and most analytical engineers I know," 
remarked <B>digitalbeing</B>, when asked if he thought his friend <B>kpsmith</B> was 
capable of a performance like this.  "I was not surprised that he did so 
well in his debut; <B>kpsmith</B> is a highly proficient programmer who is equally 
adept at defining efficient system architectures and coding up quick'n'dirty 
(correct!) solutions to one-shot challenges.  For that reason, an arena like 
the TopCoder tournament is a natural fit for him.  I expect he will be bumping
 elbows with the top Division-I coders soon."
</P>

<P>
While <B>digitalbeing</B> expected this type of performance by his friend, 
the Room 62 adversaries of <B>kpsmith</B> appreciated his kindness and were 
in awe of his proficiency and professionalism:
</P>

<P>
"The guy outclassed everyone in the room that night," said 
<A HREF="/stat?c=member_profile&amp;cr=280290" CLASS="bodyGeneric">Iconoclast</A>.
</P>

<P>
<A HREF="/stat?c=member_profile&amp;cr=282277" CLASS="bodyGeneric">FoneBone</A>
 and <A HREF="/stat?c=member_profile&amp;cr=269697" CLASS="bodyGeneric">OMNI</A>
 both mentioned that they were "amazed at how 
brilliant and efficient his code was."
</P>

<P>
"<B>kpsmith</B> was a very friendly person," revealed <B>floris</B>.  "I also 
finished early, and we had a nice chat about the problems."
</P>

<P>
The previous high point record holder was also impressed:
</P>

<P>
"I have always had a difficult time scoring near my previous best, 
even with a great round," remarked <B>vulture</B>.  "Looking back at that 
round, I'm surprised I was even able to score that high.  I'm also 
surprised that nobody has been able to top it until just now.  It was 
no easy task for sure, and a great accomplishment for him.  I wish him 
continued success on his future competitions."
</P>

<P>
<B>Early Start</B>
</P>

<P>
Like most people who are successes in their respective field, and in 
the same realm as most of the top-rated members of TopCoder, <B>kpsmith</B> 
began his programming at a young age.
</P>

<P>
"I mostly taught myself and wrote my first program when I was 10.  It 
was a simple program to simulate a submarine hunting board game I had.  
By the time I got to college (UC-Berkeley with a Bachelors degree in EECS 
and a focus on Computer Science, and then a Masters degree in Computer 
Science with a focus on computer graphics) I knew half of what was being 
taught in the classes and spent time on the side programming games.  My 
favorite was 'Netrek' which a friend and I developed as a derivative of xtrek.  
I learned as much from programming that game than I did from all of my classes, 
and it was more fun!  I love the ability to create something from nothing.  If I
 had been born 100 years earlier, I probably would have been an architect." 
</P>

<P>
<B>Discovery</B>
</P>

<P>
There are many different ways people come to discover TopCoder.  Member 
Referral.  Campus Poster.  Email from School Faculty.  Search Engine.  
Newsletter.  Another Web Site.  <B>kpsmith</B> discovered TopCoder through a 
newspaper article, which appeared in the San Jose Mercury News on April 19.  
Actually, it was the wife of <B>kpsmith</B> who noticed the article and thought it 
sounded like a good fit for him.
</P>

<P>
"She knows that I love to play games and to program, and that I'm really 
good at both," recalled <B>kpsmith</B>.  "She also thinks that I can out-program 
anyone and wanted to see how I'd do.  She was probably reading the article 
and thinking, 'My husband could do that!  He'd do really well!'  Then she 
showed me the article and encouraged me to try it saying that she would 
enjoy seeing how I did with it."
</P>

<P>
Winning at TopCoder will aid the social life of <B>kpsmith</B> and his wife.  
"My wife likes the idea that I can make enough to pay the baby sitter."
</P>

<P>
<B>Can It Continue?</B>
</P>

<P>
One hit wonders.  They happen all the time in movies and sports, but most often 
in the world of music.  While they start off with a bang, and continued success 
is expected, the phrase "We Hardly Knew Ye!" is often used as a characterization 
since they quickly disappear and are never heard from again.  Anybody remember 
"Come on, Eileen" by Dexy's Midnight Runners or "Safety Dance" by Men Without Hats?
</P>

<P>
Well TopCoder is not without its own one hit wonder.  In Single Round Match 20, 
<A HREF="/stat?c=member_profile&amp;cr=152437" CLASS="bodyGeneric">oneshinevn</A>
 won Room 13 with 1713.30 final points and a record debut rating of 2100.  
<B>oneshinevn</B> lost 78 rating points in his next match, and even though he gained 50 of 
those back in Single Round Match 22, four matches later <B>oneshinevn</B> was down to a 
rating of 1404, and never competed again.
</P>

<P>
<B>kpsmith</B> intends to continue to compete as long as he finds the time, and won't be 
affected by a rating that either rises or falls, because he believes that TopCoder's 
unique rating system will rank him where he belongs.
</P>

<P>
"The ladder based ranking system is designed to gradually move people to a level 
where they are competitive with the people who have similar rank.
</P>

<P>
If my first round was a fluke, then as I play, I will find that I'm outmatched 
and my ranking will slowly drift down to a level where I'm competitive again.  
On the other hand, the rating based upon one round is just as likely to be too 
high as too low.  So, my rating could just as easily drift up and stick me in Room 1.
</P>

<P>
The bottom line is that I WANT to be placed in a room with other people at my 
skill level.  If that is Room 10, then my rating will drift down until I end up 
in Room 10.  If that is Room 1, then it will drift up until I end up in Room 1.  
Either way is ok with me."  
</P>

<P>
<B>The Sequel</B>
</P>

<P>
<B>kpsmith</B> almost made it two-for-two in room wins, as he led Room 4 with 1385.87 
points after the Coding Phase in Single Round Match 87.  <A HREF="/stat?c=member_profile&amp;cr=269058" CLASS="bodyGeneric">jasonw</A>
 successfully 
challenged his Level Three submission during the Challenge Phase, however, 
dropping him to sixth place.  
</P>

<P>
"Argh!," was the reaction of <B>kpsmith</B> to his performance in Single Round Match 87.  
"I almost took my room in the next round too!  But a 'n &gt; 2' that should have been 'n &gt; 1' got me!"
</P>
 
<P>
Despite the disappointment, the rating of <B>kpsmith</B> did increase by 35 points to 1929. 
</P>

<P>
<B>The Next Great One?</B>
</P>

<P>
We are always looking to replace our heroes, leaders and legends when they get older and 
ride off into the sunset.  Who's going to be the next Babe Ruth? The next John Wayne? 
The next Beatles? We've asked these questions in the past. 
</P>

<P>
TopCoder is, of course, very young but a few coders, <A HREF="/stat?c=member_profile&amp;cr=152073" CLASS="bodyGeneric">NDBronson</A>,
 <A HREF="/stat?c=member_profile&amp;cr=114853" CLASS="bodyGeneric">dmwright</A>,
 and <A HREF="/stat?c=member_profile&amp;cr=114443" CLASS="bodyGeneric">jonmac</A>, 
have become very well known and respected by the member community, and have achieved that 
legendary status already.  Is <B>kpsmith</B> on the path to TopCoder greatness?  
Well it's too early to tell, but sharing the same handle structure as <B>NDBronson</B> 
and <B>dmwright</B> is a good start.
</P>


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
