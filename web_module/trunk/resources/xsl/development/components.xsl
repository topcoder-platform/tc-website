<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="../top.xsl" />
	<xsl:import href="../script.xsl" />
	<xsl:import href="../includes/body_top.xsl" />  
	<xsl:import href="../foot.xsl" />
	<xsl:import href="../includes/modules/stats_intro.xsl" />  
  <xsl:import href="../includes/global_left.xsl"/>  
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

<BODY BGCOLOR="#CCCCCC" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">
	<xsl:call-template name="Top" />

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
	<tr valign="top">
<!-- Left Column Begins -->
		<td width="170" bgcolor="#CCCCCC">
			<xsl:call-template name="global_left"/>
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
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" colspan="4"><img src="/i/clear.gif" alt="" width="240" height="10" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

	<!-- Featured Winner Begins -->
				<tr valign="top">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" class="statText" width="100%" colspan="4"><strong><img src="/i/development/title_weekly_comp_winners.gif" alt="This Week's Component Project Winners" width="346" height="26" border="0" /></strong></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" height="5" colspan="6"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

				<tr valign="middle">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_gray_bg.gif" class="registerNav" height="18" colspan="4">&#160;&#160;Featured Winner</td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr valign="top">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" colspan="4">
						<table border="0" cellspacing="0" cellpadding="0" width="100%">
							<tr><td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" height="5" colspan="4"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

							<tr valign="top"><td class="statText" colspan="4">&#160;&#160;<strong>Coder: </strong><span class="statText"><a href="/stat?c=member_profile&amp;cr=279551" class="coderTextGreen"><strong>scamp</strong></a></span></td></tr>

							<tr><td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" height="5" colspan="4"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

							<tr valign="top">
								<td class="statText" rowspan="5" width="55"><a href="/stat?c=member_profile&amp;cr=279551" class="coderTextGreen"><img src="/i/m/nophoto_dev.gif" alt="" width="55" height="61" border="0" hspace="5" vspace="5" /></a></td>
								<td class="statText" width="65%">Developer Level:</td>
								<td class="statText" align="right" width="10%">II</td>
								<td class="statText" width="25%"></td>
							</tr>

							<tr valign="top">
								<td class="statText">Rating:</td>
								<td class="statText" align="right">1244  </td>
								<td class="statText">&#160;&#160;<a href="/stat?c=ratings_history&amp;cr=279551" class="statText">[ ratings history ]</a></td>
							</tr>

							<tr valign="top">
								<td class="statText">Total Earnings for All Component Projects*:</td>
								<td class="statText" align="right">$140.00</td>
								<td class="statText"></td>
							</tr>

							<tr valign="top">
								<td class="statText">Review Board Score for this Project:</td>
								<td class="statText" align="right">97.98</td>
								<td class="statText"></td>
							</tr>

							<tr valign="top">
								<td class="statText">Total Submissions for this Project:</td>
								<td class="statText" align="right">1</td>
								<td class="statText"></td>
							</tr>

							<tr><td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" height="5" colspan="4"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr></table></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>
			</table>

			<table border="0" cellspacing="0" cellpadding="10" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%">
				<tr valign="middle">
					<td class="statText" background="/i/steel_darkblue_bg.gif">
						<p><strong>Spell Check:&#160;Design</strong><br />
						The String Component is designed to extend the functionality of the string manipulation methods available in Java.  For more details, check out <a href="http://www.topcodersoftware.com/pages/c_component.jsp?comp=3501906" class="statText">String Class</a> on the TopCoder Software web site.</p>
						
						<p><strong>Review Board Comments</strong><br />
						"This is a fine design and those functions added above and beyond the minimum requirements seem to be useful and well thought out."<a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=273206">&#160;&#151;b0b0b0b</a></p></td>
				</tr>
			</table>

	<!-- Featured Winner Ends -->

	<!-- Design Winners Begins -->
			<table border="0" cellspacing="0" cellpadding="0" background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%">
				<tr><td height="5" colspan="7"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

				<tr valign="middle">
					<td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_gray_bg.gif" class="registerNav" height="18" colspan="5">&#160;&#160;Design Winners</td>
					<td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr valign="middle">
					<td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_bluebv_bg.gif" class="statText" width="32%" height="18">&#160;&#160;Project Name</td>
					<td background="/i/steel_bluebv_bg.gif" class="statText" width="19%" height="18" align="center">&#160;Total&#160;Submissions&#160;</td>
					<td background="/i/steel_bluebv_bg.gif" class="statText" width="19" height="18">Winner&#160;</td>
					<td background="/i/steel_bluebv_bg.gif" class="statText" width="15%" height="18" align="center">&#160;Board&#160;Score&#160;</td>
					<td background="/i/steel_bluebv_bg.gif" class="statText" width="15%" height="18" align="right">&#160;Total&#160;Earnings*&#160;</td>
					<td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr valign="middle">
					<td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td class="statText" height="15">&#160;&#160;<a href="http://www.topcodersoftware.com/pages/c_component.jsp?comp=3304435" class="statText">File System Search</a></td>
					<td class="statText" height="15" align="center">1</td>
					<td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=251162" class="coderTextGreen"><strong>SamBob</strong></a></td>
					<td class="statText" height="15" align="center">84.12</td>
					<td class="statText" height="15" align="right">$210.00&#160;&#160;&#160;&#160;</td>
					<td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td height="3" colspan="7"><img src="/i/clear.gif" alt="" height="3" border="0" /></td></tr>


				<tr><td height="10" colspan="7"><img src="/i/clear.gif" alt="" height="10" border="0" /></td></tr>
	<!-- Design Winners Ends -->
				
	<!-- Development Winners Begins -->
				<tr valign="middle">
					<td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_gray_bg.gif" class="registerNav" height="18" colspan="5">&#160;&#160;Development Winners</td>
					<td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr valign="middle">
					<td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_bluebv_bg.gif" class="statText" width="32%" height="18">&#160;&#160;Project Name</td>
					<td background="/i/steel_bluebv_bg.gif" class="statText" width="19%" height="18" align="center">&#160;Total&#160;Submissions&#160;</td>
					<td background="/i/steel_bluebv_bg.gif" class="statText" width="19" height="18">Winner&#160;</td>
					<td background="/i/steel_bluebv_bg.gif" class="statText" width="15%" height="18" align="center">&#160;Board&#160;Score&#160;</td>
					<td background="/i/steel_bluebv_bg.gif" class="statText" width="15%" height="18" align="right">&#160;Total&#160;Earnings*&#160;</td>
					<td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr valign="middle">
					<td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td class="statText" height="15">&#160;&#160;<a href="http://www.topcodersoftware.com/pages/c_component.jsp?comp=2100060" class="statText">Timer</a></td>
					<td class="statText" height="15" align="center">2</td>
					<td class="statText" height="15"><a href="/stat?c=member_profile&amp;cr=266149" class="coderTextYellow"><strong>akhil_bansal</strong></a></td>
					<td class="statText" height="15" align="center">97.71</td>
					<td class="statText" height="15" align="right">$450.00&#160;&#160;&#160;&#160;</td>
					<td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td height="5" colspan="7"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>

				<tr valign="middle">
					<td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td class="statTextSmall" height="18" colspan="5">&#160;&#160;* Total Earnings for all Component Projects (before royalties)<br />&#160;&#160;</td>
					<td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr><td height="5" colspan="7"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>
			</table>
	<!-- Development Winners Ends -->
				
			<table border="0" cellspacing="0" cellpadding="0" background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%">
				<tr valign="top">
					<td background="" bgcolor="#CCCCCC" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="8" border="0" /></td>
					<td width="14"><img src="/i/table_mid_left2x.gif" alt="" width="14" height="8" border="0" /></td>
					<td width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
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

</BODY>
</html>
	</xsl:template>
</xsl:stylesheet>

