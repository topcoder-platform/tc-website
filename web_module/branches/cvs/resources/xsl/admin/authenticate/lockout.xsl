<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../../css.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:import href="../adminLeft.xsl"/>
<xsl:template match="/">
<html>

<head>
<title>Invalid Login</title>



<xsl:call-template name="CSS"/>



</head>

<body bgcolor="#000000" background="/images/background_2.jpg" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">

<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
   <td colspan="2" valign="top">




<xsl:choose>
  <xsl:when test="/TC/LoggedIn='true'">
    <xsl:call-template name="TopLoggedIn"/>
  </xsl:when>
  <xsl:otherwise>  
    <xsl:call-template name="TopLoggedOut"/>
  </xsl:otherwise>
</xsl:choose>




  </td>
  <td width="100%" bgcolor="#4d0000"><img src="/images/spacer.gif" width="1" height="1"/></td>
 </tr> 
<tr>
 <td valign="top">


<table width="156" cellpadding="0" cellspacing="0" border="0">



<xsl:choose>
  <xsl:when test="/TC/LoggedIn='true'">
    <xsl:call-template name="Home_LO"/>
  </xsl:when>
</xsl:choose>






      <tr>
        <td valign="top">
        

        			
              
              
<xsl:call-template name="LeftSideNavBarForm"/>


              
              
              


       </td>
      </tr>
    </table>
  </td>
  <td valign="top">
  
    <table width="619" cellspacing="0" cellpadding="0" border="0">
<tr>
  <td valign="top" height="5"><img src="/images/spacer.gif" width="1" height="5" /></td>
</tr>
<tr>
  <td width="619" align="left"><img src="/images/lock_out.gif" width="619" height="20" /></td>
</tr>
</table><br/>

<table width="619" cellspacing="0" cellpadding="0" border="0">
 <tr>
  <td>
    <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
      Login has been disabled in this browser session due to an excessive number of unsuccessful attempts. 
      Please close and re-open your browser for a new session. <br />
    </font>
    <a href='/coder/index'>
      <font face='arial,verdana,helvetica,sans-serif' size='2'>
        Return to Home
      </font>
    </a> 
  </td>
 </tr>
</table><br /><br/>


  


 
  
  </td>
  
    <td width="100%"><img src="/images/spacer.gif" width="1" height="1"/></td>

 </tr>
</table> 

</body>

</html>
</xsl:template>
</xsl:stylesheet>
