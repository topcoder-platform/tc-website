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
        <TITLE>Case Studies and the TopCoder Viewpoint</TITLE>
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

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Obfu-what?</B></FONT><BR/>
<I>Case studies and the TopCoder view point</I><BR/>Wednesday, May 22, 2002<BR/>
</P>

<P>
It's the challenge phase.  At first glance the code you're looking at 
seems horribly flawed.  A crucial if-statement is missing at the 
beginning of a loop, making this coder's solution useless.  "How 
could they have made such an obvious mistake," you think, as you 
run through the code one final time to make sure you didn't miss 
anything.  It's then that you see it: a slider at the bottom of the 
viewing window indicating that there is more to this code than meets 
the eye.  As you move the slider to the right, you see the crucial 
if-statement, indented past the edge of the viewing window.
</P>

<P>
Was this an act of deception, intended to trick coders into making 
unsuccessful challenges, or was it an innocent mistake by a coder having 
trouble indenting correctly?  The answer to this question determines whether 
or not cases like these are punishable under TopCoder's obfuscation rule.
</P>

<P><B>What is obfuscation?</B></P>

<P>
Webster's Revised Unabridged Dictionary defines obfuscation as "the act of 
darkening or bewildering; the state of being darkened."  On their 
<A HREF="/index?t=support&amp;c=comp_faq#14" CLASS="bodyGeneric">FAQ page</A>, TopCoder 
defines obfuscation as "an obvious and deliberate attempt to disguise the 
true behavior or nature of the code."
</P>

<P>
According to <B>dok</B>, a TopCoder administrator, the obfuscation rule was created 
in response to the Level Two submission of <A HREF="/tc?module=MemberProfile&amp;cr=112438" CLASS="bodyGeneric">stevevai</A>
 in the Semifinals of the 2001 Invitational 
(<A HREF="/stat?c=problem_solution&amp;rm=56&amp;rd=56&amp;pm=205&amp;cr=112438" CLASS="bodyGeneric">members click here to view problem statement</A>). 
<B>dok</B> explains the obfuscation of <B>stevevai</B>: 
"If you'll notice, there is a variable declared at the bottom, 'int l=0', 
and at the top there is a comparison, 'if (s.length() == l)'. Well that 
looks a lot like 'if (length == 1)'." This 'hidden' zero fooled 
<A HREF="/tc?module=MemberProfile&amp;cr=105922" CLASS="bodyGeneric">qubits</A>, 
causing him to lose 50 points on an unsuccessful challenge of the code of <B>stevevai</B>.  
The obfuscation rule was set up to prevent coders from writing intentionally confusing 
code to bait others into such challenges.
</P>

<P>
"Probably every second contest someone will suggest that another person obfuscated 
their code," <B>dok</B> said.  Despite frequent accusations, though, no coder has yet lost 
points for their code due to the obfuscation rule.  "People accuse obfuscation because 
others don't indent enough, or indent strangely, or single space indent," <B>dok</B> says.  
"That's just not enough for us to go on to make any kind of ruling.  We can't just 
drop points because a person has poor coding habits."
</P>

<P><B>The case of fbplayr78</B></P>

<P>
"Bad indentation or oddly placed brackets doesn't seem like it enough to call it 
obfuscation," agrees <A HREF="/tc?module=MemberProfile&amp;cr=155375" CLASS="bodyGeneric">fbplayr78</A> , 
a coder who has direct experience with obfuscation charges. <B>fbplayr78</B> was accused for 
a Level Two submission  in Single Round Match 86 that contained a 'hidden' if-statement like the one described in 
the first paragraph (<A HREF="/stat?c=problem_solution&amp;rm=5315&amp;rd=4150&amp;pm=708&amp;cr=155375" CLASS="bodyGeneric">members 
click here to view problem statement</A>).  
<A HREF="/tc?module=MemberProfile&amp;cr=280238" CLASS="bodyGeneric">Darth Vader</A>, 
who was in the same room as <B>fbplayr78</B> in SRM 86, reported 
the code to the administrators after viewing it in the challenge round.  The charge led to a 
two-hour-long argument in the TopCoder lobby on what obfuscation is and how the issue of coder 
intent can be fairly judged.
</P>

<P>
<B>fbplayr78</B> maintains that the oddly placed if-statement was "absolutely not" 
intentional, and that he had no idea that there was anything odd or confusing about 
the code when he submitted it.  "The only thing that I can think of is that I accidentally 
hit backspace or delete," said <B>fbplayr78</B>, when asked how the if statement got where it was.  
"I didn't even realize that I had done it until people started arguing about it."
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=267455" CLASS="bodyGeneric">cocoapi</A>, 
who was also in the room with <B>fbplayr78</B> in SRM 86, is skeptical of this explanation.  
"It does not seem really easy to make a mistake like that and not notice it. Usually when you 
click delete, it takes that line to the beginning of the previous line, not to the end of it 
and clearly off the page." Despite his skepticism, though, <B>cocoapi</B> "doesn't think [the code] 
was that clear to really do too much about."
</P>

<P><B>The question of intent</B></P>

<P>
The issue of coder intent is crucial for determining whether or not a coder is guilty 
of obfuscation.  Only "obvious or deliberate" attempts to mislead are punishable by "a 
loss of all points received for the obfuscated submission," according the TopCoder FAQ page. 
 A coder that is unfairly accused can argue his case, but in the end "TopCoder will make the final 
 decision as to whether or not a code submission has been intentionally obfuscated."
</P>

<P>
"I can remember once talking to a coder with some strange code," said <B>dok</B>, when asked about how 
he goes about determining coder intent. "It was C++ and he had no return statement, but it turned 
out that C++ would return the last variable he set within his method, which in this case turned out 
to be the value that he would have returned.  So, his code returned all the right answers, but to a 
challenger seemed very wrong.  It turned out it was just a mistake that he got away with."  If an 
obfuscation case is still unclear after talking with the coder, the administrators sometimes "look 
at old code to see a pattern in coding style," according to <B>dok</B>.
</P>
 
<P>
Sometimes, careful analysis of the accused code can garner clues as to whether the obfuscation 
was intentional or not.  "For example," <B>fbplayr78</B> said, "in my code, the braces were indented 
as if they were to be used for my if-statement," a fact that seems to support the argument 
that the statement was hidden unintentionally.
</P>

<P>
According to <B>dok</B>, the TopCoder administrators "decided that [the code of <B>fbplayr78</B>] could 
have been a copy/paste issue or a tab issue, etc., basically, that it was not absolutely clear."  
Because no one challenged the code of <B>fbplayr78</B> and the submission failed system testing, 
this official ruling didn't affect the results of the match.
</P>

<P>
Despite the inconvenience that this obfuscation case has caused, <B>fbplayr78</B> doesn't think any 
less of TopCoder for having such a rule.  On the contrary, he thinks "any organization that 
can get its members to care that much about a small mistake deserves our respect." 
</P>

<P><B>What you can do</B></P>

<P>
TopCoder makes it a point on their FAQ page to "encourage any TopCoder competitor to notify 
us in the event that you feel that a code submission during a rated event 
violates [the obfuscation] policy."  This doesn't mean you should automatically report any 
code you find confusing, though. Remember, simply using bad formatting or odd indentation is 
not enough to constitute obfuscation; the code has to be intentionally set up to hide the 
true nature of the code.  Setting the code viewer to "pretty" on your room's summary menu 
can usually help in cases where the code is simply badly written.
</P>

<P>
The best way to avoid being accused of obfuscation yourself, according to <B>dok</B>, is to simply 
"write clearer code.  Proper coding habits were probably explained to you in school, and 
every coding book you read is probably full of readable code.  In a professional environment, 
there is no reason to write unreadable code."  Or, as <B>fbplayr78</B> puts it, just "be very, very careful."
</P>


<IMG SRC="/i/m/KaiEl_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;KaiEl<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=264761" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>

         
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
