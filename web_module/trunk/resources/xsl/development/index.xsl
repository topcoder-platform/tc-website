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
			<xsl:with-param name="title">&#160;Overview</xsl:with-param>
			</xsl:call-template>
			<table border="0" cellspacing="0" cellpadding="0" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%">
				<tr valign="top">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" colspan="3" height="15"><img src="/i/clear.gif" alt="" width="240" height="15" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr valign="top">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" class="statText" colspan="3" align="center"><strong><img src="/i/development/title_get_with_program.gif" alt="Get With The Program" width="440" height="30" border="0" /></strong></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr valign="top">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" colspan="3" height="15"><img src="/i/clear.gif" alt="" width="240" height="15" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr valign="top">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" class="statText" width="33%" align="center"><a class="statTextSmall" href="/?&amp;t=about_tc&amp;c=membr_whyjoin"><img src="/i/development/diagram_coding.gif" alt="Coding Competitions" width="147" height="111" border="0" /></a></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" class="statText" width="33%" align="center"><a class="statTextSmall" href="/?&amp;t=development&amp;c=components"><img src="/i/development/diagram_comp.gif" alt="Component Development" width="147" height="111" border="0" /></a></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" class="statText" width="33%" align="center"><a class="statTextSmall" href="/?&amp;t=development&amp;c=app_meth"><img src="/i/development/diagram_app.gif" alt="Application Development" width="147" height="111" border="0" /></a></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr valign="top">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" class="statText" width="33%" align="center"><a class="statTextSmall" href="/?&amp;t=about_tc&amp;c=membr_whyjoin"><img src="/i/development/caption_coding.gif" alt="Coding Competitions" width="147" height="18" border="0" /></a></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" class="statText" width="33%" align="center"><a class="statTextSmall" href="/?&amp;t=development&amp;c=components"><img src="/i/development/caption_comp.gif" alt="Component Development" width="147" height="18" border="0" /></a></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" class="statText" width="33%" align="center"><a class="statTextSmall" href="/?&amp;t=development&amp;c=app_meth"><img src="/i/development/caption_app.gif" alt="Application Development" width="147" height="18" border="0" /></a></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>

				<tr valign="top">
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" colspan="3" height="20"><img src="/i/clear.gif" alt="" width="240" height="20" border="0" /></td>
					<td background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
				</tr>
			</table>
				
			<table border="0" cellspacing="0" cellpadding="10" background="/i/steel_darkblue_bg.gif" bgcolor="#000033" width="100%">
				<tr valign="top">
					<td width="100%" background="/i/steel_darkblue_bg.gif">
						<table border="0" cellspacing="0" cellpadding="10" bgcolor="#333333">
							<tr valign="top"><td class="devSubhead">3 great opportunities to earn money and recognition</td></tr>

							<tr valign="top">
								<td class="statText">
									<p><strong>Coding Competitions</strong><br />
									<a class="statText" href="/?&amp;t=about_tc&amp;c=membr_whyjoin">TopCoder Coding Competitions</a> attract the best programmers in the US and soon, the world. At each Single Round Match, 
									members compete against the clock, and each other. The winner of each match adds points to their rating. The more a 
									member competes, the better their rating can become. Ratings determine the initial elimination field for either the 
									yearly TopCoder Invitational Tournament or Collegiate Challenge. The purse for these tournaments ranges anywhere 
									from $100,000 to $250,000. <a class="statText" href="/?&amp;t=about_tc&amp;c=membr_whyjoin"><strong>&#160;::&#160;Read more</strong></a></p>

									<p><strong>Component Development</strong><br />
									Rated TopCoder members are eligible to participate in <a class="statText" href="/?&amp;t=development&amp;c=components">TopCoder Component Development</a>. Members submit design and 
									development solutions for these challenging and potentially lucrative projects. Winning solutions are rewarded with 
									cash payouts and royalties. For every commercial sale, TopCoder will pay the members who designed and developed the 
									component a percentage of the sale. <a class="statText" href="/?&amp;t=development&amp;c=components"><strong>&#160;::&#160;Read more</strong></a></p>

									<p><strong>Application Development</strong><br />
									Rated members with a winning track record of solutions attain Level II TopCoder Developer status. Level II developers 
									are eligible for <a class="statText" href="/?&amp;t=development&amp;c=app_meth">TopCoder Application Development</a> teams. Team members customize and integrate components for 
									specific applications, both internal to TopCoder and for commercial sale. These projects pay out higher cash amounts 
									than Commercial Component Development, and royalties are paid to team members for every commercial sale of the 
									application. <a class="statText" href="/?&amp;t=development&amp;c=app_meth"><strong>&#160;::&#160;Read more</strong></a></p>
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

