<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>How Ratings are calculated at TopCoder</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY>
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
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
  <xsl:with-param name="image">support</xsl:with-param>
  <xsl:with-param name="title">&#160;Ratings Overview - How its Calculated</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
                <BR/>
                <B>New ratings are calculated as follows:</B>
                <BR/>
                                    <BR/>
                After each competition, each coder who attended the competition is re-rated according to
                the following algorithm.  Keep in mind that only coders who shared the same problem set are rated against one another.  The average rating of everyone in the competition is calculated:
                <BR/>
                                    <BR/>
                                    <IMG ALT="average rating" HEIGHT="58" WIDTH="167" SRC="/i/rating/avg.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                Where NumCoders is the number of coders in the competition and Rating is the 
                rating without the volatility of the coder in the competition before the competition.
                <BR/>
                                    <BR/>
                <B>The competition factor is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="competition factor" HEIGHT="62" WIDTH="356" SRC="/i/rating/cf.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                Where Volatility is the volatility of the coder in the competition before the competition.
                <BR/>
                                    <BR/>
                  <b>Win Probability Estimation Algorithm:</b>
                                    <BR/>
                                    <IMG ALT="win probability" SRC="/i/rating/wp.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
Where Rating1 &amp; Vol1 are the rating and volatility of the coder being compared to, and Rating2 &amp; Vol2 are the rating and volatility of the coder whose win probability is being calculated.  Erf is the "<A href="http://mathworld.wolfram.com/Erf.html" target="_blank">error function</A>".  
                <BR/>
                                    <BR/>
                The probability of the coder getting a higher score than another coder in the 
                competition (WPi for i from 1 to NumCoders) is estimated.  
                The expected rank of the coder is calculated:
                <BR/>
                                    <BR/>
                                    <IMG ALT="expected rank" SRC="/i/rating/er.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                <B>The expected performance of the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="expected performance" HEIGHT="34" WIDTH="170" SRC="/i/rating/ep.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                Where <IMG ALT="inverse standard normal" HEIGHT="11" WIDTH="11" SRC="/i/rating/phi.gif" BORDER="0"/>
                is the inverse of the standard normal function.
                <BR/>
                                    <BR/>
                <B>The actual performance of each coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="expected performance" HEIGHT="34" WIDTH="170" SRC="/i/rating/ap.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                Where ARank is the actual rank of the coder in the competition based on score 
                (1 for first place, NumCoders forlast).  If the coder tied with another coder, 
                the rank is the average of the positions covered by the tied coders.
                <BR/>
                                    <BR/>
                <B>The performed as rating of the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="performed as" HEIGHT="14" WIDTH="286" SRC="/i/rating/pa.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                <B>The weight of the competition for the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="weight of the competition" SRC="/i/rating/wt.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                Where TimesPlayed is the number of times the coder has been rated before.
                <BR/>
                                    <BR/>
                To stabilize the higher rated members, the Weight of members whose rating is 
                between 2000 and 2500 is decreased 10% and the Weight of members whose rating 
                is over 2500 is decreased 20%.
                <BR/>
                                    <BR/>
                <B>A cap is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="cap" HEIGHT="37" WIDTH="186" SRC="/i/rating/cap.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                <B>The new volatility of the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="new volatility" SRC="/i/rating/nv.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                <B>The new rating of the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="new rating" HEIGHT="37" WIDTH="253" SRC="/i/rating/nr.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                If |NewRating - Rating| &#62; Cap the NewRating is adjusted so it is at most Cap different than Rating.
                <BR/>
                                    <BR/>

                <BR/>
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
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
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

