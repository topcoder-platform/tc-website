<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% ResultSetContainer survey = (ResultSetContainer)request.getAttribute("recent_srm_survey_question");%>

<rsc:iterator list="<%=survey%>" id="resultRow">
            <table width="530" border="0" cellspacing="0" cellpadding="3">
                <tr valign="middle">
                    <td class="statTextLarge" bgcolor="#999999"><font size="3">Member Surveys</font></td>
                </tr>
            </table>
            
            <table width="530" cellspacing="0" cellpadding="0" border="0">
                <tr>
                    <td>
                        <p class="surveyText"><span class="surveyTextBig"><rsc:item name="date" row="<%=resultRow%>"/> - </span><rsc:item name="question_text" row="<%=resultRow%>"/></p>
                    </td>
                </tr>
                
                <tr valign="top">
                    <td class="surveyButtons">
                        <a href="/tc?module=SurveyResults&sid=<rsc:item name="survey_id" row="<%=resultRow%>"/>"><img src="/i/results.gif" width="60" height="18" border="0"/></a>
                        <a href="/tc?module=ViewSurvey&sid=<rsc:item name="survey_id" row="<%=resultRow%>"/>"><img src="/i/answer.gif" width="60" height="18" border="0"/></a>
                    </td>
                </tr>
            </table>
</rsc:iterator>
            