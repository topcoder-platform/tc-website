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
        <TITLE>TopCoder :: Features</TITLE>
        <xsl:call-template name="CSS"/>      
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
		<TD WIDTH="4"   VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" VALIGN="top">
<DIV ALIGN="center">
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" WIDTH="534">
	<TR>
		<TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">

			<DIV ALIGN="center">
			<IMG SRC="/i/f/feature_title.gif" ALT="Interested in getting published on TopCoder?" WIDTH="530" HEIGHT="50" BORDER="0" />
			<IMG SRC="/i/f/pen_paper.jpg" ALT="Feature Article" WIDTH="300" HEIGHT="222" BORDER="0" /><br/>
			</DIV>

			<P CLASS="bodyTitle">Article Requirements:</P>

			<P>Feature articles should range between 1000-2000 words. The article must contain original content written by the submitter of the article.  A member photo is also required to accompany the feature. If you have not already submitted a photo, please login and follow the instructions on your member home page.</P>

			<P>The more relevant an article submission is to TopCoder members, software development, or software/algorithm education - the likelier it is that the article will be accepted for publication.</P>

			<P CLASS="bodyTitle">Submit your Feature Article:</P>

			<P>If you've created a feature article that you would like published on <A HREF="http://www.topcoder.com/">www.topcoder.com</A>, send your file (.doc, .txt, or .html) to <A HREF="mailto:editorial@topcoder.com?subject=Feature Article Submission?" CLASS="bodyGeneric">editorial@topcoder.com</A></P>

			<P CLASS="bodyTitle">Eligibility Criteria</P>

			<P>To write a feature for TopCoder, you must be a TopCoder member, at least 18 years of age, and be either (i) a citizen or lawful permanent resident of the U.S. (including the U.S. territories of Guam, Puerto Rico, and the U.S. Virgin Islands); (ii) currently residing in the U.S. with valid employment authorization; or (iii) a non-U.S. citizen writing within your country of residence. </P>

			<P CLASS="bodyTitle">Payment:</P>

			<P>TopCoder will pay &#36;150 for each article that is accepted for publication on TopCoder's web site.  Writers receive payment on a monthly basis after TopCoder approves the article for publication.</P>

			<P><BR/></P>
		</TD>
	</TR>
</TABLE>
</DIV>
		</TD>
	<!-- Center Column Ends -->
<!-- Body Area Ends -->

	<!-- Gutter -->
		<TD WIDTH="4"  ><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	<!-- Right Column Begins -->
		<TD WIDTH="170"   VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->       
        </TD>
	<!-- Right Column Ends -->
	<!-- Gutter -->
		<TD WIDTH="10"  ><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	</TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

