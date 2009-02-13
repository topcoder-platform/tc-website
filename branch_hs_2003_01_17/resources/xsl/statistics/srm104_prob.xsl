<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Statistics</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>

<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
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
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#FFFFFF" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">statisticsw</xsl:with-param>
  <xsl:with-param name="title">&#160;Match Editorials</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<!--body contextual links-->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="100%">
 	<TR>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
	<TR><TD COLSPAN="2" BGCOLOR="#43515E" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
	<TR>
		<TD VALIGN="top" BGCOLOR="#43515E" CLASS="moduleTitle">&#160; &#160;</TD>
		<TD BGCOLOR="#43515E" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
	</TR>                    
	<TR>
    	<TD COLSPAN="2" VALIGN="top" BGCOLOR="#43515E">
		<TABLE BORDER="0" WIDTH="100%" CELLSPACING="1" CELLPADDING="" BGCOLOR="#FFFFFF">
		<TR>
			<!-- <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC" HEIGHT="15"><A HREF="/?t=statistics&amp;c=srm104_prob" CLASS="bodyGeneric">&#160;Problem&#160;Set&#160;</A></TD>
			<TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="/?t=statistics&amp;c=srm103_rookie" CLASS="bodyGeneric">&#160;Rookie&#160;Review&#160;</A></TD> -->
			<TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyGeneric">&#160;Archive&#160;</A></TD>
		    <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">&#160;Comments/Ideas/Want&#160;to&#160;Write?&#160;</A></TD>
		</TR>    		
		</TABLE>
		</TD>
	</TR>               
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<B>Single Round Match 104</B><BR/>
Tuesday July 16, 2002
<P><B>Problem Set Analysis &amp; Opinion</B></P>

<P>
<B>Division-II, Level 1: Cosines</B> (200pt)<BR/>
94% submission rate (180/192)<BR/>
74% success rate (133/180)<BR/>
Best score <B>w280sax</B>, 195.37pt
</P>

<P>
This particular problem easily deserved its 200pt title, as almost the
entire program was explained in the problem. The only potential problem is
that their equations want the side lengths to be sorted, while the input is
not necessarily sorted, and the only example case that demonstrates this is
the last one. On the other hand, every language includes a sorting function
of one sort or another, and those who took advantage of this generally had
little trouble.
</P>

<P>
Most errors appear to stem from flawed sorting code, most of it being people
using &lt; and &gt; instead of &lt;= and &gt;=, causing their programs to throw a
metaphorical cog on inputs like 3,4,3 or 3,3,6. Some people tried to use
clever tricks to avoid having to sort it straight off, and tricks are always
prone to backfiring horrendously.
</P>


<P>
<B>Division-II, Level 2: Mirror</B> (500pt)<BR/>
82% submission rate (158/192)<BR/>
45% success rate (71/158)<BR/>
Best score <B>jayberkenbilt</B>, 479.73pt (time!)
</P>

<P>
There are quite a few ways to introduce special cases on this problem - it
practically comes preloaded with them. In the end, though, a solution is
simple.
</P>

<P>
Your first step is to parse out the hours and minutes, and your preferred
method for this will vary based on your preferred language. StringTokenizer
works nicely for Java, and one can use sscanf or a combination strchr and
atoi on C++. I believe C# has regexps, but in any case this isn't difficult.
</P>

<P>
Your first step should be to get rid of that ugly 12. Programmers never
count from 1, programmers always count from 0. Unfortunately, whoever
designed clocks clearly doesn't see the beauty in this counting system. So
we ignore them and do it ourselves. If the "hour" is 12, set it to 0.
Problem solved.
</P>

<P>
Most people chose to handle the minutes and hours separately. Personally, I
find it far easier to combine the two. Multiply "hour" by 60 and add it to
"minutes". Now you've got the number of minutes past the hour. Now invert it
and add 12 * 60. Now you've got the number of minutes past the hour on the
inverted clock.
</P>

<P>
From here it's just a matter of extracting the hours and minutes again
using
division and modulus, remembering to change an hour of 0 to 12, and
outputting it. You've got to be careful to use two digits on the "minutes"
part - in C++, you can use sprintf with the formatting string "%d:%02d".
Alternatively, a technique that should work in any language is to convert
the minutes to a string, then check the length - if it's 1, add a '0' in
front.
</P>


<P>
The core code, for the curious:
</P>

<P>
<PRE>
if( hour == 12 )
&#160;&#160;&#160;&#160;hour = 0;
minute += hour * 60;
tempminute = 12 * 60 - minute;
newhour = newminute / 60;
newminute = tempminute % 60;
if( newhour == 0 )
&#160;&#160;&#160;&#160;newhour = 12;
</PRE>
</P>

<P>
That code should work on any language that Topcoder supports.
</P>

<P>
It's worth noting that in the case of 12:00, newhour will end up 12
<b>before</b> the if statement to set it to 12. We get the right answer
anyway, but things like that should be watched for.
</P>

<P>
The most common bug was to fail on "11:57", returning "0:03" instead of
"12:03". A few other programs had subtler bugs.
</P>


<P>
<B>Division-II, Level 3 &amp; Division-I, Level 1: CheatCodes</B>
</P>

<P>
Div-II: (1050pt)<BR/>
14% submission rate (26/192)<BR/>
19% success rate (5/26)<BR/>
Best score <B>Ukraine</B>, 560.95pt<BR/><BR/>
Div-I: (300pt)<BR/>
64% submission rate (71/111)<BR/>
56% success rate (40/111)<BR/>
Best score <B>radeye</B>, 235.28pt
</P>

<P>
This one was perhaps a bit undervalued in Division 1. At first glance it
seemed easy, but requiring a keypress to belong to only one code - and not
even having any explicit way to figure out *which* code until it's done -
complicates things quite a bit.
</P>

<P>
The best way, in my opinion, is to loop through each button-press. For each
button-press, just run through each code from first to last and check to see
if that code fits, running *backwards* - as in, the button you're at is the
</P>

<P>
last one in the code sequence. If it does, add it to your code list and mark
the key you're currently at with some "null" value that can't be used in an
actual code (00000000 would work, or 11111111, or basically anything else,
for that matter.) Once you get to the end, you're done.
</P>

<P>
Unfortunately, the length of the input cases on this one made testing a
chore. I got tripped up by a flaw in my code that would have been found if
I'd finished the test cases, but they took so long to input that I didn't
want to. This same issue makes it nearly impossible to figure out what went
wrong in most people's code.
</P>

<P>
<B>Division-I, Level 2: CityRoads</B> (650pt)<BR/>
27% submission rate (30/111)<BR/>
43% success rate (13/30)<BR/>
Best score <B>bigg_nate</B>, 588.71pt
</P>

<P>
There are, as far as I know, two major ways to do this. The first is to
build an adjacency matrix and multiply it by itself "length" times. It's a
little tricky to get this one fast enough - you have to use the fact that
squaring a matrix twice does in fact raise it to the fourth power. Since I
don't know much about matrix multiplication I'm going to leave that one up
to the reader to implement :)
</P>

<P>
The solution I used was to make a big array of "how many ways can you get
here". Fill it with 0 to start with, and set the "start" position to 1. Then
just iterate length times, and each time, run through all the paths and add
appropriately. For instance, if we know that we have a path from A to B,
newways[ B ] += oldways[ A ]. If we have three paths from A to B, we just
end up doing that three times. We also obviously must test for overflow - I
did this by using -1 as an "overflow" value. If oldways[ A ] or newways[ B ]
was -1, I just set newways[ B ] to -1 - if they weren't, I tested if
newways[ B ] &gt; newways[ B ] + oldways[ A ]. Overflows wrap around into
negative, so if this apparently paradoxical statement was true, it signified
an overflow.
</P>

<P>
Looking at it again, I didn't even need the oldways[ A ] == -1 test. If
oldways[ A ] == -1, then obviously newways[ B ] &gt; newways[ B ] + oldways[
A ]. But such is the advantage of hindsight.
</P>


<P>
Once we'd run through "length" times, it's just a matter of returning the
value at the "end" position. Since we were clever enough to use -1 as an
overflow value we don't even need to test, just blindly return the value
that's there.
</P>

<P>
There's one major part of this that I'm skipping over, which is how to
access something like oldways[ A ] when A is a string. Two ways to do this
also. The first is to come up with some sort of a map from string to
integer, then either convert all the roads before doing the loop or convert
as you go. The second, which is what I'd do if I was reimplementing it, is
to use the C++ STL. Instead of an int[ 100 ], I would use a map&lt; string,
int &gt;. I'm not sure if the other languages have easy equivalents for this
sort of a construction though.
</P>

<P>
Oh, yes - you need an int[ 100 ] because you could, in theory, have 50 roads
that each lead from one spot to a different spot, each spot never referred
to more than once. I don't know if anyone failed because of this, but it's
something to watch out for. The begin and end are guaranteed to be in the
road matrices somewhere, so you don't need 102. (I used 110 anyway.)
</P>

<P>
<B>Division-I, Level 3: QuickDiv</B> (850pt)<BR/>
23% submission rate (26/111)<BR/>
46% success rate (12/26)<BR/>
Best score <B>lars</B>, 826.48pt
</P>

<P>
I've got to admit here, I can't prove that my solution works. In fact, I'm
not even entirely sure *how* it works. I did this one almost entirely on
instinct, it appears. But I'll explain it anyway.
</P>

<P>
First off, it's obviously easy to determine how many numbers between 1 and N
are a multiple of some number M. It's N/M. That's trivial.
</P>

<P>
So then it's also easy to determine how many numbers between 1 and N are a
multiple of, say, A, B, or C. N/A + N/B + N/C. However, the problem is, what
if it's a multiple of A *and* B? You'd count it twice. Well, the obvious
solution now is to subtract. Multiply A and B and subtract the numbers that
are multiples of both. N/A + N/B + N/C - N/(AB) - N/(AC) - N/(BC). However,
what if it's a multiple of A, B, *and* C? We've just added three then
subtracted three, we haven't noticed it at all! So let's multiply A, B, and
C, and add *those* factors. N/A + N/B + N/C - N/(AB) - N/(AC) - N/(BC) +
N/(ABC).
</P>

<P>
At this point I noticed a pattern I was working up to. If we have an even
number of multiples, we subtract. If we have an odd number of multiples, we
add. A little math proved to me that this same thing worked if it was a
multiple of 4 different numbers: 4-6+4-1 = 1. If it's 5, it still works:
5-10+10-5+1 = 1. I decided to assume it worked all the way up, so to speak.
</P>

<P>
So we have a bunch of divisors. First we add all the multiples of each
divisor. Then we subtract all the multiples of each pair of 2 multipied
divisors. Then we add all the multiples of each 3 multiplied divisors. And
so on, until we run out of numbers to start with.
</P>

<P>
So I tried this. And it *almost* worked. It got very close results, but
not quite right - it was perfect on a lot of the examples, but it failed on
two.
</P>

<P>
Eventually I figured it out. Say we have 50, 6,10. There are 8 multiples of
6 and 5 multiples of 10. 13 total. 6*10 is 60, and obviously we have no
multiples of 60 from 1 to 50. But this answer is wrong - the right answer is
12. We're counting 30 twice, because 30 is still a factor of both 6 and 10!
</P>

<P>
The solution is the Least Common Multiple, of course, and just plugging that
in to my function fixed the whole thing. Instead of N/A + N/B + N/C -
N/(AB) - N/(AC) - N/(BC) + N/(ABC) the equation is actually N/A + N/B +
N/C - N/LCM(A,B) - N/LCM(A,C) - N/LCM(B,C) + N/LCM(A,B,C). (LCM(A,B,C) ==
LCM(LCM(A,B),C).) In the end, that's actually all you need.
</P>

<P>
So: to summarize the whole solution. Start by choosing 1 number from the
list of divisors. Add the number of multiples of it that are within the
bounds. Repeat for each number in the list. Now choose 2 numbers from the
list. Get the LCM of them, and *subtract* the number of multiples of that are within the bounds. Repeat for every combination of 2 numbers. Now
choose 3, and do the same thing again, only add. Now 4, but subtract. Toggle
the sign every step and add another divisor every step, until you run out of
divisors.
</P>

<P>
Now you're done.
</P>

<P>
I hope this makes sense to somebody - I'm still a bit hazy on it myself, but
then again, a lot of Topcoder seems to be about trusting your instincts.
</P>


<IMG SRC="/i/m/ZorbaTHut_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;ZorbaTHut<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=152347" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
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


