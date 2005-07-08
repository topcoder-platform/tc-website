<%@ page language="java" %>
<%@ page import="com.topcoder.apps.review.projecttracker.ProjectType" %>
<%@ page import="com.topcoder.apps.review.document.SubjectiveScorecardQuestion" %>
<%@ page import="com.topcoder.apps.review.document.TestCaseScorecardQuestion" %>
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<!-- Start Text -->
<table class="forumBkgd" cellspacing="1" cellpadding="0" width="100%" border="0">
<html:form action="/saveAppeal">
  <html:hidden property="id" />
<tbody>
<%--
<logic:equal name="appealForm" property="valid" value="false">
  <tr><td class="errorText"><UL><bean:message key="error.invalidData" /></UL></td></tr>
</logic:equal>
--%>
  <tr>
    <td class="whiteBkgnd">
      <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
          <tr>
            <td width="5%" align="left">
<logic:equal name="appealForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
              <img src='<%="/images/icon_design.gif" %>' width="66" height="62" alt="">
</logic:equal>
<logic:notEqual name="appealForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
              <img src='<%="/images/icon_development.gif" %>' width="66" height="62" alt="">
</logic:notEqual>
            </td>
            <td width="5%">
<logic:equal name="appealForm" property="project.catalog" value="Java">
              <img src="/images/smJava.gif" alt="" width="33" height="17" border="0">
</logic:equal>
<logic:equal name="appealForm" property="project.catalog" value=".NET">
              <img src="/images/netSm.gif" alt="" width="33" height="17" border="0">
</logic:equal>
            </td>
            <td width="90%" nowrap class="tableHeader">
              <strong><bean:write name="appealForm" property="project.projectName" /></strong>
              <bean:message key="prompt.version" />
              <bean:write name="appealForm" property="project.projectVersion" />
            </td>
          </tr>
          <tr>
            <td class="forumTextOdd" colspan="3">
<strong>
The following items can be appealed:
<ul>
<li>Technically inaccurate comments by a reviewer.</li>
<li>Factually inaccurate statements regarding the Requirements Specification.</li>
<li>Modifications to the requirements or design that were clarified in the forum.</li>
<li>Scores in which you feel you've exceeded the requirements but did not receive a 4.</li>
</ul>
The following items can NOT be appealed:
<ul>
<li>Design modifications that are required or recommended by the reviewer.  The winning member can discuss these issues during the final fixes phase.</li>
<li>General comments or opinions expressed by the reviewer.</li>
</ul>
</strong>
            </td>
          </tr>
          <tr>
            <td class="whiteBkgnd" colspan="3"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
          </tr>
          <tr>
            <td class="whiteBkgnd" align="center" colspan="3">
              <table class="forumBkgd" cellspacing="1" cellpadding="0" width="70%" border="0">
                <tbody>
                  <tr>
                    <td class="errorText" colspan="2"></td>
                  </tr>
                  <tr>
                    <td class="forumTextEven" nowrap><strong>Appeal Submission Form</strong></td>
                    <td class="forumTextCenterEven" nowrap>
<%-- Let reviewer change evaluation --%>
<bean:define id="aQuestion" name="appealForm" property="question" />
<% if (aQuestion instanceof SubjectiveScorecardQuestion) { %>
<logic:present name="reviewerEdit">
                      <html:select styleClass="searchForm" property="evaluation" >
                        <html:options property="evaluationAnswers" />
                      </html:select>
</logic:present>
<%-- Else just write the current evaluation --%>
<logic:notPresent name="reviewerEdit">
                      <strong><bean:write name="appealForm" property="evaluation" /></strong>
</logic:notPresent>
                    </td>
                  </tr>
<% } %>

<% if (aQuestion instanceof TestCaseScorecardQuestion) { %>
<logic:present name="reviewerEdit">
           &nbsp;Pass: <html:text property="totalPass" styleClass="registerForm" size="4" />
           &nbsp;Total: <html:text property="totalTests" styleClass="registerForm" size="4" />
</logic:present>
<%-- Else just write the current evaluation --%>
<logic:notPresent name="reviewerEdit">
						&nbsp;Pass: <bean:write name="aQuestion" property="totalPass" />
						&nbsp;Total: <bean:write name="aQuestion" property="totalTests" />
</logic:notPresent>
                    </td>
                  </tr>
<% } %>

<%-- The question text --%>
<bean:define id="gLoc" name="appealForm" property="question.scorecardSection.sectionGroup.sequenceLocation" />
<bean:define id="sLoc" name="appealForm" property="question.scorecardSection.sequenceLocation" />
<bean:define id="qLoc" name="appealForm" property="question.sequenceLocation" />
                  <tr>
                    <td class="forumTextOdd" colspan="2">
                      <strong>Question <bean:write name="gLoc"/>.<bean:write name="sLoc"/>.<bean:write name="qLoc"/></strong>
                      <br>
                      <bean:write name="appealForm" property="question.questionText" />
                    </td>
                  </tr>

<%-- The subjective responses --%>
<logic:iterate id="qresponse" indexId="qIdx" name="appealForm" property="question.responses">
                  <tr>
                    <td class="forumTextOdd">
                      <strong>Response:</strong>
                      <br>

<%-- Let reviewer edit responseText --%>
<logic:present name="reviewerEdit">
                      <html:textarea property='<%="appeal.question.responses["+qIdx+"].responseText"%>' rows="3" cols="65"/>
</logic:present>
<%-- Else just write the current responseText --%>
<logic:notPresent name="reviewerEdit">
                      <bean:write name="qresponse" property="responseText" />
</logic:notPresent>
                    </td>
                    <td class="forumTextCenterEven" nowrap>

<%-- Let reviewer edit responseType --%>
<logic:present name="reviewerEdit">
                      <html:select property='<%="responseType["+qIdx+"]"%>' >
                        <html:options property="responseAnswers" />
                      </html:select>
</logic:present>
<%-- Else just write the current responseType --%>
<logic:notPresent name="reviewerEdit">
                      <strong><bean:write name="qresponse" property="responseType.name" /></strong>
</logic:notPresent>
                    </td>
                  </tr>
</logic:iterate>

<%-- The appeal text --%>
                  <tr>
                    <td class="forumTextOdd" colspan="2">
                    <strong>Appeal Text:</strong><br>
<%-- Let appealer edit appealText --%>
<logic:present name="appealerEdit">
                      <html:textarea property="appealText" rows="10" cols="60"/>
</logic:present>
<%-- Else just write current appealText --%>
<logic:notPresent name="appealerEdit">
                      <bean:write name="appealForm" property="appealText" />
</logic:notPresent>
                    </td>
                  </tr>

<%-- The appeal response --%>
<%-- Let reviewer edit appealResponse --%>
<logic:present name="reviewerEdit">
                  <tr>
                    <td class="forumTextOdd" colspan="2">
                      <strong>Appeal Response:</strong><br>
                      <html:textarea property="appealResponse" rows="10" cols="60"/>
                    </td>
                  </tr>
</logic:present>
<%-- Else just write current appealResponse if resolved --%>
<logic:notPresent name="reviewerEdit">
<logic:equal name="appealForm" property="appeal.resolved" value="true">
                  <tr>
                    <td class="forumTextOdd" colspan="2">
                      <strong>Appeal Response:</strong><br>
                      <bean:write name="appealForm" property="appealResponse" />
                    </td>
                  </tr>
</logic:equal>
</logic:notPresent>
                </tbody>
              </table>
            </td>
          </tr>
        </tbody>
      </table>
    </td>
  </tr>
  <tr>
    <td class="lightBkgnd" align="center">
      <table cellspacing="4" cellpadding="0" border="0">
        <tbody>
          <tr>
<logic:notPresent name="appealerEdit">
<logic:notPresent name="reviewerEdit">
            <td>
              <html:button property="back" onclick="history.back()"><bean:message key="button.back" /></html:button>
            </td>
</logic:notPresent>
</logic:notPresent>
<logic:present name="appealerEdit">
            <td>
              <html:submit styleClass="submitButton" value="Submit Appeal"/>
            </td>
            <td>
              <html:cancel styleClass="submitButton" value="Cancel"/>
            </td>
</logic:present>
<logic:present name="reviewerEdit">
            <td>
              <html:submit styleClass="submitButton" value="Submit Response"/>
            </td>
            <td>
              <html:cancel styleClass="submitButton" value="Cancel"/>
            </td>
</logic:present>
          </tr>
        </tbody>
      </table>
    </td>
  </tr>
</tbody>
</html:form>
</table>

<!-- Content ends-->
<table cellspacing="0" cellpadding="0" width="100%" border="0">
  <tbody>
    <tr>
      <td height="15">
        <img height="15" alt="" src="/images/clear.gif" width="10" border="0">
      </td>
    </tr>
  </tbody>
</table>
