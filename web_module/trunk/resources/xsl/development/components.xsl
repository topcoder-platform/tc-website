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

 <title>TopCoder :: Component Development</title>

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
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" colspan="4"><img src="/i/clear.gif" alt="" width="240" height="10" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

	<!-- Featured Winner Begins -->
				<tr valign="top">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" class="statText" width="100%" colspan="4"><strong><img src="/i/development/title_weekly_comp_winners.gif" alt="This Week's Component Project Winners" width="346" height="26" border="0" /></strong><br />
						<span class="statTextSmall">Week Ending November 22, 2002</span></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" height="5" colspan="6"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

				<tr valign="middle">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_gray_bg3.gif" class="registerNav" height="18" colspan="4">&#160;&#160;Featured Winner</td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr valign="top">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" colspan="4">
						<table border="0" cellspacing="0" cellpadding="0" width="100%">
							<tr><td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" height="5" colspan="4"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

							<tr valign="top"><td class="statText" colspan="4">&#160;&#160;<strong>Coder: </strong><span class="coderTextYellow"><a href="/stat?c=member_profile&amp;cr=296145" class="coderTextYellow"><strong>srowen</strong></a></span></td></tr>

							<tr><td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" height="5" colspan="4"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

							<tr valign="top">
								<td class="statText" rowspan="5" width="55"><a href="/stat?c=member_profile&amp;cr=296145" class="coderTextYellow"><img src="/i/m/nophoto_dev.gif" alt="" width="55" height="61" border="0" hspace="5" vspace="5" /></a></td>
								<td class="statText" width="65%">Developer Level:</td>
								<td class="statText" align="right" width="10%">II</td>
								<td class="statText" width="25%"></td>
							</tr>

							<tr valign="top">
								<td class="statText">Component Review Board Score for This Project:</td>
								<td class="statText" align="right">84.23</td>
								<td class="statText"></td>
							</tr>

							<tr valign="top">
								<td class="statText">Rating:</td>
								<td class="statText" align="right">1682</td>
								<td class="statText">&#160;&#160;<a href="/stat?c=ratings_history&amp;cr=296145" class="statText">[ ratings history ]</a></td>
							</tr>

							<tr valign="top">
								<td class="statText">Total Earnings for All Component Projects*:</td>
								<td class="statText" align="right">$180.00</td>
								<td class="statText"></td>
							</tr>

							<tr><td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" height="5" colspan="4"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr></table></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr valign="middle">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_bluebv_bg.gif" class="statText" height="18" colspan="4">&#160;&#160;Component Description</td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr valign="middle">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" colspan="4">
						<table border="0" cellspacing="0" cellpadding="5" width="100%">
							<tr><td class="statText"><a href="http://www.topcodersoftware.com/pages/c_component.jsp?comp=2300028" class="statText"><strong>Timer</strong></a><br />
									The Timer component allows for "stopwatch" type functionality to be integrated into existing and new software. For more details, check out the <a href="http://www.topcodersoftware.com/pages/c_component.jsp?comp=2300028" class="statText">Timer component</a> at <a href="http://www.topcodersoftware.com" class="statText">topcodersoftware.com</a>.</td></tr>
						</table></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" height="5" colspan="6"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

				<tr valign="middle">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_bluebv_bg.gif" class="statText" height="18" colspan="4">&#160;&#160;Component Review Board Comments</td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr valign="middle">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" colspan="4">
						<table border="0" cellspacing="0" cellpadding="5" width="100%">
							<tr><td class="statText">"Good, simple design. This would be very easy to implement and maintain." &#151;<a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=278595">seaniswise</a></td></tr>
						</table></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" height="25" colspan="6"><img src="/i/clear.gif" alt="" height="25" border="0" /></td></tr>
	<!-- Featured Winner Ends -->

	<!-- Weekly Winners Begins -->
				<tr valign="middle">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_gray_bg3.gif" class="registerNav" height="18" colspan="4">&#160;&#160;Congratulations to All of This Week's Winners</td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr valign="middle">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_bluebv_bg.gif" class="statText" width="15%" height="18">&#160;&#160;Coder</td>
					<td background="/i/steel_bluebv_bg.gif" class="statText" width="45%" height="18">Project Name</td>
					<td background="/i/steel_bluebv_bg.gif" class="statText" width="20%" height="18" align="center">Board Score</td>
					<td background="/i/steel_bluebv_bg.gif" class="statText" width="20%" height="18" align="center">Total Earnings*</td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr valign="middle">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" class="coderTextYellow" width="15%" height="18">&#160;&#160;<a href="/stat?c=member_profile&amp;cr=296145" class="coderTextYellow"><strong>srowen</strong></a></td>
					<td background="/i/steel_darkblue_bg.gif" class="statText" width="45%" height="18"><a href="http://www.topcodersoftware.com/pages/c_component.jsp?comp=2300028" class="statText">Timer Design</a></td>
					<td background="/i/steel_darkblue_bg.gif" class="statText" width="20%" height="18" align="center">84.23</td>
					<td background="/i/steel_darkblue_bg.gif" class="statText" width="20%" height="18" align="center">$180.00</td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr valign="middle">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" class="coderTextGreen" width="15%" height="18">&#160;&#160;<a href="/stat?c=member_profile&amp;cr=285960" class="coderTextGreen"><strong>jkang</strong></a></td>
					<td background="/i/steel_darkblue_bg.gif" class="statText" width="45%" height="18"><a href="http://www.topcodersoftware.com/pages/c_component.jsp?comp=2100060" class="statText">Unit Test Generator Design</a></td>
					<td background="/i/steel_darkblue_bg.gif" class="statText" width="20%" height="18" align="center">82.40</td>
					<td background="/i/steel_darkblue_bg.gif" class="statText" width="20%" height="18" align="center">$150.00</td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" height="5" colspan="6"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

				<tr valign="middle">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" class="statTextSmall" height="18" colspan="4">&#160;&#160;* Total Earnings for all Component Projects (before royalties)</td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" height="5" colspan="6"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>
			</table>
	<!-- Weekly Winners Ends -->
				
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

