<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>
  <xsl:import href="../includes/modules/invit02_nav.xsl"/>   
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Tournament</TITLE>
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
  <xsl:with-param name="image">tournaments</xsl:with-param>
  <xsl:with-param name="title">&#160;Room&#160;4:&#160;Problems&#160;&amp;&#160;Chrono&#160;Logs</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="seminav"/>
  <!-- Global Seconday Nav Ends --> 
<BR CLEAR="all"/>         
          
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%"> 
            <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 4 Problem Analysis &amp; Opinion</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
<P>
Friday, November 22, 2002
</P>
    <P><BR/></P><A NAME="Traffic"></A>
    <FONT SIZE="+2"><B>Traffic</B></FONT><BR/>
    <FONT SIZE="-1">Used as: Level 1</FONT><H4>Implementation</H4><P>
This problem was a pretty straightforward simulation.  You basically just have to follow the instructions and go from one stop light to the next.
It takes you 150/speed to get from one light to the next, though you have to use double because of the possibilty of the speed being 20.  Then, once you get to the light, you just have to check if it is red or green, and wait for it to turn green if it is red.</P>
            
            <P>&#160;</P><A NAME="TopPilot"></A><FONT SIZE="+2"><B>TopPilot</B></FONT><BR/><FONT SIZE="-1">
    Used as: Level 2</FONT><H4>Implementation</H4><P>
Undoubtedly the easiest medium problem of the match, this problem simply involved running floyds to find the transitive closure.  Since the indexes of all the airports are between 0 and 50, inclusive, it is simple to just build an adjacency matrix.  Once you have this, you simply run floyds, and count the number of connected vertices.  DjinnKahn's solution was probably the cleanest, and he got the most points on this one. </P>

            <P>&#160;</P><A NAME="DNAsynth"></A><FONT SIZE="+2"><B>DNAsynth</B></FONT><BR/><FONT SIZE="-1">
    Used as: Level 3</FONT><H4>Implementation</H4>
    <P>
To make up for the easy medium, the hardest hard problem was used in this round.  You are given a list of rules of the form &lt;SEQ1&gt;:&lt;SEQ2&gt; indicating that strings starting with &lt;SEQ2&gt; can be appended to strings ending with &lt;SEQ1&gt;.  You start with an unlimited supply of all of the strings that are &lt;SEQ1&gt; or &lt;SEQ2&gt; in one of these rules.  Additionally, sequences are the same forwards and backwards, but this is easily handled by including the reverse of all the rules.</P>
<P>
Since the length of &lt;SEQ1&gt; and &lt;SEQ2&gt; are limited to 4, it appears at first glance that we can simply keep track of the longest string with a given ending and then keep trying to add new strings from &lt;SEQ1&gt; or &lt;SEQ2&gt;.  However, a close examination of example 4 shows that this will fail.  However, this approach is on the right track.  In order to get example 4 correct, then we have to do some preproccessing.  So, after reversing the rules, we then take each of the rules, and remove the semicolon.  It is obvious that all of these strings can be formed.  Then, for each of these strings, we go through all of the rules, and if the string we formed starts with &lt;SEQ2&gt; in one of the rules then we add a new rule, &lt;SEQ1&gt;:&lt;new string&gt;, and its reverse.</P>
<P>
Once we have these extra rules, we can just do some simple dynamic programming to keep track of the longest strings with each of 4 character ending.  If the length every get over 404, then we can form an infinite loop.
</P>


<IMG SRC="/i/m/lbackstrom_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;lbackstrom<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=159052" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
          </TD>
            </TR>                  
            <!-- <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 4 Problems</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
<IMG SRC="/i/pdf_iconw.gif" ALT="" WIDTH="31" HEIGHT="31" BORDER="0"/><BR/>
Level One (250) - <A HREF="/i/invit02/Betting.pdf" CLASS="bodyText">Betting</A><BR/>
Level Two (500) - <A HREF="/i/invit02/Roadmap.pdf" CLASS="bodyText">Roadmap</A><BR/>
Level Three (1000) - <A HREF="/i/invit02/Omaha.pdf" CLASS="bodyText">Omaha</A><BR/>

          </TD>
            </TR> -->
            <TR>
              <TD VALIGN="middle"><A NAME="log"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 4 Chrono Logs</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
              
<BR/><B>CODING PHASE</B><BR/>
6:00:01 PM - ZorbaTHut opens the Level One problem<BR/>
6:00:03 PM - jms137 opens the Level One problem<BR/>
6:00:03 PM - DjinnKahn opens the Level One problem<BR/>
6:00:35 PM - John Dethridge opens the Level One problem<BR/>
6:06:15 PM - ZorbaTHut submits the Level One problem for 190.94 points (final submission)<BR/>
6:06:21 PM - ZorbaTHut opens the Level Two problem<BR/>
6:08:02 PM - John Dethridge submits the Level One problem for 187.47 points (final submission)<BR/>
6:08:21 PM - John Dethridge opens the Level Three problem<BR/>
6:12:42 PM - ZorbaTHut submits the Level Two problem for 381.24 points (final submission)<BR/>
6:12:48 PM - ZorbaTHut opens the Level Three problem<BR/>
6:20:29 PM - jms137 submits the Level One problem for 140.35 points (final submission)<BR/>
6:20:38 PM - jms137 opens the Level Two problem<BR/>
6:21:18 PM - John Dethridge opens the Level Two problem<BR/>
6:25:15 PM - DjinnKahn submits the Level One problem for 125.79 points (final submission)<BR/>
6:25:20 PM - DjinnKahn opens the Level Two problem<BR/>
6:34:05 PM - DjinnKahn submits the Level Two problem for 366.41 points (final submission)<BR/>
6:34:19 PM - DjinnKahn opens the Level Three problem<BR/>
6:36:54 PM - John Dethridge submits the Level Two problem for 315.46 points (final submission)<BR/>
6:44:44 PM - jms137 submits the Level Two problem for 257.74 points (final submission)<BR/>
6:44:52 PM - jms137 opens the Level Three problem<BR/>
7:14:50 PM - John Dethridge submits the Level Three problem for 416.94 points (final submission)<BR/>

<BR/><B>CHALLENGE PHASE</B><BR/>
7:25:36 PM - jms137 challenges John Dethridge on the Level Two problem UNsuccessfully<BR/>


          </TD>
            </TR>            
                                   
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


