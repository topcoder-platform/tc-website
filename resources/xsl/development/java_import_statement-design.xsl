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

</head>

<body bgcolor="#CCCCCC" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

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
				<xsl:variable name='month' select='/TC/DEVELOPMENT/month'/>
		        <xsl:variable name='day' select='/TC/DEVELOPMENT/day'/>
		        <xsl:variable name='year' select='/TC/DEVELOPMENT/year'/>				
			<table border="0" cellspacing="0" cellpadding="0" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%">
				<tr>
					<td bgcolor="#000033" background="/i/steel_darkblue_bg.gif" valign="top" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
					<td class="statText" colspan="2" valign="top" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>
							
<!-- Title -->
						<h1 class="devSubhead"><strong>Java Import Statement: Design</strong></h1>
                                    


<!-- Overview -->
						<p><strong>Overview</strong><br />
						The Java Import Statement component analyzes java source code and determines the required import statements.  The import statements are determined at the class level, not the package level, and are ordered alphabetically.  While the performance benefits of ordering the import statements and defining them at the class level are negligible, doing so facilitates class testing and code maintenance by clearly stating what classes are used.

An example usage of the Java Import Statement component is in test case development.  To thoroughly and accurately test a class, testers must not only fully understand the intended usage of class, but they must also know class dependencies.  These dependencies will affect the direction of those tests.
						</p>

<!-- Project Type -->
						<p><strong>Project Type</strong><br />
						Component Design Project: Provide a complete design for the Java Import Statement component.<br />
						Please review the TopCoder Software <a href="http://www.topcoder.com/?&amp;t=development&amp;c=comp_meth" class="statText">Component Development Methodology</a> before you submit a solution. 
						If you're not sure what to submit, go to <a href="/?&amp;t=development&amp;c=tcs_sample_docs" class="statText">Documentation and Sample Submissions</a> for more information.
                            </p>
                            
<!-- Technologies -->
						<p><strong>Technologies</strong></p>
						<ul>
							<li>Java 1.4</li>
						</ul>

<!-- Documentation -->
						<p><strong>Documentation</strong><br />
						All <a class="statText" target="_new" href="http://www.topcodersoftware.com/pages/c_component.jsp?comp=4310739">documentation</a> for this project is available on the TopCoder Software web site.</p>

<!-- Payment -->
						<p><strong>Payment</strong><br />
						TopCoder will compensate the member with the winning solution. Compensation will consist of both initial payments and royalties on the sale of the component. The initial payment will be distributed in two installments.<br/>
						First Milestone: When the winning solution is submitted and review board suggestions are integrated.<br/>
						Second Milestone: Is marked by the completion of the development project*.</p>

						<p>Members will also collect royalties on the revenue generated from the sale of the component. The total royalty per component will be equal to 10%* of the component's revenue, with 25%* of the royalty being paid to the designer, 25% to the developer(s), 25% to the Architecture Board member(s) and 25% to the Development Board member(s).  Royalties may be diluted if additional work is done to the component, as the total work effort for the component will increase.</p>
							
						<p><strong>Designer</strong><br />
						Royalty Percentage - 25%</p>
							
						<p>Total Payment - <xsl:value-of select="/TC/DEVELOPMENT/payment"/><br/>
						First Deliverable - <xsl:value-of select="/TC/DEVELOPMENT/first_payment"/><br/>
					    Project Completion - <xsl:value-of select="/TC/DEVELOPMENT/second_payment"/></p>

<!-- Definition of Completion -->
						<p><sup>*</sup>Completion of the project is defined as follows:</p>

						<ul>
							<li>The Initial Submission has been delivered by the Initial Submission Due Date.</li>
							<li>The Submission has been selected by the board as the winning submission.</li>
							<li>Final payment is conditional on acceptance of the fully functional component by the Development Review Board.</li>
						</ul>

<!-- Eligibility Requirements -->
						<p><strong>Eligibility</strong><br />
						You must be a rated TopCoder member, at least 18 years of age, meeting all of the membership requirements and fit into one of the following categories:</p>

						<ol>
							<li>A US Citizen </li>
							<li>A Lawful Permanent Resident of the US</li>
							<li>A temporary resident, asylee, refugee, or have a lawfully issued work authorization card permitting unrestricted employment.</li>
							<li>A Non-US Citizen working in your country of residence.</li>
						</ol>

<!-- Time Line -->
						<p><strong>Time Line</strong><br/>
						All submissions are required to be submitted by the Initial Submission Due Date.  All questions submitted prior to 6PM EDT on the Initial Submission Due Date will be answered. Following review from the board the winning member is given until the Final Submission Due Date to modify their submission.</p>

						<p><br/>
						Initial Submission Due Date: <xsl:value-of select="/TC/DEVELOPMENT/date"/><br/>
						Winner Announced: <xsl:value-of select="/TC/DEVELOPMENT/DesWinner"/><br/>
						Final Submission Due Date: <xsl:value-of select="/TC/DEVELOPMENT/DesFinal"/><br/>
						Estimated Development End Date: <xsl:value-of select="/TC/DEVELOPMENT/DesDevFinal"/></p>


<!-- Register at TCS -->
						   <p>
        						<strong>View the <a class="statText" target="_new"  href= "<<<REQUIREMENTS_FILE>>>">Requirement Specification</a> for this component project &gt;&gt;</strong>
                            </p>
						

						   <p>
						        <strong>
        						<a class="statText">
        						    <xsl:attribute name="href">
        						        <xsl:value-of select="concat('/?&amp;t=development&amp;version=1&amp;phase=112&amp;comp=4310739&amp;c=tcs_inquire&amp;Project=Java%20Import%20Statement:%20Design&amp;date=', $month, '&#47;', $day, '&#47;', $year)"/>
                                    </xsl:attribute>
                                    Register for the Component Project
        						</a>
        						to get information necessary to submit a solution &gt;&gt;</strong>
                            </p>

						<p><br /></p>
					</td>

					<td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

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

</body>
</html>
	</xsl:template>
</xsl:stylesheet>
