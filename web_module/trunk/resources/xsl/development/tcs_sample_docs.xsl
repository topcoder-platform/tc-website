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

<title>TopCoder | Development</title>

	<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<BODY>

<!-- Header Begins -->
	<xsl:call-template name="Top"/>
<!-- Header Begins -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
<!-- Left Column Begins -->
		<td width="170" bgcolor="#CCCCCC" valign="top">
			<xsl:call-template name="global_left"/>
		</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
			<td width="6" valign="top"><img src="/i/clear.gif" width="6" height="8" alt="" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
			<td class="bodyText" width="100%" valign="top"><img src="/i/clear.gif" width="240" height="1" vspace="5" alt="" border="0"/><br/>
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
                                    
	
							<table border="0" cellspacing="0" cellpadding="0" bgcolor="#001B35" width="100%">
							
                				<tr><td height="5" colspan="3"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

                				<tr valign="middle">
                    				<td background="/i/steel_gray_bg.gif" class="registerNav" height="18" colspan="3">&#160;&#160;Documentation</td>
                				</tr>

                				<tr valign="middle">
                    				<td background="/i/steel_bluebv_bg.gif" class="statText" width="25%" height="18">&#160;&#160;Item</td>
                    				<td background="/i/steel_bluebv_bg.gif" class="statText" width="50%" height="18">&#160;Description&#160;</td>
                    				<td background="/i/steel_bluebv_bg.gif" class="statText" width="25%" height="18">Download&#160;</td>
                				</tr>
                				
                				<tr><td height="3" colspan="3"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                				<tr valign="middle">
                    				<td class="statText" height="15" valign="top"><strong>Component Design Deliverables</strong></td>
                    				<td class="statText" height="15" valign="top">Java and .NET Design Deliverables provide an overview of the design process 
                    				including the required deliverables for submission and the responsibilities of the winning designer. 
                    				Submissions which do not meet the screening requirements will not be reviewed by the Architecture Review Board.</td>
                    				<td class="statText" height="15" valign="top">
                    				<a target="tcsdocs" href="/i/development/downloads/Designer_Component_Deliverables.pdf" class="statText">Java Design Deliverables.pdf</a><br />
									<a target="tcsdocs" href="/i/development/downloads/.NET_Designer_Component_Deliverables.pdf" class="statText">.NET Design Deliverables.pdf</a>
                    				</td>
                				</tr>
                				
                				<tr>
                					<td height="3" colspan="3"><img src="/i/clear.gif" alt="" height="3" border="0" /></td>
                				</tr>
                				
                				<tr>
                					<td height="1" colspan="3" background="/i/steel_gray_bg.gif"><img src="/i/clear.gif" alt="" height="1" border="0" /></td>
                				</tr>
                				
                				
                				<tr><td height="3" colspan="3"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                				<tr valign="middle">
                    				<td class="statText" height="15" valign="top"><strong>Component Development Deliverables</strong></td>
                    				<td class="statText" height="15" valign="top">Development Deliverables provides an overview of the design process including the 
                    				required deliverables for submission. Submissions which do not meet the screening requirements will not be reviewed by the 
                    				Development Review Board.</td>
                    				<td class="statText" height="15" valign="top">
                    				<a target="tcsdocs" href="/i/development/downloads/Developer_Component_Deliverables.pdf" class="statText">Development Deliverables.pdf</a>
                    				</td>
                				</tr>
                				
                				
                				
                				<tr><td height="3" colspan="3"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>
                				
                				<tr>
                					<td height="1" colspan="3" background="/i/steel_gray_bg.gif"><img src="/i/clear.gif" alt="" height="1" border="0" /></td>
                				</tr>
                				
                				
                				<tr><td height="3" colspan="3"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                				<tr valign="middle">
                    				<td class="statText" height="15" valign="top"><strong>Component Specification</strong></td>
                    				<td class="statText" height="15" valign="top">The purpose of the specification is to provide additional details 
                    				about the design, including implementation details which may not be covered in the UML diagrams. This template 
                    				should be filled out and submitted with each design submission.<br />
									If you do not have Microsoft Word 2000, please submit a Component Specification in rtf or txt format. Please 
									use the PDF version as a reference.
									</td>
                    				<td class="statText" height="15" valign="top">
                    				<a target="tcsdocs" href="/i/development/downloads/Component_Specification.dot" class="statText">Component Specification.dot</a><br />
                    				<a target="tcsdocs" href="/i/development/downloads/Component_Specification.pdf" class="statText">Component Specification.pdf</a>
                    				</td>
                				</tr>
                				
                				<tr><td height="3" colspan="3"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>
                				
                				<tr>
                					<td height="1" colspan="3" background="/i/steel_gray_bg.gif"><img src="/i/clear.gif" alt="" height="1" border="0" /></td>
                				</tr>
                				
                				<tr><td height="3" colspan="3"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                				<tr valign="middle">
                    				<td class="statText" height="15" valign="top"><strong>Deployment Guide</strong></td>
                    				<td class="statText" height="15" valign="top">The purpose of the deployment guide is to provide additional details 
                    				about the solution, including configuration details which may not be not be evident to the end-user. This template 
                    				should be filled out and submitted with each development submission.<br />
									If you do not have Microsoft Word 2000, please submit a Deployment Guide in rtf or txt format. Please use the PDF 
									version as a reference.
									</td>
                    				<td class="statText" height="15" valign="top">
                    				<a target="tcsdocs" href="/i/development/downloads/Deployment_Guide.dot" class="statText">Deployment Guide.dot</a><br />
                    				<a target="tcsdocs" href="/i/development/downloads/Deployment_Guide.pdf" class="statText">Deployment Guide.pdf</a>
                    				</td>
                				</tr>
                				
                				<tr><td height="3" colspan="3"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>
                				
                				<tr>
                					<td height="1" colspan="3" background="/i/steel_gray_bg.gif"><img src="/i/clear.gif" alt="" height="1" border="0" /></td>
                				</tr>
                				
                				
                				<tr><td height="3" colspan="3"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                				<tr valign="middle">
                    				<td class="statText" height="15" valign="top"><strong>Design Screening Scorecard</strong></td>
                    				<td class="statText" height="15" valign="top">
                    				Description?
									</td>
                    				<td class="statText" height="15" valign="top">
                    				<a target="tcsdocs" href="/i/development/downloads/TopCoder_Software_Design_Screening_Scorecard.pdf" class="statText">Design Screening Scorecard.pdf</a>
                    				</td>
                				</tr>
                				
                				<tr><td height="3" colspan="3"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>
                				
                				<tr>
                					<td height="1" colspan="3" background="/i/steel_gray_bg.gif"><img src="/i/clear.gif" alt="" height="1" border="0" /></td>
                				</tr>
                				
                				
                				<tr><td height="3" colspan="3"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                				<tr valign="middle">
                    				<td class="statText" height="15" valign="top"><strong>Design Review Scorecard</strong></td>
                    				<td class="statText" height="15" valign="top">
                    				Description?
									</td>
                    				<td class="statText" height="15" valign="top">
                    				<a target="tcsdocs" href="/i/development/downloads/TopCoder_Software_Design_Review_Scorecard.pdf" class="statText">Design Review Scorecard.pdf</a>
                    				</td>
                				</tr>
                				
                				<tr><td height="3" colspan="3"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>
                				
                				<tr>
                					<td height="1" colspan="3" background="/i/steel_gray_bg.gif"><img src="/i/clear.gif" alt="" height="1" border="0" /></td>
                				</tr>
                				
                				
                				<tr><td height="3" colspan="3"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                				<tr valign="middle">
                    				<td class="statText" height="15" valign="top"><strong>Development Screening Scorecard</strong></td>
                    				<td class="statText" height="15" valign="top">
                    				Description?
									</td>
                    				<td class="statText" height="15" valign="top">
                    				<a target="tcsdocs" href="/i/development/downloads/TopCoder_Software_Development_Screening_Scorecard.pdf" class="statText">Development Screening Scorecard.pdf</a>
                    				</td>
                				</tr>
                				
                				<tr><td height="3" colspan="3"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>
                				
                				<tr>
                					<td height="1" colspan="3" background="/i/steel_gray_bg.gif"><img src="/i/clear.gif" alt="" height="1" border="0" /></td>
                				</tr>
                				
                				
                				<tr><td height="3" colspan="3"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>

                				<tr valign="middle">
                    				<td class="statText" height="15" valign="top"><strong>Development Review Scorecard</strong></td>
                    				<td class="statText" height="15" valign="top">
                    				Description?
									</td>
                    				<td class="statText" height="15" valign="top">
                    				<a target="tcsdocs" href="/i/development/downloads/TopCoder_Software_Development_Review_Scorecard.pdf" class="statText">Development Review Scorecard.pdf</a>
                    				</td>
                				</tr>
                				
                				<tr><td height="3" colspan="3"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>
                				
                				<tr>
                					<td height="1" colspan="3" background="/i/steel_gray_bg.gif"><img src="/i/clear.gif" alt="" height="1" border="0" /></td>
                				</tr>
                				
                			</table>
							
							

							<p>For more information about deliverables see the <a href="/?&amp;t=development&amp;c=comp_meth" class="statText">TopCoder Component Methodology.</a></p><br />
					</td>

					<td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="10" border="0" /></td>
				</tr>
			</table>

			<table border="0" cellspacing="0" cellpadding="10" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%">
				<tr valign="top">
					<td width="100%" background="/i/steel_darkblue_bg.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#333333">
							<tr valign="top">
								<td class="statText" width="100%">
									<p><strong>Sample Design Submission</strong><br />
									This is the <a href="/i/development/downloads/submission-sample.jar" class="statText">winning design submission</a> from <a href="/stat?c=member_profile&amp;cr=279551" class="coderTextBlue">scamp</a> for the <a href="http://www.topcodersoftware.com/pages/c_component.jsp?comp=3501906&amp;cat=1" class="statText">String Class</a> component. It should only be used as a guide for creating a design submission. Contents of this submission include:
									<ul>
										<li>Component Specification</li>
										<li>Test Cases</li>
										<li>UML project created with Poseidon UML Community Edition version 1.5 from <a class="statText" href="http://www.gentleware.com" target="_new">Gentleware</a></li>
									</ul></p></td>
							</tr>
						</table></td>
				</tr>
			</table>
			
			<table border="0" cellspacing="0" cellpadding="10" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%">
				<tr valign="top">
					<td width="100%" background="/i/steel_darkblue_bg.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#333333">
							<tr valign="top">
								<td class="statText" width="100%">
									<p><strong>Sample Development Submission</strong><br />
									This is the <a href="/i/development/downloads/devsubmission-sample.jar" class="statText">winning development submission</a> from <a href="/stat?c=member_profile&amp;cr=281876" class="coderTextGreen">garyk</a> for the Object Formatter component. It should only be used as a guide for creating a development submission. Contents of this submission include:
									<ul>
										<li>Compilable Source Code</li>
										<li>Unit Test Cases: Developer's should submit unit test cases called from the UnitTests.java and placed in the base package test directory.</li>
										<li>Deployment Guide</li>
									</ul></p></td>
							</tr>
						</table></td>
				</tr>
			</table>

			<table border="0" cellspacing="0" cellpadding="0" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%">
				<tr><td colspan="4" valign="top" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0" /></td></tr>     

				<tr>
					<td valign="top" background="" bgcolor="#FFFFFF" width="11" align="right"><img src="/i/clear.gif" alt="" width="11" height="8" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" valign="top" bgcolor="#000033" width="14"><img src="/i/table_mid_left2x.gif" alt="" width="14" height="8" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" valign="top" bgcolor="#000033" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
					<td valign="top" background="" bgcolor="#FFFFFF" width="10"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
				</tr>  

				<tr>
					<td valign="top" background="" width="11" align="right" bgcolor="#FFFFFF"><img src="/i/clear.gif" alt="" width="11" height="8" border="0" /></td>
					<td valign="top" background="" bgcolor="#FFFFFF" width="14"><img src="/i/table_btm_left2.gif" alt="" width="14" height="8" border="0" /></td>
					<td valign="top" background="" bgcolor="#FFFFFF" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
					<td valign="top" background="" bgcolor="#FFFFFF" width="10"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
				</tr>
			</table>
		</td>
<!-- Center Column Ends -->

<!-- Gutter begins -->
		<td width="6"><img src="/i/clear.gif" width="6" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
		<td width="244" valign="top">
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
