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
        <TITLE>Sample Problem Statements from computer programming competitions at TopCoder</TITLE>
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
  <xsl:with-param name="title">&#160;Sample Problem Statements</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<P>
Here are a couple of examples of the types of problems you can expect from a TopCoder competition.  Once you become a TopCoder member, you can view all of the problems that TopCoder has ever used in the statistics section of our web site.  If you're looking to practice, you'll find that after each TopCoder competition the problem sets that were used will be added as "practice rooms" in the TopCoder competition Arena.  The TopCoder practice rooms are a great place to test your skills without the pressure of live competition and at the same time, get a feel for the competition environment.  During a TopCoder competition, you'll find that the problem set for division two rooms is easier then the one for division one rooms.  All first-time competitors will be placed in a division two competition room.  Once your TopCoder rating reaches 1200, you'll be placed into the more difficult division one rooms.  Below is an example of a problem statement from each of the two divisions.<BR/>
<BR/>
<B>Example Division Two Problem Statement</B><BR/>
(From Single Round Match 96)<BR/>
<BR/>
A palindrome is a number that is the same whether it is read from left-to-right or right-to-left. For example, 121 and 34543 are both palindromes. It turns out that nearly every integer can be transformed into a palindrome by reversing its digits and adding it to the original number. If that does not create a palindrome, add the reverse of the new number to itself. A palindrome is created by repeating the process of reversing the number and adding it to itself until the number is a palindrome.<BR/>
<BR/>
Create a class Transform that contains the method palindrome, which takes a number N that is to be transformed and returns a number that is the resultant palindrome from this process. Of course if N is already a palindrome, return it without changing it. Though it is theorized that all numbers can be transformed to palindromes in this way, some numbers do not converge in a reasonable amount of time. For instance, 196 has been carried out to 26,000 digits without finding a palindrome. So if the method finds that the resultant palindrome must be greater than 1,000,000,000, return the special value -1 instead.<BR/>
<BR/>
DEFINITION<BR/>
Class: Transform<BR/>
Method: palindrome<BR/>
Parameters: int<BR/>
Returns: int<BR/>
Method signature (be sure your method is public): int palindrome(int N);<BR/>
<BR/>
NOTES<BR/>
- Leading zeroes are never considered part of a number when it is reversed. For instance, 12's reverse will always be 21 regardless of whether it is represented as 12, 012, or 0012. Examples with leading zeroes use the leading zeroes for clarity only.<BR/>
<BR/>
TopCoder will ensure the validity of the inputs. Inputs are valid if all of the following criteria are met:<BR/>
- N will be between 1 and 10000 inclusive.<BR/>
<BR/>
EXAMPLES<BR/>
Worked examples:<BR/>
Example 1: N = 28<BR/>
28 + 82 = 110<BR/>
110 + 011 = 121, a palindrome. Return 121<BR/>
<BR/>
Example 2: N = 51<BR/>
51 + 15 = 66, a palindrome. Return 66<BR/>
<BR/>
Further examples:<BR/>
Example 3: N = 11, return 11<BR/>
Example 4: N = 607, return 4444<BR/>
Example 5: N = 196, return -1<BR/>
<BR/>
<BR/>
<BR/>
<B>Example Division One Problem Statement</B><BR/>
(From Single Round Match 102)<BR/>
<BR/>
Binary strings, as most of us know, are composed solely of 0's and 1's. Sometimes it is necessary to turn all the bits either on (1) or off (0). However, sometimes it is not possible to just pick and flip individual bits. In this hypothetical scenario, it is only possible to flip bits in a contiguous segment which is a subset of the contiguous segment which was flipped immediately prior to it. For example, if bits 2-4 are flipped, it is not legal to flip bits 3-5 next, or bits 1-3. However, bits 3-4 or bits 2-3 would be legal. The first segment to be flipped can be located anywhere in the sequence.<BR/>
<BR/>
Create a class BitFlipper which contains a method minFlip which determines the minimum number of bits that must be flipped under the above restriction in order to get all the bits set to 0. For purposes of this problem, to flip a bit means to change it from 0 to 1 or from 1 to 0.<BR/>
<BR/>
DEFINITION<BR/>
<BR/>
Class: BitFlipper<BR/>
Method: minFlip<BR/>
Parameters: String<BR/>
Returns: int<BR/>
<BR/>
Method signature (be sure it is declared public): int minFlip (String bits);<BR/>
<BR/>
TopCoder will ensure the validity of the inputs. Inputs are valid if all of the following criteria are met:<BR/>
* bits will be between 0 and 50 characters in length, inclusive<BR/>
* bits will contain only 1's and 0's.<BR/>
<BR/>
EXAMPLES<BR/>
<BR/>
Example 1:<BR/>
bits = "00110".<BR/>
By flipping bits 3-4, we get "00000". Method returns 2.<BR/>
<BR/>
Example 2:<BR/>
bits = "10110"<BR/>
If we flip bits 1-4, we get "01000". Now we flip bit 2 and get "00000".<BR/>
Method returns 4 + 1 = 5.<BR/>
<BR/>
Example 3:<BR/>
bits = "1001110001"<BR/>
Flipping bits 1-10 yields "0110001110"<BR/>
Now, flipping bits 2-9 yields "0001110000"<BR/>
Again, flipping bits 4-6 yields "0000000000"<BR/>
Method returns 10 + 8 + 3 = 21.<BR/>
<BR/>
Example 4:<BR/>
bits = "10001"<BR/>
Method returns 8.<BR/>
<BR/>
Example 5:<BR/>
bits = "101010101"<BR/>
Method returns 25.<BR/>
<BR/>
Example 6:<BR/>
bits = ""<BR/>
Method returns 0.
</P>


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

