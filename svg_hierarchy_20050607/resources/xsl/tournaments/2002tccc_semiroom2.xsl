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
  <xsl:with-param name="title">&#160;Room&#160;2:&#160;Summary&#160;&amp;&#160;Photos</xsl:with-param>
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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 2 Summary</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P><IMG SRC="/i/2002tccc/tourney_photo3.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Room 2 - dmwright...dominates!</B></FONT><BR/>
<I>Stanford junior makes 2nd consecutive finals appearance.</I><BR/><BR/>
Friday, April 19, 2002<BR/>
By&#160;Adam Loss,<I>TopCoder Staff Writer</I><BR/>
</P>
<!-- <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#" CLASS="bodyGeneric"></A>
<A HREF="/index?t=tournaments&amp;c=2002tccc_favs#" CLASS="bodyGeneric"></A>
<A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#" CLASS="bodyGeneric"></A>
<IMG SRC="/i/2002tccc/tourney_photo2.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<IMG SRC="/i/2002tccc/coder_quote2.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/> -->


<P>
A late arriving Los Angeles-esque crowd gathered to witness the 11am 
round of the 2002 Sun Microsystems and TopCoder Collegiate Challenge.  
<IMG SRC="/i/2002tccc/coder_quote3.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/>
Perhaps it was the smell of the lunch that was being set up that brought 
the spectators, but more likely it was to watch TopCoder tournament veteran 
<A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A> strut his stuff.  
The junior from Stanford University, who is 
TopCoder's only member to make it to the semifinals of their first three 
major tournaments, didn't disappoint those who attended, as he advanced 
to his second consecutive final by submitting code for all three problems 
and 1114.91 final points.
</P>

<P>
"I'm not nervous at all," said <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A>, 
when asked about returning for 
his second consecutive appearance in a TopCoder major tournament final.  
"I'll just treat it like a Single Round Match, and block everyone else around me out."
</P>

<P>
2001 TopCoder Invitational semifinalists <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#Logan" CLASS="bodyGeneric">Logan</A> and <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A> finished 
second and third with 566.59 and 260.51 final points, respectively, while 
<A HREF="/index?t=tournaments&amp;c=2002tccc_cind#bigg_nate" CLASS="bodyGeneric">bigg_nate</A> had a rough time in his first semifinals appearance, and finished with -50.
</P>

<P>
<A HREF="/index?t=tournaments&amp;c=2002tccc_cind#Logan" CLASS="bodyGeneric">Logan</A> threw the first curve into the match, as he attacked the hard Level 
Three problem, while everyone else chose the easier Level One problem.  
<A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A> 
finished the problem first and earned 214.73 points.  <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#bigg_nate" CLASS="bodyGeneric">bigg_nate</A> 
finished minutes later, and earned 207.89 points.  Meanwhile, <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A> 
and <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#Logan" CLASS="bodyGeneric">Logan</A> were struggling, losing time and valuable points as they pressed 
to complete their respective codes, but it just wasn't meant to be.  <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#Logan" CLASS="bodyGeneric">Logan</A> 
ended up leaving the Level Three problem, and opened the Level One problem, 
which he submitted for 222.34 points.  "I figured if I could submit the 
Level Three problem in a decent amount of time, I might have enough points 
to beat out the guys who went after the Level One problem first," remarked 
<A HREF="/index?t=tournaments&amp;c=2002tccc_cind#Logan" CLASS="bodyGeneric">Logan</A>.  "I just couldn't figure it out, and had to move on."  <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A> 
stopped compiling code for the Level One problem, and went after the Level 
Two problem, for which he ended up earning 310.51 points.  "I didn't think I 
could code a solution that would run in the allotted amount of time 
(under eight second)," said <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A>, when asked about why he decided to move on.
</P>

<P>
<A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A> ended up earning 397.86 points on his Level Two submission, 
and was the only coder in the room to finish the Level Three problem, gaining 502.32.
</P>

<P>
After the "Coding Phase", <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A> led the way with 1114.91 points, 
far ahead of second place <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#Logan" CLASS="bodyGeneric">Logan</A> (566.59), third place <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#bigg_nate" CLASS="bodyGeneric">bigg_nate</A> (475.61), 
and fourth place <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A> (310.51).
</P>

<P>
While the 548.32-point lead for <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A> may have seemed insurmountable 
to onlookers, <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#Logan" CLASS="bodyGeneric">Logan</A>, <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#bigg_nate" CLASS="bodyGeneric">bigg_nate</A>, and <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A> all knew that there was a 
"Challenge Phase" ahead, and that they would have their opportunity to prove 
if the high point total of <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A> was warranted.  To their disappointment, 
however, all three guys were unable to break any of the code 
submitted by <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A>, and he remained far ahead entering the "System Test
 Phase".  The only action in the "Challenge Phase" was unsuccessful 
 challenges by <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#bigg_nate" CLASS="bodyGeneric">bigg_nate</A> and <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A> on each other's Level Two 
 submissions.  Those ill fated attempts cost each coder 50 points.
</P>

<P>
<A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A>, all three submissions, <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#Logan" CLASS="bodyGeneric">Logan</A>, his Level One and Two, and 
<A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#ColinMacLeod" CLASS="bodyGeneric">ColinMacLeod</A>, his Level Two, all passed through the system test unscathed.  
<A HREF="/index?t=tournaments&amp;c=2002tccc_cind#bigg_nate" CLASS="bodyGeneric">bigg_nate</A>, however, wasn't as fortunate, as his Level One and Two submissions both failed.
</P>

          </TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><A NAME="photo"></A></TD>
            </TR>          
            
          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 2 Photos</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR201')"><IMG SRC="/i/2002tccc/SFR201_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR202')"><IMG SRC="/i/2002tccc/SFR202_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR203')"><IMG SRC="/i/2002tccc/SFR203_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR204')"><IMG SRC="/i/2002tccc/SFR204_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR205')"><IMG SRC="/i/2002tccc/SFR205_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR206')"><IMG SRC="/i/2002tccc/SFR206_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR207')"><IMG SRC="/i/2002tccc/SFR207_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR208')"><IMG SRC="/i/2002tccc/SFR208_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR209')"><IMG SRC="/i/2002tccc/SFR209_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR210')"><IMG SRC="/i/2002tccc/SFR210_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR211')"><IMG SRC="/i/2002tccc/SFR211_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR212')"><IMG SRC="/i/2002tccc/SFR212_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR213')"><IMG SRC="/i/2002tccc/SFR213_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR214')"><IMG SRC="/i/2002tccc/SFR214_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR215')"><IMG SRC="/i/2002tccc/SFR215_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=SFR216')"><IMG SRC="/i/2002tccc/SFR216_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
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


