<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="../../css.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:import href="../adminLeft.xsl"/>
<xsl:template match="/">

<html>

<head>
<title>TopCoder Login</title>



</head>

<body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" bgcolor="#000000" background="/images/background_2.jpg" onLoad="">



<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td colspan="2" valign="top">
      <xsl:choose>
        <xsl:when test="/ADMIN/LoggedIn='true'">
          <xsl:call-template name="TopLoggedIn"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="TopLoggedOut"/>
        </xsl:otherwise>
      </xsl:choose>
    </td>
  
    <td width="100%" bgcolor="#4d0000"><img src="/images/spacer.gif" width="1" height="1" alt="" /></td>

 </tr> 

<tr>
 <td valign="top">
  
  
    <table width="156" cellpadding="0" cellspacing="0" border="0">

<xsl:choose>
  <xsl:when test="/TC/LoggedIn='true'">
    <xsl:call-template name="Cache_LI"/>
  </xsl:when>
  <xsl:otherwise>  
    <xsl:call-template name="Cache_LI"/>
  </xsl:otherwise>
</xsl:choose>
      <tr>
       <td valign="top">
    
<xsl:call-template name="LeftSideNavBarForm"/>
        
       </td>
      </tr>
      
      <tr>
       <td valign="top" height="5"><img src="/images/spacer.gif" width="1" height="5" alt="" /></td>
      </tr>
      
    </table>
  
  </td>

  <td valign="top">
  
<form name="frmDataCache" method="POST">
<input type="hidden" name="Command" value=""/>
<input type="hidden" name="Task" value=""/>
<input type="hidden" name="All" value=""/>
<input type="hidden" name="Contest" value=""/>
<input type="hidden" name="School" value=""/>
<input type="hidden" name="Country" value=""/>
<input type="hidden" name="State" value=""/>
      
  <table cellspacing="0" cellpadding="0" border="0" width="619" >
    <tr>
      <td><img src="/images/spacer.gif" width="25" height="50" alt="" /></td>
      <td><img src="/images/spacer.gif" width="25" height="50" alt="" /></td>
    </tr>
    <tr>
      <td><img src="/images/spacer.gif" width="10" height="60" alt="" /></td>
      <td><input type="submit" name="Cache" onclick="doClearAllCache()" value="Clear All Cached Data"></input></td>
    </tr>
    <tr>
      <td><img src="/images/spacer.gif" width="10" height="40" alt="" /></td>
      <td><input type="submit" name="Cache" onclick="doClearContestCache()" value=" Clear Contest Cache "></input></td>
    </tr>     
    <tr>
      <td><img src="/images/spacer.gif" width="10" height="40" alt="" /></td>
      <td><input type="submit" name="Cache" onclick="doClearSchoolsCache()" value=" Clear Schools Cache "></input></td>
    </tr>     
    <tr>
      <td><img src="/images/spacer.gif" width="10" height="40" alt="" /></td>
      <td><input type="submit" name="Cache" onclick="doClearCountriesCache()" value="Clear Countries Cache"></input></td>
    </tr>     
    <tr>
      <td><img src="/images/spacer.gif" width="10" height="40" alt="" /></td>
      <td><input type="submit" name="Cache" onclick="doClearStatesCache()" value=" Clear States Cache  "></input></td>
    </tr>
    <tr>
      <td><img src="/images/spacer.gif" width="10" height="40" alt="" /></td>
      <td><input type="submit" name="Cache" onclick="doClearStatsCache()" value="Rebuild General Stats Cache"></input></td>
    </tr>  
  </table>

<SCRIPT TYPE="text/javascript"><![CDATA[
var NS4=(document.layers)
var IE4=(document.all)
var ver4=(NS4||IE4)
var cache=document.frmDataCache

function doClearAllCache() {
   cache.Task.value = 'data_cache';
   cache.Command.value='all';
}

function doClearContestCache() {
   cache.Task.value = 'data_cache';
   cache.Command.value='contests';
}

function doClearSchoolsCache() {
   cache.Task.value = 'data_cache';
   cache.Command.value='schools';
}

function doClearCountriesCache() {
   cache.Task.value = 'data_cache';
   cache.Command.value='countries';
}

function doClearStatesCache() {
   cache.Task.value = 'data_cache';
   cache.Command.value='states';
}

function doClearStatsCache() {
   cache.Task.value = 'data_cache';
   cache.Command.value='general_stats';
}
]]></SCRIPT>

</form>
  
  </td>
  <td width="100%"><img src="/images/spacer.gif" width="1" height="1" alt="" /></td>
</tr>
</table>

</body>

</html>
</xsl:template>
</xsl:stylesheet>
