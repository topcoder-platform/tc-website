<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="../top.xsl" />
	<xsl:import href="../script.xsl" />
	<xsl:import href="../includes/body_top.xsl" />  
	<xsl:import href="../foot.xsl" />
	<xsl:import href="../includes/modules/stats_intro.xsl" />  
	<xsl:import href="../includes/dev/public_dev_left.xsl" /> 
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
			<xsl:call-template name="public_dev_left" />
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
					<td class="statText" colspan="2">Component Projects are classified as <a class="statText" href="#design">Design</a> or <a class="statText" href="#development">Development</a> projects. There are also <a class="statText" href="/index?t=development&amp;c=app_projects">Application</a> projects available.</td>
				</tr>

				<tr><td class="statText" colspan="2"><a name="design"><h1 class="devSubhead">Open Component Design Projects</h1></a></td></tr>
				
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
						Project: <a class="statText" href="/index?t=development&amp;c=db_abstract-design">Database Abstraction:&#160;Design</a><br/>
						Posted: 11.26.2002<br/>
						Submission Deadline: 12.11.2002<br/>
						</p>   

						<p>
						Project: <a class="statText" href="/index?t=development&amp;c=encrypt-design">Encryption:&#160;Design</a><br/>
						Posted: 11.26.2002<br/>
						Submission Deadline: 12.11.2002<br/>
						</p>   

						<p>
						Project: <a class="statText" href="/index?t=development&amp;c=spell_check">Spell Check:&#160;Design</a><br/>
						Posted: 11.21.2002<br/>
						Submission Deadline: 12.04.2002<br/>
						</p>   

						<p>
						Project: <a class="statText" href="/index?t=development&amp;c=email_validator_design">Email Address Verifier:&#160;Design</a><br/>
						Posted: 11.14.2002<br/>
						Submission Deadline: 11.27.2002<br/>
						</p>   
					</td>

					<td class="statText" width="50%">
						<p>
						Project: <a class="statText" href="/index?t=development&amp;c=http_tunnel-design">HTTP Tunneling:&#160;Design</a><br/>
						Posted: 11.26.2002<br/>
						Submission Deadline: 12.11.2002<br/>
						</p>   

						<p>
						Project: <a class="statText" href="/index?t=development&amp;c=object_selector-design">Object Selector:&#160;Design</a><br/>
						Posted: 11.26.2002<br/>
						Submission Deadline: 12.11.2002<br/>
						</p>   

						<p>
						Project: <a class="statText" href="/index?t=development&amp;c=math_eval">Math Evaluator:&#160;Design</a><br/>
						Posted: 11.21.2002<br/>
						Submission Deadline: 12.04.2002<br/>
						</p>   

						<p>
						Project: <a class="statText" href="/index?t=development&amp;c=simple_cache">Simple Cache:&#160;Design</a><br/>
						Posted: 11.14.2002<br/>
						Submission Deadline: 11.27.2002<br/>
						</p>   
					</td>
				</tr>
				
				<tr><td height="1" colspan="2"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td></tr>

				<tr><td class="statText" colspan="2"><a name="development"><h1 class="devSubhead">Open Component Development Projects</h1></a></td></tr>
				
<!--				<tr valign="top">
					<td class="statText">
						<p>
						There are no Open Component Development postings.<br/>
						</p>   
					</td>
				</tr>  -->
							
				<tr valign="top">
					<td class="statText" width="50%">
						<p>
						Project: <a class="statText" href="/index?t=development&amp;c=timer_dev">Timer:&#160;Development</a><br/>
						Posted: 11.21.2002<br/>
						Submission Deadline: 12.05.2002<br/>
						</p>   

						<p>
						Project: <a class="statText" href="/index?t=development&amp;c=email_engine_dev">Email Engine Enhancements:&#160;Development</a><br/>
						Posted: 11.14.2002<br/>
						Submission Deadline: 11.29.2002<br/>
						</p>   
					</td>

					<td class="statText" width="50%">
						<p>
						Project: <a class="statText" href="/index?t=development&amp;c=utg_dev">Unit Test Generator:&#160;Development</a><br/>
						Posted: 11.21.2002<br/>
						Submission Deadline: 12.05.2002<br/>
						</p>   

						<p>
						Project: <a class="statText" href="/index?t=development&amp;c=log_interface_dev">Logging Wrapper:&#160;Development</a><br/>
						Posted: 11.14.2002<br/>
						Submission Deadline: 11.29.2002<br/>
						</p>   
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

