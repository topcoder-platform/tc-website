<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="../top.xsl" />
	<xsl:import href="../script.xsl" />
	<xsl:import href="../includes/body_top.xsl" />  
	<xsl:import href="../foot.xsl" />
	<xsl:import href="../includes/modules/stats_intro.xsl" />  
	<xsl:import href="../includes/global_left.xsl"/> 
	<xsl:import href="../includes/public_right_col.xsl" />     
	<xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN" />
	<xsl:template match="/">

<html>
<head>

	<xsl:call-template name="Preload" />      

<title>TopCoder :: Development</title>

	<xsl:call-template name="CSS" />      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<BODY BGCOLOR="#CCCCCC" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

	<xsl:call-template name="Top" />

<table width="100%" xborder="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
	<tr>
<!-- Left Column Begins -->
		<td width="170" bgcolor="#CCCCCC" valign="top">
			<xsl:call-template name="global_left"/>
		</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
		<td width="4" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="4" height="8" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
		<td class="bodyText" width="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="240" height="1" vspace="5" alt="" border="0" /><br />
			<xsl:call-template name="BodyTop">
				<xsl:with-param name="image1">steelblue</xsl:with-param>
				<xsl:with-param name="image">development</xsl:with-param>
				<xsl:with-param name="title">&#160;Overview</xsl:with-param>
			</xsl:call-template>
			<xsl:variable name='FORUMID' select='/TC/DEVELOPMENT/forumId'/>
              <INPUT TYPE="hidden" NAME="date">
                <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/date"/></xsl:attribute>
              </INPUT>
              <INPUT TYPE="hidden" NAME="Project">
                <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/Project"/></xsl:attribute>
              </INPUT>
              <INPUT TYPE="hidden" NAME="forum">
                <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/forumId"/></xsl:attribute>
              </INPUT>

			<table border="0" cellspacing="0" cellpadding="0" background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%">
				<tr valign="top">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="1" height="30" border="0" /></td>
					<td class="statText" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%">
						<img src="/i/clear.gif" alt="" width="240" height="1" border="0" /><br />
						<p><strong>Your inquiry has been sent. Thank You!</strong></p>
						<p>Thanks for your interest in the <xsl:value-of select="/TC/DEVELOPMENT/Project"/> component.  You now have access to the Specification Forum (
    						<a>
    						    <xsl:attribute name="href">
    						        <xsl:value-of select="concat('http://www.topcodersoftware.com/pages/c_forum.jsp?f=',$FORUMID)"/>
                                </xsl:attribute>
    						</a>) 
    						which can be used to obtain design documentation and ask any questions you may have regarding the component design.  Please post your questions at any time and I will respond within 24 hours.  However, any questions asked within 6 hours of the submission due date/time may not be answered, so get your questions in early!
						</p>
                        <p>The deadline for submitting a design is <xsl:value-of select="/TC/DEVELOPMENT/date"/> at 11:59 PM EST.  Please submit your design to submissions@topcodersoftware.com  Your submission should consist of a jar file populated with the required documents in /docs and appropriate test cases in /src/java/tests.  Any late submissions will be ignored.  Also, a reminder that this is a competition, and only the winning designer will receive payment.</p>
						
						<p><br /></p>
					</td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="1" height="30" border="0" /></td>
				</tr>
			</table>
		</td>
<!-- Center Column Ends -->

<!-- Gutter begins -->
		<td width="4" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="4" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
		<td width="170" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="170" height="1" alt="" border="0" /><br />
			<xsl:call-template name="public_right_col" />        
		</td>
<!-- Right Column Ends -->

<!-- Gutter begins -->
		<td width="25" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="25" height="1" border="0" /></td>
<!-- Gutter Ends -->
	</tr>
</table>

<!-- Footer begins -->
        <xsl:call-template name="Foot" />
<!-- Footer ends -->

</BODY>
</html>
	</xsl:template>
</xsl:stylesheet>

