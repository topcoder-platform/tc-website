<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="modules/practice_room.xsl"/>
  <xsl:import href="modules/calendar.xsl"/>
  <xsl:import href="modules/my_stats.xsl"/>
  <!-- <xsl:import href="../includes/modules/module_login.xsl"/> -->   
  <xsl:template name="pr_right_col">
            <img src="/i/clear.gif" width="170" height="10" alt="" border="0" /><br />
            
            <xsl:call-template name="calendar"/>
            
            <img src="/i/clear.gif" width="170" height="10" alt="" border="0" /><br />
            
            <table width="170" border="0" cellpadding="6" cellspacing="0" class="sidebarBox">
                <tr><td class="sidebarTitle" width="100%"><strong>PR Contact</strong></td></tr>
                <tr valign="top">
                    <td class="sidebarText" width="100%">
                        <p>Jessica Ann Morris<br />
                        FitzGerald Communications<br />
                        617.585.2227<br />
                        <A href="mailto:jmorris@fitzgerald.com">jmorris@fitzgerald.com</A></p>
                    </td>
                </tr>
            </table>

  </xsl:template>
</xsl:stylesheet>
