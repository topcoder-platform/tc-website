<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="../top.xsl"/>
	<xsl:import href="../script.xsl"/>
	<xsl:import href="../includes/body_top.xsl"/>  
	<xsl:import href="../foot.xsl"/>
	<xsl:import href="../includes/modules/stats_intro.xsl"/>  
	<xsl:import href="../includes/global_left.xsl"/> 
	<xsl:import href="../includes/dev/public_dev_right.xsl"/>     
	<xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
	<xsl:template match="/">

<html>

<head>

	<xsl:call-template name="Preload"/>      

<title>TopCoder :: Development</title>

	<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

	<style type="text/css">
	
ol {
	margin-left: 10px;
	padding-left: 10px;
	}
	
ul {
	margin-left: 10px;
	padding-left: 10px;
	}
	
li {
	margin-left: 0px;
	padding-top: 2px;
	padding-bottom: 2px;
	}
	
.topPage {
	text-align: right;
	}
	
	</style>

</head>

<BODY BGCOLOR="#CCCCCC" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

<!-- Header Begins -->
	<xsl:call-template name="Top"/>
<!-- Header Begins -->

<table width="100%" height="69%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
	<tr>
<!-- Left Column Begins -->
		<td width="170" bgcolor="#CCCCCC" valign="top">
			<xsl:call-template name="global_left"/>
		</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
			<td width="4" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="4" height="8" alt="" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
			<td class="bodyText" width="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="240" height="1" vspace="5" alt="" border="0"/><br/>
				<xsl:call-template name="BodyTop">
					<xsl:with-param name="image1">steelblue</xsl:with-param>
					<xsl:with-param name="image">development</xsl:with-param>
					<xsl:with-param name="title">&#160;Component Development</xsl:with-param>
				</xsl:call-template>
				
				<table border="0" cellspacing="0" cellpadding="0" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%">
					<tr>
						<td bgcolor="#000033" background="/i/steel_darkblue_bg.gif" valign="top" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
						<td class="statText" colspan="2" valign="top" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>
							
							<h1 class="devSubhead"><strong>Documentation and Sample Submissions</strong></h1>
                                    
							<p><strong>Component Design Deliverables</strong><br />
							<a href="/i/development/downloads/tcs_design_deliverables.doc" class="statText">Design Deliverables</a> provides an overview of the 
							design process including the required deliverables for submission and the responsibilities of the winning designer. Submissions which 
							do not meet the screening requirements will not be reviewed by the Architecture Review Board.</p>

							<p><strong>Component Development Deliverables</strong><br />
							<a href="/i/development/downloads/tcs_dev_deliverables.doc" class="statText">Development Deliverables</a> provides an overview 
							of the design process including the required deliverables for submission.  Submissions which do not meet the screening requirements 
							will not be reviewed by the Development Review Board.</p>
							
							<p><strong>Component Specification</strong><br />
							This <a href="/i/development/downloads/component_specification.dot" class="statText">template</a> was created in Microsoft Word 
							2000. The purpose of the specification is to provide additional details about the design, including implementation details which may not be 
							covered in the UML diagrams.  This template should be filled out and submitted with each design submission.</p>

							<p>For more information about deliverables see the <a href="/?&amp;t=development&amp;c=comp_meth" class="statText">TopCoder Component Methodology.</a></p>
					</td>

					<td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>
			</table>

			<table border="0" cellspacing="0" cellpadding="10" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%">
				<tr valign="top">
					<td width="100%" background="/i/steel_darkblue_bg.gif"><a name="collaboration"></a>
						<table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#333333">
							<tr valign="top">
								<td class="statText" width="100%">
									<p><strong>Sample Design Submission</strong><br />
									This is the <a href="/i/development/downloads/submission-sample.jar" class="statText">winning design submission</a> from <a href="/stat?c=member_profile&amp;cr=296145" class="coderTextYellow">srowen</a> for the Timer component. It should only be used as a guide for creating a design submission. Contents of this submission include:
									<ul>
										<li>Component Specification</li>
										<li>Test Cases</li>
										<li>UML project created with Poseidon UML Community Edition version 1.5 from <a class="statText" href="http://www.gentleware.com" target="_new">Gentleware</a></li>
									</ul></p></td>
							</tr>
						</table></td>
				</tr>
			</table>

			<table border="0" cellspacing="0" cellpadding="0" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%">
				<tr><td colspan="4" valign="top" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0" /></td></tr>     

				<tr>
					<td valign="top" background="" bgcolor="#CCCCCC" width="11" align="right"><img src="/i/clear.gif" alt="" width="11" height="8" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" valign="top" bgcolor="#000033" width="14"><img src="/i/table_mid_left2x.gif" alt="" width="14" height="8" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" valign="top" bgcolor="#000033" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
					<td valign="top" background="" bgcolor="#CCCCCC" width="10"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
				</tr>  

				<tr>
					<td valign="top" background="" width="11" align="right" bgcolor="#CCCCCC"><img src="/i/clear.gif" alt="" width="11" height="8" border="0" /></td>
					<td valign="top" background="" bgcolor="#CCCCCC" width="14"><img src="/i/table_btm_left2.gif" alt="" width="14" height="8" border="0" /></td>
					<td valign="top" background="" bgcolor="#CCCCCC" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
					<td valign="top" background="" bgcolor="#CCCCCC" width="10"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
				</tr>
			</table>
		</td>
<!-- Center Column Ends -->

<!-- Gutter begins -->
		<td width="1" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="1" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
		<td width="244" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="170" height="1" alt="" border="0" /><br/>
			<xsl:call-template name="public_dev_right" />        
		</td>
<!-- Right Column Ends -->

	</tr>
</table>

<!-- Footer begins -->
	<xsl:call-template name="Foot" />
<!-- Footer ends -->

</BODY>
</html>
	</xsl:template>
</xsl:stylesheet>
