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


<body bgcolor="#000000" background="/images/background_2.jpg" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" onLoad="setFocus()">




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
<input type="hidden" name="Coder" value="">
	<xsl:attribute name="value">
    <xsl:value-of select="/TC/CONTACTMAIL/CoderId"/>
  </xsl:attribute>
</input>

<SCRIPT type="text/javascript"><![CDATA[
var NS4=(document.layers)
var IE4=(document.all)
var ver4=(NS4||IE4)
var contact=document.frmContact
var authorizedSubmit=false;

function     doNext() {
  if ( doCheck() ) {
    contact.Command.value = "Submit";
    contact.Task.value = "contact";
    doSubmit();    
  }
}
function doCheck() {
  if(contact.Comment.value=="") {alert("Please enter a Comment or Question to continue.");contact.Comment.focus();return false;}
  return true; 
}
function setFocus() {
  if (contact.Email.value=="") {
      contact.Email.focus();
  } else {
      contact.Comment.focus();
  }
}

function doSubmit(){authorizedSubmit=true;contact.submit();}
]]></SCRIPT>

     <table width="490" cellspacing="0" cellpadding="0" border="0">
      <tr>
  		<td valign="top" height="5"><img src="/images/spacer.gif" width="1" height="5" alt="" /></td>
	  </tr>
      <tr>
       <td><img src="/images/contact_us_header.gif" width="490" height="20" alt="" /><br/></td>
      </tr>
      
      <tr>
  		<td valign="top" height="5"><img src="/images/spacer.gif" width="1" height="12" alt="" /></td>
	  </tr>
      
      <tr>
       <td valign="middle"><font color="#ffffff" size="2" face="arial, verdana, helvetica, sans-serif">Here at TopCoder we are continuously working to improve the site. Any comments, questions, and suggestions you may have are appreciated.</font></td>
      </tr>
      
     <tr>
  		<td valign="top" height="5"><img src="/images/spacer.gif" width="1" height="8" alt="" /></td>
	  </tr>
      
      
     </table>

     
      <br/>
      
      
    <table width="619" border="0" cellpadding="0" cellspacing="0">
     
      <tr>
       <td align="center" valign="middle" width="5" height="5"><img src="/images/spacer.gif" alt="" /></td>
      </tr>
      
      <tr>
      <td align="center">
        <table border="0" cellpadding="0" cellspacing="0">
         <tr>
         <td valign="middle"><font color="#ffffff" size="2" face="arial, verdana, helvetica, sans-serif">Subject:</font></td>
         </tr>
        
          <tr>
           <td><xsl:call-template name="subjectInput"/></td>
          </tr>
          
          <tr>
           <td align="center" valign="middle" width="5" height="5"><img src="/images/spacer.gif" alt="" /></td>
          </tr>
         
<xsl:comment><!--
         <tr>
          <td valign="middle"><font color="#ffffff" size="2" face="arial, verdana, helvetica, sans-serif">Other:</font></td>
         </tr>
      
         <tr>
          <td><xsl:call-template name="otherInput"/></td>
         </tr>
--></xsl:comment>
          
          <tr>
          <td align="center" valign="middle" width="5" height="5"><img src="/images/spacer.gif" alt="" /></td>
         </tr>
         
         <tr>
          <td valign="middle"><font color="#ffffff" size="2" face="arial, verdana, helvetica, sans-serif">Your email address:</font></td>
         </tr>
            
         <tr>
          <td><xsl:call-template name="emailInput"/></td>
         </tr>
      
         <tr>
          <td align="center" valign="middle" width="5" height="5"><img src="/images/spacer.gif" alt="" /></td>
         </tr>
      
         <tr>
          <td valign="middle"><font color="#ffffff" size="2" face="arial, verdana, helvetica, sans-serif">Comments | Questions:  (1024 character max)</font> </td>
         </tr>
         
         <tr>
          <td><xsl:call-template name="commentInput"/></td>
         </tr>
        
         <tr>
          <td align="center" valign="middle" width="5" height="5"><img src="/images/spacer.gif" alt="" /></td>
         </tr>
        </table>

      </td>
     </tr>
     <tr>
      <td align="center" valign="middle" width="5" height="5"><img src="/images/spacer.gif" alt="" /></td>
     </tr>
     <tr>
      <td align="center" valign="middle" width="5" height="5"><img src="/images/spacer.gif" alt="" /></td>
     </tr>
    </table>


    <table width="619" border="0" cellpadding="0" cellspacing="0">

     <tr>
      <td align="center" valign="middle" width="5" height="5"><img src="/images/spacer.gif" alt="" /></td>
     </tr>

     <tr>
     <td align="center"><a href="JavaScript:doNext()"><img src="/images/submit_button.gif" width="70" height="19" border="0" alt="" /></a></td>
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
