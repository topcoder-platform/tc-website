<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../menu.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
<xsl:template match="/">
  <html>
    <head>
      <title>Contact Us Admin Tool</title>
    </head>
    <body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">
      <xsl:call-template name="Top"/>
      <xsl:call-template name="Menu"/>


      <form name="frmResults" method="post">
        <xsl:attribute name="action">http<xsl:value-of select="/TC/PostURL"/></xsl:attribute>
        <input type="hidden" name="Task" value=""/>
        <input type="hidden" name="Command" value=""/>
        <input type="hidden" name="results" value=""/>
        <input type="hidden" name="remove" value=""/>
        <input type="hidden" name="mailid">
          <xsl:attribute name="value">
            <xsl:value-of select="MailId"/>
          </xsl:attribute>
        </input>

<SCRIPT TYPE="text/Javascript"><![CDATA[
 function doGetResponses(subjectId) {
    document.frmResults.results.value = surveyName;
    document.frmResults.Command.value = 'getSurveyResults';
    document.frmResults.submit();
 }
  function doRemove(id) {
    document.frmResults.remove.value = id;
    document.frmResults.Task.value = 'contactusadmin';
    document.frmResults.Command.value = 'getEmailListRefresh';
    document.frmResults.submit();
 }
]]></SCRIPT>

          <xsl:for-each select="/TC/CONTACT/ContactMail">      
            <table width="700" cellspacing="0" cellpadding="0" border="0">
              <tr>
                <td align="center"><b>Mail Id</b></td>
                <td align="center"><b>Sent</b></td>
                <td align="center"><b>Handle</b></td>
                <td align="center"><b>Email</b></td>
                <td align="center"><b>Subject</b></td>
              </tr>
              <tr><td colspan="5"><hr/></td></tr>
              <tr> 
                <td>
                  <a>
                    <xsl:attribute name="href">/admin?Task=contact_mail&amp;Command=getResponseScreen&amp;results=<xsl:value-of select="MailId"/></xsl:attribute>
                    <xsl:value-of select="MailId"/>
<!--
                    <xsl:attribute name="HREF">JavaScript:doRespond('<xsl:value-of select="MailId"/>')</xsl:attribute>
                    <xsl:value-of select="MailId"/>
-->
                  </a>
                  <br/>
                  <a>
                    <xsl:attribute name="HREF">JavaScript:doRemove('<xsl:value-of select="MailId"/>')</xsl:attribute>
                    Remove
                  </a>
                </td>
                <td>
                  <xsl:value-of select="Timestamp"/>
                </td>
                <td>
                  <xsl:value-of select="Handle"/>
                </td>
                <td>
                  <xsl:value-of select="FromAddress"/>
                </td>
                <td>
                  <xsl:value-of select="ContactSubjects/SubjectDesc"/>
                </td>
              </tr>
              <tr><td colspan="5"><hr/></td></tr>
              <tr>
                <td colspan="5">
                  <xsl:value-of select="CommentQuestion"/>
                </td>
              </tr>
              <tr><td colspan="5"><hr/></td></tr>
              <br/>
            </table>
          </xsl:for-each>    
        </form>            
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
