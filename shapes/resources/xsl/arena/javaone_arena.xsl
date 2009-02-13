<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../script.xsl"/>
<xsl:import href="arenaApplet.xsl"/>
<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
<xsl:template match="/">
<html>
  <head>
    <title>Competition Arena</title>
        <xsl:call-template name="CSS"/>
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
  </head>
  <body bgcolor="#CCCCCC" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" onLoad="focus()">
    <table border="0" cellpadding="0" cellspacing="0" width="290" align="center">
      <tr>
        <td>
          <img border="0" height="8" width="1" src="/images/spacer.gif"/>
        </td>
      </tr>
      <tr>
        <td class="bodyText">
          <font size="3">
            <b>Competition Arena</b>
          </font>
        </td>
      </tr>
      <tr>
        <td>
          <img border="0" height="12" width="1" src="/images/spacer.gif"/>
        </td>
      </tr>
      <tr>
        <td class="bodyText">
              This page should present you with a button to start the competition arena applet.<br/><br/>
              NOTE: If a red button to "Load Competition Arena" does <b>not</b> appear below,
              you may not have the appropriate Plug-in software installed.
              <SCRIPT type="text/javascript">
                <![CDATA[function getReq(){u='\?t=support&amp;c=software_req';window.open(u);close();}]]>
              </SCRIPT><BR/>
              <a href="Javascript:getReq()">
                Click here for more information &gt;&gt;
              </a>
        </td>
      </tr>
      <tr>
        <td valign="top"><img height="20" width="1" src="/images/spacer.gif"/></td>
      </tr>
      <tr>
        <td align="center" class="bodyText">
          <xsl:call-template name="ArenaApplet">
            <xsl:with-param name="host">www.topcoder.com</xsl:with-param>
            <xsl:with-param name="port">6001</xsl:with-param>
            <xsl:with-param name="tunnel">http://arena2.topcoder.com/servlet/com.topcoder.utilities.HTTPTunnelling.Tunnel?host=listener+port=6001</xsl:with-param>
            <xsl:with-param name="companyName">SunPractice</xsl:with-param>
          </xsl:call-template><br/><br/>
          <b>You may minimize this browser window, but do not close it.</b>
          Doing so will close the applet.
        </td>
      </tr>
    </table>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>
