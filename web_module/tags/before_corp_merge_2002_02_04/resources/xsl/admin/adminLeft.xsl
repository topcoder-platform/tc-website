<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="adminButtons.xsl"/>


<xsl:template name="LeftSideNavBarForm">
  <SCRIPT type="text/javascript"><![CDATA[
  var contactSubjectId='6'
  function doSubmitNavBar(task, command){
    document.frmNavBar.Task.value=task;
    document.frmNavBar.Command.value=command;
    nav=window.navigator;
    document.frmNavBar.AppName.value=nav.appName;
    document.frmNavBar.AppVersion.value=nav.appVersion;
    document.frmNavBar.UserAgent.value=nav.userAgent;
    if (task=="authentication" || task=="registration") {
      document.frmNavBar.action = "http"+document.frmNavBar.formActionURL.value
    } else {
        document.frmNavBar.action = "http"+document.frmNavBar.formActionURL.value
    }
    document.frmNavBar.ContactSubjectId.value=contactSubjectId;
    document.frmNavBar.submit();
  }
  function setContactSubject(id) {
    //id 2 = 'Forum Ideas'
    //id 3 = 'Contest Ideas'
    //id 4 = 'Bugs or Problems'
    //id 5 = 'Survey Ideas'
    //id 6 = 'General Comments or Questions'
    //id 7 = 'Sponsor Relations'
    //navBar.ContactSubjectId.value=id;
    contactSubjectId=id;
  }
  ]]></SCRIPT>
  <form name="frmNavBar" method="POST" action="formActionURL">
    <input type="hidden" name="formActionURL">
      <xsl:attribute name="VALUE"><xsl:value-of select="/ADMIN/PostURL"/></xsl:attribute>
    </input>
    <input type="hidden" name="Task" VALUE=""/>
    <input type="hidden" name="Command" VALUE=""/>
    <input type="hidden" name="ContactSubjectId" VALUE=""/>
    <input type="hidden" name="AppName" VALUE=""/>
    <input type="hidden" name="AppVersion" VALUE=""/>
    <input type="hidden" name="UserAgent" VALUE=""/>
    <input type="hidden" name="LoggedIn">
      <xsl:attribute name="VALUE"><xsl:value-of select="/TC/LoggedIn"/></xsl:attribute>
    </input>
  </form>
</xsl:template>


<xsl:template name="Home_LO_Inactive">
 <xsl:call-template name="B_MaintenanceClosedInactive"/>
</xsl:template>

<xsl:template name="Home_LO">
 <xsl:call-template name="B_MaintenanceClosed"/>
</xsl:template>



<xsl:template name="ContactMail_LO">
 <xsl:call-template name="B_MaintenanceTop"/>
  <tr>
    <td align="center">
      <xsl:comment>begin sub nav table</xsl:comment>
      <table cellSpacing="0" cellPadding="0" width="132" border="0">
        <tbody>
        <xsl:call-template name="B_Contest_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Problems_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_ContactMail_S"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Cache_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Question_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Jive_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_CoderGroups_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_World_Cache_US"/>
        <xsl:call-template name="B_Bottom"/>
        </tbody>
      </table>
      <xsl:comment>end sub nav table</xsl:comment>
    </td>
  </tr>
</xsl:template>

<xsl:template name="Cache_LO">
  <xsl:call-template name="B_MaintenanceTop"/>
  <tr>
    <td align="center">
      <xsl:comment>begin sub nav table</xsl:comment>
      <table cellSpacing="0" cellPadding="0" width="132" border="0">
        <tbody>
        <xsl:call-template name="B_Contest_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Problems_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_ContactMail_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Cache_S"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Question_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Jive_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_CoderGroups_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_World_Cache_US"/>
        <xsl:call-template name="B_Bottom"/>
        </tbody>
      </table>
      <xsl:comment>end sub nav table</xsl:comment>
    </td>
  </tr>
</xsl:template>

<xsl:template name="QuestionMaint_LO">
  <xsl:call-template name="B_MaintenanceTop"/>
  <tr>
    <td align="center">
      <xsl:comment>begin sub nav table</xsl:comment>
      <table cellSpacing="0" cellPadding="0" width="132" border="0">
        <tbody>
        <xsl:call-template name="B_Contest_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Problems_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_ContactMail_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Cache_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Question_S"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Jive_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_CoderGroups_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_World_Cache_US"/>
        <xsl:call-template name="B_Bottom"/>
        </tbody>
      </table>
      <xsl:comment>end sub nav table</xsl:comment>
    </td>
  </tr>
</xsl:template>



<xsl:template name="Jive_LO">
  <xsl:call-template name="B_MaintenanceTop"/>
  <tr>
    <td align="center">
      <xsl:comment>begin sub nav table</xsl:comment>
      <table cellSpacing="0" cellPadding="0" width="132" border="0">
        <tbody>
        <xsl:call-template name="B_Contest_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Problems_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_ContactMail_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Cache_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Question_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Jive_S"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_CoderGroups_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_World_Cache_US"/>
        <xsl:call-template name="B_Bottom"/>
        </tbody>
      </table>
      <xsl:comment>end sub nav table</xsl:comment>
    </td>
  </tr>
</xsl:template>


<xsl:template name="Home_LI">
 <xsl:call-template name="B_MaintenanceTop"/>
  <tr>
    <td align="center">
      <xsl:comment>begin sub nav table</xsl:comment>
      <table cellSpacing="0" cellPadding="0" width="132" border="0">
        <tbody>
        <xsl:call-template name="B_Contest_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Problems_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_ContactMail_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Cache_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Question_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Jive_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_CoderGroups_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_World_Cache_US"/>
        <xsl:call-template name="B_Bottom"/>
        </tbody>
      </table>
      <xsl:comment>end sub nav table</xsl:comment>
    </td>
  </tr>
</xsl:template>


<xsl:template name="ContactMail_LI">
  <xsl:call-template name="B_MaintenanceTop"/>
  <tr>
    <td align="center">
      <xsl:comment>begin sub nav table</xsl:comment>
      <table cellSpacing="0" cellPadding="0" width="132" border="0">
        <tbody>
        <xsl:call-template name="B_Contest_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Problems_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_ContactMail_S"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Cache_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Question_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Jive_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_CoderGroups_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_World_Cache_US"/>
        <xsl:call-template name="B_Bottom"/>
        </tbody>
      </table>
      <xsl:comment>end sub nav table</xsl:comment>
    </td>
  </tr>
</xsl:template>


<xsl:template name="Cache_LI">
  <xsl:call-template name="B_MaintenanceTop"/>
  <tr>
    <td align="center">
      <xsl:comment>begin sub nav table</xsl:comment>
      <table cellSpacing="0" cellPadding="0" width="132" border="0">
        <tbody>
        <xsl:call-template name="B_Contest_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Problems_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_ContactMail_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Cache_S"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Question_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Jive_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_CoderGroups_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_World_Cache_US"/>
        <xsl:call-template name="B_Bottom"/>
        </tbody>
      </table>
      <xsl:comment>end sub nav table</xsl:comment>
    </td>
  </tr>
</xsl:template>

<xsl:template name="QuestionMaint_LI">
  <xsl:call-template name="B_MaintenanceTop"/>
  <tr>
    <td align="center">
      <xsl:comment>begin sub nav table</xsl:comment>
      <table cellSpacing="0" cellPadding="0" width="132" border="0">
        <tbody>
        <xsl:call-template name="B_Contest_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Problems_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_ContactMail_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_FastMail_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Cache_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Question_S"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Jive_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_CoderGroups_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_World_Cache_US"/>
        <xsl:call-template name="B_Bottom"/>
        </tbody>
      </table>
      <xsl:comment>end sub nav table</xsl:comment>
    </td>
  </tr>
</xsl:template>


<xsl:template name="Contest_LI">
  <xsl:call-template name="B_MaintenanceTop"/>
  <tr>
    <td align="center">
      <xsl:comment>begin sub nav table</xsl:comment>
      <table cellSpacing="0" cellPadding="0" width="132" border="0">
        <tbody>
        <xsl:call-template name="B_Contest_S"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Problems_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_ContactMail_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Cache_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Question_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Jive_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_CoderGroups_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_World_Cache_US"/>
        <xsl:call-template name="B_Bottom"/>
        </tbody>
      </table>
      <xsl:comment>end sub nav table</xsl:comment>
    </td>
  </tr>
</xsl:template>

<xsl:template name="CoderGroups_LI">
  <xsl:call-template name="B_MaintenanceTop"/>
  <tr>
    <td align="center">
      <xsl:comment>begin sub nav table</xsl:comment>
      <table cellSpacing="0" cellPadding="0" width="132" border="0">
        <tbody>
        <xsl:call-template name="B_Contest_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Problems_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_ContactMail_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Cache_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Question_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Jive_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_CoderGroups_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_World_Cache_US"/>
        <xsl:call-template name="B_Bottom"/>
        </tbody>
      </table>
      <xsl:comment>end sub nav table</xsl:comment>
    </td>
  </tr>
</xsl:template>

<xsl:template name="Jive_LI">
  <xsl:call-template name="B_MaintenanceTop"/>
  <tr>
    <td align="center">
      <xsl:comment>begin sub nav table</xsl:comment>
      <table cellSpacing="0" cellPadding="0" width="132" border="0">
        <tbody>
        <xsl:call-template name="B_Contest_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Problems_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_ContactMail_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Cache_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Question_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Jive_S"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_CoderGroups_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_World_Cache_US"/>
        <xsl:call-template name="B_Bottom"/>
        </tbody>
      </table>
      <xsl:comment>end sub nav table</xsl:comment>
    </td>
  </tr>
</xsl:template>

<xsl:template name="Problems_LI">
  <xsl:call-template name="B_MaintenanceTop"/>
  <tr>
    <td align="center">
      <xsl:comment>begin sub nav table</xsl:comment>
      <table cellSpacing="0" cellPadding="0" width="132" border="0">
        <tbody>
        <xsl:call-template name="B_Contest_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Problems_S"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_ContactMail_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Cache_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Question_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Jive_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_CoderGroups_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_World_Cache_US"/>
        <xsl:call-template name="B_Bottom"/>
        </tbody>
      </table>
      <xsl:comment>end sub nav table</xsl:comment>
    </td>
  </tr>
</xsl:template>

<xsl:template name="World_Cache_LI">
  <xsl:call-template name="B_MaintenanceTop"/>
  <tr>
    <td align="center">
      <xsl:comment>begin sub nav table</xsl:comment>
      <table cellSpacing="0" cellPadding="0" width="132" border="0">
        <tbody>
        <xsl:call-template name="B_Contest_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Problems_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_ContactMail_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Cache_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Question_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_Jive_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_CoderGroups_US"/>
        <xsl:call-template name="B_Spacer"/>
        <xsl:call-template name="B_World_Cache_S"/>
        <xsl:call-template name="B_Bottom"/>
        </tbody>
      </table>
      <xsl:comment>end sub nav table</xsl:comment>
    </td>
  </tr>
</xsl:template>


</xsl:stylesheet>



