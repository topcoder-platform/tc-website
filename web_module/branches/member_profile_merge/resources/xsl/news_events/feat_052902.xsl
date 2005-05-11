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
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>Non-Eligible TopCoder Members Compete Despite Restrictions</TITLE>
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
  <xsl:with-param name="image">press_room</xsl:with-param>
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

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>The Outsiders</B></FONT><BR/>
<I>Non-Eligible Members Compete Despite Restrictions</I><BR/><BR/>
Wednesday, May 29, 2002<BR/>
By&#160;Adam Loss,<I>TopCoder Staff Writer</I><BR/>
</P>

<P>
Ah, the excitement of going to an amusement parks as a kid.  You couldn't wait to climb 
on your favorite ceramic horse and go up and down the Merry-Go-Round, crash into your 
friends in the Bumper Boats, and show your parents your world class arm by knocking 
down a bunch of stacked cans to win a stuffed animal.  What you really wanted, though, 
was to experience the thrill of that supersonic roller coaster you had seen advertised 
on television.  You waited in what seemed like an endless line for hours and slowly 
progressed to the front of the line.  Finally there, your smiling face and racing heart 
are quickly replaced by streaming tears and a temper tantrum when you read the sign 
which says, "You Must Be This Tall For This Ride", and you're just not that tall.
</P>

<P>
Now think how American kids who aren't yet 18 years old, and programmers from countries 
not yet eligible to compete (and earn cash prizes) in TopCoder competitions feel when 
they search the internet for "Programming Competitions", discover TopCoder and its 
significant financial rewards, become members and then find out they can't win a 
piece of the TopCoder pie.  Well, I'm sure their frustration was handled with a bit 
more maturity than the childish behavior of a little kid, but nonetheless, they are 
disappointed, although not as much as you would think...
</P>

<P>
Russia's <A HREF="/tc?module=MemberProfile&amp;cr=269088" CLASS="bodyGeneric">pan</A>
 is frustrated he can't win money, but it "doesn't spoil the great feelings 
I'm getting from competing in TopCoder's competitions.  I really love programming and I 
love the spirit of competition.  I always searched for a competition such as this, and 
was really excited when a friend of mine told me about TopCoder."
</P>
 
<P><IMG SRC="/i/f/feat_052902_tn1.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="right" BORDER="0"/>
"Of course I wouldn't mind earning money," said Norwegian member, 
<A HREF="/tc?module=MemberProfile&amp;cr=251832" CLASS="bodyGeneric">dark_lord</A>.  "But, 
I keep competing at TopCoder because I'm very fond of solving problems, and TopCoder 
is one of very few places where you can do problem-solving in a competitive environment."
</P>

<P>
The love of coding and the willingness to learn are what keep underage American's 
<A HREF="/tc?module=MemberProfile&amp;cr=274504" CLASS="bodyGeneric">brother_cheng</A>
 (Massachusetts) and <A HREF="/tc?module=MemberProfile&amp;cr=277851" CLASS="bodyGeneric">hay4man</A>
 (Texas) competing.  "I love computer 
science and have the desire to learn new programming techniques that are faster 
and more efficient," said <B>hay4man</B>, while <B>brother_cheng</B> added, "I'm motivated to 
learn more technique in programming, and perfect my skills." 
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=260274" CLASS="bodyGeneric">dark_shadow</A>, 
a resident of Norway, mentioned "the ability to code the programs 
in a real-time environment, where time pressure is of the utmost importance to win 
<IMG SRC="/i/f/feat_052902_tn2.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="5" ALIGN="left" BORDER="0"/>is what appeals to me."  He then admitted he was somewhat frustrated, although, 
"Not because I'm so greedy for money, but because I know that I am among very few 
people that don't have this privilege."
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=269554" CLASS="bodyGeneric">Yarin</A>, 
a recent Coder of the Week 
(<A HREF="/index?t=statistics&amp;c=coder_of_week042202" CLASS="bodyGeneric">View the Coder of the Week feature on Yarin</A>) 
from Sweden, summed up the thoughts of the frustrated foreign contingent by admitting, 
"I've been doing problem solving programming for fun for years without receiving any prize 
money as a reward.  Of course, doing the same thing as a lot of others, and performing 
better than most, while they receive money and you don't, well that can frustrate anybody."
</P>

<P>
More than not being compensated for their performances, many of the ineligible 
members were more frustrated with the match times and the feeling of seclusion.
</P>

<P>
<B>Woke Up, Got Out of Bed...</B>
</P>

<P>
When the hours of 3 and 4am are mentioned, most of us can be found dreaming about 
being on a private island with an exotic model, celebrating the $1 zillion we just 
won in the lottery, or communicating with aliens in space.  That's because sleep is 
what the majority of people in this world are doing at that time of the day.  Even 
if you are up, your brain is probably mush from watching your fourth consecutive 
infomercial on the latest weight loss gimmick.  Anybody feel like designing a code 
based the maximum number of calories that a hiker can take on a trip, such that the 
total weight of the items does not exceed the maximum weight and the total volume of 
the items does not exceed the maximum volume right about then?  Well, if you're from 
countries such as France, Sweden, Norway or Russia, then this is exactly what you'd be 
doing, since this is what time the TopCoder Single Round Matches start for you.
</P>

<P>
Some members try and get a few hours of sleep before the contest:
</P>

<P>
"I set the alarm to wake up at 2:30 or 3:30am," said 
<A HREF="/tc?module=MemberProfile&amp;cr=273079" CLASS="bodyGeneric">JeromeAbela</A> of France, who 
makes sure he has a glass full of Coca-Cola and music turned on, among other things, 
to help him stay awake.  "If I'm too tired, or not motivated enough, I know I won't be able to wake up."
</P>

<P>
"I usually try and go to bed earlier to be able to wake up earlier and to 
participate in a match," mentioned <B>pan</B>.  "Unfortunately, many times I just miss 
the match by waking up later, and many times I just can't allow myself to get to 
bed early, as I have lots of things to do besides TopCoder." 
</P>

<P>
"Im probably not at my peak of intelligence at 3am," proclaimed <B>dark_shadow</B>.  
"Competing at about 4am average, I sacrifice a lot more than Americans to participate."
</P>

<P>
"The only reason why I don't compete in every Single Round Match, are these inhuman 
match schedules," declared <B>dark_lord</B>.  The toughest part of each match is usually 
the struggle to get out of bed.  Perhaps TopCoder should arrange a sympathy-match 
at 3am EST with no prizes, to see how well the US coders perform while struggling to 
keep their eyes open.  You could call it ZombieCoder."
</P>

<P>
An interesting fact which was brought to my attention by <B>dark_lord</B>, and that some of you 
may have noticed by viewing the non-eligible rooms, is that "the Norwegian coders have 
the dark_ prefix, because it's usually quite dark here when we code."
</P>

<P>
<B>Same Bat Time, Same Bat Place</B>
</P>

<P>
In the movie Groundhog Day, Bill Murray's character kept repeating the same day.  Well, to 
coders like <B>brother_cheng</B>, competing in a Single Round Match seems like they are repeating 
the same day as well, since "you'll always be competing with the same people, and you won't 
be able to compete with the other members."
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=275071" CLASS="bodyGeneric">antimatter</A>, 
an underage American member from New York, is frustrated by the seclusion of the 
non-eligible rooms, because he constantly has to perform against some members who have much 
higher ratings, which decreases his chance for feeling the satisfaction of winning a room and increasing his rating.
</P>
 
<P>
"The most frustrating issue is the fact that all the non-eligible coders are put in a separate 
room, which makes us feel that not only are we banned from the earnings, but we're also banned 
from the rooms where the real competition happens," said <B>JeromeAbela</B>.  "I also miss the Ironman 
system because the non-eligible room contains levels ranging from 1200 to 2400."
</P>

<P>
The seclusion of the non-eligible rooms has proponents, however, as well.  
</P>

<P>
"Having our own VIP room is a little cool, actually," proclaimed <B>dark_shadow</B>.  "It's nice to test 
wits against the same coders over some time.  You get to see the progression and regression.  
Second to Room 1, we're the only room that people can check out for the latest results.  
All other rooms are different each time."
</P>

<P>
"The ineligible rooms are also unique in that you compete with the same people over and over again, 
and you get to know them," added <B>dark_lord</B>.  "A match usually ends with "cya!" or "Auf Wiedersehen! 
(Good bye, See you, or So long)"
</P>

<P>
<B>There Is An "I" in Quit</B>
</P>

<P>
Remember all of those internships and volunteer jobs that your parents and teachers recommended you do 
to enhance your resume?  Sure you learned a lot and the experience was invaluable, but after pouring all 
of your blood, sweat and tears into it, down deep it must have been eating at you that you weren't getting 
paid.  No money for the underage Americans must lead to some thoughts of quitting, right?
</P>

<P>
"Never," said <B>antimatter</B>.  "I love the competition, even if I can't make any money off of it.  As far as 
I'm concerned, money would just be an extra incentive."
</P>

<P>
"I find no reason to do so," seconded <B>brother_cheng</B>.  "Good competition and good problems mean I'll 
continue to do it," while <B>hay4man</B> added, "I rarely quit an unfinished job."
</P>

<P>
All three are looking forward to their 18th birthdays. 
</P>

<P>
No money and the added burden of match times in the wee hours of the morning have produced a number 
of different thoughts from the non-eligible European members.
</P>

<P>
Some share the thoughts of <B>pan</B>:
</P>

<P>
"I don't even think of quitting.  As long as TopCoder exists, I'll be competing here.  
My motivation is not the money, but the love for programming and the competitions."
</P>

<P>
Some share the thoughts of Germany's <A HREF="/tc?module=MemberProfile&amp;cr=276854" CLASS="bodyGeneric">hjdorn</A>:
</P>

<P>
"Maybe when I reach a point where my ranking stabilizes (i.e. no more progress).  Getting 
some money for winning a room once in a while would keep me from quitting, I suppose."
</P>

<P>
While others like <B>dark_lord</B> and <B>dark_shadow</B> are waiting to see what the future holds:
</P>

<P>
"Norway is a small country, so I'm prepared to wait long for eligibility," said <B>dark_lord</B>.  
"Since money isn't my primary motivation, I don't think I'll quit just because I'm ineligible to 
receive prizes.  <B>dark_shadow</B> added that he might skip some matches along the way due to the odd hours, 
but "the account always lies ready to participate again."
</P>

<P>
<B>Tan&#225;cs</B>
</P>

<P>
I'm guessing that only 15 of you know what the title of this section means.  That's because we have 
15 members from Hungary, and tan&#225;cs is Hungarian for advice, with perhaps the best piece of advice 
for underage American's and non-eligible members of other countries was offered by Hungarian member, 
<A HREF="/tc?module=MemberProfile&amp;cr=273185" CLASS="bodyGeneric">mitch0</A>.
</P>

<P>
"They (potential non-eligible members) should definitely become members, and actively participate as 
much as they can.  I believe it would help in 'internationalizing' TopCoder if there were a lot more 
competitors from the 'outside' countries.  For those that are ineligible only because they're under 18, 
it's not even a question; by the time they'll become eligible, they'll have a lot of practice behind them, 
and that will surely help them win prizes later."
</P>

<P>
<B>How About This...</B>
</P>

<P>
Hearing the phrase "it's not about the money" seems a lot more genuine coming from a non-eligible member 
of TopCoder, than a professional athlete who just signed for $200 million because $199.5 million just wasn't 
enough.  However, seeing hundreds of other eligible coders receive money for their sometimes not-as-good or 
equal performances, has led these members to propose a couple of solutions.
</P>

<P>
<B>JeromeAbela</B> would like, "to be able to compete in the eligible rooms, and give any of his winnings to an 
American not-for-profit, while <B>dark_lord</B> and <B>Yarin</B> would like the ability to give their winnings to charity.  
<B>Yarin</B> adds, "This way we could compete in the regular rooms, which would be a lot more fun.  There are not many 
people in the non-eligible room in Division-I, sadly."
</P>

<P>
<B>antimatter</B> would like underage American members to be treated somewhat like child actors.  "It's sort of 
frustrating to not be able to win money for this.  I wonder if it would be possible maybe to send the 
money to my parents in my name?"  Hopefully this wouldn't result in members like <B>antimatter</B> suing his 
parents like Macaulay Culkin did for his Home Alone royalties.
</P>

<P>
<B>The TopCoder Response</B>
</P>

<P>
TopCoder Chief Financial Officer Tanya Horgan addressed the eligibility issue as follows:
</P>

<P>
"In order to include additional countries, TopCoder must first perform a thorough review of the gaming 
laws in each country to determine whether our contests would be considered lawful.  This review would 
include an evaluation of whether our contests would be considered a lottery, since we award cash prizes.  
It is, as we know, a skills contest, however we must review the subtle details of the laws to ensure our 
contests comply with each country's laws.  TopCoder engages a local law firm in each country to perform 
the review, and they report to us their findings and opinion as to whether our contests comply with local 
laws.  Their report also includes an affidavit that contest winners must execute, as the language in the 
affidavits varies by country.
</P>

<P>
TopCoder evaluates the opportunities to open up our competitions to other countries based on the 
representation in our member base.  We must also consider language barriers in non-English speaking 
countries as a possible hindrance to performing this process efficiently and cost-effectively."
</P>

<P>
As far as the eligibility of underage American's, Mrs. Horgan added:
</P>

<P>
"Anyone under 18 years of age is considered a minor, and any contract they sign would be invalid 
because they are not considered 'capable' of entering into a lawful and binding contract.  Since 
they have to sign an affidavit if they win money, if a winner was under age 18, the affidavit would be unenforceable."
</P>

<P>
Despite the current restrictions, Mrs. Horgan is encouraged by TopCoder's international growth and 
notes that continued foreign expansion will take place.  "We are very excited about the level of 
participation in our Single Round Matches from the global developer community, despite the fact 
that many competitors are ineligible to win prize money.  Although prize money is only awarded to 
residents of six eligible countries (Australia, Canada, India, Ireland, the United Kingdom and the 
United States), more than 100 countries are represented in the TopCoder community.  Even with this 
impressive global representation, TopCoder remains committed to expanding the list of eligible 
countries, and is pleased to announce the recent addition of New Zealand and China."
</P>

<P><B>A Wish For The Future</B></P>

<P>
Perhaps <B>pan</B> best professed the dream of all non-eligible members best, "I hope that this 
competition continues to grow and include new countries into the community.  I really like 
what the TopCoder team, have already created, and I just enjoy it.
</P>

<!-- <IMG SRC="/i/m/KaiEl_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;KaiEl<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=264761" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/> -->
      
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
        <xsl:call-template name="pr_right_col"/>       
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
