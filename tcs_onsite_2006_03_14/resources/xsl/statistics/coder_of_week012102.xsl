<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>
  <xsl:import href="../includes/modules/coder_week_pulldown.xsl"/>    
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
      <BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
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
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">statistics</xsl:with-param>
  <xsl:with-param name="title">&#160;Coder of the Week</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
   <TR>
      <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
      <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
    <!-- Coder of the Week Pulldown Begins -->            
        <xsl:call-template name="coder_week_pulldown"/>
   <!-- Coder of the Week Pulldown Ends -->               
               
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                  <TR>
                     <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                  </TR>               
                  <TR>
                     <TD VALIGN="middle" COLSPAN="3" HEIGHT="16" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;January 21 - January 27, 2002</TD>
                  </TR>
                  <TR>
                     <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                  </TR>                                                   
                  <TR>
                     <TD VALIGN="top" COLSPAN="3" CLASS="statText">
                                    
<IMG SRC="/i/m/mitkid/mitkid_big.jpg" ALT="Coder of the Week" WIDTH="126" HEIGHT="140" ALIGN="left" HSPACE="10" VSPACE="10" BORDER="0"/>
<P CLASS="statText">
<b>Handle:</b> <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260800" CLASS="coderTextYellow">mitkid</A><br/>
<b>Rating:</b> 2039<br/>
<b>Member Since:</b> January&#160;3,&#160;2002<br/>
<b>Total Competitions:</b> 2<br/>
</P>

<P>
TopCoder, Inc announced today that <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260800" CLASS="coderTextYellow">mitkid</A> has been named the "Coder of the Week" for 
Single Round Match's 59 and 60, which took place between January 21 - 27, 2002.  
</P>

<P>
In SRM 59, <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260800" CLASS="coderTextYellow">mitkid</A> won Room 42 by submitting correct code for all three problems and 
being successful in his lone challenge.  The 1910 rating he earned in that match is the fifth highest 
debut rating ever.  That win placed <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260800" CLASS="coderTextYellow">mitkid</A> in Division I for SRM 60.  
Unfazed by the steeper competition, he won his room once again by successfully coding all three 
algorithms.  <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260800" CLASS="coderTextYellow">mitkid</A> gained 129 rating points in SRM 60 for an overall 
rating of 2039, which ranks him 28th among all members.  
</P>

<P>
"I think my success in my first two matches can be attributed to my participation in the Computer 
Science Olympiad (IOI)," said <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260800" CLASS="coderTextYellow">mitkid</A>.  "It taught me how to come up with efficient 
algorithms and write correct code."
</P>

<P>
A TopCoder member since January 3, 2002, <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260800" CLASS="coderTextYellow">mitkid</A> has competed twice and has won a 
total of $450.  <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260800" CLASS="coderTextYellow">mitkid</A> is a senior Computer Science major at MIT in Cambridge, 
Massachusetts. 
</P>

<P>
"I enjoy participating in TopCoder a lot, because coding solutions to small, challenging 
problems is a lot of fun," added <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260800" CLASS="coderTextYellow">mitkid</A>.  "Of course, the cash reward is also nice.  
TopCoder provides a great opportunity for college students to measure and improve their coding skills."
</P>

<P>
Other members nominated for "Coder of the Week" were: <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=111435" CLASS="coderTextBlue">overflow</A>, who won his 
room for the second and third consecutive times in SRM's 59 and 60; <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153650" CLASS="coderTextYellow">polgara</A>, 
who won her room for the fourth consecutive time in SRM 59; <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152347" CLASS="coderTextRed">qubits</A>, who won 
his room for the third consecutive time in SRM 59; and <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=262936" CLASS="coderTextRed">dgarthur</A>, whose 376-point 
rating gain in SRM 60 was the 11th highest ever in Division II.
</P>

                     
                     </TD>                  
                  </TR>                  
               </TABLE>
               <P><br/></P>
      </TD>
      <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
   </TR>
   <TR>
      <TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
   </TR>      
   <TR>
      <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
      <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
   </TR>   
   <TR>
      <TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
      <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
      <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
      <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
   </TR>
</TABLE>
      </TD>
   <!-- Center Column Ends -->
<!-- Body Area Ends -->

   <!-- Gutter -->
      <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
   <!-- Right Column Begins -->
      <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_right_col"/>        
<!-- Right Column Include Ends -->        
        </TD>
   <!-- Right Column Ends -->
   <!-- Gutter -->
      <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
   </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

