<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="../top.xsl" />
	<xsl:import href="../script.xsl" />
	<xsl:import href="../includes/body_top.xsl" />  
	<xsl:import href="../foot.xsl" />
	<xsl:import href="../includes/modules/stats_intro.xsl" />  
	<xsl:import href="../includes/dev/dev_comp_left.xsl" /> 
	<xsl:import href="../includes/dev/public_dev_right.xsl" />     
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

<body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">
	<xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
	<tr valign="top">
<!-- Left Column Begins -->
		<td width="170" bgcolor="#CCCCCC">
			<xsl:call-template name="dev_comp_left" />
	  	</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
		<td width="4" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="4" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td class="bodyText" width="100%" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="240" height="1" alt="" vspace="5" border="0" /><br />
			<xsl:call-template name="BodyTop">
			<xsl:with-param name="image1">steelblue</xsl:with-param>
			<xsl:with-param name="image">development</xsl:with-param>
			<xsl:with-param name="title">&#160;Component Development</xsl:with-param>
			</xsl:call-template>
			<table border="0" cellspacing="0" cellpadding="0" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%">
				<tr valign="top">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" height="10"><img src="/i/clear.gif" alt="" width="240" height="10" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>
			</table>
				
			<table border="0" cellspacing="0" cellpadding="10" background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%">
				<tr valign="top">
					<td width="100%" background="/i/steel_darkblue_bg.gif">
						<table border="0" cellspacing="0" cellpadding="10" bgcolor="#333333">
							<tr valign="top">
								<td class="statText">
									<p><strong>There has been significant change to the development of components. All members interested submitting design and 
									development solutions need to first review both the TopCoder Software Component Design Methodology detailed below and the
									<a class="statText" href="/index?t=development&amp;c=comp_dev_meth"><strong>TopCoder Software Component Development Methodology</strong></a>.</strong></p>

									<p><strong>All Component Projects:</strong></p>

									<p>Component projects have been redesigned to to be more competitve. Interested members must submit their solution to the 
									posted project by the project due date. Once all submissions have been received, a review team will select the winning solution. 
									Software components built through the competition based projects offer the additional benefit of being commercially marketed. 
									In addition to the initial payment received for providing the winning solution, members can also receive royalties on all sales 
									of the component through TopCoder Software. The TopCoder Software Component Methodologies combine the best of 
									traditional software development methodologies with the power of community-based, distributed development. These methodologies 
									are designed for low-level base components, not for larger applications.</p>

									<p><strong>Component Design Projects:</strong>

									<ol>
										<li>TopCoder Software product manager posts a design project on the Development section of the TopCoder website. This posting includes a high-level functional description of the component and a timeline for submissions and project payment. A requirements specification document and the required deliverables for the design proposal will be sent to all members who inquire about the project.</li>
										<li>Only rated TopCoder members are allowed to inquire about the Design project on the Development section of the TopCoder website.</li>
										<li>The product manager will grant all eligible members access to an online forum on www.topcodersoftware.com. This forum is used for the designers to ask the product manager questions about the requirements specification. </li>
										<li>All designers are required to submit their designs to the product manager by the end of the design phase as stated on the project posting. Any designs received after the Initial Submission Due Date will be ignored. </li>
										<li>The product manager will assemble an architecture review board consisting of 3 TopCoder Software architects to review proposals submitted by the designers.</li>
										<li>A member of the architecture review board first screens the design documents to verify that the proposal includes all required elements and performs a high-level review of the designs to narrow down to the top 5 component designs.</li>
										<li>Accepted designs are then reviewed by the architecture board and scored. The architecture board will submit a design scorecard for each design, which may include suggestions for improvements.</li>
										<li>The member with the winning design will be given additional time to incorporate design suggestions received from the architecture board. The additional time period will be set as a percentage (currently 20%) of the initial design period. For example, a component with a 5 day design period will allow an additional 1 day after the due date for the designer to incorporate the suggestions. If the completed design is submitted on time, the designer is paid the first of two payments for the project as stated in the project posting.</li>
										<li>The winning designer is required to answer questions regarding the design during the development project. At the completion of the development project the designer will receive their final payment.</li>
									</ol></p>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
				
			<table border="0" cellspacing="0" cellpadding="0" background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%">
				<tr valign="top">
					<td background="" bgcolor="#CCCCCC" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="8" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="14"><img src="/i/table_mid_left2x.gif" alt="" width="14" height="8" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
					<td background="" bgcolor="#CCCCCC" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>	
	
				<tr valign="top">
					<td background="" bgcolor="#CCCCCC" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="8" border="0" /></td>
					<td background="" bgcolor="#CCCCCC" width="14"><img src="/i/table_btm_left2.gif" alt="" width="14" height="8" border="0" /></td>
					<td background="" bgcolor="#CCCCCC" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
					<td background="" bgcolor="#CCCCCC" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>
			</table>
		</td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
		<td width="1" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="1" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
		<td width="244" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="244" height="1" alt="" border="0" /><br />
			<xsl:call-template name="public_dev_right" />        
        </td>
<!-- Right Column Ends -->
	
	</tr>
</table>

<!-- Footer Begins -->
        <xsl:call-template name="Foot" />
<!-- Footer Endss -->

</body>
</html>
	</xsl:template>
</xsl:stylesheet>

