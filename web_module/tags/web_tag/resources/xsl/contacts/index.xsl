<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/contacts/public_contacts_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="Preload"/>      
        <title>TopCoder :: Contacts</title>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </head>
      <body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<table width="100%" height="69%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
	<tr>
<!-- Left Column Begins -->
		<td width="170" bgcolor="#CCCCCC" valign="top">
			<xsl:call-template name="public_contacts_left"/>
		</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
		<td width="4" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="4" height="8" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
		<td class="bodyText" width="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="240" height="1" vspace="5" border="0"/><br/>
			<xsl:call-template name="BodyTop">
				<xsl:with-param name="image1">white</xsl:with-param>
				<xsl:with-param name="image">contacts</xsl:with-param>
				<xsl:with-param name="title">&#160;</xsl:with-param>
			</xsl:call-template>
			
			<table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" width="100%">
				<tr>
					<td valign="top" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
					<td class="bodyText" colspan="2" valign="top" bgcolor="#FFFFFF" width="100%">
						<img src="/i/clear.gif" alt="" width="240" height="1" border="0"/>
						
						<p class="bodyText">TopCoder is dedicated to servicing members, partnering companies, the media and anyone else interested in what 
						TopCoder is about. Please contact the appropriate individuals below for more information or assistance.</p>
						
						<div align="center">
						<table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr valign="top">
								<td colspan="3" class="bodyText">
									<p><strong>Please direct general questions or concerns to</strong></p>
									
									<p>TopCoder, Inc.<br/>
									703 Hebron Avenue<br/>Glastonbury, CT 06033 U.S.A.<br/>
									Phone: 860.633.5540<br/>Fax: 860.657.4276<br/>
									Email:<a href="mailto:service@topcoder.com" class="bodyText">TopCoder General Inbox</a></p>
									
									<p><strong><a href="mailto:mlydon@topcoder.com" class="bodyText">NEED TECH SUPPORT?</a></strong></p>
							
									<p><strong>Questions regarding sponsorships, membership, employment services and technology</strong></p></td>
							</tr>
							
							<tr valign="top">
								<td width="50%" align="left" class="bodyText">
									<a href="mailto:dvaughn@topcoder.com" class="bodyText">Sponsorship Sales</a><br/>
									Drew Vaughn, VP of Sales<br/>
									Corporate Office<br/>
									703 Hebron Avenue<br/>
									Glastonbury, CT 06033<br/>
									ph: 860.633.5540<br/>
									fx: 860.657.4276</td>
									
								<td width="50%" align="left" class="bodyText">
									<a href="mailto:mlydon@topcoder.com" class="bodyText">Competition Applet/Website</a><br/>
									Mike Lydon, CTO<br/>
									Corporate Office<br/>
									703 Hebron Avenue<br/>
									Glastonbury, CT 06033<br/>
									ph: 860.633.5540<br/>
									fx: 860.657.4276</td>
							</tr>

							<tr valign="top">
								<td width="50%" align="left" class="bodyText">
									<a href="mailto:tlongo@topcoder.com" class="bodyText">Membership/College Relations</a><br/>
									Tom Longo, VP of Membership<br/>
									Corporate Office<br/>
									703 Hebron Avenue<br/>
									Glastonbury, CT 06033<br/>
									ph: 860.633.5540<br/>
									fx: 860.657.4276</td>
									
								<td width="50%" align="left" class="bodyText">
									<a href="mailto:tces@topcoder.com" class="bodyText">Employment Services</a><br/>
									Paul Moriarty, Director of Employment Services<br/>
									Corporate Office<br/>
									703 Hebron Avenue<br/>
									Glastonbury, CT 06033<br/>
									ph: 860.633.5540<br/>
									fx: 860.657.4276</td>
							</tr>
						</table>
					</div>
					</td>
				
					<td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
				</tr>

				<tr><td colspan="4" valign="top" bgcolor="#FFFFFF" width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>   	
			
				<tr>
					<td valign="top" bgcolor="#CCCCCC" width="11" align="right"><img src="/i/clear.gif" alt="" width="11" height="8" border="0"/></td>
					<td valign="top" width="75"><img src="/i/table_mid_left2.gif" alt="" width="14" height="8" border="0"/></td>
					<td valign="top" bgcolor="#FFFFFF" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
					<td valign="top" bgcolor="#CCCCCC" width="10"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
				</tr>	

				<tr>
					<td valign="top" width="11" align="right" bgcolor="#CCCCCC"><img src="/i/clear.gif" alt="" width="11" height="8" border="0"/></td>
					<td valign="top" bgcolor="#CCCCCC" width="14"><img src="/i/table_btm_left2.gif" alt="" width="14" height="8" border="0"/></td>
					<td valign="top" bgcolor="#CCCCCC" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
					<td valign="top" bgcolor="#CCCCCC" width="10"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
				</tr>
			</table>
		</td>
<!-- Center Column Ends -->

<!-- Gutter -->
		<td width="4" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
		<td width="170" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
			<xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
		<td width="25" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="25" height="1" border="0"/></td>
<!-- Gutter Ends -->
	</tr>
</table>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
