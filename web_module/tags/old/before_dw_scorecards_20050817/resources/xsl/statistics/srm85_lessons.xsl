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
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="250" ALIGN="right">
 	<TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
	<TR><TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
	<TR>
		<TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
		<TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
	</TR>                    
	<TR>
    	<TD COLSPAN="4" VALIGN="top" BGCOLOR="#999999">
		<TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm85_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyText">Editorial Archive</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm85_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm85_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm85_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
			<TD VALIGN="top" CLASS="bodyText">&#160;</TD>
		</TR>
		<TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
		</TABLE>
		</TD>
	</TR>
 	<TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links <A HREF="/stat?c=last_match&amp;rd=4140" CLASS="bodyGeneric">NDBronson</A> -->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<P><B>Single Round Match 85</B><BR/>
May 1, 2002</P>
<P><B>Lessons Learned the Hard Way</B></P>
<P>This is the first of what hopefully will develop into a regular review of division 2.  The focus will be on "what went wrong". 
We hope to provide a statistical breakdown in the future, but this has not been finalised yet.</P>

<P>SRM 85 had 660 entrants. In the end, there were enough coders to create some 43 rooms in Division 2.  As a landmark, it was the first
match to allow submission in C#.</P>

<P>The first 2 problems on the division 2 problem slate were straightforward: if you could do the problem, there was a very high
likelihood that it was correct.  My room had only 2 challenges, some others had none.  The top 2 rooms of the division each had only 1
solution fail.  The third problem was trickier, but the problem complexity seems to have stopped submission of weak solutions.</P>

<P><B>Level One - 250:</B><BR/>
This problem involved doing a parity check on the bits of an array of ints.  The return value was a String with the character '0' representing 
odd parity and '1' representing even parity.  Bear in mind that failures  were quite rare.<BR/><BR/>

Issues:<BR/>
1.  Failure to extract a bit!<BR/>
2.  Adding the wrong character!  (Mea culpa)<BR/>
3.  Returning the string in reverse order...<BR/>
</P>

<P><B>Level Two - 500:</B><BR/>
This problem was based on error correction, where each character of message was sent 3 times to increase reliability.  The problem was to then extract
the original message.  A '*' represented a garbled input character. The rules within a block of 3 characters were (a, b and c each represent 
one of block[i], block[i+!] and block[i+2] at random:<BR/><BR/>
1. a == b == c: return a;<BR/>
2. a == b &amp;&amp; a == '*': return c;<BR/>
3. a == b &amp;&amp; a != '*': return a;<BR/>
4. a != b &amp;&amp; a != c &amp;&amp; b != c: return '*';<BR/>
</P>

<P>The solution was simple: search each block of 3 in each position. A variant on this was to keep a "starcount" of the number of '*' characters,
to help in identifying cases.  A third variant counted the number of pairs of equal characters.</P>

<P>It was noticeable that the solutions which failed were distinctly "uglier" than average.  The counting methods were fairly unreliable.<BR/><BR/>
Issues:<BR/>
1. Not checking all combinations of rules 2 &amp; 3 correctly.  This tended to arise from long conditionals.<BR/>
2. In problems which kept a "starcount", failure to deal with the case where only one star is found.<BR/>
3. Correct checks, but in the wrong order...</P>

<P><B>Level Two - 100:</B><BR/>
The 1000 problem doubled as the 450 in division 1.  The problem was to score a multiplayer, roshambo-like game with a bunch of random rules.
Valid choices were 0-5, with i+1%6 beating i+2%6. Among these were bonuses for choosing the lowest entry.  Another rule said that the cumulative score 
for each player at the end of each round reset to 0 if it was negative.</P>

<P>It's hard to analyse where a lot of these problems went wrong, because of the complexity of the rules.  Probably, only getting out a debugger.<BR/><BR/>
Issues:<BR/>Many of the issues involved either failing to deal with the negative reset, or resetting the round score rather than the cumulative score.</P>

<IMG SRC="/i/m/slowjoe_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;slowjoe<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=271917" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>

<P><B>Member Comments</B></P>

<P>In the article on Div2 there is a case in the Rules for level two that fails.  '*aa" would drop out of the ifs.  I can't figure out if these 4 rules are meant to be complete, but at the least it is confusing, and probably not the most readable way of doing the problem.</P>
 
<P>The two variants I would choose would be</P>
 
<P>
1. a == '*' &amp;&amp; b == '*'; return c;<BR/>
2. a == '*' &amp;&amp; c == '*'; return b;<BR/>
3. b == '*' &amp;&amp; c == '*'; return a;<BR/>
4. a == b; return a;<BR/>
5. a == c; return a;<BR/>
6. b == c; return b;<BR/>
return '*';<BR/>
</P>
 
<P>this separates the two aspects of the problem hence increasing readability or</P>
 
<P>
1. a != '*' &amp;&amp; (a==b || a==c || (b == '*' &amp;&amp; c == '*')); return a;<BR/>
2. b != '*' &amp;&amp; (b==c || (a == '*' &amp;&amp; c == '*')); return b;<BR/>
3. b == '*' &amp;&amp; a == '*'; return c;<BR/>
4. return '*';<BR/>
</P>
 
<P>this gives a fall through on what will produce each result.  As a more instructive way of solving the problem I would make:</P> 
<P>3. c != '*' &amp;&amp; (b == '*' &amp;&amp; a == '*'); return c;</P>
 
<P>as this shows a trend of the equalities decreasing, and improves coder's ability to see patterns and analyse problems.</P>
 
<P>Other than that an excellent article that should be continued.</P>
 
<P><A HREF="/tc?module=MemberProfile&amp;cr=280735" CLASS="bodyGeneric">Shammah</A></P>
 
 <HR/>
 
<P>
He also forgot to mention the approach to sort each triple first (I've
also put this into practice room 109):
</P>

<P>
  string handle ( string t ) {<BR/>
    string r;<BR/>
    for( int i=0; i&#60;t.size(); i&#43;=3 ){<BR/>
      sort( &amp;t[i], &amp;t[i]&#43;3 );<BR/>
      if( t[i&#43;1]=='*' ) r &#43;= t[i&#43;2];<BR/>
      else if( t[i&#43;1]==t[i] || t[i&#43;1]==t[i&#43;2] ) r &#43;= t[i&#43;1];<BR/>
      else r &#43;= '*';<BR/>
    }<BR/>
    return r;<BR/>
  }<BR/>
</P>

<P>
Problem Set Analysis &amp; Opinion
</P>


<P>
Div. 2 - Easy: Evil
</P>

<P>
Would be nice to also mention these two variants to count the number of bits:
</P>


<P>
int bitCount ( int n ) {<BR/>
  return (n&#62;0) ? 1&#43;bitCount( n&amp;(n-1) ) : 0;<BR/>
}<BR/>
</P>

<P>
int bitCount ( int n ) {<BR/>
  return (n&#62;0) ? (n&amp;1) &#43; bitCount( n/2 ) : 0;<BR/>
}<BR/>
</P>

<P>
I got the first variant from the book "The C Programming Language" by
Brian Kernighan and Dennis Ritchie.
</P>

<A HREF="/tc?module=MemberProfile&amp;cr=269889" CLASS="bodyGeneric">Stefan</A>          
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


