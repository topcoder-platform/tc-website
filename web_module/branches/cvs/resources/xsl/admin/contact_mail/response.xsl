<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../../css.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:import href="../adminLeft.xsl"/>
<xsl:preserve-space elements="*"/> 
<xsl:template match="/">

<html>
<head>
<title>Contact Mail Response</title>

<xsl:call-template name="CSS"/>

</head>

<body bgcolor="#000000" background="/images/background_2.jpg" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" onLoad="loaded=true">

<a name="top"></a>

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
           <xsl:call-template name="ContactMail_LI"/>
         </xsl:when>
         <xsl:otherwise>  
           <xsl:call-template name="ContactMail_LO"/>
         </xsl:otherwise>
       </xsl:choose>
       <tr>
         <td valign="top">
           <xsl:call-template name="LeftSideNavBarForm"/>
         </td>
       </tr>
       <tr>
         <td valign="top" height="5"><img src="/images/spacer.gif" width="1" height="5" /></td>
       </tr>
     </table>
   </td>
   <td valign="top">

<form name="frmResults" method="post">
<xsl:attribute name="action">http<xsl:value-of select="/ADMIN/PostURL"/></xsl:attribute>
<input type="hidden" name="Task" value="contactusadmin"/> 
<input type="hidden" name="Command"  value="submitResponse"/>
<input type="hidden" name="results"  value="submit"/>
<input type="hidden" name="response" value=""/>
<input type="hidden" name="LoggedIn">
  <xsl:attribute name="value">
    <xsl:value-of select="/ADMIN/LoggedIn"/>
  </xsl:attribute>
</input>
<input type="hidden" name="LoggedIn">
  <xsl:attribute name="value">
    <xsl:value-of select="/ADMIN/LoggedIn"/>
  </xsl:attribute>
</input>
<input type="hidden" name="mailid">
  <xsl:attribute name="value">
    <xsl:value-of select="/ADMIN/CONTACT/ContactMail/MailId"/>
  </xsl:attribute>
</input>
<input type="hidden" name="userid">
  <xsl:attribute name="value">
    <xsl:value-of select="/ADMIN/CONTACT/ContactMail/CoderId"/>
  </xsl:attribute>
</input>
<input type="hidden" name="username">
  <xsl:attribute name="value">
    <xsl:value-of select="/ADMIN/CONTACT/ContactMail/Username"/>
  </xsl:attribute>
</input>
<input type="hidden" name="subjectid">
  <xsl:attribute name="value">
    <xsl:value-of select="/ADMIN/CONTACT/ContactMail/ContactSubjects/ContactSubjectId"/>
  </xsl:attribute>
</input>
<input type="hidden" name="subjectdesc">
  <xsl:attribute name="value">
    <xsl:value-of select="/ADMIN/CONTACT/ContactMail/ContactSubjects/SubjectDesc"/>
  </xsl:attribute>
</input>
<input type="hidden" name="coderemail">
  <xsl:attribute name="value">
    <xsl:value-of select="/ADMIN/CONTACT/ContactMail/FromAddress"/>
  </xsl:attribute>
</input>
<input type="hidden" name="commentquestion">
  <xsl:attribute name="value">
    <xsl:value-of select="/ADMIN/CONTACT/ContactMail/CommentQuestion"/>
  </xsl:attribute>
</input>


<SCRIPT TYPE="text/Javascript"><![CDATA[
function doSubmit() {
  if ( doCheck() ) {
    document.frmResults.response.value = document.frmResults.answer.value;
    document.frmResults.submit();
  }
}

function doCheck() {
  if(document.frmResults.answer.value=="") {alert("Please enter a response to continue.");document.frmResults.answer.focus();return false;}
  return true; 
}

]]></SCRIPT>

      <table width="619" cellspacing="0" cellpadding="0" border="0">
        <tr>
          <td><img src="/images/spacer.gif" height="20" /></td>
        </tr>

        <tr>
          <td><img src="/images/manage_mail.gif" /></td>
        </tr>
        <tr>
          <td colspan="2"><img src="/images/spacer.gif" width="400" height="4" /></td>
        </tr>
      </table><br/>
      <table width="619" cellspacing="0" cellpadding="0" border="0">
        <tr>
          <td><img src="/images/spacer.gif" width="2" height="0" /></td>
          <td><img src="/images/spacer.gif" width="50" height="0" /></td>
          <td><img src="/images/spacer.gif" width="7" height="0" /></td>
          <td><img src="/images/spacer.gif" width="100" height="0" /></td>
          <td><img src="/images/spacer.gif" width="20" height="0" /></td>
          <td><img src="/images/spacer.gif" width="100" height="0" /></td>
          <td><img src="/images/spacer.gif" width="7" height="0" /></td>
          <td><img src="/images/spacer.gif" width="100" height="0" /></td>
          <td><img src="/images/spacer.gif" width="139" height="0" /></td>
        </tr>
        <tr>
          <td colspan="9">
            <table width="611" cellspacing="0" cellpadding="0" border="0">
			           <tr>
   			          <td><img src="/images/tlc_g.gif" width="4" height="4" /></td>
    		          <td bgcolor="#333333"><img src="/images/spacer.gif" width="611" height="4" /></td>
    		          <td><img src="/images/trc_g.gif" width="4" height="4" /></td>
    		        </tr>
		          </table>
          </td>
        </tr>
        <tr bgcolor="#333333">
          <td><img src="/images/spacer.gif" width="2" height="1" /></td>
          <td align="right"><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">Mail Id </font></td>
          <td><img src="/images/spacer.gif" width="7" height="1" /></td>
          <td colspan="2">
            <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
              <xsl:value-of select="/ADMIN/CONTACT/ContactMail/MailId"/>
            </font>
          </td>
          <td align="right"><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">Sent </font></td>
          <td><img src="/images/spacer.gif" width="7" height="1" /></td>
          <td>
            <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
              <xsl:value-of select="/ADMIN/CONTACT/ContactMail/Timestamp"/>
            </font>
          </td>
          <td><img src="/images/spacer.gif" width="139" height="1" /></td>
        </tr>
        
        <tr bgcolor="#333333">
          <td colspan="9"><img src="/images/spacer.gif" width="619" height="2" /></td>
        </tr>
        
        <tr>
          <td colspan="9"><img src="/images/spacer.gif" width="619" height="10" /></td>
        </tr>
        
        <tr>
          <td><img src="/images/spacer.gif" width="2" height="1" /></td>
          <td align="right"><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">Handle </font></td>
          <td><img src="/images/spacer.gif" width="7" height="1" /></td>
          <td>
            <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
              <xsl:value-of select="/ADMIN/CONTACT/ContactMail/Username"/>
            </font>
          </td>
          <td><img src="/images/spacer.gif" width="20" height="1" /></td>
          <td align="right"><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">Email </font></td>
          <td><img src="/images/spacer.gif" width="7" height="1" /></td>
          <td>
            <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
              <xsl:value-of select="/ADMIN/CONTACT/ContactMail/FromAddress"/>
            </font>
          </td>
          <td><img src="/images/spacer.gif" width="139" height="1" /></td>
        </tr>
        <tr>
          <td colspan="9"><img src="/images/spacer.gif" width="619" height="10" /></td>
        </tr>
        <tr>
          <td><img src="/images/spacer.gif" width="2" height="1" /></td>
          <td align="right"><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">Subject </font></td>
          <td><img src="/images/spacer.gif" width="7" height="1" /></td>
          <td colspan="3">
              <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
                <xsl:value-of select="/ADMIN/CONTACT/ContactMail/ContactSubjects/SubjectDesc"/>
              </font>
          </td>
          <td><img src="/images/spacer.gif" width="7" height="1" /></td>
          <td><img src="/images/spacer.gif" width="100" height="1" /></td>
          <td><img src="/images/spacer.gif" width="139" height="1" /></td>
        </tr>
        <tr>
          <td colspan="9"><img src="/images/spacer.gif" width="619" height="10" /></td>
        </tr>
        <tr>
          <td><img src="/images/spacer.gif" width="2" height="1" /></td>
          <td valign="top" align="right"><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">Question </font></td>
          <td><img src="/images/spacer.gif" width="7" height="1" /></td>
          <td colspan="6">
            <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ffffff">
              <xsl:value-of select="/ADMIN/CONTACT/ContactMail/CommentQuestion"/>
            </font>
          </td>
        </tr>
        <tr>
          <td colspan="9"><img src="/images/spacer.gif" width="619" height="10" /></td>
        </tr>
        <tr>
          <td><img src="/images/spacer.gif" width="2" height="1" /></td>
          <td valign="top" align="right"><font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">Reply </font></td>
          <td><img src="/images/spacer.gif" width="7" height="1" /></td>
          <td colspan="6">
            <textarea cols="65" rows="15" maxlength="4000" name="answer"></textarea>
          </td>
        </tr>
   
  <tr>
    <td width="1" colspan="10"><img src="/images/spacer.gif" width="1" height="10" /></td>
  </tr>
  		
  <tr>
    <td width="1" colspan="10" bgcolor="#333333"><img src="/images/spacer.gif" width="1" height="2" /></td>
  </tr>
              
  <tr>
    <td colspan="10">
      <table width="611" cellspacing="0" cellpadding="0" border="0">
      	<tr>
        <td><img src="/images/blc_g.gif" width="4" height="4" /></td>
        <td bgcolor="#333333"><img src="/images/spacer.gif" width="611" height="4" /></td>
        <td><img src="/images/brc_g.gif" width="4" height="4" /></td>
        </tr>
      </table>
    </td>
  </tr>
  
  <tr>
    <td width="1" colspan="10"><img src="/images/spacer.gif" width="1" height="15" /></td>
  </tr>
    </table>
    <table width="619">
      <tr>
        <td align="center">
          <a href="JavaScript:doSubmit()">
            <img src="/images/submit_button.gif" width="70" height="19" border="0"/>
          </a>
        </td>
      </tr>
    </table>
    </form>
    </td>
  </tr>
</table>


</body>

</html>
</xsl:template>
</xsl:stylesheet>
