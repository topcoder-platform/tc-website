<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="question_week">
      <img src="/i/question_otw.gif" alt="" width="244" height="20" border="0"/>
      <table width="100%" border="0" cellpadding="10" cellspacing="0" class="bodyText">
         <tr><td class="bodyText"><xsl:value-of select="/TC/HOME/SurveyInfo/QuestionInfo/question_text"/></td></tr>
<!--         <tr><td class="bodyText" align="center"><a href="/">Submit</a> | <a href="/">View Results</a></td></tr>-->
         <tr>
             <td class="bodyText" align="center">
                 <a>
                   <xsl:attribute name="href">/tc?&amp;module=ViewSurvey&amp;sid=<xsl:value-of select="/TC/HOME/SurveyInfo/QuestionInfo/survey_id"/></xsl:attribute>
                   <img src="/i/submit.gif" width="101" height="20" border="0"/>
                 </a>
                 <a>
                   <xsl:attribute name="href">/tc?&amp;module=SurveyResults&amp;sid=<xsl:value-of select="/TC/HOME/SurveyInfo/QuestionInfo/survey_id"/></xsl:attribute>
                   <img src="/i/view_results.gif" width="101" height="20" border="0"/>
                 </a>
             </td>
         </tr>
      </table>
  </xsl:template>
</xsl:stylesheet>