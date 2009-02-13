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
        <TITLE>Competition Process Details at TopCoder</TITLE>
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
  <xsl:with-param name="image">support</xsl:with-param>
  <xsl:with-param name="title">&#160;Competition Process Details</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<BR/><B>Coding Phase</B>
<BR/>
This is the first phase of the competition round.  Programming in the language(s) specified by the competition, 
each coder will attempt to implement solutions to three algorithmic problems in one hour's time.  
All of the coders who are participating in a given round of competition 
will be attempting to solve the same algorithms, with the same point values assigned.<BR/>
<BR/>

When the round begins, coders must decide which problem to work on first. The problems to choose from will each have a 
point potential based upon level of complexity:<BR/>
<BR/>
Easy:  250 points<BR/>
Medium:  500 points<BR/>
Difficult: 1000 points<BR/>
<BR/>

Coders must make their selection without the benefit of knowing the actual problem statements.<BR/>
<BR/>

Once a point value is chosen, the coder will see the problem statement, the necessary class and method names, 
and the method arguments and return values that are necessary in order to implement a proper solution.  
<BR/>
<BR/>
Please note:  
<UL>
<LI>If a problem calls for the return of a particular type of object, that exact type must be returned.
Returning a subclass of the required type is not considered a valid result.</LI>
<LI>If C++ is the language chosen, string refers to a C++ string, and vector refers to the STL (Standard Template Library) implementation of vector.</LI>
<LI>If you have questions regarding the problem statement, or any other problems during the competition, 
administrators will be posted in the lobby area of the tournament arena.  
If you are unable to get to the lobby, the administrators will also
be available on AOL, MSN, or Yahoo instant messenger services under the screen name 'Topcoder1'.</LI>
</UL>

Within the coding window, the coder will have the option to compile code, test code, and ultimately submit code. 
<BR/>
<BR/>
A note on testing code:  
<UL>
<LI>
Code that runs for eight seconds or more in the system tester will be halted.  The error message
from the system tester will read, "Your code submission caused the system tester to fail."  If code 
with a runtime in excess of eight seconds is submitted, it will fail any challenges or system tests 
(<A HREF="#cphase" CLASS="bodyText">Challenge Phase</A> and <A HREF="#sphase" CLASS="bodyText">System-Testing Phase</A> details are listed below).
</LI>
</UL>
TopCoder allows multiple submissions during the coding phase.<BR/>
Here are the rules:
<ul>
<li>You can submit the same problem as many times as you like.</li>
<li>For every submission past the first one you will incur a 10% penalty of the problem point total potential.<br/>
Example:<br/>
Coder A's 1st submission of the 500pt problem results in 400pts because they took approximately 15 minutes to solve it.<br/>
Coder A's 2nd submission of the 500pt problem results in 280pts because they took an additional 8 minutes to solve (a total of 23) and we pena
lized 50pts (50 = 500*.10)</li>
<li>You can never go below 3/10 of the problems point total potential.<br/>
Example:<br/>
Coder B's 29th submission of the 500pt problem will result in 150pts<br/>
Coder B's 55th submission of the 500pt problem will result in 150pts</li>
</ul>
**Some of the numbers in the examples above are rounded.
<BR/>
<BR/>
<B>Scoring</B>
<BR/>
The point value of a submission is dependent upon the problem's level of difficulty and the time it took to code a solution.  
The TopCoder server will calculate the time spent on a problem by counting the time between when the coder selects a 
problem and when a solution is submitted. Keep in mind that these times are captured when a problem request or problem 
submission actually gets to our server, so network latency may play a minor role in the competition process.<BR/>
<BR/>  

Total points awarded = <IMG WIDTH="172" HEIGHT="37" ALT="points" SRC="/i/pts.gif"/><BR/>
<BR/>
Where PT is the time spent coding a problem, TT is the total time allocated for coding all problems, 
and MP is the maximum points available for that problem.<BR/>
<BR/> 

For example:<BR/>

A coder spends 22.7 minutes working on the medium problem before submitting. Given the fact that the total coding
round is one hour, and the maximum point value for the medium problem is 500, the coder's awarded points for the
submission will be: <BR/>
<BR/>

500*(.3 + .7*60^2/(10*22.7^2+60^2))<BR/>
<BR/>

or <BR/>
<BR/>

293.95 points (point calculations are rounded to two decimal places)<BR/>
<BR/>

The maximum number of points available is really just a frame of reference.  It is not practically achievable because 
in order to do so a coder would need to spend zero milliseconds reading, coding, and submitting a problem.<BR/>
<BR/>
<B>About the clock</B>
<BR/>
During the coding phase, the coder can see the time remaining count down in the Java application. This time remaining 
is synchronized with the system clock on the client's machine, whereas the "real" tournament time is maintained by our TopCoder server. Slight discrepancies between the speed of a client's system clock and our server's system clock, coupled with network latency, may cause your application to end a phase a few seconds before or after the time runs out on the application clock. Coders should be aware that this might occur and plan accordingly. To be safe, coders should submit any final solutions before the time remaining falls below 20 seconds.
<BR/>
<BR/>
<B>Of strategic note:</B>
<BR/>
A coder may submit any code that compiles on our server as the solution to a problem. The point value of a submission 
is dependent on the time it took to code and the difficulty of the problem, regardless of the correctness. The challenge and 
system testing phases will uncover incorrect submissions and adjust the point values accordingly.<BR/>
<BR/>
<BR/>
<A NAME="cphase" CLASS="bodyText"></A><B>Challenge Phase</B>
<BR/>

In order for a coder to participate in the challenge phase, some amount of points (greater than zero) must be attained during the coding phase.<BR/>
<BR/>

In this phase, coders can earn points and take points away from others by finding fault with their competitors' submitted code. A coder whose incorrect submission is detected and challenged will be penalized, while those coders that are the first to identify the mistakes in the other coders' submissions will be rewarded.<BR/>
<BR/>

During the challenge phase, the source code of all of the submissions in a tournament room will be viewable to all of the coders in that room. This gives all of the coders a chance to identify submission(s) from other coders that are worth challenging. <BR/>
<BR/>

A challenge consists of the challenger entering a valid set of input parameters (as defined by the problem text) with the expectation that the defendant's solution will produce the WRONG results. TopCoder's server will determine whether or not the results are correct. 
A successful challenge will earn a challenger 50 points, regardless of the difficulty level of the submission challenged.  
However, if a challenge is unsuccessful because the expected result matches the actual result, the challenger is penalized the 50 points.  In all cases, a coder whose submission is successfully challenged will lose all of the points that were originally obtained for the submission. <BR/>
<BR/>

Once a coder's submission has been invalidated, no other coders may challenge that submission. If two challenges are submitted towards the same submission at roughly the same time, the first one to reach the TopCoder server (for any reason) will be applied.<BR/>
<BR/>
<BR/>
<A NAME="sphase" CLASS="bodyText"></A><B>System-Testing Phase</B>
<BR/>
After the Challenge Phase is complete, all submissions that have not been successfully challenged will be run through 
a series of automatic tests by the TopCoder tournament server.  These tests will attempt to validate the solutions by 
subjecting each submission to a predetermined set of inputs and noting the output, or return value, that each submission 
generates.  If any coder's submission does not produce the expected result, the coder will lose all of the points that 
were originally obtained for the submission.  A coder's final score is the sum of all remaining points for all of the 
problems and challenges after the system-testing phase has completed.<BR/>
<BR/>
<B>Rating Adjustment</B>
<BR/>
After each round of competition a coder's rating will be adjusted based on his or her performance relative to the other 
coders competing in the round.  A detailed overview of our rating system can be found on the TopCoder 
<A HREF="/index?t=support&amp;c=ratings" CLASS="bodyText">rating system</A> page.<BR/>
<BR/>
<BR/>
<B>Tournament Advancement</B>
<BR/>
Each tournament will have a specific outline on how to advance to each round in that tournament. The number of coders from 
each room that will advance to the next round is based on the total number of coders allotted in the next round and point 
totals from the current round.<BR/>
<BR/>

For example:<BR/>

512 coders in the first round of a given tournament will be divided up into 64 tournament  rooms with eight coders assigned 
to each room.  If the second round of the tournament is limited to 256 contestants, the top four coders from each 
first-round tournament room will advance.  However, coders with 0 or less points will not advance.  

Some rooms may have less coders with a final positive score than advancement places.  Any remaining seeds for the next round will be made available as "wildcards" to coders with the highest positive scores from other rooms who do not yet hold a seed in the next round.
<BR/>
<BR/>

Due to the precision of the point values, a tie should be an unlikely event. However, in the event of a tie in points for 
the final position in a room, all of the tied coders will advance to the next round of competition.
<BR/>
<P><BR/></P>
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

