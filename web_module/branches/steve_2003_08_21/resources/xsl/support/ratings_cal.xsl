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
                After each competition, each coder who attended the competition is re-rated according
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
                <B>The skill of the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="skill" HEIGHT="34" WIDTH="138" SRC="/i/rating/skill.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                Where Rating is the coder's rating before the competition.
                <BR/>
                                    <BR/>
                <B>The deviation of the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="deviation" HEIGHT="34" WIDTH="141" SRC="/i/rating/dev.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                Where Volatility is the volatility of the coder before the competition.
                <BR/>
                                    <BR/>
                The probability of the coder getting a higher score than another coder in the 
                competition (WPi for i from 1 to NumCoders) is estimated.  See below for the 'Estimation Algorithm'.
                The expected rank of the coder is calculated:
                <BR/>
                                    <BR/>
                                    <IMG ALT="expected rank" HEIGHT="39" WIDTH="118" SRC="/i/rating/er.gif" ALIGN="center" BORDER="0"/><BR/>
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
                                    <IMG ALT="weight of the competition" HEIGHT="37" WIDTH="223" SRC="/i/rating/wt.gif" ALIGN="center" BORDER="0"/><BR/>
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
                                    <IMG ALT="new volatility" HEIGHT="46" WIDTH="421" SRC="/i/rating/nv.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                <B>The new rating of the coder is calculated:</B>
                <BR/>
                                    <BR/>
                                    <IMG ALT="new rating" HEIGHT="37" WIDTH="253" SRC="/i/rating/nr.gif" ALIGN="center" BORDER="0"/><BR/>
                                    <BR/>
                If |NewRating - Rating| &#62; Cap the NewRating is adjusted so it is at most Cap different than Rating.
                <BR/>
                                    <BR/>
                                    <HR/>
                                    <BR/>
                                    <BR/>
                <B>Estimation Algorithm:</B>
                <BR/>
                                    <BR/>
Estimating the probability a coder gets a higher score than another coder is done by looking at either coder's 
expected performance rating on a range of good to bad days.  Each coder's performance is modeled as a
normal distribution with a mean (the rating) and standard deviation (the volatility).  Using this model, a coder's
performance can be turned into a percentage using the normal distribution, so that 50% represents expected
performance and 25% represents better three days out of four, etc.  Then, to estimate the probability that the
coder beats coder i, the range from 0% to 100% is broken into 1% blocks, and the midpoint is taken of each
block and the corresponding performance is computed.  The win probability is the number of blocks where the
midpoint favors coder i.  If it's a tie, the block is split between both coders.   
                <BR/>
                                    <BR/>
Here is the psuedo-code function to estimate the probability of coder A beating coder B
(<SPAN STYLE="font-family:Symbol;">f</SPAN> is the inverse of the
standard normal function):
                <BR/>
                                    <BR/>
WinProbability( SkillA, DeviationA, SkillB, DeviationB)
                <BR/>
         Set count, a, b to 0.
                <BR/>
         Set fa = SkillA + <!-- <SPAN STYLE="font-family:Symbol;">f</SPAN> -->f((a + .5)/100)*DeviationA
                <BR/>
         Set fb = SkillB + <!-- <SPAN STYLE="font-family:Symbol;">f</SPAN> -->f((b + .5)/100)*DeviationB
                <BR/>
         While (a&#60;100)
                <BR/>
 &#160;&#160;        If fa&#60;fb:
                <BR/>
 &#160;&#160;&#160;&#160;         Add 100-b to count
                <BR/>
  &#160;&#160;&#160;&#160;        Increment a
                <BR/>
&#160;&#160;&#160;&#160; Set fa = SkillA + <!-- <SPAN STYLE="font-family:Symbol;">f</SPAN> -->f((a + .5)/100)*DeviationA
                <BR/>
&#160;&#160;         If fa == fb:
                <BR/>
&#160;&#160;&#160;&#160;          Add 100-b-.5 to count
                <BR/>
&#160;&#160;&#160;&#160;          Increment a
                <BR/>
&#160;&#160;&#160;&#160;          Increment b
                <BR/>
&#160;&#160;&#160;&#160;         Set fa = SkillA + <!-- <SPAN STYLE="font-family:Symbol;">f</SPAN> -->f((a + .5)/100)*DeviationA
                <BR/>
&#160;&#160;&#160;&#160;         Set fb = SkillB + <!-- <SPAN STYLE="font-family:Symbol;">f</SPAN> -->f((b + .5)/100)*DeviationB
                <BR/>
&#160;&#160;         If fa&#62;fb:
                <BR/>
&#160;&#160;&#160;&#160;            Increment b
                <BR/>
&#160;&#160;&#160;&#160;            Set fb = SkillB + <!-- <SPAN STYLE="font-family:Symbol;">f</SPAN> -->f((b + .5)/100)*DeviationB
                <BR/>
            Return count  (count is the win probability)
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

