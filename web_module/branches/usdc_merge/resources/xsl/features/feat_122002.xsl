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
  <xsl:with-param name="title">&#160;TopCoder Feature</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="21" BORDER="0"/></TD></TR>						
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">
<!-- <IMG SRC="/i/f/feat_050102_tn3.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="right" BORDER="0"/> -->

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>The Big Rerun</B></FONT><BR/>
<I>A Complete Breakdown of the 2002 Invitational Championship Round</I><BR/><BR/>
Friday, December 20, 2002<BR/>
By&#160;KaiEl,<I>TopCoder Member</I><BR/>
</P>

<P>
Anyone who's been with TopCoder for long enough should be used to the troubles that occasionally 
come up during Single Round Matches. Whether it's due to an error in the problem statement, system 
testing or some other part of the process, sometimes there is an issue that compromises the fairness 
or feasibility of counting the results of a contest. Some coders get mad about having their 75 
minutes of hard work thrown out, but most of them accept that accidents do happen.
</P>

<P>
When there's a similiar problem at a $150,000 tournament, though, people tend to be less accepting.
</P>

<P>
Since the controversial re-running of the final round of the 2002 TopCoder Invitational, an 
internal debate has flared up within the ranks of the TopCoder competitors and administrators. 
Hundreds of people who were not directly affected by the results have posted their opinions in 
the Round Tables and chatted endlessly about the results in the Competition Arena. If TopCoder 
had its own version of 'Sports Talk' radio, then this one issue would probably have taken up 
the morning and afternoon drive-time slots for the past month.
</P>

<P>
But for all the chatter and all the writings about this issue, no two people seem to share 
exactly the same opinion on the controversy. True, you can generally divide those concerned 
into "the decision was fair" and "the decision was unfair" camps, but even then you'll find 
that people disagree on why the decision was fair or unfair, what the best course of action 
would have been, and what should be done to prevent these kinds of problems from happening 
in the future. Where is the middle ground in the debate? What is the general mood of the 
TopCoder community nearly a month after the controversy began? I was asked to find out.
</P>

<P>
<B>What actually happened?</B>
</P>

<P>
Even though there is a general agreement about the course of events that led up to the 
controversial decision to re-run the final round, there's some disagreement as to the 
details of what actually happened at the contest. The account of <B>John Dethridge</B>, one of
 the four finalists that participated in the disputed round, is probably the most logical place to start.
</P>

<P>
"I tested my 1100-point solution partway through writing it to make sure it was getting 
the right answers on the sample cases," <B>John Dethridge</B> said. "For two cases, it was 
getting the wrong answer. I spent most of the rest of the coding phase trying to debug 
my code and figure out why I didn't get the same answer."
</P>

<P>
It turned out that those two examples were showing up as incorrect due to a last-minute 
change to the problem statement. Problem author <B>axchma</B> explains the error:
</P>

<P>
"On Wednesday night I received an e-mail that some test cases were found on which my 
solution timed out. The problem was supposed to be downloaded to the site, and I 
didn't have time to rewrite my solution. I suggested to lower the number of cows, so my
solution wouldn't time out, or to find somebody else to write another solution. As I 
understood this didn't happen."
</P>

<P>
Lars Backstrom (<B>lbackstrom</B>), problem coordinator for the match, clarifies the nature of the problem and the 
manner in which it was discovered: "With about 15 minutes left, I became suspicious 
that there might be an error because <B>John Dethridge</B> was getting most of the examples right.  
I went back to double check everything and it became evident that I had introduced an off by 
1 error into the reference solution when I added one last heuristic."
</P>

<P>
With about 11 minutes left in the coding phase, the administrators sent out a broadcast
message about this error to the competitors, but due to a technical problem at the site of 
the competition, the message never made it to any of the coders. 
</P>

<P>
"I only found out about the problem because one of the administrators was told by a 
spectator that I'd been trying to get my code correct for one of the test cases for a 
long time," <B>John Dethridge</B> said, "so the administrator spoke with me to check that I
 knew that the test case was wrong. I then stopped trying to 'debug' my code, but by 
 that stage, there were only two or three minutes left of the coding phase, so I didn't 
 get time to finish my solution."
</P>

<P>
<B>The war room</B>
</P>

<P>
After the coding and challenge phases were over, the contest administrators went into 
the "war room," the place where the system tests were being run. This is when Jack Hughes, founder of TopCoder, became aware of the situation.
</P>

<P>
"I remember going into the 'war room', it appeared pretty solemn - quiet.  I asked what was going on.  [TopCoder Chief Technology Officer] Mike [Lydon], in a very matter of fact manner, described the situation. I was interested in whether or not, had he been given the right information, John would have had a shot at the problem in question.  The consensus seemed to be - maybe."
</P>

<P>
"I was very relieved," said <B>SnapDragon</B>, another of the four finalists, of his mood after the completion of the first contest. During the challenge phase of that round, <B>SnapDragon</B> had successfully challenged <B>John Dethridge</B>'s code on the 500-point problem, seemingly leaving him with a secure lead. If all of <B>SnapDragon</B>'s code passed the system tests, or if he and <B>John Dethridge</B> both failed on the 1100-point problem, then there was no way he could lose.
</P>

<P>
"<B>John Dethridge</B> seemed upset, understandably," <B>SnapDragon</B> said. "The crowd was supportive, and I think a lot of people were assuming I had probably won. Including me."
</P>

<P>
This assumption would not last, however, as the administrators soon called the four finalists into the war room to discuss their decision. Rumors began to circulate among the audience assembled at the Mohegan Sun competition site.
</P>

<P>
"Since we did not have enough information of what exactly went wrong, the most circulated guess was that <B>John Dethridge</B> argued that had he been able to submit the 1K with 15 minutes to go, then he would have a chance to fix his 500," said <B>kyky</B> one of the on-site spectators. "The assumption was that both <B>John Dethridge</B>'s and <B>SnapDragon</B>'s 1K passed the system tests." According to Hughes, however, no system tests had been run at this point, although the submitted code of all the competitors had been looked at.
</P>

<P>
<B>ZorbaTHut</B> described the general mood of the assembled crowd as confused and annoyed. "Most of the time the competitors were in another room talking to the administrators, so we didn't see them at all," he said. "I didn't hear any rumors - though I did jokingly say that they were going to start the finals all over again. I didn't think it would actually happen!"
</P>

<P>
"At the end of the challenge phase, the admins took the four finalists into a room in the back, which was confusing," said <B>lbackstrom</B>, one of the sixteen semi-finalists.  "Someone mentioned that in a previous tournament they had told the competitors the results before announcing them to the audience, so some of us thought perhaps that's what was happening. After a few minutes, word began to circulate that the administrators had told <B>John Dethridge</B> during the contest that the sample input was wrong, and it was apparent that things were going to be delayed."
</P>

<P>
While the on-site spectators rested and talked amongst themselves, those watching the competition on the Internet were treated to a 40-minute blackout period in which they were left in the dark on what was going on at Mohegan Sun. 
</P>

<P>
"The waiting started," said Goron, an online spectator, of the blackout. "We waited and waited and waited.  Then the contest was scrubbed. In the re-run, <B>John Dethridge</B> won."
</P>

<P>
<B>The Announcement</B>
</P>

<P>
After being assembled in the 'war room' for 20 to 25 minutes, the administrators and coders came out and the decision to re-run the contest was announced. Hughes explains his reasoning:
</P>

<P>
"I figured that if <B>John Dethridge</B> had a decent shot at the question but could not answer it due to the error, then neither could anyone else.  I essentially looked at the competition as fatally flawed. I do remember, after making the decision, that <B>John Dethridge</B> was arguing that for some reason or other having had the information would have given him more time to work on the other problems as well."
</P>

<P>
"The reaction of the crowd seemed to be overall surprise," Lydon said. "There was a collective gasp when it was announced that the round would be re-run. The mood of the audience did not seem particularly affected after the announcement. However, it was obvious that none of the finalists were looking forward to another difficult problem set in a couple of hours."
</P>

<P>
After a new round was run with a backup set of questions, (checked beforehand by on-site spectators <B>NDBronson</B> and <B>reid</B>) <B>John Dethridge</B> was declared the winner of the 2002 TopCoder Invitational. <B>SnapDragon</B> came in second place while finalists <B>dgarthur</B> and <B>moira</B> came in third and fourth, respectively.
</P>

<P>
<B>The Controversy</B>
</P>

<P>
Looking back, coders seem hopelessly split as to whether or not the decision to re-run the final round of the contest was the best one possible, based on the information available at the time. Retired member Goron, who started a 60+-message thread on the Round Tables about the issue, seems in the lead of those opposed to the decision.
</P>

<P>
"There is nothing fair about depriving somebody of a lead or any other benefit that they have accrued in competition," Goron said. "Scrubbing a contest, especially after examining the likely outcome, is arbitrary and patently unfair. Imagine if I won the lottery, only to be told that I wouldn't get my million because a couple of tickets were double printed. Pshaw! Only radical communist philosophies believe that fairness is achieved by erasing the fruits of one's past efforts."
</P>

<P>
Goron had plenty of support for his position. "The most flattering judgment that could possibly be made of TopCoder's decision is that it was an arbitrary one," said stupefaction, another on-site spectator. "At the time the decision was made, I saw it only as a sad miscarriage of justice brought about by the tournament organizers' ineptitude and stupidity."
</P>

<P>
"My biased opinion is that the least unfair solution would have been to let the contest stand," said <B>SnapDragon</B>, who has posted extensively in the Round Table discussion on why he feels the decision was unfair. "Conditions in the contest were technically equal, even though John was possibly harmed by the error and I was not. I understand the administrators' decision, but they were mistaken in believing that it would end up being fair to everyone. Instead of being unfair to <B>John Dethridge</B>, it was unfair to both <B>dgarthur</B> and me."
</P>

<P>
Others supported TopCoder's decision to re-run the contest. "I strongly believe there was no other alternative [to re-running the contest] in this case," said <B>ValD</B>. "Any other choice would simply mask the unfairness that was obviously present. Re-running the round invited back all the fairness that was originally intended."
</P>

<P>
<B>John Dethridge</B> defended the decision as well. "I think it was handled in the best fashion possible," he said. "To obtain a result without a re-run, they'd have needed to make some kind of guess as to the likelihood of my level 3 solution passing system tests, if the problems had not occurred. There wasn't really any way they could do that, and I doubt that anyone would have been satisfied with an outcome that was determined by such a guess anyway."
</P>

<P>
<B>John Dethridge</B> added that he believes his 1100-point problem would have passed the system tests, making the re-run largely irrelevant. "I was fairly confident that the solution I said I would have submitted would have worked, since I had worked on similar optimization problems before," he said. "I didn't know for sure until the problem was put up in a practice room in the applet, and I got a chance to submit my solution.  It passed, and actually turned out to be much faster on some of the more difficult test cases.  So I probably would have won the first run of the finals, so I don't feel bad about the eventual outcome."
</P>

<P>
The administrators were quick to back up their decision too. "Given the circumstances, I still believe that the decision that was made was the best decision that could have been made," Lydon said. "During the decision making process, there was a whole lot of speculation over what could have happened - who could have done what with more time and less confusion.  Our final decision was based on throwing out all speculation and deciding whether or not the original final round was conducted in a manner that was fair and consistent for all of the competitors.  Our unanimous decision was that it was not a fair round of competition."
</P>

<P>
Some coders, like <B>schveiguy</B>, supported the decision based on the information available at the time, but think that the outcome was unfair based on information that has come out since the competition ended. "I learned afterwards that both <B>SnapDragon</B> and <B>John Dethridge</B> failed the level 3 on a test case that was not in the examples," he said.  "It is my belief that if they knew the true example answers and their flawed solutions were outputting the same, they would have submitted their code anyways, and failed anyways." 
</P>

<P>
Others are largely undecided on the issue. "The way it was handled was clearly not the fairest for any individual competitor," said <B>radeye</B>, "since fairest means equitable to all competitors, and clearly rerunning it was unfair to <B>SnapDragon</B>. But not re-running it would have been unfair to <B>John Dethridge</B>.  In a situation like this, there just is no totally fair solution."
</P>

<P>
<B>What's to be done?</B>
</P>

<P>
As a result of the controversy, steps are already being taken at TopCoder to prevent problems like these from happening in the future. A Contest Review Board, made up entirely of coders, has been proposed by Jack Hughes to "minimize mistakes affecting tournaments and SRMs as well as helping to set rules, process and policy for when they do [occur]," according to a Round Table post. <B>Lars</B> has also taken pains to make sure future examples are correct before they get to the applet. "Right before every match now, I go back and reread everything, and re-test the reference solutions on all test cases," he said.
</P>

<P>
Other changes are being made specific to on-site competitions, like the Invitational finals. "We will never again depend on the administrative broadcast system for communicating important information to a group of on-site competitors," Lydon said. "At the very least, we could have verified with the competitors that they had received the announcement."
</P>

<P>
Coders had a variety of additional suggestions for reducing the chance of problems occurring. "Personally, I think a system test for the writer's solution is a good move," said <B>ValD</B>. "The system test should only consist of trivial cases, which are easily calculated by hand.  The effect of this is buggy solutions are less likely to make their way into a round."
</P>

<P>
"I think multiple working solutions should be required," said <B>schveiguy</B>. "Then both smart and random-generated test cases based on the constraints should be tested against all solutions.  Currently, the test cases are not random; the writer must provide them."
</P>

<P>
<B>axchma</B> had a rather radical suggestion to improve problem quality. "Increase the amount of money paid for the Division-I hard problems," she said. "The Division-I hard problems [are paid] three times as much as Division-II easy problems, but the work ratio is 10 to 1. For some problems like Meteor a lot of extra time is needed."
</P>

<P>
<B>A matter of respect</B>
</P>

<P>
In the end, the controversy caused by the 2002 TopCoder Invitational Finals may be remembered mainly as a public relations issue. Many coders have reported feeling reduced respect for TopCoder and its administrators since the Finals.
</P>

<P>
"I cannot overstate how appalled I was and continue to be by TopCoder's actions in the final," said Goron, who has retired from TopCoder over the controversy. "It appears that many TopCoder disciples are unwilling to criticize because they feel beholden to the organization.  Blind acceptance of TopCoder's weaknesses benefits neither TopCoder nor its members."
</P>

<P>
<B>ZorbaTHut</B> also said he lost some respect for TopCoder after the finals, but not wholly because of the administrators. "In all honesty, I don't think <B>John Dethridge</B> or <B>SnapDragon</B> is handling this very well," he said. "It's sort of a pity they're on opposite sides of the world, or I'd have them go out for a beer together or something -- and have <B>John Dethridge</B> pay for it. As it is...well, someone in my SRM123 room called it the first TopCoder soap opera, and I think that fits it pretty well."
</P>

<P>
But to other coders, the way the TopCoder staff handled the tumultuous finals has only increased their respect for the organization. "To me this has demonstrated TopCoder's intense commitment to producing a fair result," <B>NDBronson</B> said. "They did not take the easy way out, but rather made a difficult decision and then followed through on it.  The finalists themselves have my highest respect.  Had I been in the finals myself I don't believe I would have had the stamina to compete back-to-back."
</P>

<P>
Even <B>SnapDragon</B>, the man who was allegedly cheated out of $30,000 by the decision, bears no ill will to those who had to make it. "Mistakes happen. TopCoder is run by humans, and there will always be the potential for error.  I understand the decision, despite the significant cost to me.  As long as TopCoder learns from this experience, and does not repeat the same mistake in the future, I have not lost respect for them."
</P>

<P>
But the cost for <B>SnapDragon</B> goes much deeper than a simple loss of money or respect. "On a personal level, I don't think I'm equipped to handle playing for such high stakes," he said.  "Going into the competition, I kept telling myself to consider any money I won a 'bonus'... but I let myself believe, for a few moments, that I had truly won $50,000 and the title of TopCoder champion.  That was a mistake.  I should have known better."
</P>

<P>
As it no doubt has for many coders, the whole thing has simply left <B>SnapDragon</B> with a bad taste in his mouth. "The sad part is, until the Invitational I loved writing computer competitions," he said. "I'm not sure that is true any longer. They taste of ashes."
</P>

<P>
<A HREF="/index?t=tournaments&amp;c=invit02_champ" CLASS="bodyText">Click here</A> for championship summary and photos.
</P>

<P><BR/></P>

<IMG SRC="/i/m/KaiEl_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;KaiEl<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=264761" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
      
<P><A HREF="/?&amp;t=features&amp;c=feat_topics" CLASS="bodyGeneric">Would you like to write a feature?</A></P>
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

