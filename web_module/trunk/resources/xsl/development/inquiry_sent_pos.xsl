<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="../top.xsl" />
	<xsl:import href="../script.xsl" />
	<xsl:import href="../includes/body_top.xsl" />  
	<xsl:import href="../foot.xsl" />
	<xsl:import href="../includes/modules/stats_intro.xsl" />  
	<xsl:import href="../includes/global_left.xsl"/> 
	<xsl:import href="../includes/dev/public_dev_right.xsl"/> 
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
			<xsl:variable name='design' select='/TC/DEVELOPMENT/design'/>
			<xsl:variable name='Project' select='/TC/DEVELOPMENT/Project'/>

              <INPUT TYPE="hidden" NAME="handle">
                <xsl:attribute name="VALUE"><xsl:value-of select="/TC/DEVELOPMENT/handle"/></xsl:attribute>
              </INPUT>
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
						<!--<p><strong>Your inquiry has been sent. Thank You!</strong></p>-->
        
    						Thank you <xsl:value-of select="/TC/DEVELOPMENT/handle"/>, for your interest in the <xsl:value-of select="/TC/DEVELOPMENT/Project"/> component.  You now have access to the
    						<a class="statText">
    						    <xsl:attribute name="href">
    						        <xsl:value-of select="concat('http://www.topcodersoftware.com/pages/c_forum.jsp?f=',$FORUMID)"/>
                                </xsl:attribute>
                                Specification Forum
    						</a>.  

       						<xsl:choose>
    						    <!-- xsl:when test="$design=1" -->
    						    <xsl:when test="contains($Project, 'Design')">
    						        which can be used to obtain design documentation and ask any questions you may have regarding the component design.  Please post your questions at any time and a product manager will respond within 24 hours.  However, any questions asked within 6 hours of the submission due date/time may not be answered, so get your questions in early!
    						        <p>The deadline for submitting a design is <xsl:value-of select="/TC/DEVELOPMENT/date"/> at 11:59 PM EST.  Please submit your design to <a href="mailto:submissions@topcodersoftware.com" class="statText">submissions@topcodersoftware.com</a>  Your submission should consist of a jar file populated with the required documents in /docs and appropriate test cases in /src/java/tests.  Any late submissions will be ignored.  Also, a reminder that this is a competition, and only the winning designer will receive payment.</p>
    						    </xsl:when>
    						    <xsl:otherwise>
    						        which can be used to obtain the component design and designer test cases (See "Development Phase Documents" thread), as well as to ask any questions you may have regarding the development process or the design itself.  Design questions will be answered by the winning designer.  Please post your questions at any time and a product manager will respond within 24 hours.  However, any questions asked within 6 hours of the submission due date/time may not be answered, so get your questions in early!
    						        <p>The deadline for submitting a solution is <xsl:value-of select="/TC/DEVELOPMENT/date"/> at 11:59 PM EST.  Please submit your solution to <a href="mailto:submissions@topcodersoftware.com" class="statText">submissions@topcodersoftware.com</a>.  Your submission should consist of a jar file populated with the required documents in /docs and appropriate source and test code in /src/java.  Do not modify the test cases that come with the design.  If you have problems getting the tests to run, please post a comment to the forum.  Any late submissions will be ignored.  Also, a reminder that this is a competition, and only the winning developer will receive payment.</p>
    						    </xsl:otherwise>
    						</xsl:choose>

						<p>If you have any problems please contact <a class="statText" href="mailto:service@topcodersoftware.com">service@topcodersoftware.com</a></p>
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
			<xsl:call-template name="public_dev_right" />        
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

