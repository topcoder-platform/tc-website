<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="../top.xsl" />
	<xsl:import href="../script.xsl" />
	<xsl:import href="../includes/body_top.xsl" />  
	<xsl:import href="../foot.xsl" />
	<xsl:import href="../includes/modules/stats_intro.xsl" />  
	<xsl:import href="../includes/public_dev_left.xsl"/>  
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
	padding-bottom: 3px;
	}
	
.topPage {
	text-align: right;
	}
	
.methNav {
	color: #F90;
	}
	
	</style>

</head>

<body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">
	<xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
	<tr valign="top">
<!-- Left Column Begins -->
		<td width="170" bgcolor="#CCCCCC">
			<xsl:call-template name="public_dev_left"/>
	  	</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
		<td width="4" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="4" height="5" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
            <td class="bodyText" width="100%" bgcolor="#CCCCCC">
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
					<td class="statText">
						<div align="center"><h1 class="devSubhead"><strong>TopCoder Software Component Development Methodology</strong></h1></div></td>
				</tr>

				<tr valign="top">
					<td width="100%">
						<div align="center">
						<table width="565" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td rowspan="3"><img src="images/spacer.gif" width="59" height="204" alt=""></td>
								<td><a class="statText" href="#certification"><img src="images/methodology_02.gif" width="161" height="67" alt="Certification" border="0"></a></td>
								<td><img src="images/methodology_03.gif" width="118" height="67" alt=""></td>
								<td><a class="statText" href="#collaboration"><img src="images/methodology_04.gif" width="177" height="67" alt="Collaboration" border="0"></a></td>
								<td rowspan="3"><img src="images/spacer.gif" width="50" height="204" alt=""></td>
							</tr>
						
							<tr>
								<td><img src="images/methodology_06.gif" width="161" height="56" alt=""></td>
								<td><img src="images/methodology_07.gif" width="118" height="56" alt=""></td>
								<td><img src="images/methodology_08.gif" width="177" height="56" alt=""></td>
							</tr>

							<tr>
								<td><a class="statText" href="#development"><img src="images/methodology_09.gif" width="161" height="81" alt="Development" border="0"></a></td>
								<td><img src="images/methodology_10.gif" width="118" height="81" alt=""></td>
								<td><a class="statText" href="#design"><img src="images/methodology_11.gif" width="177" height="81" alt="Design" border="0"></a></td>
							</tr>
						</table></div></td>
				</tr>

				<tr valign="top">
					<td class="statText">
						<p>The Component Development Methodology combines the best of traditional software development methodologies with the power 
						of community-based development.  The four stages of the methodology make up one release of a component.  If any one of the 
						phases does not pass required acceptance that phase of the project is restarted.</p></td>
				</tr>

<!-- Collaboration begins -->
				<tr valign="top">
					<td width="100%" background="/i/steel_darkblue_bg.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#333333">
							<tr valign="top">
								<td class="statText" width="98%">
									<a name="collaboration"><strong>Collaboration</strong></a><span class="methNav">&#160;&#160;&#160;&#160;&#160;<a class="statText" href="#collPart">Participants</a>&#160;::&#160;<a class="statText" href="#collDet">Details</a>&#160;&#160;&#160;</span></td>
								<td class="statText" width="2%" nowrap="nowrap">
									<div class="topPage"><a class="statText" href="#top">[Top of Page]</a></div></td>
							</tr>
						</table></td>
				</tr>
				
				<tr valign="top">
					<td class="statText">
						<p>Gather component scope by collaborating with customers and topcodersoftware.com members though online 
						<a class="statText" href="http://www.topcodersoftware.com/pages/c_active_collab.jsp">Collaboration Forums.</a>  For new components this includes a new request for a component, for existing components it is the request for additional functionality.</p>
									
						<p><a name="collPart"><strong>Participants</strong></a><br />
						Product Manager (PM)<br />
						TopCoder Software Customers<br />
						TopCoder Software Members</p>
									
						<p><a name="collDet"><strong>Details</strong></a><br />
						<ol>
							<li>PM moderates <a class="statText" href="http://www.topcodersoftware.com/pages/c_active_collab.jsp">Collaboration Forums</a> on topcodersoftware.com to gather component requirements.</li>
							<li>The Collaboration Forums are open to view by all TopCoder Software visitors, but only registered members are allowed to post replies to the forums.</li>
							<li>Once the project scope has been determined, the PM creates a Requirements Specification for the Design Phase of that component.</li>
							<li>The project is <a class="statText" href="index?t=development&amp;c=comp_projects">posted</a> on the Development Section of topcoder.com, and an email is sent out notifying members of the new development opportunity.  The posting includes the payment and submission deadline for all design submissions.</li>
							<li>Interested members are required to inquire about projects, at that point all eligible members are granted access to the required project specification and a secure forum to communicate with the PM.</li>
						</ol></p></td>
				</tr>
<!-- Collaboration ends -->

<!-- Design begins -->
				<tr valign="top">
					<td width="100%" background="/i/steel_darkblue_bg.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#333333">
							<tr valign="top">
								<td class="statText" width="98%">
									<strong>Architecture and Design</strong><span class="methNav">&#160;&#160;&#160;<a class="statText" href="#desPart">Participants</a>&#160;::&#160;<a class="statText" href="#desDet">Details</a>&#160;::&#160;<a class="statText" href="#desDel">Deliverables</a>&#160;&#160;&#160;</span></td>
								<td class="statText" width="2%" nowrap="nowrap">
									<div class="topPage"><a class="statText" href="#top">[Top of Page]</a></div></td>
							</tr>
						</table></td>
				</tr>
				
				<tr valign="top">
					<td class="statText">
						<p>Gather component scope by collaborating with customers and topcodersoftware.com members though online 
						Collaboration Forums.  For new components this includes a new request for a component, for existing components it is 
						the request for additional functionality.</p>
									
						<p><a name="desPart"><strong>Participants</strong></a><br />
						Product Manager (PM)<br />
						Customers<br />
						TopCoder Software Members</p>
									
						<p><a name="desDet"><strong>Details</strong></a><br />
						<ol>
							<li>PM moderates collaboration forums on topcodersoftware.com to gather component requirements.</li>
							<li>Collaboration sessions will last a minimum of one week and last as long as the - PM deems necessary to gather the requirements.</li>
							<li>Each PM will start a minimum of double their component quota of active collaborations per month.</li>
							<li>The collaboration forums are open to view by all TopCoder Software visitors, but only registered members are allowed to post to the forums.</li>
							<li>Once a project scope has been determined, the PM creates a Requirements Specification and Project Posting for the design of that component.</li>
							<li>The project is posted on the Development Section of topcoder.com, and an email is sent out notifying members of the new development opportunity.  The posting includes the payment and submission date for all design submissions.  Interested members are required to inquire about projects, at that point all eligible members are granted access to the required project specification and a secure forum to communicate with the TopCoder Product Manager.</li>
						</ol></p>
									
						<p><a name="desDel"><strong>Deliverables</strong></a><br />
						<ul>
							<li>Project overview and functional requirements in the collaboration forum.</li>
							<li>(PM) Requirements Specification detailing the specific requirements of the component is created and posted to the specification forum.</li>
							<li>(PM) Project Posting for design project (including: Requirements Specification, timeline, payments and deliverables).</li>
						</ul></p></td>
				</tr>
<!-- Design ends -->

<!-- Development begins -->
				<tr valign="top">
					<td width="100%" background="/i/steel_darkblue_bg.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#333333">
							<tr valign="top">
								<td class="statText" width="98%">
									<strong>Development and Testing</strong><span class="methNav">&#160;&#160;&#160;<a class="statText" href="#devPart">Participants</a>&#160;::&#160;<a class="statText" href="#devDet">Details</a>&#160;::&#160;<a class="statText" href="#devDel">Deliverables</a>&#160;&#160;&#160;</span></td>
								<td class="statText" width="2%" nowrap="nowrap">
									<div class="topPage"><a class="statText" href="#top">[Top of Page]</a></div></td>
							</tr>
						</table></td>
				</tr>
				
				<tr valign="top">
					<td class="statText">
						<p>Gather component scope by collaborating with customers and topcodersoftware.com members though online 
						Collaboration Forums.  For new components this includes a new request for a component, for existing components it is 
						the request for additional functionality.</p>
									
						<p><a name="devPart"><strong>Participants</strong></a><br />
						Product Manager (PM)<br />
						Customers<br />
						TopCoder Software Members</p>
									
						<p><a name="devDet"><strong>Details</strong></a><br />
						<ol>
							<li>PM moderates collaboration forums on topcodersoftware.com to gather component requirements.</li>
							<li>Collaboration sessions will last a minimum of one week and last as long as the - PM deems necessary to gather the requirements.</li>
							<li>Each PM will start a minimum of double their component quota of active collaborations per month.</li>
							<li>The collaboration forums are open to view by all TopCoder Software visitors, but only registered members are allowed to post to the forums.</li>
							<li>Once a project scope has been determined, the PM creates a Requirements Specification and Project Posting for the design of that component.</li>
							<li>The project is posted on the Development Section of topcoder.com, and an email is sent out notifying members of the new development opportunity.  The posting includes the payment and submission date for all design submissions.  Interested members are required to inquire about projects, at that point all eligible members are granted access to the required project specification and a secure forum to communicate with the TopCoder Product Manager.</li>
						</ol></p>
									
						<p><a name="devDel"><strong>Deliverables</strong></a><br />
						<ul>
							<li>Project overview and functional requirements in the collaboration forum.</li>
							<li>(PM) Requirements Specification detailing the specific requirements of the component is created and posted to the specification forum.</li>
							<li>(PM) Project Posting for design project (including: Requirements Specification, timeline, payments and deliverables).</li>
						</ul></p></td>
				</tr>
<!-- Development ends -->

<!-- Certification begins -->
				<tr valign="top">
					<td width="100%" background="/i/steel_darkblue_bg.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="10" bgcolor="#333333">
							<tr valign="top">
								<td class="statText" width="98%">
									<strong>Certification</strong><span class="methNav">&#160;&#160;&#160;<a class="statText" href="#certPart">Participants</a>&#160;::&#160;<a class="statText" href="#certDet">Details</a>&#160;::&#160;<a class="statText" href="#certDel">Deliverables</a>&#160;&#160;&#160;</span></td>
								<td class="statText" width="2%" nowrap="nowrap">
									<div class="topPage"><a class="statText" href="#top">[Top of Page]</a></div></td>
							</tr>
						</table></td>
				</tr>
				
				<tr valign="top">
					<td class="statText">
						<p>Gather component scope by collaborating with customers and topcodersoftware.com members though online 
						Collaboration Forums.  For new components this includes a new request for a component, for existing components it is 
						the request for additional functionality.</p>
									
						<p><a name="certPart"><strong>Participants</strong></a><br />
						Product Manager (PM)<br />
						Customers<br />
						TopCoder Software Members</p>
									
						<p><a name="certDet"><strong>Details</strong></a><br />
						<ol>
							<li>PM moderates collaboration forums on topcodersoftware.com to gather component requirements.</li>
							<li>Collaboration sessions will last a minimum of one week and last as long as the - PM deems necessary to gather the requirements.</li>
							<li>Each PM will start a minimum of double their component quota of active collaborations per month.</li>
							<li>The collaboration forums are open to view by all TopCoder Software visitors, but only registered members are allowed to post to the forums.</li>
							<li>Once a project scope has been determined, the PM creates a Requirements Specification and Project Posting for the design of that component.</li>
							<li>The project is posted on the Development Section of topcoder.com, and an email is sent out notifying members of the new development opportunity.  The posting includes the payment and submission date for all design submissions.  Interested members are required to inquire about projects, at that point all eligible members are granted access to the required project specification and a secure forum to communicate with the TopCoder Product Manager.</li>
						</ol></p>
									
						<p><a name="certDel"><strong>Deliverables</strong></a><br />
						<ul>
							<li>Project overview and functional requirements in the collaboration forum.</li>
							<li>(PM) Requirements Specification detailing the specific requirements of the component is created and posted to the specification forum.</li>
							<li>(PM) Project Posting for design project (including: Requirements Specification, timeline, payments and deliverables).</li>
						</ul></p></td>
				</tr>
<!-- Certification ends -->
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
		<td width="244" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="244" height="1" alt="" border="0" /><br/>
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

