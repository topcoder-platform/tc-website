<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../includes/modules/srm_dates.xsl"/>
  <xsl:import href="../includes/modules/tc_updates2.xsl"/>
  <xsl:import href="../includes/modules/white_last_srm.xsl"/>
  <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
  <xsl:import href="../includes/modules/quick_stats_tidbit.xsl"/>
  <xsl:import href="../includes/modules/countries2.xsl"/>
  <xsl:import href="../includes/modules/intro.xsl"/>
  <xsl:import href="../includes/modules/coder_week2.xsl"/>
  <xsl:import href="../includes/modules/top_10_coders2.xsl"/>
  <xsl:import href="../includes/modules/top_10_schools.xsl"/>
  <xsl:import href="../includes/modules/round_table.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/module_login.xsl"/>
  <xsl:import href="../includes/modules/arena2.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/editorials.xsl"/>
  <xsl:import href="../includes/modules/simple_search.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template name="PublicBody">

<!-- Body Begins -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
	<tr>
		<td valign="top" colspan="3"><img src="/i/clear.gif" width="1" height="1" border="0"/><br />
<!-- SRM Promo Begins -->

<!-- SRM Promo Ends -->
		</td>

		<td width="1" rowspan="2" bgcolor="#FFFFFF"><img src="/i/clear.gif" width="1" height="1" border="0"/></td>
    <!-- Gutter Ends -->
		</tr>

<!-- Left Column Begins -->
		<tr>
			<td width="170" bgcolor="#000000" valign="top"><!-- <IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0" VSPACE="5"><br /> -->
<xsl:call-template name="global_left"/>

				<img src="/i/logo_ghosted_bracket.gif" width="160" height="77" border="0" alt="[ TopCoder ]" vspace="5"/><br />
<!-- Do Not Delete This Line --><font size="1" color="#000000" face="tahoma">HiddenWord</font>
			</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
			<td width="1" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="1" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
			<td width="100%" valign="top" align="center" bgcolor="#FFFFFF"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/><br />

				<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
					<tr>
						<td valign="top" width="1"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
						<td valign="top" width="1" bgcolor="#000000"><a href="/?&amp;t=tournaments&amp;c=tccc03_sched"><img src="/i/tournament/tccc03/tccc03_home.gif" alt="" width="138" height="90" border="0"/></a></td>
						<td valign="top" bgcolor="#000000" class="statText"><br />
							<strong>When:</strong> Feb. 18th - April 5th, 2003<br />
							<strong>Where:</strong> the University Park Hotel @ MIT in Cambridge, MA<br />
							<strong>Total Purse:</strong> $100,000<br /><br />
							<font color="#CC0000"><strong>200 TopCoder Members will win money!</strong></font><br />
							<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tccc03_sched</xsl:attribute>Click here</a> for more information.<br /><br />
						</td>
						<td valign="top" width="1"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
					</tr>
				</table>

<!-- Summary/Best/Worst Begins -->
				<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
					<tr>
						<td valign="middle" bgcolor="#FFFFFF" width="184"><img src="/i/label_srm_summary.gif" alt="Last Match Summary" width="184" height="26" hspace="5" border="0" align="left"/></td>
						<td width="100%" bgcolor="#FFFFFF"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
					</tr>
				</table>

				<table border="0" cellspacing="1" cellpadding="0" width="100%" bgcolor="#FFFFFF">
					<tr>
						<td valign="top" width="4"><img src="/i/clear.gif" alt="" width="4" height="1" border="0"/></td>
						<td valign="top" colspan="3" class="bodyText"><a class="bodyGeneric">
							<xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute><strong>Single Round Match 131</strong></a><br />
							Thursday, January 30, 2003<br /><br />
						</td>
						<td valign="top" width="6"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>
					</tr>

					<tr>
						<td valign="top" width="4"><img src="/i/clear.gif" alt="" width="4" height="1" border="0"/></td>
						<td valign="middle" align="center" bgcolor="#CCCCCC" width="33%" nowrap="0" height="15">
							<a class="bodyGeneric">
<xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#leaders</xsl:attribute>
							Div. Leaders</a>
						</td>
						<td valign="middle" align="center" bgcolor="#CCCCCC" width="43%" nowrap="0">
							<a class="bodyGeneric">
<xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#problem_stats</xsl:attribute>
							Problem Stats</a>
						</td>
						<td valign="middle" align="center" bgcolor="#CCCCCC" width="23%" nowrap="0">
							<a class="bodyGeneric">
<xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute>
							Results</a>
						</td>
						<td valign="top" width="6"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>
					</tr>
				</table>

				<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
					<tr>
						<td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
						<td valign="middle" class="statText" width="100%">
							<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#001935">
								<tr><td valign="middle" height="17" align="center" colspan="5" class="statTextBig" background="/i/steel_bluebv_bg.gif">Best/Worst Rating Change</td></tr>
								<tr><td colspan="5" bgcolor="#FFFFFF"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>
<xsl:for-each select="/TC/HOME/GainersAndLosers/Coder">
								<tr>
									<td height="14" valign="middle" width="20%" class="statTextBig" nowrap="0">&#160;&#160;&#160;<xsl:value-of select="division"/></td>
									<td valign="middle" width="10%" class="statText">&#160;&#160;<xsl:value-of select="change_type"/>:</td>
									<td valign="middle" width="35%" class="statText" nowrap="0">&#160;&#160;
										<a>
<xsl:attribute name="HREF">stat?c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
<xsl:attribute name="CLASS">bodyText</xsl:attribute>
										<font>
<xsl:attribute name="color">
	<xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template>
</xsl:attribute>
<xsl:value-of select="handle"/>
										</font></a>
									</td>
									<td valign="middle" width="15%" class="statText" align="center"><xsl:value-of select="change"/></td>
									<td valign="middle" width="20%" class="statText" nowrap="0">&#160;<xsl:value-of select="room_name"/></td>
								</tr>
</xsl:for-each>
								<tr><td colspan="5" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="1" height="6" border="0"/></td></tr>
							</table>
						</td>
						<td valign="top" width="6"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>
					</tr>

					<tr><td colspan="3" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="1" height="8" border="0"/></td></tr>
				</table>
<!-- Summary/Best/Worst Ends -->

<!-- Coder Point of View Begins -->
<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
  <tr><td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="8" border="0"/></td>
      <td valign="top" colspan="7"><img src="/i/label_coder_view.gif" alt="Coder's Point of View" width="148" height="26" border="0"/></td>
      <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
  </tr>
  <tr>
    <td valign="top" width="8" rowspan="2"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
    <td valign="top" width="55" align="left" class="bodyText" rowspan="2"><img src="/i/m/brett1479_mug.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1"/><br />
    By&#160;brett1479<br /><i>[TC]&#160;Member</i><br /></td>
    <td valign="top" width="8" rowspan="2"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
    <td valign="top" width="100%" align="left" class="bodyText" colspan="2">
    <font size="2" color="#000000" face="tahoma, verdana"><strong>SRM 131</strong></font>
    </td>
  </tr>
  <tr>
    <td valign="top" class="bodyText" width="100%">
	<a class="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm131_prob</xsl:attribute>
        <strong>Problem Set Analysis &amp; Opinion</strong>
      </a><br />

<p>
    With the Collegiate Championship only a few weeks down the road,
    competition attendance is growing steadily.  Over 400 coders registered
    for SRM 131 including top ranked competitors Yarin, John Dethridge,
    SnapDragon, and ZorbaTHut.  Competition was fierce, with the top scoring
    spot changing hands multiple times in the coding, challenge, and system
    test phases.  In the end, Yarin prevailed with SnapDragon and John Dethridge
    close behind....
 <a class="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm131_prob</xsl:attribute>Get the analysis</a>
</p>
    </td>
    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
  </tr>
  <tr><td valign="top" colspan="9"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
  <tr>
    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
    <td valign="top" width="100%" colspan="7" bgcolor="#43515E"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
  </tr>
  <tr><td valign="top" colspan="8"><img src="/i/clear.gif" alt="" width="1" height="4" border="0"/></td></tr>
</table>
<!-- End of Point of View -->

<!-- Feature -->
<table border="0" cellspacing="1" cellpadding="0" width="100%" bgcolor="#FFFFFF">
  <tr>
    <td valign="top" width="5" rowspan="2"><img src="/i/clear.gif" alt="" width="5" height="1" border="0"/></td>
    <td valign="middle" width="40%" bgcolor="#FFFFFF" height="26"><img src="/i/label_feat.gif" alt="Weekly Feature" width="184" height="26" border="0"/></td>
    <td width="60%" bgcolor="#FFFFFF"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
    <td valign="top" width="7" rowspan="2"><img src="/i/clear.gif" alt="" width="7" height="1" border="0"/></td>
  </tr>
  <tr>
    <td valign="middle" bgcolor="#CCCCCC" align="center" height="15">
      <a class="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=index</xsl:attribute>
        Upcoming/Past Features
      </a>
    </td>
    <td valign="middle" bgcolor="#CCCCCC" align="center"> <a class="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_topics</xsl:attribute>Want to write?</a></td>
  </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
  <tr>
    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
    <td valign="top" width="55" align="left" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/><br />
<!-- <IMG SRC="/i/f/feat_050102_tn2.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/> -->
<!-- <img src="/i/m/the_gigi_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1"/> --><br />
By&#160;the_gigi<br /><i>[TC] Member</i><br /><br />
<a href="/?&amp;t=features&amp;c=feat_topics"><img src="/i/writers_wanted.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="15"/></a></td>
    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
    <td valign="top" width="100%" align="left" class="bodyText"><br />
<a class="bodyGeneric">
  <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_012203</xsl:attribute>
  <strong>Who needs another UI framework?</strong></a><br />
<i>Unorthodox UI Framework</i><br />
Wednesday, January 22, 2003<br />

<p>
The time is 1999. The internet hype is high and we were out to conquer the
world. The killer app was a chat-on-page service that allows users who surf
the web to see who else is on the same page and interact with them. The
architecture was a classic client-server. The client had to be magnificent
of course to capture the hearts and souls of the billions of users. A
strategic decision we made was that  one of our competitive advantages will
be a user interface that has never been seen before...<a class="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_012203</xsl:attribute>full&#160;story</a></p>
  </td>
    <td valign="top" width="7"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
  </tr>
  <tr><td valign="top" colspan="5"><img src="/i/clear.gif" alt="" width="1" height="12" border="0"/></td></tr>
  <tr>
  <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
  <td valign="top" bgcolor="#43515E" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
  <td valign="top" width="7"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
  </tr>
</table>

 <!-- Coder of the Week Begins -->
   <!-- <xsl:call-template name="coder_week"/> -->
<!-- Coder of the Week Ends -->
<xsl:call-template name="tc_updates"/>
<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
  <tr><td valign="top" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="2" border="0"/></td></tr>
  <tr>
    <td valign="top" width="6"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>
    <td valign="top" width="100%" bgcolor="#CCCCCC"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>
    <td valign="top" width="6"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>
  </tr>
  <tr><td valign="top" colspan="3"><img src="/i/clear.gif" alt="" width="1" height="2" border="0"/></td></tr>
</table>
<xsl:call-template name="arena"/>
<!-- TC special promo -->
<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
  <tr>
    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
    <td valign="top" colspan="3" width="100%" bgcolor="#43515E"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>
    <td valign="top" width="6"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>
  </tr>
  <tr><td valign="top" colspan="5"><img src="/i/clear.gif" alt="" width="1" height="6" border="0"/></td></tr>
  <tr>
    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="26" border="0"/></td>
    <td valign="top" width="50%" align="left" class="bodyText"><font size="2" color="#000000" face="tahoma, verdana"><strong>[TC] Sponsorships</strong></font><br />TopCoder offers sponsorship programs for the weekly
      <a class="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_srm</xsl:attribute>
        Single Round Matches
      </a> as well as for
      <a class="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_tourny</xsl:attribute>Tournaments</a>. Read more about our
      <a class="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_target</xsl:attribute>sponsorship programs</a>.<br /></td>
    <td valign="top" width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0"/></td>
    <td valign="top" width="50%" align="left" class="bodyText"><font size="2" color="#000000" face="tahoma, verdana"><strong>[TC] Employment Services</strong></font><br />TopCoder works with companies to connect them with top-rated developers. Read more about our
      <a class="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>employment services</a>.<br /></td>
    <td valign="top" width="6"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td></tr>
  <tr><td valign="top" colspan="5"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
</table>
		</td>
  <!-- Center Column Ends -->

		<td valign="top" class="statText" width="244"><img src="/i/clear.gif" alt="" width="244" height="1" border="0"/><br />

<!--SRM Sponsor Starts-->
			<img usemap="#srmanimation_home" src="/i/es/srmanimation_home.gif" alt="" width="244" height="160" border="0"/><br />
			<map name="srmanimation_home">
				<area alt="TCES" shape="poly" coords="17,33,17,60,141,60,141,92,228,92,228,25,17,25" href="/?&amp;t=tces&amp;c=index"/>
				<area alt="" shape="poly" coords="229,104,120,105,105,94,11,95,10,120,36,146,229,148" href="/?RoundId=4456&amp;t=schedule&amp;c=srm"/>
			</map>
<!--SRM Sponsor Ends-->

<!-- TCES Quote Begins -->
			<map name="tcesMap">
			<area shape="rect" alt="" coords="33,89,159,104" href="/?t=schedule&amp;c=index"></area>
			<area shape="rect" alt="" coords="3,3,239,23" href="/?t=tces&amp;c=index"></area>
			</map>
			<img src="/i/tces_quote.gif" width="244" height="138" alt="Only rated members can apply for TCES jobs" border="0" usemap="#tcesMap" />
<!-- TCES Quote Ends -->

<!-- Software Promo Begins -->
			<a href="/?&amp;t=development&amp;c=bonus_contest_0303"><img src="/i/tcs_board.gif" alt="TCS" width="244" height="156" vspace="1" border="0"/></a>
<!-- Software Promo Ends -->

<!-- Software Leader Board Begins -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#333333">
				<tr><td height="20" class="moduleTitle"><img src="/i/module_labels_tcs_coders.gif" alt="TopCoder Software Leaders" width="244" height="20" border="0"/></td></tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#001935">
				<tr valign="middle">
					<td width="10" height="15" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="10" height="15" border="0"/></td>
					<td class="statTextBig" background="/i/steel_bluebv_bg.gif">Handle</td>
					<td class="statTextBig" align="right" background="/i/steel_bluebv_bg.gif" nowrap="nowrap">Average Score</td>
					<td width="10" height="15" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="10" height="15" border="0"/></td>
				</tr>

				<tr valign="top">
					<td colspan="4" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
				</tr>

				<tr valign="top">
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
					<td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=279551">scamp</a></td>
					<td class="statText" align="right">97.98</td>
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
				</tr>

				<tr valign="top">
					<td colspan="4" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
				</tr>

				<tr valign="top">
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
					<td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145">srowen</a></td>
					<td class="statText" align="right">88.49</td>
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
				</tr>

				<tr valign="top">
					<td colspan="4" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
				</tr>

				<tr valign="top">
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
					<td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=299180">isv</a></td>
					<td class="statText" align="right">85.48</td>
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
				</tr>

				<tr valign="top">
					<td colspan="4" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
				</tr>

				<tr valign="top">
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
					<td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=251162">SamBob</a></td>
					<td class="statText" align="right">84.12</td>
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
				</tr>

				<tr valign="top">
					<td colspan="4" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
				</tr>

				<tr valign="top">
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
					<td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=150940">orb</a></td>
					<td class="statText" align="right">83.78</td>
					<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
				</tr>

				<tr valign="top">
					<td width="10"><img src="/i/clear.gif" width="10" height="10" border="0"/></td>
					<td width="59%"><img src="/i/clear.gif" width="1" height="10" border="0"/></td>
					<td width="39%"><img src="/i/clear.gif" width="1" height="10" border="0"/></td>
					<td width="10"><img src="/i/clear.gif" width="10" height="10" border="0"/></td>
				</tr>
			</table>
<!-- Software Leader Board Ends -->

			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr><td><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0" valign="top" bgcolor="#001935">
				<tr><td height="17" class="moduleTitle" bgcolor="#333333"><img src="/i/module_labels_10_coders.gif" alt="Competition Leaders" width="244" height="20" border="0"/></td></tr>
				<tr><td><img src="/i/clear.gif" width="1" height="3" border="0"/></td></tr>
			</table>

<xsl:call-template name="top_10_schools"/>
<xsl:call-template name="top_10_coders"/>

			<table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" width="100%">
				<tr>
					<td align="left" class="statText"><img src="/i/clear.gif" width="20" height="4" border="0"/></td>
					<td></td>
					<td></td>
					<td align="left" class="statText"><img src="/i/clear.gif" width="10" height="4" border="0"/></td>
				</tr>

				<tr><td align="center" class="statTextBig" colspan="4">More Leaders</td></tr>

				<tr>
					<td></td>
					<td align="left" class="statText">Coders</td>
					<td align="right"><a href="/stat?c=coder_ratings" class="statText">view all</a></td>
					<td></td>
				</tr>

				<tr>
					<td></td>
					<td align="left" class="statText">Schools</td>
					<td align="right"><a href="/stat?c=school_avg_rating" class="statText">view all</a></td>
					<td></td>
				</tr>

				<tr>
					<td></td>
					<td align="left" class="statText">States</td>
					<td align="right"><a href="/stat?c=state_avg_rating" class="statText">view all</a></td>
					<td></td>
				</tr>

				<tr>
					<td></td>
					<td align="left" class="statText">Countries</td>
					<td align="right"><a href="/stat?c=country_avg_rating" class="statText">view all</a></td>
					<td></td>
				</tr>

				<tr>
					<td align="left" class="statText"><img src="/i/clear.gif" width="20" height="10" border="0"/></td>
					<td></td>
					<td></td>
					<td align="left" class="statText"><img src="/i/clear.gif" width="10" height="10" border="0"/></td>
				</tr>
			</table>

			<table border="0" cellspacing="0" cellpadding="0" width="100%">
				<tr>
					<td align="left" class="statText"><img src="/i/clear.gif" width="20" height="10" border="0"/></td>
					<td></td>
					<td></td>
					<td align="left" class="statText"><img src="/i/clear.gif" width="10" height="10" border="0"/></td>
				</tr>
			</table>

<!-- Statistics Begins -->
			<table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" width="100%">
				<tr><td colspan="3" bgcolor="#333333"><img src="/i/label_quick_stats_home.gif" alt="Statistics" width="244" height="20" border="0" /></td></tr>
				<tr>
					<td rowspan="5"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
					<td><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td>
					<td rowspan="5"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
				</tr>
				<tr><td class="statText">Select a Statistic from the menu below.</td></tr>
				<tr><td><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td></tr>
				<tr><td class="quickstatText" valign="top">

				<xsl:call-template name="quick_stats_pulldown"/>

					</td>
				</tr>
				<tr><td><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td></tr>
			</table>
<!-- Statistics Ends -->

<!-- Coder of the Month Begins -->
			<table border="0" cellspacing="0" cellpadding="0" width="100%">
				<tr><td><a href="/stat?c=member_profile&amp;cr=304168"><img src="/i/codermonth_dec.gif" alt="Coder of the Month" width="244" height="116" vspace="10" border="0" /></a></td></tr>
			</table>
<!-- Coder of the Month ends -->
		</td>
	</tr>
</table>

  </xsl:template>
</xsl:stylesheet>
