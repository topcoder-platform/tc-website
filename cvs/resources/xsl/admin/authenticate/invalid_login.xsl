<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../../css.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:import href="../adminLeft.xsl"/>
<xsl:import href="login_body.xsl"/>
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

  

<xsl:call-template name="LoginForm"/>

<br/>

<font face="arial,verdana,helvetica,sans-serif" size="3" color="#ff0000">
<p><br/></p>
<center><p><b>Invalid Login Credentials</b></p></center>
</font>

 
     

	 
   
  
  </td>
  <td width="100%"><img src="/images/spacer.gif" width="1" height="1"/></td>
</tr>

</table> 

</body>

</html>
</xsl:template>
</xsl:stylesheet>
