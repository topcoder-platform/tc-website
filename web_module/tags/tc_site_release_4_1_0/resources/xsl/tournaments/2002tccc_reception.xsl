<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>
  <xsl:import href="../includes/modules/2002tccc_seminav.xsl"/>    
  <xsl:import href="../includes/stats/public_stats_left.xsl"/> 
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
<script Language="JavaScript">


function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');

}


</script>      
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
        <xsl:call-template name="public_stats_left"/>
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
  <xsl:with-param name="image">statisticsw</xsl:with-param>
  <xsl:with-param name="title">&#160;Opening&#160;Ceremonies:&#160;Summary&#160;&amp;&#160;Photos</xsl:with-param>
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
            <!-- <TR>
              <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/index?t=tournaments&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_banner_white.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
            </TR> -->          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Reception Summary</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P><IMG SRC="/i/2002tccc/tourney_photo1.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Opening Ceremonies</B></FONT><BR/>
<I>16 coders arrive for Collegiate Challenge</I><BR/><BR/>
Thursday, April 18, 2002<BR/>
By&#160;Adam Loss,<I>TopCoder Staff Writer</I><BR/>
</P>


<P>
The drinks were flowing, the hors d' oeuvres were consumed, the smiles were bright, and the pleasantries were exchanged, 
as the 16 semifinalists in the 2002 Sun Microsystems and TopCoder Collegiate Challenge enjoyed the welcome reception on 
<IMG SRC="/i/2002tccc/coder_quote1.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/>
Thursday night.  Come Friday, however, the pressure of competition could make stomachs uneasy, and those smiles and 
pleasantries will most likely turn to game-faces and trash talking.
</P>

<P>
<A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A>, the Southeast Regional champion, and 
<A HREF="/index?t=tournaments&amp;c=2002tccc_favs#ZorbaTHut" CLASS="bodyGeneric">ZorbaTHut</A>, 
the Northeast Regional champion, were the first coders 
to arrive, and both are looking to make amends for lackluster performances as semifinalists in the 2001 TopCoder 
Invitational.  "We call ourselves members of the Zero Club," said 
<A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A>, 
referring to the fact that they both 
failed to earn any points and finished last in their rooms at the Invitational.  "We can't do any worse," added 
<A HREF="/index?t=tournaments&amp;c=2002tccc_favs#ZorbaTHut" CLASS="bodyGeneric">ZorbaTHut</A>.  
</P>

<P>
Two other returning semifinalists from the Invitational, 
<A HREF="/index?t=tournaments&amp;c=2002tccc_favs#ambrose" CLASS="bodyGeneric">ambrose</A> and 
<A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#milhouse" CLASS="bodyGeneric">milhouse</A>, are both battling physical ailments.  
"I've been sick this whole week and my contacts are bothering me," said 
<A HREF="/index?t=tournaments&amp;c=2002tccc_favs#ambrose" CLASS="bodyGeneric">ambrose</A>.  "I'm mentally prepared, however, 
and I think the competition in my room is easier than in the Invitational."  
<A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#milhouse" CLASS="bodyGeneric">milhouse</A> was a no-show at the reception 
and unavailable for comment.  The word on the street is that he is suffering from food poisoning...will he show?
</P>

<P>
First-time semifinalists <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#zoidal" CLASS="bodyGeneric">zoidal</A>, 
<A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A> and <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A>, 
the MidWest Regional champion, were surprisingly confident in 
their chances to win.  "I know that a lot of people will be watching, but I'm just going to block them out and get 
into a zone," said <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#zoidal" CLASS="bodyGeneric">zoidal</A>.  
<A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A> is feeling rather optimistic 
based on his success in the most recent Single Round Match.  
"I won Room 3 on Monday, so my confidence is definitely high."   While 
<A HREF="/index?t=tournaments&amp;c=2002tccc_favs#DjinnKahn" CLASS="bodyGeneric">DjinnKahn</A> is as sanguine as 
<A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#zoidal" CLASS="bodyGeneric">zoidal</A> and 
<A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A>, 
he plans on being careful as well.  "My strategy for the elimination rounds was to be cautious, rather than rush 
and make mistakes, which is exactly what I plan to do on Friday."
</P>

<P>
Tournament favorite <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A> was 
one of the last participants to show up for the reception, perhaps trying to psych
 out his opponents.  Despite his tournament experience and success, however, he is still humbled by his competition.  
 "I'm sure everyone here has beaten me in a match before, so I have to make sure that I don't make the same mistakes 
 which have cost me in past tournaments."
</P>

          </TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><A NAME="photo"></A></TD>
            </TR>          
            
          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 1 Photos</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR101')"><IMG SRC="/i/2002tccc/SFR101_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR102')"><IMG SRC="/i/2002tccc/SFR102_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR103')"><IMG SRC="/i/2002tccc/SFR103_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR104')"><IMG SRC="/i/2002tccc/SFR104_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR105')"><IMG SRC="/i/2002tccc/SFR105_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR106')"><IMG SRC="/i/2002tccc/SFR106_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR107')"><IMG SRC="/i/2002tccc/SFR107_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR108')"><IMG SRC="/i/2002tccc/SFR108_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR109')"><IMG SRC="/i/2002tccc/SFR109_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR110')"><IMG SRC="/i/2002tccc/SFR110_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR111')"><IMG SRC="/i/2002tccc/SFR111_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
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


