<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="member_surveys">
      <img src="/i/member_surveys_header.gif" alt="" width="244" height="20" border="0"/>
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
      
         <tr valign="middle">
             <td class="surveyText">
                  <span class="surveyTextBig"><xsl:value-of select="/TC/HOME/SurveyInfo/QuestionInfo/date"/> - </span>
                  <xsl:value-of select="/TC/HOME/SurveyInfo/QuestionInfo/question_text"/>
              </td>
         </tr>
         <tr valign="top">
             <td align="center" background="/i/surveyBorderBottom.gif">
                 <A><xsl:attribute name="href">/tc?&amp;module=SurveyResults&amp;sid=<xsl:value-of select="/TC/HOME/SurveyInfo/QuestionInfo/survey_id"/></xsl:attribute><img src="/i/results.gif" width="60" height="18" border="0"/></A>
                 <img src="/i/clear.gif" width="10" height="30" border="0"/>
                 <A><xsl:attribute name="href">/tc?&amp;module=ViewSurvey&amp;sid=<xsl:value-of select="/TC/HOME/SurveyInfo/QuestionInfo/survey_id"/></xsl:attribute><img src="/i/answer.gif" width="60" height="18" border="0"/></A>
             </td>
         </tr>
         
         <tr>
            <td><img src="/i/clear.gif" width="244" height="10" border="0"/></td>
         </tr>
         
      </table>
  </xsl:template>
</xsl:stylesheet>