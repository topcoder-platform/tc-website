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
  <xsl:with-param name="title">&#160;Quick Stats</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="14" BORDER="0"/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">		
	<TR>
		<TD CLASS="bodyText" VALIGN="top" WIDTH="50%"><A HREF="/stat?&amp;c=winning_debuts" CLASS="statText"><IMG SRC="/i/stat_labels_win_debuts.gif" ALT="Winning Debuts" WIDTH="158" HEIGHT="17" BORDER="0"/></A></TD>
		<TD ROWSPAN="12" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>		
		<TD CLASS="bodyText" VALIGN="top" WIDTH="50%"><A HREF="/stat?&amp;c=highest_accuracy" CLASS="statText"><IMG SRC="/i/stat_labels_sub.gif" ALT="Submission Accuracy" WIDTH="158" HEIGHT="17" BORDER="0"/></A></TD>
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="top" WIDTH="50%">This chart represents those members who won their room in their initial Single Round Match... // <A HREF="/stat?&amp;c=winning_debuts" CLASS="statText">more</A></TD>
		<TD CLASS="statText" VALIGN="top" WIDTH="50%">Submission Accuracy is measured by dividing the  number of correct submissions by the number of total submissions by a member...// <A HREF="/stat?&amp;c=highest_accuracy" CLASS="statText">more</A></TD>
	</TR>
	<TR>
		<TD COLSPAN="2" CLASS="statText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
	</TR>		
	<TR>
		<TD CLASS="bodyText" VALIGN="top"><A HREF="/stat?&amp;c=all_time_wins" CLASS="statText"><IMG SRC="/i/stat_labels_all_wins.gif" ALT="All-Time Wins" WIDTH="158" HEIGHT="17" BORDER="0"/></A></TD>
		<TD CLASS="bodyText" VALIGN="top"><A HREF="/stat?&amp;c=impressive_debuts" CLASS="statText"><IMG SRC="/i/stat_labels_imp_debuts.gif" ALT="Impressive Debuts" WIDTH="158" HEIGHT="17" BORDER="0"/></A></TD>
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="top">This chart ranks the Top-10 in Single Round Match Room Wins.<BR/>
		<A HREF="/stat?&amp;c=all_time_wins" CLASS="statText">Overall</A> : 
		<A HREF="/stat?&amp;c=all_time_wins_by_div&amp;dn=1" CLASS="statText">Division I</A> : 
		<A HREF="/stat?&amp;c=all_time_wins_by_div&amp;dn=2" CLASS="statText">Division II</A><BR/>
		</TD>
		<TD CLASS="statText" VALIGN="top">This chart represents the members who have made the most impressive debuts in a Single Round Match... // <A HREF="/stat?&amp;c=impressive_debuts" CLASS="statText">more</A></TD>
	</TR>
	<TR>
		<TD COLSPAN="2" CLASS="statText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
	</TR>	
	<TR>
		<TD CLASS="bodyText" VALIGN="top"><A HREF="/stat?&amp;c=highest_totals&amp;dn=1" CLASS="statText"><IMG SRC="/i/stat_labels_total.gif" ALT="Highest Match Total" WIDTH="158" HEIGHT="17" BORDER="0"/></A></TD>
		<TD CLASS="bodyText" VALIGN="top"><A HREF="/stat?&amp;c=most_consecutive_wins&amp;dn=1" CLASS="statText"><IMG SRC="/i/stat_labels_consec_wins.gif" ALT="Consecutive Wins" WIDTH="158" HEIGHT="17" BORDER="0"/></A></TD>
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="top">This chart represents the Top-10 highest point totals earned in a Single Round Match.<BR/>
		<A HREF="/stat?&amp;c=highest_totals&amp;dn=1" CLASS="statText">Division I</A> : 
		<A HREF="/stat?&amp;c=highest_totals&amp;dn=2" CLASS="statText">Division II</A><BR/>
		</TD>
		<TD CLASS="statText" VALIGN="top">This chart represents the longest consecutive room win streaks in Single Round Matches.<BR/>
		<A HREF="/stat?&amp;c=most_consecutive_wins&amp;dn=1" CLASS="statText">Division I</A> : 
		<A HREF="/stat?&amp;c=most_consecutive_wins&amp;dn=2" CLASS="statText">Division II</A><BR/>
		</TD>
	</TR>
	<TR>
		<TD COLSPAN="2" CLASS="statText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
	</TR>	
	<TR>
		<TD CLASS="bodyText" VALIGN="top"><A HREF="/stat?&amp;c=biggest_rating_gains&amp;dn=1" CLASS="statText"><IMG SRC="/i/stat_labels_rating.gif" ALT="Rating Point Gain" WIDTH="158" HEIGHT="17" BORDER="0"/></A></TD>
		<TD CLASS="bodyText" VALIGN="top"><A HREF="/stat?&amp;c=best_challengers" CLASS="statText"><IMG SRC="/i/stat_labels_chall.gif" ALT="Challenge Success" WIDTH="158" HEIGHT="17" BORDER="0"/></A></TD>
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="top">This chart represents the biggest rating point gain in a Single Round Match.<BR/>
		<A HREF="/stat?&amp;c=biggest_rating_gains&amp;dn=1" CLASS="statText">Division I</A> : 
		<A HREF="/stat?&amp;c=biggest_rating_gains&amp;dn=2" CLASS="statText">Division II</A><BR/>
		</TD>
		<TD CLASS="statText" VALIGN="top">Challenge Success is a percentage based on successful challenges divided by total challenges... // <A HREF="/stat?&amp;c=best_challengers" CLASS="statText">more</A></TD>
	</TR>
	<TR>
		<TD COLSPAN="2" CLASS="statText" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
	</TR>	
</TABLE>
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

