<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>
<!--  <xsl:import href="../includes/modules/2002tccc_seminav.xsl"/>   -->  
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
  <xsl:with-param name="title">&#160;The&#160;2002&#160;Sun/TopCoder&#160;Collegiate&#160;Challenge</xsl:with-param>
</xsl:call-template>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<DIV ALIGN="center"><IMG SRC="/i/sun_banner_white.gif" ALT="" WIDTH="428" HEIGHT="84" BORDER="0"/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="100%" ALIGN="right">
 	<TR>
        <!-- <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText" ALIGN="center"><IMG SRC="/i/02tccc_logow_sm.gif" ALT="" WIDTH="96" HEIGHT="74" ALIGN="left" HSPACE="5" VSPACE="15" BORDER="0"/></TD> 	
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD> -->
        <TD COLSPAN="3" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
	<TR><TD COLSPAN="3" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
	<TR>
		<TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD WIDTH="70%" BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">TOURNAMENT LINKS:</TD> 
		
		<TD WIDTH="30%" BGCOLOR="#FFFFFF" VALIGN="middle" ALIGN="right" CLASS="moduleTitle"><A HREF="/index?t=tournaments&amp;c=2002tccc_breakdown" CLASS="bodyText">-&#160;Brackets</A>&#160;&#160;</TD>
	</TR>                    
	<TR>
    	<TD COLSPAN="3" VALIGN="top" BGCOLOR="#999999" WIDTH="100%" NOWRAP="0">
		<TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
		<TR>					
			<TD VALIGN="top" CLASS="bodyText" NOWRAP="0">&#160;&#160;<B>Championship:</B><BR/>
			 &#160;<A HREF="/index?t=tournaments&amp;c=2002tccc_chmp" CLASS="bodyText">Summary</A> | 
			 <A HREF="/index?t=tournaments&amp;c=2002tccc_chmpprob" CLASS="bodyText">Problems</A> | 			
			 <A HREF="/index?t=tournaments&amp;c=2002tccc_chmpprob#log" CLASS="bodyText">Chrono Log</A> | 
			 <A HREF="/index?t=tournaments&amp;c=2002tccc_chmp#photo" CLASS="bodyText">Photos</A> | 
			 <A CLASS="bodyText"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/Registration</xsl:attribute>Register Today!</A> |
			 <A HREF="/index" CLASS="bodyText">TopCoder Home</A>
			</TD>									
        </TR>
		<TR><TD VALIGN="top" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
		</TABLE>
		</TD>
	</TR>                
</TABLE></DIV> 
<BR CLEAR="all"/>       
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
            <!-- <TR>
              <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/index?t=tournaments&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_banner_white.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
            </TR> -->          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Championship Summary</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<!-- TC top special promo --> 
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">          
  <TR>  
    <TD VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>   
  </TR>  
  <TR>  
    <!-- <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD> -->
    <TD VALIGN="middle" WIDTH="100%" ALIGN="center" BGCOLOR="#CCCCCC" HEIGHT="50" CLASS="bodyText">
    <FONT SIZE="5" COLOR="#000000" FACE="tahoma,verdana,arial"><B>The&#160;Sun/TopCoder&#160;Collegiate&#160;Challenge</B></FONT><BR/>
    Stanford Junior Daniel Wright wins in 3rd tournament appearance</TD>   
    <!-- <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD> -->
  </TR>
  <TR>  
    <TD VALIGN="top" BGCOLOR="#FFFFFF" ALIGN="center"><IMG SRC="/i/2002tccc/tourney_photo6.jpg" ALT="" WIDTH="450" HEIGHT="155" HSPACE="2" VSPACE="3" BORDER="0"/></TD>   
  </TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="100%" ALIGN="left" CLASS="bodyText">
<P>
<!-- <FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Room 4 - Go <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A>!</B></FONT><BR/> 
<I>3 from the West and 1 from the Midwest Advance to the Finals.</I><BR/><BR/> -->
<BR/>
Saturday, April 20, 2002<BR/>
By&#160;Adam Loss,<I>TopCoder Staff Writer</I><BR/>
</P>
<!-- <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#" CLASS="bodyGeneric"></A>
<A HREF="/index?t=tournaments&amp;c=2002tccc_favs#" CLASS="bodyGeneric"></A>
<A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#" CLASS="bodyGeneric"></A>
<IMG SRC="/i/2002tccc/tourney_photo2.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<IMG SRC="/i/2002tccc/coder_quote2.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/>
<A HREF="/index?t=tournaments&amp;c=2002tccc_cind#<A HREF="/index?t=tournaments&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A>" CLASS="bodyGeneric"><A HREF="/index?t=tournaments&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A></A>
<A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#<A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A>" CLASS="bodyGeneric"><A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A></A>
<A HREF="/index?t=tournaments&amp;c=2002tccc_favs#<A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A>" CLASS="bodyGeneric"><A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A></A>
<A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A>
 -->


<P>
Three times happened to be the charm for <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A>.  After advancing to the semifinals in the 2001 
Collegiate Challenge and the 2001 Invitational, <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A> finally came out on top and won the 2002 
<IMG SRC="/i/2002tccc/coder_quote6.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/>
Sun Microsystems and TopCoder Collegiate Challenge on Saturday, April 20, at the University Park Hotel @ MIT.
</P>

<P>
Perhaps Stanford University should rename itself "TopCoder West".  That's because Stanford's 
jonmac was the champion of the 2001 TopCoder Invitational, giving the school two of the first 
three TopCoder major tournament champions.
</P>

<P>
<A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A>, the number two-ranked TopCoder member, started the championship match off by opening
 the Level Two problem, while <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A>, <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A>, and <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A> all tackled the Level One problem. <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A> 
 
 was the first to submit his code and earned 228.56 points.  <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A> and <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A> finished shortly 
 thereafter, gaining 227.96 and 223.09, respectively.  <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A>, <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A> and <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A> all headed for 
 the Level Two problem next.
</P>

<P>
Meanwhile, <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A> took a good amount of time on the Level Two problem, shocking most
 spectators, who were expecting a top score.  "The Level Two problem was very technical," 
 said <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A>.  "I had to be careful because it was easy to make an error."  <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A> 
 finally submitted the Level Two problem for 274.20 points, and opened the Level 
 Three problem.  When asked about his strategy for opening the Level Two problem 
 first, and then going for the Level Three problem, <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A> responded, "Even if 
 it took a little longer to code, the Level Two and Three problems are worth more
  points, so I figured I could outscore the coders who attempted to code the Level
   One and Two problems in succession." 
</P>

<P>
As the minutes passed the room became more animated as spectators watching soon
 realized the difficulty of the problems that the competitors had been presented 
 
 with. Twenty-seven minutes into the match, <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A> abandoned his attempt at the 
 Level Two problem and moved on to the Level Three problem.  <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A> did exactly the same soon after. 
</P>

<P>
Eighteen minutes into his effort on Level Three problem, <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A> made the decision 
to move on to the Level One problem in an effort to secure points, as none of the other
 coders had yet to submit on either the Level Two or Three.
</P>

<P>
After a brief effort, <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A> submitted on the Level One problem for 219.05 points. 
 As the "Coding Phase" ended, <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A> lead with 493.25 points.  <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A> was second 
 with 228.56, <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A> was third with 227.95, while <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A> was fourth with 223.09.
</P>

<P>
<A HREF="/index?t=tournaments&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A> kicked off the "Challenge Phase" with a successful challenge of the Level 
One submission of <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A>.  Those additional 50 points gave <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A> a total of 278.56 
points.  <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A> then tried to break the Level One and Two codes of <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A>.  If 
he has been successful with either challenge, he would have won the championship. 
 To his dismay and the delight of <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A>, however, he was unable to, and after 
 everyone's remaining code passed the system test, <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A> was declared the winner
  with 493.25 final points.  <A HREF="/index?t=tournaments&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A> finished second with 278.56 points, <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A> was 
  third with 227.96, while <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A> finished fourth.  
</P>

<P>
"It's really nice to win after making the semifinals in last year's Collegiate 
Challenge and Invitational," said <A HREF="/index?t=tournaments&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A>.  "My adrenaline was flowing, and I
 really got absorbed in the problems.  I was able to block out all of the spectator 
 activity, and finally submit code without any bugs in it.  Bugs in my code have cost
  me in past major tournaments."
</P>


    </TD>
  </TR>

  <TR>  
    <TD VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>    
  </TR>  
</TABLE> 
          </TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><A NAME="photo"></A></TD>
            </TR>          
            
          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Championship Photos</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=CHMP01')"><IMG SRC="/i/2002tccc/CHMP01_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=CHMP02')"><IMG SRC="/i/2002tccc/CHMP02_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=CHMP03')"><IMG SRC="/i/2002tccc/CHMP03_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=CHMP04')"><IMG SRC="/i/2002tccc/CHMP04_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=CHMP05')"><IMG SRC="/i/2002tccc/CHMP05_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=CHMP06')"><IMG SRC="/i/2002tccc/CHMP06_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=CHMP07')"><IMG SRC="/i/2002tccc/CHMP07_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>             
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=CHMP08')"><IMG SRC="/i/2002tccc/CHMP08_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=CHMP09')"><IMG SRC="/i/2002tccc/CHMP09_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=CHMP10')"><IMG SRC="/i/2002tccc/CHMP10_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=CHMP11')"><IMG SRC="/i/2002tccc/CHMP11_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=CHMP12')"><IMG SRC="/i/2002tccc/CHMP12_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=CHMP13')"><IMG SRC="/i/2002tccc/CHMP13_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=CHMP14')"><IMG SRC="/i/2002tccc/CHMP14_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>              
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=CHMP15')"><IMG SRC="/i/2002tccc/CHMP15_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=CHMP16')"><IMG SRC="/i/2002tccc/CHMP16_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=CHMP17')"><IMG SRC="/i/2002tccc/CHMP17_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A> 
<A HREF="javascript:open_window('/?t=pic&amp;c=member&amp;img=CHMP18')"><IMG SRC="/i/2002tccc/CHMP18_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="10" HSPACE="5" BORDER="0"/></A>
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


