<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% ResultSetContainer survey = (ResultSetContainer)request.getAttribute("recent_srm_survey_question");%>

<rsc:iterator list="<%=survey%>" id="resultRow">
     <table width="100%" border="0" cellpadding="0" cellspacing="0">
         <tr><td><img src="/i/member_surveys_header.gif" alt="" width="244" height="20" border="0"/></td></tr>
         <tr>
             <td background="/i/surveyBorderMiddle.gif">
                  <table width="100%" border="0" cellpadding="10" cellspacing="0">
                     <tr>
                        <td class="surveyText">
                        <span class="surveyTextBig"><rsc:item name="date" row="<%=resultRow%>"/> - </span>
                        <rsc:item name="question_text" row="<%=resultRow%>"/>
                        </td>
                     </tr>
                  </table>
             </td>
         </tr>
         <tr>
             <td align="center" valign="top" background="/i/surveyBorderBottom.gif">
                 <a href="/tc?module=SurveyResults&sid=<rsc:item name="survey_id" row="<%=resultRow%>"/>">
                   <img src="/i/results.gif" width="60" height="18" border="0"/>
                 </a>
                 <img src="/i/clear.gif" width="10" height="30" border="0"/>
                 <a href="/tc?module=ViewSurvey&sid=<rsc:item name="survey_id" row="<%=resultRow%>"/>">
                   <img src="/i/answer.gif" width="60" height="18" border="0"/>
                 </a>
             </td>
         </tr>
      </table>
</rsc:iterator>
