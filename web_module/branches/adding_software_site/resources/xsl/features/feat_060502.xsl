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

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Where Has The Time Gone?</B></FONT><BR/>
<I>qubits Became TopCoder's First $100,000 Champion One Year Ago This Week</I><BR/><BR/>
Wednesday, June 5, 2002<BR/>
By&#160;Adam Loss,<I>TopCoder Staff Writer</I><BR/>
</P>

<P>
Powerball, "It's America's Game", and it's extremely popular.  And to think of it, why wouldn't it be?   Powerball is a lotto game, which is a combined large jackpot game and a cash game.  Twice a week, drawings are held where participants must match five balls, plus the "red powerball" to balls that are randomly chosen, to win a jackpot which has many times exceeded $50 million.  It only costs one dollar to play, so it's worth a shot, but the odds to win the jackpot are 1:80,089,128.  Hardly a sure thing.  Playing the lottery is more of a matter of luck rather than skill, although the people who constantly play the numbers of their birthday or their kids age's will tell you differently.
</P>

<P><IMG SRC="/i/f/feat_060502_tn1.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
TopCoder, although not as widely known as Powerball, is becoming pretty popular itself, averaging close to 60 new members per day, and has also been known to pay out a pretty penny to its members.  <A HREF="/stat?c=member_profile&amp;cr=105922" CLASS="bodyGeneric">qubits</A>
 was TopCoder's first big winner, rewarded with $100,000 for winning the 2001 TopCoder Collegiate Challenge.  Although TopCoder's $100,000 grand prize is nowhere near a reward of $50 million from Powerball, <B>qubits</B> decided the odds of TopCoder were more in his favor, as he could use his skills, rather than rely on luck, to earn a big payday.
</P>

<P>
Educated and trained at MIT and armed with a Bachelors Degree in Computer Science and Mathematics and a Masters Degree in Engineering, <B>qubits</B> "knew that TopCoder was not yet widely known (when he joined in March 2001), and that the upcoming Collegiate Challenge would not draw the audience that it could (and later events have).  As a result, I thought I might have decent odds at making it to the semifinals."
</P>

<P>
<B>qubits</B> was right.  The odds to make the semifinals of the 2001 TopCoder Collegiate Challenge, where competitors were guaranteed to win $3,000, were 16:256 or 1:16.  The worst odds in Powerball, just matching the "red powerball" are 1:74 and pay a miniscule $3.  The odds to win $100,000 in Powerball (matching five balls) are 1:1,953,393, whereas the odds at winning the $100,000 grand prize at the Collegiate Challenge was 1:256.  In Powerball, odds of 1:256 pay out $7.
</P>

<P>
Luck might pay a buck, but skills pay the bills.
</P>

<P>
<B>1,2,3,4...A,B,C,C++?</B>
</P>

<P>
Although stubborn and independent, four-year-old children have an uncanny desire to learn and explore.  Parents know to never answer a question with a non-definitive word such as "because", as they are more than likely going to receive the extremely annoying "Why, Why, Why?!?!" until a direct answer is given.
</P>

<P>
<B>qubits</B> started to program at age four.  "My father got me off to a good start."  Like most children his age, <B>qubits</B> had queries, and of course asked why, but "he (his father) could answer most questions I had at a young age."
</P>

<P>
<B>qubits</B> father did such a good job at answering his questions, in fact, that "he convinced my mother that I had an aptitude for computers which should be encouraged  At four, I wrote something along the lines of 'Hello, World'.  I think I referred to a BASIC manual to see how to do certain things, and it undoubtedly started with a program like that.  I would sometimes type the source code (BASIC) of games into a TI99/4A.  On occasion, I would try to figure out what the program actually did and would use what I learned to write simple programs."
</P>

<P>
<B>qubits</B> desire to learn and explore then became more personal as, "soon after I drove myself, using computers to solve interesting problems I came across while growing programming related skills.
</P>

<P>
I have always liked CS/programming, but it is somewhat focused.  My primary focus has been solving problems and I see computers as a tool to that end.  Programming remained a hobby from my elementary years up through high school, while my primary focus was on mathematics and the physical sciences."
</P>

<P>
With that kind of background and youthful agenda, an education from MIT was naturally followed by a career in computer industry.  "My primary focus is on solving interesting problems.  I would flat out refuse most jobs that fall under the classification of 'programmer'.  However, programming is a great tool for most problems, so I decided to specialize there."
</P>

<P>
<B>A TopCoder First</B>
</P>

<P>
<B>qubits</B> was introduced to a TopCoder, a place where he could sharpen those programming skills, weeks before the start of the 2001 TopCoder Collegiate Challenge.  
</P>

<P>
"My bridge partner and friend told me about the site.  He was a classmate at MIT and is now pursuing his PhD in Computer Science at Stanford.  It (TopCoder) looked fun and I thought I might be able to get a slice of the $250,000 Collegiate Challenge prize purse."
</P>

<P>
After getting through the first three online elimination rounds, <B>qubits</B> was confident when he headed to San Francisco for the onsite finals.
</P>

<P>
"By the time the 16 semifinalists were known, my goal was to make it to the finals.  <A HREF="/stat?c=member_profile&amp;cr=112630" CLASS="bodyGeneric">Aleksey</A>
 seemed to be the strongest competitor in my room, but his performance in SRM's leading up to the finals was far less strong than his qualifying rounds."  
</P>

<P>
The following is <B>qubits</B> take on the semifinals, in his own words:
</P>

<P>
"Going with the strategy I decided on before the event, I opened the 500-point problem first, expecting to advance to the 1000-point problem if people seemed stuck on the 250-point problem, otherwise picking up the 250-point problem and ending with the 1000.  Upon reading the 500-point problem, a dynamic programming solution immediately jumped out at me and led to a quick solution.
</P>

<P>
Seeing only one solution for the 250, I moved on to the 1000 (I think).  I also saw a quick solution for this problem, and submitted it in twelve minutes.  Seeing only two other submissions (both easy), I confidently attacked the 250-point problem and finished in just over 28 minutes total.
</P>

<P>
Upon walking off the competition platform in under 30 minutes, some of the other competitors were noticeably disturbed.  I was feeling good and started to work on challenge test cases.  My confidence improved further when I saw <B>Aleksey</B> skip the 500-point problem.
</P>

<P>
During the challenge phase, I quickly picked off all of the other easy submissions.  I could taste victory as <B>Aleksey</B> challenged <A HREF="/stat?c=member_profile&amp;cr=110176" CLASS="bodyGeneric">Orbus</A>
' 500-point problem, leaving me over a 1000-point lead.  That taste quickly turned bitter when I realized my 1000-point problem was flawed.  My lead mentally collapsed to 200 points and I realized I would fail if I had another bug in my 500-point solution.
</P>

<P>
I waited intently for the results, hoping my solutions would stand.  When it did, I was excited and relieved."
</P>

<P>
<B>qubits</B> confidence for the semifinals quickly faded when he got a look at the competition in the finals.  "I didn't think I would have good odds in the finals, so I decided I'd just give it a shot for what it's worth if I made it."
</P>

<P>
A very intense <B>qubits</B> was able to drown out his nervousness on finals morning.  "I remember bringing a couple bottles of water/juice with me to the terminal and had to ask for more during the competition.  I don't ever remember ever needing to drink that much before."
</P>

<P>
<B>qubits</B> now takes us through the finals:
</P>

<P>
"Upon making it to the finals, I had done what I had set out to do and was actually quiet calm.  I was a bit nervous upon reading the 500-point problem, however.  Unlike the day before, I could not think of the dynamic programming approach.  Not knowing what else to do, I brute forced it and found that it would execute in under six seconds in the worst case, so I submitted and moved on.
</P>

<P>
For the 1000-point problem, I encountered a severe compiler error that caused me to lose my calm demeanor minutes after regaining it.  There was a syntax error that was reported in a nonsensical sense on another line.  I remember calling Mike (admin) over, but there was nothing he could do.  Eventually I discovered it and charged forward.  Initially I thought of just keeping track of which vertices are traversed by the bounding path, but discovered that was not sufficient.  After a bit more hacking I discovered it would be sufficient if I doubled the grid size.  It took only a few minutes to implement the changes followed by some testing...submit.
</P>

<P>
The 250-point problem seemed like a complicated tangle of prioritized special cases.  I tried to carefully get the cases right, but <A HREF="/stat?c=member_profile&amp;cr=114443" CLASS="bodyGeneric">jonmac</A>
 would eventually catch me on one I missed.  I thought this would be a ripe area for challenges.
</P>

<P>
Thus, in the challenge phase I rushed to inspecting the easy problems, declining the chance to attack <A HREF="/stat?c=member_profile&amp;cr=112441" CLASS="bodyGeneric">seacow</A>
's last-minute 1000-point submission.  However, like in the semifinals, I was able to defeat each of the other 250-point submissions, producing a 500-point swing (~200 + 3x100).  I realized I might just have a chance, so I charged forward to increase my lead.
</P>

<P>
Then I noticed <A HREF="/stat?c=member_profile&amp;cr=109965" CLASS="bodyGeneric">vulture</A>
 was using the approach I abandoned on the hard problem.  He tried to avoid the problem by omitting the last segment inspected.  I didn't notice this, though, so had I challenged with something like "DRU", his code would have succeeded.  However, a little voice inside me made the test case a bit wider (like "RRDLL"), forming a successful challenge.
</P>

<P>
When <B>vulture</B> exploited <B>jonmac</B>'s corner-case in his 500-point solution and <B>seacow</B>'s problems fell, things were looking pretty good.  I tried to extend my lead by challenging <B>jonmac</B>'s 1000-point solution, but failed.  <B>jonmac</B> caught my 250-point bug and cheered with excitement, but I remained confident; after all, I had 300 points from challenges and his 500-point solution was down, giving me just over a 400-point lead.
</P>

<P>
The walls came crashing down when it was announced immediately after the contest that I would lose two of my challenges on the 250-point problems.  My 400-point lead vanished: 200 to lost challenge points and the another 200 or so to <B>jonmac</B> regaining credit for his 250-point solution.  I panicked, realizing that only 206.76 points separated us and that <B>jonmac</B> could have scored that much on his 250-point problem (I had forgotten and the scores had not yet been updated).  However, I was quickly reminded by my guests, who had been working through all the possible scenarios, that he received under 200 points:  I had won."
</P>

<P>
<B>qubits</B>, now the inaugural TopCoder tournament champion, $100,000 richer, and arguably the top collegiate programmer in the country, almost needed someone to pinch him.  "I almost didn't believe it at first."  The media and spectator frenzy also caught <B>qubits</B> off guard.  "I had a bunch of lights, cameras, and a microphone pointed at me...Wow!!!"  When all of the attention died down for a bit, <B>qubits</B> finally got a chance to reflect on what had just taken place.  "I was relieved.  I had been looking forward to the semifinals for days, and then the finals.  I could finally relax."
</P>

<P>
We've all heard of those stories about the person who took a tax-refund, invested it and is now a multi-millionaire.  Unfortunately, we've also heard just as many, or more, stories of athletes and entertainers who've squandered the millions they've made with exurbanite expenditures.
</P>

<P>
<B>qubits</B> decided to take the approach of the former, and although he isn't a millionaire yet, his winnings have exhibited considerable growth over the year.  "Eventually I hope to buy a house once I decide for sure where I want to live long-term." 
</P>

<P>
<B>Compete. Win. Repeat.</B>
</P>

<P>
In the world of competition, winning successive major events is very difficult.  Whereas in team events, the group as a whole can offset a poor performance by one member, individual events such as TopCoder major tournaments don't provide such a luxury.  Many times sub-par displays are the result of pressure, which is exactly what <B>qubits</B> felt during the semifinals of the 2001 TopCoder Invitational, the next major tournament.
</P>

<P>
"I was nervous and rattled, the complete opposite of the Collegiate Challenge.  Lately, I've been wondering if this is a curse of previous success.  I barely made it through the online qualification rounds, bombing in the semifinals.    If I was presented the set during an ordinary online match, I'm sure I would have done much better.  I choked."
</P>

<P>
Though disappointed, <B>qubits</B> didn't let it affect him too much.  "I had my moment in the spotlight, and not doing well in the Invitational wouldn't change that."
</P>

<P>
<B>Professional Life</B>
</P>

<P>
The rules change and your responsibilities increase when you leave school and enter the real world.  The professional engagements in the life of <B>qubits</B>, who is currently a Senior Research and Design Engineer in California, have led to him competing in only two of the last 21 matches.  Don't expect to see him quietly vanish from the TopCoder hierarchy and become another 'whatever happened to him?' case, however.  <B>qubits</B> is still motivated to do well and has a sincere love of coding.  "Competing is fun.  Competition scares some people, but I think the more interaction there is, the better.  I like working through the various types of problems that are used, and have a love of problem solving in general.  I'll definitely compete more as the Invitational approaches."
</P>

<P>
<B>qubits</B> goals for competing in TopCoder competitions from when he was a student are now somewhat different.  "While I was a student, match awards were great because I wasn't making a lot of money while at school.  The problems were fun, but time was limited as I was cramming for the final leg of writing my thesis.  Now the money is less important, but I have more time for competing."
</P>

<P>
<B>Advice</B>
</P>

<P>
Advice from your TopCoder peers is usually something to value.  They are people who are just like you, and may be the best at understanding your needs, wants and concerns, so most likely listening and learning from them would be of tremendous benefit.  Advice from <B>qubits</B>, however, is definitely something to value.  Think about it.  <B>qubits</B> is a TopCoder original, a two-time tournament semifinalist, and a $100,000 champion.  He joined TopCoder when there were only 205 members, Single Round Matches had yet to start, and TopCoder was a virtual unknown in the developer community.  TopCoder has now attracted well over 16,000 members, has run 94 Single Round Matches, held three major tournaments, paid out millions of dollars in prizes, and attracted major technology companies as sponsors.  According to <B>qubits</B>, there is no need to worry about competing:  
</P>

<P>
"Many people seem scared of competing, but they don't realize that most of the other people just starting out feel the same way.  Even then, there's nothing to be really afraid of.  No one knows who you are, and you'll compete against coders of similar ability.  As you improve, so will your competition, at your own pace.  Just do it!"
</P>

<P>
<B>Future</B>
</P>

<P>
It would be nice if we all had a Delorian, and once we hit 88 mph be sent into the future to see how our lives have unfolded.  Well, since that's just a movie fantasy, and we have no idea of what the future holds, we must wish and hope.  Personally, <B>qubits</B> hopes "to make it back into the top-10," and would "eventually like to solve an important problem facing society or design something to fill a need, although it's not clear what that problem or need is, though."  As far as TopCoder goes, he would like to see more medium sized tournaments, perhaps encompassing a weekend, added to the TopCoder competition structure, and a "report card" added to the member profile, "which highlights areas of weakness and strengths as a coder and plots improvement.
</P>

<P>
Along with the increased quantity of coders who have helped TopCoder increase from the 205 members when <B>qubits</B> joined, to the current level of over 16,000, the quality of coders has also sky-rocketed.  The battle during the next TopCoder tournament will produce the most competitive competition ever, making the odds of <B>qubits</B> becoming TopCoder's first multiple tournament champion extremely difficult.  It's a good bet that he will be among the final sixteen, however, since he's two-for-two in that respect. 
</P>

<!-- <IMG SRC="/i/m/KaiEl_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;KaiEl<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=264761" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/> -->
      
<P><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Would you like to write a weekly feature?</A></P>

<P><BR/></P>
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
