<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="member_surveys">
      <img src="/i/member_surveys_header.gif" alt="" width="244" height="20" border="0"/>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
         <tr>
             <td class="bodyText" valign="middle" background="/i/surveyBorderLeft.gif"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
             <td class="bodyText"><br/><font size="3"><b><xsl:value-of select="/TC/HOME/SurveyInfo/QuestionInfo/date"/> - </b></font>
                  <xsl:value-of select="/TC/HOME/SurveyInfo/QuestionInfo/question_text"/></td>
             <td class="bodyText" valign="middle" background="/i/surveyBorderRight.gif"><img src="/i/clear.gif" width="10" height="1" border="0"/></td></tr>
<!--         <tr><td class="bodyText" align="center"><a href="/">Submit</a> | <a href="/">View Results</a></td></tr>-->
         <tr>
             <td class="bodyText" align="center" valign="top" colspan="3" background="/i/surveyBorderBottom.gif">
                 <a>
                   <xsl:attribute name="href">/tc?&amp;module=SurveyResults&amp;sid=<xsl:value-of select="/TC/HOME/SurveyInfo/QuestionInfo/survey_id"/></xsl:attribute>
                   <img src="/i/results.gif" width="60" height="18" border="0"/>
                 </a>
                 <img src="/i/clear.gif" width="10" height="30" border="0"/>
                 <a>
                   <xsl:attribute name="href">/tc?&amp;module=ViewSurvey&amp;sid=<xsl:value-of select="/TC/HOME/SurveyInfo/QuestionInfo/survey_id"/></xsl:attribute>
                   <img src="/i/answer.gif" width="60" height="18" border="0"/>
                 </a>
             </td>
         </tr>
         <tr><td colspan="3"><img src="/i/clear.gif" width="244" height="10" border="0"/></td></tr>
      </table>
  </xsl:template>
</xsl:stylesheet>