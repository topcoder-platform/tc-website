<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/srm_results.xsl"/>  
  <xsl:import href="../includes/modules/last_srm.xsl"/>
  <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
  <xsl:import href="../includes/modules/coder_week.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
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
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">statistics</xsl:with-param>
  <xsl:with-param name="title">&#160;</xsl:with-param>
</xsl:call-template>
			<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" width="100%">
				<TR>
					<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>
           </TABLE>
<!-- Coder of the Week Begins -->
        <xsl:call-template name="coder_week"/>
<!-- Coder of the Week Ends -->
			<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<!-- <TR>
					<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" COLSPAN="9">
					      <DIV ALIGN="center"><A HREF="/i/mot_redir.html"><IMG SRC="/i/moto_banner.gif" ALT="" WIDTH="428" HEIGHT="84" BORDER="0"/></A></DIV>
					</TD>
				</TR> -->		
				<TR>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/steelblue_top_left1.gif" ALT="" WIDTH="11" HEIGHT="26" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="75" ALIGN="left"><IMG SRC="/i/steelblue_top_left2.gif" ALT="" WIDTH="75" HEIGHT="26" BORDER="0"/></TD>
					<TD CLASS="bodyTextBold" VALIGN="middle" BGCOLOR="#FFFFFF" WIDTH="35%"><A HREF="/index?t=statistics&amp;c=round_stats&amp;Last_Match=true"><IMG SRC="/i/label_srm_results_sm.gif" ALT="Last Match Resutls" WIDTH="138" HEIGHT="26" BORDER="0"/></A></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>					
					<TD ROWSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="2" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="2" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/steelblue_top_left1.gif" ALT="" WIDTH="11" HEIGHT="26" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="75" ALIGN="left"><IMG SRC="/i/steelblue_top_left2.gif" ALT="" WIDTH="75" HEIGHT="26" BORDER="0"/></TD>
					<TD CLASS="bodyTextBold" VALIGN="middle" BGCOLOR="#FFFFFF" WIDTH="65%"><A HREF="/index?t=statistics&amp;c=match_summary"><IMG SRC="/i/label_srm_summary_sm.gif" ALT="Last Match Summary" WIDTH="102" HEIGHT="26" BORDER="0"/></A></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD VALIGN="top" WIDTH="11" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD COLSPAN="2" CLASS="statText" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif">
      <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
        <TR>
          <TD COLSPAN="4" WIDTH="1"><IMG HEIGHT="3" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>
        <TR>
          <TD BACKGROUND="/i/steel_gray_bg3.gif" CLASS="registerNav" COLSPAN="4" VALIGN="middle" HEIGHT="14">&#160;&#160;Top-3 room winners from Division-I<!-- Div-I: Top-3 from match 71 - Mar. 11 --></TD>
        </TR>        
        <TR>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
        </TR>                
        <TR>
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" ALIGN="center" WIDTH="10" HEIGHT="13">&#160;&#160;Place&#160;&#160;&#160;</TD>  
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" WIDTH="32%">Handle</TD>
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" ALIGN="center" WIDTH="32%">Room#</TD>
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" ALIGN="center" WIDTH="32%">Points</TD>  
        </TR>
        <TR>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="4" CLASS="smallFoot" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
        </TR> 
        <!-- <TR>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="4" CLASS="statTextBig" WIDTH="1">There were no Division-I coders in this round.</TD>    
        </TR> -->               
        <TR>
          <TD CLASS="statText" ALIGN="right" VALIGN="middle" HEIGHT="12">&#160;&#160;&#160;1st.&#160;&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle"><A HREF="/stat?c=member_profile&amp;cr=153902" CLASS="coderTextRed">evd</A></TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">1152.03</TD>  
        </TR>    
        <TR>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right" HEIGHT="12">2nd.&#160;&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle"><A HREF="/stat?c=member_profile&amp;cr=152073" CLASS="coderTextRed">NDBronson</A></TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">1</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">1130.16</TD>
        </TR>
        <TR>
          <TD CLASS="statText" ALIGN="right" VALIGN="middle" HEIGHT="12">3rd.&#160;&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle"><A HREF="/stat?c=member_profile&amp;cr=151360" CLASS="coderTextYellow">buddh4sack</A></TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">8</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">580.93</TD>
        </TR>
        <TR>
          <TD  COLSPAN="4" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="smallText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
        </TR>
        <TR>
          <TD  COLSPAN="4" BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" CLASS="smallText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
        </TR>
        <TR>
          <TD  COLSPAN="4" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="smallText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="12" BORDER="0"/></TD>
        </TR>                          
      </TABLE>
    
      <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
        <TR>
          <TD COLSPAN="4" WIDTH="1"><IMG HEIGHT="3" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>
        <TR>
          <TD BACKGROUND="/i/steel_gray_bg3.gif" CLASS="registerNav" COLSPAN="4" VALIGN="middle" HEIGHT="14">&#160;&#160;Top-3 room winners from Division-II<!-- Div-II: Top-3 from match 71 - Mar. 11 --></TD>
        </TR>        
        <TR>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
        </TR>      
        <TR>
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" ALIGN="center" WIDTH="10" HEIGHT="13">&#160;&#160;Place&#160;&#160;&#160;</TD>  
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" WIDTH="32%">Handle</TD>
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" ALIGN="center" WIDTH="32%">Room#</TD>
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" ALIGN="center" WIDTH="32%">Points</TD>  
        </TR>
        <TR>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="4" CLASS="smallFoot" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
        </TR>        
        <TR>
          <TD CLASS="statText" ALIGN="right" VALIGN="middle" HEIGHT="12">&#160;&#160;&#160;1st.&#160;&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle"><A HREF="/stat?c=member_profile&amp;cr=274023" CLASS="coderTextBlue">venco</A></TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">48</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">1651.44</TD>  
        </TR>    
        <TR>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right" HEIGHT="12">2nd.&#160;&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle"><A HREF="/stat?c=member_profile&amp;cr=268010" CLASS="coderTextBlue">cem1834</A></TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">26</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">1651.01</TD>
        </TR>
        <TR>
          <TD CLASS="statText" ALIGN="right" VALIGN="middle" HEIGHT="12">3rd.&#160;&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle"><A HREF="/stat?c=member_profile&amp;cr=262602" CLASS="coderTextBlue">infrared</A></TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">27</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">1649.46</TD>
        </TR>
        <TR>
          <TD  COLSPAN="4" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="smallText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
        </TR>
        <TR>
          <TD  COLSPAN="4" BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" CLASS="smallText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
        </TR>
        <TR>
          <TD  COLSPAN="4" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="smallText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
        </TR>          
      </TABLE> 
     <!-- SRM Results Begins --> 
        <!-- <xsl:call-template name="srm_results"/> -->
    <!-- SRM Results Ends -->
					</TD>
					<TD VALIGN="top" WIDTH="10" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>					
					<TD VALIGN="top" WIDTH="11" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD COLSPAN="2" CLASS="statText" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/><BR/>
   <!-- <DIV ALIGN="center"><A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A></DIV> -->
    <!-- Last SRM Begins --> 
        <xsl:call-template name="last_srm"/>
    <!-- Last SRM Ends --> 
    <BR/>
    				
					</TD>
					<TD VALIGN="top" WIDTH="10" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				
				
				<TR>
					<TD VALIGN="top" WIDTH="11" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD COLSPAN="7" CLASS="statText" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif">

						<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#000033">
                           <!-- <TR>
                              <TD COLSPAN="3" VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
                           </TR> -->                           
                           <TR>
                              <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="left"><IMG SRC="/i/steelblue_top_left1.gif" ALT="" WIDTH="11" HEIGHT="26" BORDER="0"/></TD>
                              <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="75" ALIGN="left"><IMG SRC="/i/steelblue_top_left2.gif" ALT="" WIDTH="75" HEIGHT="26" BORDER="0"/></TD>
                              <TD CLASS="bodyTextBold" VALIGN="middle" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/label_quick_stats_sm.gif" ALT="Quick Stats" WIDTH="104" HEIGHT="26" BORDER="0"/></TD>                              
                           </TR>
                           <TR>
                             <TD CLASS="statText" VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
                          </TR> 							
							<TR>
								<TD CLASS="statText" VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="3" WIDTH="50%">Select a Quick Stat from the menu below or <A HREF="/index?t=statistics&amp;c=quick_stats" CLASS="statText">click here</A> to access the Quick Stats intro page.<BR/><BR/></TD>
							</TR>							
							<TR>
								<TD CLASS="statText" VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="50%" COLSPAN="3">
    <!-- Quick Stat Pulldown Begins --> 
        <DIV ALIGN="right"><xsl:call-template name="quick_stats_pulldown"/></DIV>
    <!-- Quick Stat Pulldown Ends --> 
								</TD>
							</TR>	
						</TABLE>


<!-- <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="100%">
	<TR>
		<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="75"><IMG SRC="/i/steelblue_top_left2.gif" ALT="" WIDTH="75" HEIGHT="26" BORDER="0"/></TD>
		<TD CLASS="bodyTextBold" VALIGN="middle" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/label_quick_stats_sm.gif" ALT="Quick Stats" WIDTH="104" HEIGHT="26" BORDER="0"/></TD>
	</TR>
	<TR>
		<TD COLSPAN="2" CLASS="statText" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
	</TR>	
</TABLE>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">		
	<TR>
		<TD CLASS="bodyText" VALIGN="top" WIDTH="50%"><A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText"><IMG SRC="/i/stat_labels_win_debuts.gif" ALT="Winning Debuts" WIDTH="158" HEIGHT="17" BORDER="0"/></A></TD>
		<TD ROWSPAN="12" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>		
		<TD CLASS="bodyText" VALIGN="top" WIDTH="50%"><A HREF="/index?t=statistics&amp;c=sub_acc" CLASS="statText"><IMG SRC="/i/stat_labels_sub.gif" ALT="Submission Accuracy" WIDTH="158" HEIGHT="17" BORDER="0"/></A></TD>
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="top" WIDTH="50%">This chart represents those members who won their room in their initial Single Round Match... // <A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">more</A></TD>
		<TD CLASS="statText" VALIGN="top" WIDTH="50%">Submission Accuracy is measured by dividing the  number of correct submissions by the number of total submissions by a member...// <A HREF="/index?t=statistics&amp;c=sub_acc" CLASS="statText">more</A></TD>
	</TR>
	<TR>
		<TD COLSPAN="2" CLASS="statText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
	</TR>		
	<TR>
		<TD CLASS="bodyText" VALIGN="top"><A HREF="/index?t=statistics&amp;c=srm_wins" CLASS="statText"><IMG SRC="/i/stat_labels_all_wins.gif" ALT="All-Time Wins" WIDTH="158" HEIGHT="17" BORDER="0"/></A></TD>
		<TD CLASS="bodyText" VALIGN="top"><A HREF="/index?t=statistics&amp;c=rate_debut" CLASS="statText"><IMG SRC="/i/stat_labels_imp_debuts.gif" ALT="Impressive Debuts" WIDTH="158" HEIGHT="17" BORDER="0"/></A></TD>
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="top">This chart ranks the Top-10 in Single Round Match Room Wins.<BR/>
		<A HREF="/index?t=statistics&amp;c=srm_wins" CLASS="statText">Overall</A> : 
		<A HREF="/index?t=statistics&amp;c=srm_wins_div1" CLASS="statText">Division I</A> : 
		<A HREF="/index?t=statistics&amp;c=srm_wins_div2" CLASS="statText">Division II</A><BR/>
		</TD>
		<TD CLASS="statText" VALIGN="top">This chart represents the members who have made the most impressive debuts in a Single Round Match... // <A HREF="/index?t=statistics&amp;c=rate_debut" CLASS="statText">more</A></TD>
	</TR>
	<TR>
		<TD COLSPAN="2" CLASS="statText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
	</TR>	
	<TR>
		<TD CLASS="bodyText" VALIGN="top"><A HREF="/index?t=statistics&amp;c=high_total_div1" CLASS="statText"><IMG SRC="/i/stat_labels_total.gif" ALT="Highest Match Total" WIDTH="158" HEIGHT="17" BORDER="0"/></A></TD>
		<TD CLASS="bodyText" VALIGN="top"><A HREF="/index?t=statistics&amp;c=consec_wins_div1" CLASS="statText"><IMG SRC="/i/stat_labels_consec_wins.gif" ALT="Consecutive Wins" WIDTH="158" HEIGHT="17" BORDER="0"/></A></TD>
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="top">This chart represents the Top-10 highest point totals earned in a Single Round Match.<BR/>
		<A HREF="/index?t=statistics&amp;c=high_total_div1" CLASS="statText">Division I</A> : 
		<A HREF="/index?t=statistics&amp;c=high_total_div2" CLASS="statText">Division II</A><BR/>
		</TD>
		<TD CLASS="statText" VALIGN="top">This chart represents the longest consecutive room win streaks in Single Round Matches.<BR/>
		<A HREF="/index?t=statistics&amp;c=consec_wins_div1" CLASS="statText">Division I</A> : 
		<A HREF="/index?t=statistics&amp;c=consec_wins_div2" CLASS="statText">Division II</A><BR/>
		</TD>
	</TR>
	<TR>
		<TD COLSPAN="2" CLASS="statText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
	</TR>	
	<TR>
		<TD CLASS="bodyText" VALIGN="top"><A HREF="/index?t=statistics&amp;c=rate_gain_div1" CLASS="statText"><IMG SRC="/i/stat_labels_rating.gif" ALT="Rating Point Gain" WIDTH="158" HEIGHT="17" BORDER="0"/></A></TD>
		<TD CLASS="bodyText" VALIGN="top"><A HREF="/index?t=statistics&amp;c=chall_success" CLASS="statText"><IMG SRC="/i/stat_labels_chall.gif" ALT="Challenge Success" WIDTH="158" HEIGHT="17" BORDER="0"/></A></TD>
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="top">This chart represents the biggest rating point gain in a Single Round Match.<BR/>
		<A HREF="/index?t=statistics&amp;c=rate_gain_div1" CLASS="statText">Division I</A> : 
		<A HREF="/index?t=statistics&amp;c=rate_gain_div2" CLASS="statText">Division II</A><BR/>
		</TD>
		<TD CLASS="statText" VALIGN="top">Challenge Success is a percentage based on successful challenges divided by total challenges... // <A HREF="/index?t=statistics&amp;c=chall_success" CLASS="statText">more</A></TD>
	</TR>
	<TR>
		<TD COLSPAN="2" CLASS="statText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
	</TR>	
</TABLE> -->
			<P><BR/></P>	
				 	</TD>
					<TD VALIGN="top" WIDTH="10" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>				 
				</TR>				
			</TABLE>
			<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
				<TR>
					<TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" WIDTH="60%" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
				</TR>   	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/clear.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
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

