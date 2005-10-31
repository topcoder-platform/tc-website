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
                     <TD VALIGN="middle" COLSPAN="3" HEIGHT="16" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;November 12 - November 18, 2001</TD>
                  </TR>
                  <TR>
                     <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                  </TR>                                                   
                  <TR>
                     <TD VALIGN="top" COLSPAN="3" CLASS="statText">
                                    
<IMG SRC="/i/m/petch/petch_big.jpg" ALT="Coder of the Week" WIDTH="126" HEIGHT="140" ALIGN="left" HSPACE="10" VSPACE="10" BORDER="0"/>
<P CLASS="statText">
<b>Handle:</b> <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153479" CLASS="coderTextYellow">petch</A><br/>
<b>Rating:</b> 1837<br/>
<b>Member Since:</b> August 24, 2001<br/>
<b>Total Competitions:</b> 18<br/>
</P>

<P>
TopCoder, Inc. announced today that <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153479" CLASS="coderTextYellow">petch</A> has been named the "Coder of the Week" for Single Round Matches 42 and 43, which took place between November 12 and November 18, 2001.  
</P>

<P>
After submitting the 250 and 1000-point problems during the "Coding Phase" of 
SRM 43, <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153479" CLASS="coderTextYellow">petch</A> 
found himself in second place in Room 26 with 1034.05 points, just slightly behind room leader <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158149" CLASS="coderTextBlue">adrian</A>, who 
had coded all three problems for 1125.20 points.  <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153479" CLASS="coderTextYellow">petch</A> used the 
"Challenge Phase" to his advantage as he first successfully challenged the 250-point code submitted by <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=157967" CLASS="coderTextGray">damonema</A> for 
50 points, and then was successful in his challenge of the 1000-point problem submitted by <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158149" CLASS="coderTextBlue">adrian</A> for another 50 
points.  Those extra 100 points gave <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153479" CLASS="coderTextYellow">petch</A> 1134.05 final points and the Room 26 win.
</P>

<P>
"Most of the 250-point problems are easy, but usually have some special cases to be aware of," said 
<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153479" CLASS="coderTextYellow">petch</A>.  "I 
am usually able to succeed in my challenges due to carelessness."  I challenge 1000-point submission's when I see high scores, 
as I think they might be guessing."
</P>

<P>
In addition, <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153479" CLASS="coderTextYellow">petch</A> 
made himself eligible to compete in Division I competitions, as his overall TopCoder rating increased from 1369 to 1589.
</P>

<P>
A TopCoder member since August 24, 2001, 
<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153479" CLASS="coderTextYellow">petch</A> has 
competed in 18 TopCoder Single Round Matches and has won a total of $1,425.  He is a freshman at MIT majoring in 
Computer Science and Electrical Engineering.  In addition to his room win in SRM 43, 
<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153479" CLASS="coderTextYellow">petch</A> also was a room 
winner in SRM's 31, 36, 38, 47 and 48.
</P>

<P>
"I feel TopCoder is very challenging, and I enjoy the opportunity to both compete with other skilled 
programmers and improve my own skills, added 
<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153479" CLASS="coderTextYellow">petch</A>."
</P>

<P>
Other members nominated for "Coder of the Week" were: <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158922" CLASS="coderTextYellow">Revoklaw</A>, 
who won Room 28 of SRM 43 in his TopCoder debut, and whose 1725 rating ranks him 20th in 
Highest Debut Rating; <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=119676" CLASS="coderTextYellow">Pops</A>, whose two successful challenges of room leader 
<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156530" CLASS="coderTextGray">ic1981</A> helped him win Room 15 in SRM 43; <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=105922" CLASS="coderTextRed">qubits</A>, who was correct in all 
three of his submissions to win Room 6 in SRM 42 with a match-high 1402.75 final points; and <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=155793" CLASS="coderTextYellow">Quest171</A>, 
whose two successful challenges lifted him from second to first place in Room 15 of match 42, earning him his first TopCoder room win.
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

