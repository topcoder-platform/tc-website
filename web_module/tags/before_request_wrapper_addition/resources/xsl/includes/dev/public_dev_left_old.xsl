<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="../modules/calendar.xsl"/>
	<xsl:template name="public_dev_left">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr valign="top"><td colspan="3" width="170" bgcolor="#CCCCCC"><img src="/i/sub_navbox_top_left.gif" width="25" height="1" alt="" border="0" /><img src="/i/clear.gif" width="145" height="1" alt="" border="0"/></td></tr>
				<tr valign="top">
					<td width="25" bgcolor="#333333" align="right"><img src="/i/sub_navbox_btm_left.gif" width="25" height="21" alt="" border="0"/></td>
					<td width="100%" bgcolor="#333333">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr valign="top"><td colspan="2" width="140" height="1"><img src="/i/clear.gif" width="140" height="1" alt="" border="0"/></td></tr>
							<tr valign="top"><td class="statTextBig" width="5">::&#160;&#160;Development</td><td width="5"><img src="/i/clear.gif" width="5" alt="" border="0"/></td></tr>
							<tr valign="top"><td colspan="2" width="140" height="3"><img src="/i/clear.gif" width="140" height="3" alt="" border="0"/></td></tr>
						</table>
					</td>
					<td width="5" bgcolor="#333333"><img src="/i/sub_nav_title_right.gif" width="5" height="21" alt="" border="0" /></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0" background="/i/steel_gray_bg2.gif" bgcolor="#43515E"> 
				<tr><td colspan="2" background="" height="5"><img src="/i/clear.gif" width="1" height="5" alt="" border="0" /></td><td width="1" background=""><img src="/i/clear.gif" width="1" height="1" alt="" border="0"/></td></tr>

				<tr valign="top"><td class="subNav" background="" align="right">&#160;&#160;::&#160;&#160;</td><td height="15" class="subNav" background="" width="100%"><a href="/?&amp;t=development&amp;c=index" class="subNav">Overview</a></td><td width="1"><img src="/i/clear.gif" width="1" height="1" alt="" border="0" /></td></tr>

				<tr><td colspan="3" background="" height="3"><img src="/i/clear.gif" height="3" alt="" border="0" /></td></tr>

				<tr valign="top"><td class="subNav" background="" align="right">&#160;&#160;::&#160;&#160;</td><td height="15" class="subNav" background="" width="100%"><a href="/?&amp;t=about_tc&amp;c=membr_whyjoin" class="subNav">Coding Competitions</a></td><td width="1"><img src="/i/clear.gif" width="1" height="1" alt="" border="0" /></td></tr>

				<tr><td colspan="3" background="" height="3"><img src="/i/clear.gif" height="3" alt="" border="0" /></td></tr>

				<tr valign="top"><td class="subNav" background="" align="right">&#160;&#160;::&#160;&#160;</td><td height="15" class="subNav" background="" width="100%"><a href="/?&amp;t=development&amp;c=components" class="subNav">Component Development</a></td><td width="1"><img src="/i/clear.gif" width="1" height="1" alt="" border="0" /></td></tr>

				<tr><td colspan="3" background="" height="3"><img src="/i/clear.gif" height="3" alt="" border="0" /></td></tr>

				<tr valign="top"><td class="subNav" background="" align="right">&#160;&#160;::&#160;&#160;</td><td height="15" class="subNav" background="" width="100%"><a href="/?&amp;t=development&amp;c=app_meth" class="subNav">Application Development</a></td><td width="1"><img src="/i/clear.gif" width="1" height="1" alt="" border="0" /></td></tr>

				<tr><td colspan="2" background="" height="5"><img src="/i/clear.gif" width="1" height="5" alt="" border="0" /></td><td width="1" background=""><img src="/i/clear.gif" width="1" height="1" alt="" border="0" /></td></tr>

				<tr><td colspan="3" background="/i/steel_gray_bg.gif" align="right"><img src="/i/sub_navbox_btm_right.gif" width="13" height="17" alt="" border="0"/></td></tr>
			</table>

			<table border="0" cellspacing="0" cellpadding="0">
				<tr><td height="5"><img src="/i/clear.gif" width="5" height="5" alt="" border="0" /></td></tr>
			</table>

			<xsl:call-template name="calendar"/>

			<img src="/i/logo_ghosted_bracket.gif" width="160" height="77" border="0" alt="[ TopCoder ]" vspace="10"/>

  </xsl:template>
</xsl:stylesheet>
