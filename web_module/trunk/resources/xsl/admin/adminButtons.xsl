<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">



<xsl:template name="B_Spacer">
                                <xsl:comment>Start Button Spacer</xsl:comment>
    <tr>
      <td height="1"><img src="/images/spacer.gif" width="1" height="1" alt=""/></td>
    </tr>
                                <xsl:comment>End Button Spacer</xsl:comment>    
</xsl:template>

<xsl:template name="B_Bottom">
                                <xsl:comment>Start Bottom Button</xsl:comment>
  <tr>
    <td width="10"><img src="/images/bottom_left_corner.gif" width="10" height="2" alt=""/></td>
    <td width="10" bgcolor="#660000"><img src="/images/bottom_middle.gif" width="112" height="2" alt=""/></td>
    <td width="10"><img src="/images/bottom_right_corner.gif" width="10" height="2" alt=""/></td>
  </tr>
  <tr>
    <td colSpan="3" height="4"><img src="/images/spacer.gif" width="1" height="4" alt=""/></td>
  </tr>
                                <xsl:comment>End Bottom Button</xsl:comment>  
</xsl:template>



<xsl:template name="B_MaintenanceTop">
                                <xsl:comment>Start of Maintenance Button Series</xsl:comment>
  <tr>
    <td rowspan="8" valign="top"><img src="/images/left_top.gif" width="4" height="76" alt=""/></td>
    <td valign="top" height="25"><img src="/images/maintenance_open.gif"  width="132" height="25" border="0" alt="maintenance" /></td>
    <td rowspan="8" valign="top"><img src="/images/right_top.gif" width="20" height="76" alt=""/></td> 
  </tr>
</xsl:template>

<xsl:template name="B_ContactMail_US">
  <tr>
    <td width="10"><img src="/images/dk_red_left.gif" width="10" height="15" alt=""/></td>
    <td><a href="JavaScript:doSubmitNavBar('contactusadmin','getEmailList')"><img src="/images/contact_mail_off.gif" width="112" height="15" border="0" alt="contact mail"/></a></td>
    <td width="10"><img src="/images/dk_red_right.gif" width="10" height="15" alt=""/></td>
  </tr>
</xsl:template>

<xsl:template name="B_ContactMail_S">
  <tr>
    <td width="10"><img src="/images/lt_red_left.gif" width="10" height="15" alt=""/></td>
    <td><img src="/images/contact_mail_on.gif" width="112" height="15" border="0" alt="contact mail"/></td>
    <td width="10"><img src="/images/lt_red_right.gif" width="10" height="15" alt=""/></td>
  </tr>
</xsl:template>

<xsl:template name="B_Cache_US">
  <tr>
    <td width="10"><img src="/images/dk_red_left.gif" width="10" height="15" alt=""/></td>
    <td><a href="JavaScript:doSubmitNavBar('data_cache','')"><img src="/images/cache_off.gif" width="112" height="15" border="0" alt="data cache"/></a></td>
    <td width="10"><img src="/images/dk_red_right.gif" width="10" height="15" alt=""/></td>
  </tr>
</xsl:template>

<xsl:template name="B_Cache_S">
  <tr>
    <td width="10"><img src="/images/lt_red_left.gif" width="10" height="15" alt=""/></td>
    <td><img src="/images/cache_on.gif" width="112" height="15" border="0" alt="data cache"/></td>
    <td width="10"><img src="/images/lt_red_right.gif" width="10" height="15" alt=""/></td>
  </tr>
</xsl:template>

<xsl:template name="B_Question_US">
  <tr>
    <td width="10"><img src="/images/dk_red_left.gif" width="10" height="15" alt=""/></td>
    <td><a href="JavaScript:doSubmitNavBar('questionmaintenance','')"><img src="/images/questions_off.gif" width="112" height="15" border="0" alt="questions"/></a></td>
    <td width="10"><img src="/images/dk_red_right.gif" width="10" height="15" alt=""/></td>
  </tr>
</xsl:template>

<xsl:template name="B_Question_S">
  <tr>
    <td width="10"><img src="/images/lt_red_left.gif" width="10" height="15" alt=""/></td>
    <td><img src="/images/questions_on.gif" width="112" height="15" border="0" alt="questions"/></td>
    <td width="10"><img src="/images/lt_red_right.gif" width="10" height="15" alt=""/></td>
  </tr>
</xsl:template>

<xsl:template name="B_Jive_US">
  <tr>
    <td width="10"><img src="/images/dk_red_left.gif" width="10" height="15" alt=""/></td>
    <td>
      <a href="http://172.16.1.153/jive/skins/admin/login.jsp">
        <img src="/images/jive_off.gif" width="112" height="15" border="0" alt="jive"/>
      </a>
    </td>
    <td width="10"><img src="/images/dk_red_right.gif" width="10" height="15" alt=""/></td>
  </tr>
</xsl:template>

<xsl:template name="B_Jive_S">
  <tr>
    <td width="10"><img src="/images/lt_red_left.gif" width="10" height="15" alt=""/></td>
    <td><img src="/images/jive.gif" width="112" height="15" border="0" alt="jive"/></td>
    <td width="10"><img src="/images/lt_red_right.gif" width="10" height="15" alt=""/></td>
  </tr>
</xsl:template>

<xsl:template name="B_Contest_US">
  <tr>
    <td width="10"><img src="/images/dk_red_bottom_left.gif" width="10" height="15" alt=""/></td>
    <td>
      <a href="JavaScript:doSubmitNavBar('contest','getContestMenuScreen')">
        <img src="/images/contests_nav_off.gif" width="112" height="15" border="0" alt="contests"/>
      </a>
    </td>
    <td width="10"><img src="/images/dk_red_right.gif" width="10" height="15" alt=""/></td>
  </tr>
</xsl:template>

<xsl:template name="B_Contest_S">
  <tr>
    <td width="10"><img src="/images/lt_red_bottom_left.gif" width="10" height="15" alt=""/></td>
    <td><img src="/images/contests_nav_on.gif" width="112" height="15" border="0" alt="contests"/></td>
    <td width="10"><img src="/images/lt_red_bottom_right.gif" width="10" height="15" alt=""/></td>
  </tr>
</xsl:template>

<xsl:template name="B_CoderGroups_US">
  <tr>
    <td width="10"><img src="/images/dk_red_bottom_left.gif" width="10" height="15" alt=""/></td>
    <td><a href="JavaScript:doSubmitNavBar('codergroups','getContestInfo')"><img src="/images/codergroups_off.gif" width="112" height="15" border="0" alt="coder groups"/></a></td>
    <td width="10"><img src="/images/dk_red_bottom_right.gif" width="10" height="15" alt=""/></td>
  </tr>
</xsl:template>

<xsl:template name="B_CoderGroups_S">
  <tr>
    <td width="10"><img src="/images/lt_red_bottom_left.gif" width="10" height="15" alt=""/></td>
    <td><img src="/images/codergroups_off.gif" width="112" height="15" border="0" alt="coder groups"/></td>
    <td width="10"><img src="/images/lt_red_bottom_right.gif" width="10" height="15" alt=""/></td>
  </tr>
</xsl:template>

<xsl:template name="B_Problems_US">
  <tr>
    <td width="10"><img src="/images/dk_red_left.gif" width="10" height="15" alt=""/></td>
    <td><a href="JavaScript:doSubmitNavBar('problems','getProblemInfo')"><img src="/images/problems_nav_off.gif" width="112" height="15" border="0" alt="problems"/></a></td>
    <td width="10"><img src="/images/dk_red_bottom_right.gif" width="10" height="15" alt=""/></td>
  </tr>
</xsl:template>

<xsl:template name="B_Problems_S">
  <tr>
    <td width="10"><img src="/images/lt_red_bottom_left.gif" width="10" height="15" alt=""/></td>
    <td><img src="/images/problems_nav_on.gif" width="112" height="15" border="0" alt="problems"/></td>
    <td width="10"><img src="/images/lt_red_bottom_right.gif" width="10" height="15" alt=""/></td>
  </tr>
</xsl:template>

<xsl:template name="B_MaintenanceClosed">
  <tr>
    <td  align="center" valign="top" height="25"><a href="JavaScript:doSubmitNavBar('contactusadmin','getEmailList')"><img src="/images/maintenance_closed.gif"  width="132" height="25" border="0" alt="maintenance" /></a></td>
  </tr>
</xsl:template>

<xsl:template name="B_MaintenanceClosedInactive">
  <tr>
    <td  align="center" valign="top" height="25"><img src="/images/maintenance_closed.gif"  width="132" height="25" border="0" alt="maintenance" /></td>
  </tr>
</xsl:template>

<xsl:template name="B_World_Cache_US">
  <tr>
    <td width="10"><img src="/images/dk_red_left.gif" width="10" height="15" alt=""/></td>
    <td><a href="JavaScript:doSubmitNavBar('worldcache','getWorldCacheMenu')"><img src="/images/worldcache_nav_off.gif" width="112" height="15" border="0" alt="worldcache"/></a></td>
    <td width="10"><img src="/images/dk_red_bottom_right.gif" width="10" height="15" alt=""/></td>
  </tr>
</xsl:template>

<xsl:template name="B_World_Cache_S">
  <tr>
    <td width="10"><img src="/images/lt_red_bottom_left.gif" width="10" height="15" alt=""/></td>
    <td><img src="/images/worldcache_nav_on.gif" width="112" height="15" border="0" alt="worldcache"/></td>
    <td width="10"><img src="/images/lt_red_bottom_right.gif" width="10" height="15" alt=""/></td>
  </tr>
</xsl:template>

</xsl:stylesheet>
