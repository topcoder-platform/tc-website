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
                      <xsl:call-template name="Benefit_A"/>
                      <xsl:call-template name="Plan_I"/>
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
                        <td width="15"><img src="/images/spacer.gif" width="15" height="11" border="0" alt="0" /></td>
                        <td width="100%"><img src="/images/spacer.gif" width="507" height="2" border="0" alt="0" /></td>
                        <td width="20"><img src="/images/spacer.gif" width="20" height="2" border="0" alt="0" /></td>
                        <td width="170"><img src="/images/spacer.gif" width="170" height="2" border="0" alt="0" /></td>
                        <td width="15"><img src="/images/spacer.gif" width="15" height="2" border="0" alt="0" /></td>
                      </tr>
                      <tr>
                        <td><img src="/images/spacer.gif" width="2" height="2" border="0" alt="0" /></td>
                        <td valign="top">
                        <font face="arial, verdana, helvetica, sans-serif" size="2" bgcolor="#000000">
                          <b>Teaming up with TopCoder benefits your company</b><br />
                          Companies position themselves favorably in the eyes of the programming
                          community when they sponsor the TopCoder competitions. As a TopCoder partner,
                          your company enjoys many advantages:<br />
                          <ul>
                            <li>Access to the highly concentrated pool of the best programmers.</li>
                            <br />
                            <li>
                              Aggregated rating information designed to help identify and sort
                              programmers with required skill levels.
                            </li>
                            <br />
                            <li>A more cost-effective approach to recruiting and hiring top quality employees.</li>
                            <br />
                            <li>
                              Co-branding with TopCoder, a company held in high and growing esteem in the
                              programmer community.
                            </li>
                            <br />
                            <li>
                              Valuable tools for market research to help you evaluate positioning
                              alternatives and obtain recruitment information.
                            </li>
                            <br />
                            <li>
                              Gain a new avenue to advertise, communicate and personally reach the
                              programmer audience, with significant opportunities for favorable publicity.
                            </li>
                            <br />
                            <li>
                              Your company can become a positive newsmaker that encourages programmer
                              development and recognizes achievement.
                            </li>
                          </ul>
                          <br /><br />
                          </font>
                        </td>
                        <td><img src="/images/spacer.gif" width="20" height="2" border="0" alt="0" /></td>
                        <td valign="top">
                          <xsl:call-template name="BenefitAnnounce"/>
                        </td>
                        <td><img src="/images/spacer.gif" width="2" height="2" border="0" alt="0" /></td>
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
