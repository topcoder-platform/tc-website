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
				
			<table border="0" cellspacing="5" cellpadding="5" background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%">
				<tr>
					<td class="statText" colspan="2">The TopCoder Development area lists all open and in-progress projects at TopCoder that involve the use of the TopCoder member base. Projects are classified as Component Design, <a class="statText" href="/index?t=development&amp;c=comp_dev_projects">Component Development</a> or <a class="statText" href="/index?t=development&amp;c=app_projects">Application projects</a>.</td>
				</tr>

				<tr><td class="statText" colspan="2"><strong>Open Component Design Projects</strong></td></tr>
				
<!--				<tr valign="top">
					<td class="statText">
						<p>
						There are no Open Component Design postings.<br/>
						</p>   
					</td>
				</tr>  -->
							
				<tr valign="top">
					<td class="statText" width="50%">
						<p>
						Project: <a class="statText" href="/index?t=development&amp;c=email_validator_design">Email Address Validator</a><br/>
						Posted: 11.14.2002<br/>
						Submission Deadline: 11.27.2002<br/>
						</p>   

						<p>
						Project: <a href="/index?t=development&amp;c=object_formatter" class="statText">Object Formatter</a><br/>
						Posted: 11.8.2002<br/>
						Submission Deadline: 11.21.2002<br/>
						</p>   

						<p>
						Project: <a href="/index?t=development&amp;c=api_compare" class="statText">API Comparator</a><br/>
						Posted: 11.8.2002<br/>
						Submission Deadline: 11.19.2002<br/>
						</p>   
					</td>

					<td class="statText" width="50%">
						<p>
						Project: <a class="statText" href="/index?t=development&amp;c=simple_cache">Simple Cache</a><br/>
						Posted: 11.14.2002<br/>
						Submission Deadline: 11.27.2002<br/>
						</p>   

						<p>
						Project: <a href="/index?t=development&amp;c=unique_key" class="statText">Unique Key Generator</a><br/>
						Posted: 11.8.2002<br/>
						Submission Deadline: 11.21.2002<br/>
						</p>

						<p>
						Project: <a href="/index?t=development&amp;c=ip_filter" class="statText">IP Filter</a><br/>
						Posted: 11.8.2002<br/>
						Submission Deadline: 11.19.2002<br/>
						</p>   
					</td>
				</tr>
							
<!--				<tr><td class="statText" colspan="2"><strong>In-Progress Projects</strong></td></tr>	
							
				<tr valign="top">
					<td class="statText">
						<p>
						There are no In-Progress Component Design postings.<br/>
						</p>   
					</td>
				</tr>  -->
							
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

