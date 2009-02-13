<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="../../css.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:import href="../adminLeft.xsl"/>
<xsl:import href="login_body.xsl"/>
<xsl:template match="/">

<html>

<head>
<title>TopCoder Login</title>



<xsl:call-template name="CSS"/>



</head>

<body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" bgcolor="#000000" background="/images/background_2.jpg" onLoad="setFocus()">




<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
   <td colspan="2" valign="top">



<xsl:choose>
  <xsl:when test="/ADMIN/STATIC/LoggedIn='true'">
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
  <xsl:when test="/ADMIN/STATIC/LoggedIn='true'">
    <xsl:call-template name="Home_LI"/>
  </xsl:when>
</xsl:choose>
    <td valign="top">
      <table width="156" cellpadding="0" cellspacing="0" border="0">
            <xsl:call-template name="Home_LO_Inactive"/>
        <tr>
          <td valign="top">
            <xsl:call-template name="LeftSideNavBarForm"/>
         </td>
        </tr>
      </table>
    </td>


</table>
</td>
<td valign="top">

 
<xsl:call-template name="LoginForm"/>

   
  
  </td>
  <td width="100%"><img src="/images/spacer.gif" width="1" height="1" alt="" /></td>
</tr>
</table>



</body>

</html>
</xsl:template>
</xsl:stylesheet>
