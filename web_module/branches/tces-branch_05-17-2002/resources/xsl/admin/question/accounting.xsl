<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../../css.xsl"/>
<xsl:import href="QuestionInput.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:import href="../adminLeft.xsl"/>
<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
<xsl:template match="/">

<html>
<head>
<title>Accounting</title>
<xsl:call-template name="CSS"/>
</head>


<body bgcolor="#000000" background="/images/background_2.jpg" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" >

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
    <xsl:call-template name="QuestionMaint_LI"/>
  </xsl:when>
  <xsl:otherwise>  
    <xsl:call-template name="QuestionMaint_LO"/>
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

<form name="frmAdmin" method="POST">
<input type="hidden" name="Command" value=""/>
<input type="hidden" name="Task" value=""/>



<table cellspacing="0" cellpadding="0" border="0" width="619" >
  <tr>
    <td><img src="/images/spacer.gif" width="5" height="10" /></td>
    <td><img src="/images/spacer.gif" width="75" height="10" /></td>
    <td><img src="/images/spacer.gif" width="10" height="10" /></td>
    <td><img src="/images/spacer.gif" width="75" height="10" /></td>
    <td><img src="/images/spacer.gif" width="10" height="10" /></td>
    <td><img src="/images/spacer.gif" width="75" height="10" /></td>
    <td><img src="/images/spacer.gif" width="10" height="10" /></td>
    <td><img src="/images/spacer.gif" width="100" height="10" /></td>
    <td><img src="/images/spacer.gif" width="115" height="10" /></td>
  </tr>   
  <tr>
    <td colspan="9">
      <table width="619" cellspacing="0" cellpadding="0" border="0">
        <td><img src="/images/tlc_g.gif" width="4" height="4" alt="" /></td>
        <td bgcolor="#333333"><img src="/images/spacer.gif" width="611" height="4" alt="" /></td>
        <td><img src="/images/trc_g.gif" width="4" height="4" alt="" /></td>
      </table>
    </td>
  </tr>
  <tr>
    <td bgcolor="#333333"><img src="/images/spacer.gif" width="5" height="10" /></td>
    <td bgcolor="#333333"><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff"><b>Date</b></font></td>
    <td bgcolor="#333333"><img src="/images/spacer.gif" width="10" height="1"/></td>
    <td bgcolor="#333333"><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff"><b>Handle</b></font></td>
    <td bgcolor="#333333"><img src="/images/spacer.gif" width="10" height="1"/></td>
    <td align="right" bgcolor="#333333"><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff"><b>Quantity</b></font></td>
    <td bgcolor="#333333"><img src="/images/spacer.gif" width="10" height="1"/></td>
    <td align="right" bgcolor="#333333"><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff"><b>Payment Amount</b></font></td>
    <td bgcolor="#333333"><img src="/images/spacer.gif" width="115" height="10" /></td>
  </tr>   
  <tr>
    <td colspan="9" bgcolor="#333333"><img src="/images/spacer.gif" width="1" height="2" alt="" /></td>
  </tr>
  <xsl:for-each select="/ADMIN/Questions/QuestionPayment">  
  <xsl:sort order="descending" select="Handle"/>
  <tr>
    <td colspan="7"><img src="/images/spacer.gif" width="1" height="10" alt="" /></td>
  </tr>
  <tr>
    <td><img src="/images/spacer.gif" width="5" height="10" /></td>
    <td><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff"><xsl:value-of select="substring(CreatedDate, 1, 10)"/></font></td>
    <td><img src="/images/spacer.gif" width="10" height="1"/></td>
    <td><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff"><xsl:value-of select="Handle"/></font></td>
    <td><img src="/images/spacer.gif" width="10" height="1"/></td>
    <td align="right" ><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff"><xsl:value-of select="Count"/></font></td>
    <td><img src="/images/spacer.gif" width="10" height="1"/></td>
    <td align="right" ><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff"><xsl:value-of select="format-number((Count) * 5,'0.00')"/></font></td>
    <td><img src="/images/spacer.gif" width="119" height="10" /></td>
  </tr>   
  </xsl:for-each>  
  <tr>
    <td colspan="9"><img src="/images/spacer.gif" width="619" height="15" /></td>
  </tr> 
  <tr bgcolor="#333333">
    <td colspan="9"><img src="/images/spacer.gif" width="1" height="2" alt="" /></td>
  </tr>
  <tr>
    <td colspan="9">
      <table width="619" cellspacing="0" cellpadding="0" border="0">
        <td><img src="/images/blc_g.gif" width="4" height="4" alt="" /></td>
        <td bgcolor="#333333"><img src="/images/spacer.gif" width="611" height="4" alt="" /></td>
        <td><img src="/images/brc_g.gif" width="4" height="4" alt="" /></td>
      </table>
    </td>
  </tr>
</table>

<table cellspacing="0" cellpadding="0" border="0" width="619" >
  <tr>
    <td ><img src="/images/spacer.gif" width="619" height="15" /></td>
  </tr> 
  <tr>
    <td align="center"><a href="JavaScript:doBack()"><img src="/images/back_button.gif" border="none" width="70" height="19"/></a></td>
  </tr>  
</table>
<SCRIPT type="text/javascript"><![CDATA[
var NS4=(document.layers)
var IE4=(document.all)
var ver4=(NS4||IE4)
var question=document.frmAdmin

function doBack(){
    window.history.back();
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
