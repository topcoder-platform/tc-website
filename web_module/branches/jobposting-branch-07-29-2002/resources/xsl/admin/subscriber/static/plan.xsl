<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="../css.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:import href="../form.xsl"/>
<xsl:import href="../foot.xsl"/>
<xsl:import href="../tab.xsl"/>
<xsl:import href="../announce.xsl"/>
<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>

<xsl:template match="/">
  <html>
    <head>
      <title>TopCoder Subscriber Benefits</title>
      <xsl:call-template name="CSS"/>
    </head>
    <body bgcolor="#cccccc" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">
   
      <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td width="20"><img src="/images/spacer.gif" width="20" height="1" border="0" alt="0" /></td>
          <td width="100%"><img src="/images/spacer.gif" width="735" height="1" border="0" alt="0" /></td>
          <td width="20"><img src="/images/spacer.gif" width="20" height="1" border="0" alt="0" /></td>
        </tr>
        <tr>
          <td colspan="3" valign="top" align="left">
            <xsl:call-template name="Top_LO"/>
             <xsl:call-template name="NavForm"/>
          </td>
        </tr> 
        <tr bgcolor="#cccccc">
          <td><img src="/images/spacer.gif" width="20" height="1" border="0" alt="0" /></td>
          <td><img src="/images/spacer.gif" width="1" height="1" border="0" alt="0" /></td>
          <td><img src="/images/spacer.gif" width="20" height="1" border="0" alt="0" /></td>
        </tr>
        <tr bgcolor="#cccccc">
          <td><img src="/images/spacer.gif" width="20" height="1" border="0" alt="0" /></td>
          <td valign="top" align="left">





            <!--begin inner body table-->
            <table cellspacing="0" cellpadding="0" border="0" width="100%">
              <tr bgcolor="#cccccc">
                <td width="4"><img src="/images/spacer.gif" width="4" height="4" border="0" alt="0" /></td>
                <td widt="100%"><img src="/images/spacer.gif" width="727" height="4" border="0" alt="0" /></td>
                <td width="4"><img src="/images/spacer.gif" width="4" height="4" border="0" alt="0" /></td>
              </tr>
              <tr bgcolor="#cccccc">
                <td><img src="/images/spacer.gif" width="4" height="4" border="0" alt="0" /></td>
                <td valign="top" align="left">
                <!--begin tab navigation-->
                  <table cellspacing="0" cellpadding="0" border="0">
                    <tr bgcolor="#cccccc">
                      <xsl:call-template name="Overview_I"/>
                      <xsl:call-template name="Benefit_I"/>
                      <xsl:call-template name="Plan_A"/>
                      <xsl:call-template name="Request_I"/>
                    </tr>
                  </table>
                  <!--end tab navigation-->
                </td>
                <td><img src="/images/spacer.gif" width="4" height="4" border="0" alt="0" /></td>
              </tr>
              <tr bgcolor="#cccccc">
                <td><img src="/images/tl_wc.gif" width="4" height="4" border="0" alt="0" /></td>
                <td bgcolor="#ffffff"><img src="/images/spacer.gif" width="727" height="4" border="0" alt="0" /></td>
                <td><img src="/images/tr_wc.gif" width="4" height="4" border="0" alt="0" /></td>
              </tr>
              <tr bgcolor="#ffffff">
                <td><img src="/images/spacer.gif" width="4" height="4" border="0" alt="0" /></td>
                <td><img src="/images/spacer.gif" width="4" height="4" border="0" alt="0" /></td>
                <td><img src="/images/spacer.gif" width="4" height="4" border="0" alt="0" /></td>
              </tr>
              <tr bgcolor="#ffffff">
                <td><img src="/images/spacer.gif" width="4" height="4" border="0" alt="0" /></td>
                <td align="center" valign="top">
                  <!--begin main table content-->
                  <table cellspacing="0" cellpadding="0" border="0" width="100%">
                  <tr>
                    <td width="15"><img src="images/spacer.gif" width="15" height="11" border="0" alt="0" /></td>
                    <td width="100%"><img src="images/spacer.gif" width="507" height="2" border="0" alt="0" /></td>
                    <td width="20"><img src="images/spacer.gif" width="20" height="2" border="0" alt="0" /></td>
                    <td width="170"><img src="images/spacer.gif" width="170" height="2" border="0" alt="0" /></td>
                    <td width="15"><img src="images/spacer.gif" width="15" height="2" border="0" alt="0" /></td>
                  </tr>
                  <tr>
                    <td><img src="images/spacer.gif" width="2" height="2" border="0" alt="0" /></td>
                    <td valign="top">
                    <font face="arial, verdana, helvetica, sans-serif" size="2" bgcolor="#000000">
                    Because access requirements vary from company to company, TopCoder has structured a
                    multi-tiered solution that offers exceptional value to every participant. Regardless of
                    your level of affiliation with TopCoder, you gain a true competitive advantage: privileged
                    access to a densely populated, highly qualified pool of programmers.<br />
                    <br />
                    <ul>
                    <li>
                    <b>Tier I - Basic Membership</b><br />
                    Companies have full access to the TopCoder database for an extended period of time.
                    This tier is especially useful for organizations seeking market reference information
                    on demographics, trends, etc. Access to competition participant information is limited to
                    competition aliases only.
                    </li>
                    <br />
                    <li>
                    <b>Tier II - Enhanced Membership</b><br />
                    In addition to the features of a basic membership, this membership offers the
                    ability to define and personally contact a set number of job-seeking programmers
                    for an extended period.
                    </li>
                    <br />
                    <li>
                    <b>Tier III - Co-Sponsor Membership</b><br />
                    Consider this level of participation for greater visibility, access to competitors'
                    contact information, and promotional exposure. This level includes all the
                    benefits of the previous levels, plus advertisement space in the TopCoder Tournament Program, TopCoder
                    Web site links, co-branding opportunities and signage at tournaments.
                    </li>
                    </ul>
                    <br />
                    <b>Ad-hoc Database Access for non-members</b><br />
                    Non-member organizations may pay for one-time database access that includes competition
                    results by field and rating.  This limited access may be useful for research
                    and information gathering. Contact information with event participants is not provided.<br />
                    For further information, about corporate participation, contact (telephone number to come).
                    <br />
                    <br />
                    <br />
                    </font>
                    </td>
                    <td><img src="images/spacer.gif" width="20" height="2" border="0" alt="0" /></td>
                    <td valign="top">
                      <xsl:call-template name="PlanAnnounce"/>
                    </td>
                    <td><img src="images/spacer.gif" width="2" height="2" border="0" alt="0" /></td>
                  </tr>
                  </table>
                  <!--end main table content-->
                </td>
                <td><img src="/images/spacer.gif" width="4" height="4" border="0" alt="0" /></td>
              </tr>
              <xsl:call-template name="Foot"/>
            </table>
            <!--end inner body table-->
          
          
          
          
          </td>
          <td><img src="/images/spacer.gif" width="20" height="1" border="0" alt="0" /></td>
        </tr>
      </table> 
    </body>
  </html>
</xsl:template>


</xsl:stylesheet>
