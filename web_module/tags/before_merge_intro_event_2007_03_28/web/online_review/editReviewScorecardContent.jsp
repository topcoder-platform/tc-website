<%@ page language="java" %>
<%@ page import="com.topcoder.apps.review.projecttracker.ProjectType" %>
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<script>
    function set(form, what, qIdx, rIdx) {
        form.action.value = what;
        form.questionIndex.value = qIdx;
        form.responseIndex.value = rIdx;
    }
</script>

<!-- Start Title -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="forumBkgd">
    <html:form action="/saveReviewScorecard">
        <html:hidden property="id" />
        <html:hidden property="rid" />
        <html:hidden property="sid" />
        <html:hidden property="action" />
        <html:hidden property="questionIndex" />
        <html:hidden property="responseIndex" />

        <logic:equal name="reviewScorecardForm" property="valid" value="false">
            <tr>
                <td class="errorText">
                    <UL><bean:message key="error.invalidData" /></UL>
                </td>
            </tr>
        </logic:equal>

        <tr>
            <td class="whiteBkgnd">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="5%" align="left">
                            <logic:equal name="reviewScorecardForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
                                <img src='<%="/images/icon_design.gif" %>' width="66" height="62" alt="">
                            </logic:equal>
                            <logic:notEqual name="reviewScorecardForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
                                <img src='<%="/images/icon_development.gif" %>' width="66" height="62" alt="">
                            </logic:notEqual>
                        </td>
                        <td width="5%">
                            <logic:equal name="reviewScorecardForm" property="project.catalog" value="Java">
                                <img src="/images/smJava.gif" alt="" width="33" height="17" border="0">
                            </logic:equal>
                            <logic:equal name="reviewScorecardForm" property="project.catalog" value=".NET">
                                <img src="/images/netSm.gif" alt="" width="33" height="17" border="0">
                            </logic:equal>
                        </td>
                        <td width="40%" nowrap class="tableHeader">
                            <strong>
                                <bean:write name="reviewScorecardForm" property="project.name" />
                            </strong>
                            <bean:message key="prompt.version" />
                            <bean:write name="reviewScorecardForm" property="project.version" />
                        </td>
                        <td width="50%" valign="bottom" align="right" class="breadcrumb">
                            <bean:define id="theForm" name="reviewScorecardForm" type="com.topcoder.apps.review.AbstractScorecardForm" />
                            <html:link page='<%="/submissionDownload.do?id="+theForm.getProject().getId()+"&sid="+theForm.getSubmissionId()%>' styleClass="breadcrumbLinks">
                                <bean:message key="prompt.download" />
                            </html:link>
                        </td>
                    </tr>
                    <tr>
                        <td class="whiteBkgnd" colspan="4">
                            <img src="/images/clear.gif" alt="" width="1" height="1" border="0">
                        </td>
                    </tr>
                </table>

                <table width="100%" border="0" cellpadding="0" cellspacing="1" class="forumBkgd">
                    <tr>
                        <td class="blackBkgnd" colspan="2">
                            <bean:write name="reviewScorecardForm" property="project.projectType.name" />
                            Review Scorecard -
                            <bean:message key="prompt.submission" />
                            <review:showSubmissionId name="reviewScorecardForm" property="submission" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="forumTextOdd">
                            For the <bean:write name="reviewScorecardForm" property="project.projectType.name" />
                            Checklist, mark each deliverable as Yes, it exists; No, it does not exist; N/A,
                            this deliverable was not required. For the
                            <bean:write name="reviewScorecardForm" property="project.projectType.name" />
                            Review, provide a score for each statement according to the dropdown answers.
                        </td>
                    </tr>
                </table>

                <!-- Start Text -->
                <logic:iterate id="question" indexId="qIdx" name="reviewScorecardForm" property="questions">
                <!--
                    <logic:equal name="reviewScorecardForm" property="questionIndex" value="<%=String.valueOf(qIdx.intValue())%>">
                        <a name="lastPosition"></a>
                    </logic:equal>
                  -->

                    <logic:equal name="question" property="groupFirst" value="true">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="whiteBkgnd">
                                    <bean:write name="question" property="sectionGroup" />
                                </td>
                            </tr>
                        </table>
                    </logic:equal>
                    <logic:equal name="question" property="first" value="true">
                        <table width="100%" border="0" cellpadding="0" cellspacing="1" align="center" class="forumBkgd">
                            <tr>
                                <td width="80%" class="forumTitle">
                                    <strong>
                                        <bean:write name="question" property="scorecardSection" />
                                    </strong>
                                </td>
                                <td width="10%" class="forumTitleCenter">
                                    <strong>
                                        Weight: <bean:write name="question" property="question.scorecardSection.weight" />
                                    </strong>
                                </td>
                                <td width="10%" class="forumTitleCenter">
                                    <strong>
                                        <bean:message key="heading.response" />
                                    </strong>
                                </td>
                            </tr>
                    </logic:equal>
                            <logic:equal name="question" property="valid" value="false">
                                <tr>
                                    <td colspan="2" width="100%" class="errorText">
                                        <html:errors property='<%="questions["+qIdx+"]"%>' />
                                    </td>
                                </tr>
                            </logic:equal>
                            <tr>
                                <td width="80%" class="forumTextOdd">
                                    <review:showString name="question" property="questionText" styleClass="scorecardQuestion" />
                                </td>
                                <td width="10%" valign="top" class="forumTextOdd">
                                    Weight: <bean:write name="question" property="question.weight"/>
                                </td>
                                <td width="10%" valign="top" class="forumTextOdd">
                                    <logic:equal name="question" property="type" value="testcase">
                                        &nbsp;Pass: <html:text property='<%="questions["+qIdx+"].totalPass"%>' styleClass="registerForm" size="4" />
                                        <br>
                                        &nbsp;Total: <html:text property='<%="questions["+qIdx+"].totalTests"%>' styleClass="registerForm" size="4" />
                                    </logic:equal>
                                    <logic:notEqual name="question" property="type" value="testcase">
                                        <html:select styleClass="searchForm" property='<%="questions["+qIdx+"].evaluation"%>' >
                                            <html:options property='<%="questions["+qIdx+"].evaluationAnswers"%>' />
                                        </html:select>
                                    </logic:notEqual>
                                </td>
                            </tr>
                            <logic:notEqual name="question" property="type" value="objective">
                                <logic:iterate id="rspns" indexId="rIdx" name="question" property="responses">
                                    <tr>
                                        <td colspan="2">
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="whiteBkgnd">
                                                <logic:equal name="rspns" property="valid" value="false">
                                                    <tr>
                                                        <td colspan="5" width="100%" class="errorText">
                                                            <html:errors property='<%="questions["+qIdx+"].responses["+rIdx+"]"%>' />
                                                        </td>
                                                    </tr>
                                                </logic:equal>
                                                <tr>
                                                    <td width="15%" class="forumTextOdd" nowrap>
                                                        <strong>
                                                            <bean:message key="prompt.response" /> <%=rIdx.intValue()+1%>:
                                                        </strong>
                                                    </td>
                                                    <td width="60%" class="forumTextOdd">
                                                        <html:textarea property='<%="questions["+qIdx+"].responses["+rIdx+"].responseText"%>' rows="2" cols="65" />
                                                    </td>
                                                    <td width="15%" valign="middle" class="forumTextOdd">&nbsp;
                                                        <html:select property='<%="questions["+qIdx+"].responses["+rIdx+"].responseType"%>' >
                                                            <html:options property='<%="questions["+qIdx+"].responses["+rIdx+"].responseAnswers"%>' />
                                                        </html:select>
                                                    </td>
                                                    <td width="5%" valign="middle" class="forumTextOdd">
                                                        <% String doDel="'delete'"; %>
                                                        <html:submit styleClass="submitButton" onclick='<%="set(this.form,"+doDel+","+qIdx+","+rIdx+")"%>'>
                                                            <bean:message key="button.delete" />
                                                        </html:submit>
                                                    </td>
                                                    <td width="5%" valign="middle" class="forumTextOdd">
                                                        <logic:equal name="question" property="responseNum" value="<%=String.valueOf(rIdx.intValue()+1)%>">
                                                            <% String doAdd="'add'"; %>
                                                            <html:submit styleClass="submitButton" onclick='<%="set(this.form,"+doAdd+","+qIdx+","+rIdx+")"%>'>
                                                                <bean:message key="button.add" />
                                                            </html:submit>
                                                        </logic:equal>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </logic:iterate>
                            </logic:notEqual>
                            <logic:equal name="question" property="last" value="true">
                        </table>
                        <!-- spacer  -->
                        <table width="100%" border="0" cellpadding="2" cellspacing="0">
                            <tr>
                                <td class="normal">
                                    <img src="/images/clear.gif" alt="" width="1" height="5" border="0">
                                </td>
                            </tr>
                        </table>
                    </logic:equal>
                </logic:iterate>
            </td>
        </tr>

        <!-- Bottom Buttons -->
        <tr>
            <td align="center" class="lightBkgnd">
                <table border="0" cellpadding="0" cellspacing="4">
                    <tr>
                        <logic:equal name="utility" property="admin" value="false">
                            <td>
                                <html:submit styleClass="submitButton" onclick="set(this.form,'save', -1, -1)">
                                    <bean:message key="button.save" />
                                </html:submit>
                            </td>
                        </logic:equal>

                        <td>
                            <html:submit styleClass="submitButton" onclick="set(this.form,'finish', -1, -1)">
                                <bean:message key="button.finish" />
                            </html:submit>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </html:form>
</table>

<!--
<logic:notEqual name="reviewScorecardForm" property="questionIndex" value="-1">
    <script>
        window.location = "#lastPosition";
    </script>
</logic:notEqual>
 -->
