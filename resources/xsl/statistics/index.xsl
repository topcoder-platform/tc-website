<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/srm_results.xsl"/>  
  <xsl:import href="../includes/modules/white_last_srm.xsl"/>
  <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
  <xsl:import href="../includes/modules/coder_week2.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/top_room_wins.xsl"/>  
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
        <xsl:call-template name="public_stats_left"/>
	<!-- Global Seconday Nav Ends -->			
<!-- Left Column Include Ends -->							
	  	</TD>
	<!-- Left Column Ends -->
	<!-- Gutter Begins -->
		<TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD class="bodyText" width="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">statisticsw</xsl:with-param>
  <xsl:with-param name="title">&#160;</xsl:with-param>
</xsl:call-template>

			<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<TR>
					<TD VALIGN="top" WIDTH="11" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" VALIGN="top" BGCOLOR="#FFFFFF">
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/>

<!-- <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>  
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" WIDTH="90%" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;<B>Last Match Summary</B></TD> 
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="10%" NOWRAP="0"><A HREF="/stat?c=last_match" CLASS="bodyGeneric">Results</A></TD>  
  </TR>  
</TABLE> -->
 	<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/><BR/>				
    <!-- Last SRM Begins --> 
        <!-- <xsl:call-template name="last_srm"/> -->
    <!-- Last SRM Ends --> 
    
    <BR/><SPAN CLASS="bodyTextBold">Single Round Match 102</SPAN><BR/>
Monday, July 1, 2002<BR/>   
    <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><BR/><A NAME="leaders"></A>
<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>  
    <TD VALIGN="middle" COLSPAN="2" BGCOLOR="#CCCCCC" WIDTH="40%" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;<B>Div-I Leaders</B></TD>
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="10%" NOWRAP="0"><A HREF="/stat?c=last_match&amp;rd=4230&amp;dn=1" CLASS="bodyGeneric">Results</A></TD> 
    <TD VALIGN="middle" COLSPAN="2" BGCOLOR="#CCCCCC" WIDTH="40%" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;<B>Div-II Leaders</B></TD>
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="10%" NOWRAP="0"><A HREF="/stat?c=last_match&amp;rd=4230&amp;dn=2" CLASS="bodyGeneric">Results</A></TD>  
  </TR> 
  
  <TR>  
    <TD VALIGN="middle" NOWRAP="0" WIDTH="30%" HEIGHT="15" CLASS="bodyText">&#160;radeye</TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="10%" HEIGHT="15" CLASS="bodyText" ALIGN="right">1450.82 &#160;&#160;</TD>    
    <TD VALIGN="middle" NOWRAP="0" WIDTH="10%" HEIGHT="15" CLASS="bodyText">&#160;Room 1</TD>
    
    <TD VALIGN="middle" NOWRAP="0" WIDTH="30%" HEIGHT="15" CLASS="bodyText">&#160;bstanescu</TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="10%" HEIGHT="15" CLASS="bodyText" ALIGN="right">1213.28 &#160;&#160;</TD>    
    <TD VALIGN="middle" NOWRAP="0" WIDTH="10%" HEIGHT="15" CLASS="bodyText">&#160;Room 35</TD>          
  </TR>  
  <TR>  
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Yarin</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">1366.10 &#160;&#160;</TD>    
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Room 1</TD>
    
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;db</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">1078.65 &#160;&#160;</TD>    
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Room 14</TD>          
  </TR>
  <TR>  
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;benetin</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">1251.67 &#160;&#160;</TD>    
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Room 1</TD>
    
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;seaniswise</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">1040.35 &#160;&#160;</TD>    
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Room 16</TD>          
  </TR>
  <TR>  
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;John Dethridge</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">1172.89 &#160;&#160;</TD>    
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Room 1</TD>
    
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;vietchau</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">809.51 &#160;&#160;</TD>    
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Room 22</TD>          
  </TR>
  <TR>  
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;ambrose</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">1093.96 &#160;&#160;</TD>    
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Room 2</TD>
    
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Mikaus</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">686.93 &#160;&#160;</TD>    
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Room 21</TD>          
  </TR>           
</TABLE>
    <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><BR/><A NAME="problem_stats"></A>
<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>  
    <TD VALIGN="middle" COLSPAN="5" BGCOLOR="#CCCCCC" WIDTH="100%" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;<B>Div-I Problem Stats</B></TD>  
  </TR> 
 
  <TR>  
    <TD VALIGN="middle" NOWRAP="0" WIDTH="20%" HEIGHT="15" CLASS="bodyText">&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="30%" HEIGHT="15" CLASS="bodyText">&#160;<B>Problem Name</B></TD>    
    <TD VALIGN="middle" NOWRAP="0" WIDTH="10%" HEIGHT="15" CLASS="bodyText" ALIGN="right">&#160;<B>Submissions</B></TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="20%" HEIGHT="15" CLASS="bodyText" ALIGN="right">&#160;<B>Correct %&#160;&#160;</B></TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="20%" HEIGHT="15" CLASS="bodyText" ALIGN="right"><B>Average Pts.</B></TD>             
  </TR>  
  <TR>  
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Level One</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;BitFlipper</TD>    
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">121 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">95.04% &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">221.51</TD>             
  </TR> 
  <TR>  
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Level Two</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;GirlFriend</TD>    
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">71 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">38.03% &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">280.34</TD>             
  </TR>
  <TR>  
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Level Three</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;DNAStrand</TD>    
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">33 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">66.67% &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">579.33</TD>             
  </TR>         
</TABLE>
    <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/><BR/>
<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>  
    <TD VALIGN="middle" COLSPAN="5" BGCOLOR="#CCCCCC" WIDTH="100%" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;<B>Div-II Problem Stats</B></TD>  
  </TR> 
 
  <TR>  
    <TD VALIGN="middle" NOWRAP="0" WIDTH="20%" HEIGHT="15" CLASS="bodyText">&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="30%" HEIGHT="15" CLASS="bodyText">&#160;<B>Problem Name</B></TD>    
    <TD VALIGN="middle" NOWRAP="0" WIDTH="10%" HEIGHT="15" CLASS="bodyText" ALIGN="right">&#160;<B>Submissions</B></TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="20%" HEIGHT="15" CLASS="bodyText" ALIGN="right">&#160;<B>Correct %&#160;&#160;</B></TD>
    <TD VALIGN="middle" NOWRAP="0" WIDTH="20%" HEIGHT="15" CLASS="bodyText" ALIGN="right"><B>Average Pts.</B></TD>             
  </TR>  
  <TR>  
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Level One</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;Phrase</TD>    
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">207 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">77.78% &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">176.74</TD>             
  </TR> 
  <TR>  
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Level Two</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;MoleWhack</TD>    
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">195 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">95.38% &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">322.48</TD>             
  </TR>
  <TR>  
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;Level Three</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText">&#160;&#160;GirlFriend</TD>    
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">54 &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">7.41% &#160;&#160;</TD>
    <TD VALIGN="middle" NOWRAP="0" HEIGHT="15" CLASS="bodyText" ALIGN="right">495.55</TD>             
  </TR>
  <TR>  
    <TD VALIGN="middle" COLSPAN="5" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0"/></TD>  
  </TR>  
  <!-- <TR>  
    <TD VALIGN="middle" COLSPAN="5" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>  
  </TR> -->           
</TABLE>

				 	</TD>
					<TD VALIGN="top" WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>		 
				</TR>
  <TR>  
    <TD VALIGN="top" COLSPAN="3" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>    
  </TR>  							

				<!-- <TR>
					<TD VALIGN="top" WIDTH="11" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD COLSPAN="3" CLASS="statText" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif">  -->
<!-- Coder of the Week Begins -->
        <!-- <xsl:call-template name="coder_week"/> -->
<!-- Coder of the Week Ends -->

	
					<!-- </TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR> -->
				<TR>
					<TD COLSPAN="3" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>   	
				<TR>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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
<!-- <A href="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm92"><IMG SRC="/i/motorola_sidebar1.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
<A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=stats_index','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A> -->
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

