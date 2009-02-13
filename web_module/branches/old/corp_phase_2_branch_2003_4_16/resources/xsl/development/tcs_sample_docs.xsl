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
			<td class="bodyText" width="100%" valign="top"><img src="/i/clear.gif" width="240" height="1" vspace="5" alt="" border="0"/><br />
				<xsl:call-template name="BodyTop">
					<xsl:with-param name="image1">steelblue</xsl:with-param>
					<xsl:with-param name="image">development</xsl:with-param>
					<xsl:with-param name="title">&#160;Component Development</xsl:with-param>
				</xsl:call-template>
				
				<table border="0" cellspacing="0" cellpadding="0" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%">
					<tr>
						<td bgcolor="#000033" background="/i/steel_darkblue_bg.gif" valign="top" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
						<td class="statText" colspan="2" valign="top" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br />
							
							<h1 class="devSubhead"><strong>Documentation and Sample Submissions</strong></h1>
                                    
	
							<table border="0" cellspacing="0" cellpadding="2" bgcolor="#001B35" width="100%">
							
                				<tr valign="middle">
                    				<td bgcolor="#666666" class="registerNav" height="18" colspan="3">&#160;Component Documentation</td>
                				</tr>
                				
                				<tr valign="middle">
                    				<td background="/i/steel_bluebv_bg.gif" class="statText" width="45%" height="18">&#160;Description&#160;</td>
                    				<td background="/i/steel_bluebv_bg.gif" class="statText" width="5%" height="18"><img src="/i/clear.gif" alt="" height="1" width="5" border="0" /></td>
                    				<td background="/i/steel_bluebv_bg.gif" class="statText" width="50%" height="18">Modified&#160;&#160;&#160;&#160;&#160; Download File&#160;</td>
                				</tr>
                			
                			    <tr>
                					<td colspan="3">
                					<hr width="100%" size="1px" color="666666" /></td>
                				</tr>
                				
                				<tr valign="middle">
                    				<td class="statText" valign="top"><strong>TopCoder Software Development Environment</strong><br />
                    				The TopCoder Software Development Environment is intended to facilitate the component design and 
                    				and development process.  Anyone interested in working on component design or development 
                    				should download this file and configure their environment before getting started.</td>
                    				<td><img src="/i/clear.gif" alt="" height="1" width="1" border="0" /></td>
                    				<td class="statText" valign="top">
                    				<br />
                    				03.20.2003 &#160;<a target="tcsdocs" href="/i/development/downloads/topcoder_env.jar" class="statText">topcoder_env.jar</a>
                    				</td>
                				</tr>	

                			    <tr>
                					<td colspan="3">
                					<hr width="100%" size="1px" color="666666" /></td>
                				</tr>

                				<tr valign="middle">
                    				<td class="statText" valign="top"><strong>Design Deliverables</strong><br />
                    				Java and .NET Design Deliverables provide an overview of the design process 
                    				including the required deliverables for submission and the responsibilities of the winning designer. 
                    				Submissions which do not meet the screening requirements will not be reviewed by the Architecture Review Board.</td>
                    				<td><img src="/i/clear.gif" alt="" height="1" width="1" border="0" /></td>
                    				<td class="statText" valign="top">
                    				<br />
                    				04.10.2003 &#160;<a target="tcsdocs" href="/i/development/downloads/Designer_Component_Deliverables.pdf" class="statText">Java Design Deliverables.pdf</a><br />
									04.10.2003 &#160;<a target="tcsdocs" href="/i/development/downloads/.NET_Designer_Component_Deliverables.pdf" class="statText">.NET Design Deliverables.pdf</a>
                    				</td>
                    				
                				</tr>
                				
                				<tr>
                					<td colspan="3">
                					<hr width="100%" size="1px" color="666666" /></td>
                				</tr>
                				
                				<tr valign="middle">
                    				<td class="statText" valign="top"><strong>Development Deliverables</strong><br />
                    				Development Deliverables provides an overview of the design process including the 
                    				required deliverables for submission. Submissions which do not meet the screening requirements will not be reviewed by the 
                    				Development Review Board.</td>
                    				<td><img src="/i/clear.gif" alt="" height="1" width="1" border="0" /></td>
                    				<td class="statText" valign="top">
                    				<br />
                    				04.14.2003 &#160;<a target="tcsdocs" href="/i/development/downloads/Developer_Component_Deliverables.pdf" class="statText">Java Development Deliverables.pdf</a>
                    				<br />
                    				04.14.2003 &#160;<a target="tcsdocs" href="/i/development/downloads/DOTNET_Developer_Component_Deliverables.pdf" class="statText">.NET Development Deliverables.pdf</a>
                    				</td>
                				</tr>
                				
                				<tr>
                					<td colspan="3">
                					<hr width="100%" size="1px" color="666666" /></td>
                				</tr>
                				
                				<tr valign="middle">
                    				<td class="statText" valign="top"><strong>Specification</strong><br />
                    				The purpose of the specification is to provide additional details 
                    				about the design, including implementation details which may not be covered in the UML diagrams. This template 
                    				should be filled out and submitted with each design submission.<br /><br />
									If you do not have Microsoft Word 2000, please submit a Component Specification in rtf or txt format. Please 
									use the PDF version as a reference.
									</td>
									<td><img src="/i/clear.gif" alt="" height="1" width="1" border="0" /></td>
                    				<td class="statText" valign="top">
                    				<br />
                    				04.14.2003 &#160;<a target="tcsdocs" href="/i/development/downloads/Component_Specification.dot" class="statText">Component Specification.dot</a><br />
                    				04.14.2003 &#160;<a target="tcsdocs" href="/i/development/downloads/Component_Specification.pdf" class="statText">Component Specification.pdf</a>
                    				</td>
                				</tr>
                				
                				<tr>
                					<td colspan="3">
                					<hr width="100%" size="1px" color="666666" /></td>
                				</tr>
                				
                				<tr valign="middle">
                    				<td class="statText" height="15" valign="top"><strong>Screening and Review Scorecards</strong><br />
                    				The screening and review scorecards are used by the Architecture and Development Review Boards to score component 
                    				submissions. All members who submit a design or development solution will receive the populated scorecards from the 
                    				review boards. 
									</td>
									<td><img src="/i/clear.gif" alt="" height="1" width="1" border="0" /></td>
                    				<td class="statText" height="15" valign="top">
                    				<br />
                    				04.10.2003 &#160;<a target="tcsdocs" href="/i/development/downloads/TopCoder_Software_Design_Screening_Scorecard.pdf" class="statText">Design Screening Scorecard.pdf</a><br />
                    				04.10.2003 &#160;<a target="tcsdocs" href="/i/development/downloads/TopCoder_Software_Design_Review_Scorecard.pdf" class="statText">Design Review Scorecard.pdf</a><br />
                    				04.14.2003 &#160;<a target="tcsdocs" href="/i/development/downloads/TopCoder_Software_Development_Screening_Scorecard.pdf" class="statText">Development Screening Scorecard.pdf</a><br />
									04.14.2003 &#160;<a target="tcsdocs" href="/i/development/downloads/TopCoder_Software_Development_Review_Scorecard.pdf" class="statText">Development Review Scorecard.pdf</a>
                    				</td>
                				</tr>
                				
                				<tr>
                					<td colspan="3">
                					<hr width="100%" size="1px" color="666666" /></td>
                				</tr>
                				
                			</table>
                			<br />
                			<br />
                			<table border="0" cellspacing="0" cellpadding="2" bgcolor="#001B35" width="100%">
							
                				<tr valign="middle">
                    				<td bgcolor="#666666" class="registerNav" height="18" colspan="3">&#160;Application Documentation</td>
                				</tr>
                				
                				<tr valign="middle">
                    				<td background="/i/steel_bluebv_bg.gif" class="statText" width="45%" height="18">&#160;Description&#160;</td>
                    				<td background="/i/steel_bluebv_bg.gif" class="statText" width="5%" height="18"><img src="/i/clear.gif" alt="" height="1" width="5" border="0" /></td>
                    				<td background="/i/steel_bluebv_bg.gif" class="statText" width="50%" height="18">Modified&#160;&#160;&#160;&#160;&#160; Download File&#160;</td>
                				</tr>
                				
                				<tr>
                					<td colspan="3"><img src="/i/clear.gif" alt="" height="5" border="0" /></td>
                				</tr>

                				<tr valign="middle">
                    				<td class="statText" valign="top"><strong>Design Deliverables</strong><br />
                    				This document provides an overview of the design process including the deliverables required of a complete 
                    				submission and the responsibilities	of a winning designer.	Submissions which do not meet the criteria set 
                    				forth in this document will not pass screening and therefore will not be reviewed by the Application Design 
                    				Review Board</td>
                    				<td><img src="/i/clear.gif" alt="" height="1" width="1" border="0" /></td>
                    				<td class="statText" valign="top">
                    				<br />
                    				03.03.2003 &#160;<a target="tcsdocs" href="/i/development/downloads/Application_Design_Deliverables.pdf" class="statText">Application Design Deliverables.pdf</a><br />
                    				</td>
                    				
                				</tr>
                			
                				<tr>
                					<td colspan="3">
                					<hr width="100%" size="1px" color="666666" /></td>
                				</tr>
                				
                				<tr valign="middle">
                    				<td class="statText" height="15" valign="top"><strong>Screening and Review Scorecards</strong><br />
                    				The screening and review scorecards are completed by the Application Design Review Boards to score 
                    				application submissions.  All members who submit a design or development solution will recieve the 
                    				populated scorecards from the review boards.
									</td>
									<td><img src="/i/clear.gif" alt="" height="1" width="1" border="0" /></td>
                    				<td class="statText" height="15" valign="top">
                    				<br />
                    				03.17.2003 &#160;<a target="tcsdocs" href="/i/development/downloads/App_Design_Screening_Scorecard.dot" class="statText">Design Screening Scorecard.dot</a><br />
                    				03.14.2003 &#160;<a target="tcsdocs" href="/i/development/downloads/App_Design_Review_Scorecard.dot" class="statText">Design Review Scorecard.dot</a><br />
                    				</td>
                				</tr>
                				
                				<tr>
                					<td colspan="3">
                					<hr width="100%" size="1px" color="666666" /></td>
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
									This is the <a href="/i/development/downloads/submission-sample.jar" class="statText">winning design submission</a> from <a href="/stat?c=member_profile&amp;cr=119676" class="coderTextBlue">Pops</a> for the <a href="http://software.topcoder.com/pages/c_component.jsp?comp=6402357&amp;cat=1" class="statText">Class Discovery</a> component. It should only be used as a guide for creating a design submission. Contents of this submission include:
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

			<table border="0" cellspacing="0" cellpadding="10" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%">
				<tr valign="top">
					<td width="100%" background="/i/steel_darkblue_bg.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#333333">
							<tr valign="top">
								<td class="statText" width="100%">
									<p><strong>Completed Component</strong><br/>
									This is the completed <a href="/i/development/downloads/logging_wrapper-1_0.jar" class="statText">Logging Wrapper</a> component that has gone through the Component Development Methodology.
									You are encouraged to download and install this component for personal, non-commercial use and to incorporate it into future TopCoder Software components.
							    </p></td>
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
