<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="ActivateForm">
    <table width="100%" cellspacing="0" cellpadding="0" border="0" BGCOLOR="#000033">
      <tr>
       <td colspan="2" align="left" class="registerNav">
         <br/><br/>This account has not been activated.
         <ul>
           <li><a href="/?t=authentication&amp;c=mail_activation">Resend</a> my activation code to my email address.</li>
           <li>
             Enter activation code from email:
             <FORM NAME="frmActivate" METHOD="POST">
               <INPUT TYPE="HIDDEN" NAME="t" VALUE="authentication"/>
               <INPUT TYPE="HIDDEN" NAME="c" VALUE="submit_login"/>
               <INPUT TYPE="HIDDEN" NAME="LoggedIn">
                 <xsl:attribute name="VALUE"><xsl:value-of select="/TC/LoggedIn"/></xsl:attribute>
               </INPUT>
               <INPUT TYPE="text" NAME="code" SIZE="15" MAXLENGTH="50"/>&#160;&#160;
               <a href="JavaScript:document.frmActivate.submit()">Submit &gt;&gt;</a>
             </FORM>
           </li>
         </ul>
       </td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>
