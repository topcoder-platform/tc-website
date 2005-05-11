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
<B>Single Round Match 105</B><BR/>
Wednesday July 24, 2002
<P><B>Problem Set Analysis &amp; Opinion</B></P>

<P>
<B>StringSet</B> (Value 250)<BR/>
Used as: Division-II, Level 1:
</P>

<P>
Submission Rate - 185/204 (90.69%) <BR/>
Success Rate - 165/185 (89.19%) <BR/>
High Score - <B>Liam</B> for 247.44 points<BR/> 
</P>

<P>
<B>Implementation</B>
</P>

<P>
This problem consists of building and maintaining a set (or rather the complement of a set). Since the alphabet consists of 26 letters (which, even more conveniently, are represented by a contiguous range of ASCII values), we only need a boolean array of length 26. For each letter we encounter, we mark its corresponding index in the boolean array (which is found by subtracting the value 'A' from the character). 
</P>

<P>
After we have iterated through all of the characters, we build a string by iterating through the alphabet in order. For each unmarked index in the array, we append the letter that corresponds to that index (found by adding the value 'A' to the index) to the string. After we traverse the entire alphabet we return the string. 
</P>


<P>
<B>Stream</B> (Value 550)<BR/>
Used as: Division-II, Level 2:
</P>

<P>
Submission Rate - 123/204 (60.29%) <BR/>
Success Rate - 75/123 (60.98%) <BR/>
High Score - <B>FrodoB</B> for 448.12 points<BR/>
</P>

 
<P>
Used as: Division-I, Level 1: (Value 250)
</P>

<P>
Submission Rate - 121/127 (95.28%) <BR/>
Success Rate - 107/121 (88.43%) <BR/>
High Score - <B>zoidal</B> for 239.35 points <BR/>
Reference implementation: <B>FrodoB</B> <BR/>
</P>

<P>
<B>Implementation</B>
</P>

<P>
One needs to be able to perform two complementary tasks in order to do this problem: decompose an integer into its component bits, and compose an integer from a sequence of bits. 
</P>

<UL>
	<LI><P> <B>Decomposition</B> <BR/>
	There are two ways to do this. If one is using Java, one can simply call the <pre>Integer.toBinaryString</pre> method to get a String representation of the bits (which everyone should know how to manipulate). Be sure to pad the beginning of the strings with as many zeros as are necessary to make the string exactly 32 characters in length. </P>	
	<P>Another method is to use the bitwise operators to extract bits. The expression value &amp; (1 &lt;&lt; n) is non-zero only if the <pre>n th</pre> bit of value is 1. Note that the order of bits in the stream is the <I>opposite</I> of the order of bits in an integer. Bit 0, as obtained by the expression just given, is the <I>last</I> bit in the bit stream. </P></LI>
	<LI><P> <B>Composition</B> <BR/>
	Again there are two methods. If one is using Java, one can use the <pre>Integer.parseInt</pre>  method with a radix of 2 to convert a string of ones and zeros into an integer. If one is using bitwise operators, then the expression value &#124;= (1 &lt;&lt; n) will set the <pre>n th</pre> bit to 1. One could also shift the value one bit to the left and then set the <pre>0 th</pre> bit using the next bit in the stream, for each bit in the stream (e.g., value &lt;&lt;= 1; value &#124;= bit;). </P></LI>
</UL>

<P>
With these tools in hand, the problem is easy. It is just a matter of following directions and being careful about padding. 
</P>

<P>
<B>GridLocks</B> (Value 900)<BR/>
Used as: Division-II, Level 3:
</P>


<P>
Submission Rate - 56/204 (27.45%) <BR/>
Success Rate - 7/56 (12.5%) <BR/>
High Score - <B>pernick</B> for 648.04 points <BR/>
Reference implementation: <B>Pernick</B> <BR/>
</P>

<P>
<B>Implementation</B>
</P>

<P>
Determining if any cell in the grid is "surrounded" consists of a familiar depth-first search (e.g., a flood fill). One can either do a DFS starting at the cell in question, or one can do a flood-fill from all of the edge cells (thus marking all the non-surrounded cells of a certain type at once). 
</P>

<P>
<B>PowerPlant </B>(Value 500)<BR/> 
Used as: Division-I, Level 2:
</P>


<P>
Submission Rate - 89/127 (70.08%) <BR/>
Success Rate - 50/89 (56.18%) <BR/>
High Score - <B>SnapDragon</B> for 471.96 points <BR/>
Reference implementation: <B>WishingBone</B> <BR/>
</P>

<P>
<B>Implementation</B>
</P>

<P>
Our initial approach to solving this problem might consist of a depth-first search. We start on the first day, where we only have one choice for power output. On the next day (assuming the next day is not the last day), we may have as many as three different choices for power output, dependent upon the power output chosen for the previous day. While this method would work, there might be as many as 3 <sup>48</sup>  possible choices -- far too many to compute in 8 seconds. 
</P>

<P>
An alternate approach is dynamic programming. Suppose that for any particular day, we know every output level that we can possibly have that satisfies all constraints for all the previous days, and for each such output level we know the minimum output level over all the days up to and including that particular day. Then from this information we can compute the same information for the next day. 
</P>

<P>
For each possible output level, we know we can either add 100, subtract 100, or leave as is. For each of these actions, we can determine whether the output level will be too low for the next day (or, for the last day, if the output level is not the right one at all). At the same time we maintain our minimum output level for each output level. All we need is an array of pairs of integers (or a pair of arrays of integers) for each day. 
</P>

<P>
<B>Parliament </B> (Value 1000)<BR/>
Used as: Division-I, Level 3:
</P>


<P>
Submission Rate - 17/127 (13.39%) <BR/>
Success Rate - 3/17 (17.65%) <BR/>
High Score - <B>SnapDragon</B> for 544.10 points <BR/>
Reference implementation: <B>SnapDragon</B> <BR/>
</P>


<P>
<B>Implementation</B>
</P>

<P>
From the statistics it is apparent that this was a devilishly difficult problem. However, once the solution is seen, it seems much simpler. 
</P>

<P>
For each party we maintain a list of coalitions such that the sequence for each coalition ends with the given party. Each coalition can be represented as a simple bit-set (e.g., an n-bit integer for n parties). Initially each party's list of coalitions consists of a single set containing only that party. We then incrementally grow each coalition until we cannot increase the size of any coalitions. 
</P>

<P>
Suppose we wish to grow a coalition that ends with party X. We iterate through each party Y that X sympathizes with. We create a new set by adding Y to the original set. If none of the parties in this new set dislike each other, and this new set is not the same as any of the sets currently in Y's list of coalitions, then we add the new set as a new coalition in Y's list. For determining whether any parties in the set dislike each other, we can precompute all the impossible sets in advance, by iterating through all the n-bit integers (e.g., O(2<sup>n</sup>n<sup>2</sup>), which is reasonable for n &lt;= 15). 
</P>

<P>
Once we can make no more new, unique coalitions, we return the size of the largest one we constructed. We can update this value as we build the coalitions, eliminating the need to iterate through all our constructed coalitions before we return. 
</P>


<IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Logan<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=112902" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="100%">
 	<TR>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
	<TR><TD COLSPAN="2" BGCOLOR="#43515E" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
	<TR>
		<TD VALIGN="top" BGCOLOR="#43515E" CLASS="moduleTitle">&#160;</TD>
		<TD BGCOLOR="#43515E" VALIGN="top" CLASS="moduleTitle">COMMENTS</TD>
	</TR>                                   
</TABLE>

<P>
Hey I noticed in the overview of problem set 105 that you guys mention 
creating an array of booleans for a-z and using that to solve the problem.  
Well I had a bit of an easier way. 
</P>

<pre>
#include &lt;string&gt;
#include &lt;vector&gt;

using namespace std; 

class StringSet 
{ 
public: 
   string compliment(vector&lt;string&gt; input) 
   { 
      string output = ""; 
      for(int x = 'A'; x &lt;= 'Z'; x++) 
      { 
         bool found = false; 
         for(int y = 0; y &lt; input.size(); y++) 
         { 
            if(input[y].find((char)x) != string::npos) 
               found = true; 
         } 
         if(!found) 
            output += (char)x; 
      } 
  
      return(output);    
   }
   
}; </pre>

<P>
Now, I'm not professing to be the best coder in the world, but 
I just happened to think it out this way, and I think it's better, 
but I could be wrong.  It makes use of the string find algorithm. 
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=292601" CLASS="bodyGeneric">Ssmoimo</A>
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


