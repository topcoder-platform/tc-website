<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="ContactInput.xsl"/>
<xsl:import href="../css.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:import href="../leftAdmin.xsl"/>
<xsl:template match="/">

<html>
<head>
<title>Contact Us</title>

<xsl:call-template name="CSS"/>

</head>

<body bgcolor="#000000" background="/images/background_2.jpg" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">




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
    <xsl:call-template name="ContactMail_LI"/>
  </xsl:when>
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
  
  
  
<form name="frmContact" method="post" onSubmit="return authorizedSubmit">
<input type="hidden" name="Command" value=""/>
<input type="hidden" name="Task" value=""/>
<input TYPE="hidden" NAME="LoggedIn">
  <xsl:attribute name="VALUE"><xsl:value-of select="/TC/LoggedIn"/></xsl:attribute>
</input>

<SCRIPT type="text/javascript"><![CDATA[
var NS4=(document.layers)
var IE4=(document.all)
var ver4=(NS4||IE4)
var contact=document.frmContact
var authorizedSubmit=false;

function doNext() {
  contact.Command.value = "";
  contact.Task.value = "contact";
  doSubmit();
}
function doExit() {
  
}

function doSubmit(){authorizedSubmit=true;contact.submit();}
]]></SCRIPT>

<table width="610" cellspacing="0" cellpadding="0" border="0">


<tr>
  <td valign="top" height="5"><img src="/images/spacer.gif" width="1" height="5" alt="" /></td>
</tr>


 <tr>
  <td width="490" align="left"><img src="/images/thanks2_header.gif" width="490" height="20" alt="" /></td>
</tr>

</table><br/>

 
<table width="619" cellspacing="0" cellpadding="0" border="0">
 <tr>
  <td colspan="2"><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">Your request has been submitted.  We will email your response.</font></td>
 </tr>
 
  <tr>
  <td colspan="2"><img src="/images/spacer.gif" width="25" height="25" alt="" /></td>
 </tr>
 
 <tr>
  <td align="center" valign="middle" colspan="2"><a href="JavaScript:doSubmitNavBar('','')"><img src="/images/exit_button.gif" width="70" height="19" border="0" alt="" /></a></td>
 </tr>
</table>

</form>
     
	 
  </td>
  
  <td width="100%"><img src="/images/spacer.gif" width="1" height="1" alt="" /></td>
  
 </tr>
</table> 


</body> 

</html>

</xsl:template>
</xsl:stylesheet>
