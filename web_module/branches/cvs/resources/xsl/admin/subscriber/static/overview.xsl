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
      <title>TopCoder Subscriber Overview</title>
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
          <td height="100%"><img src="/images/spacer.gif" width="20" height="1" border="0" alt="0" /></td>
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
                      <xsl:call-template name="Overview_A"/>
                      <xsl:call-template name="Benefit_I"/>
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
                          <b>Investment.  Return.</b><br />
                          It's a simple relationship that gets complicated quickly.  Variables such as efficiency
                          can increase investment while decreasing return.  TopCoder has a tool for managing two
                          of these variables:  marketing and human resources.
                          <br />
                          <dl>
                          <dd>
                          <b>Employment.</b><br />
                          Efficiency is important in recruitment, selection, placement and development.
                          You need to find the best programmers quickly, assess their talents and determine
                          who best fits your needs. TopCoder draws the best talent to one place, pits them
                          against each other in competition and records their strengths in the form of a rating.<br />
                          </dd>
                          <br />
                          <dd>
                          <b>Marketing.</b><br />
                          Getting the most for your marketing dollar is all about how tightly you can target
                          your market and how effectively you can communicate your message.  If you're looking
                          for top programmers, TopCoder can give you both.  Our member base is a densely populated
                          group of professionals and college students, all of whom are tops in their field.
                          We can provide you with the means to access them.
                          </dd>
                          </dl>
                          <br />
                          <b>Performance.  Credibility.</b><br />
                          Investing in TopCoder for marketing and/or employment returns is the right approach.
                          Our competitions serve to attract and retain a highly desirable group of coders;
                          our rating system differentiates them for you.
                          <br /><br /><br />
                        </font>
                      </td>
                      <td><img src="/images/spacer.gif" width="20" height="2" border="0" alt="0" /></td>
                      <td valign="top">
                        <xsl:call-template name="OverviewAnnounce"/>
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
