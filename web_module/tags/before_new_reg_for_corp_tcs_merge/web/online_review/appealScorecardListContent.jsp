<%@ page language="java" %>
<%@ page import="com.topcoder.apps.review.projecttracker.ProjectType" %>
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="forumBkgd">
	<tr>
		<td class="whiteBkgnd">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td width="5%" align="left">
<logic:equal name="projectInfo" property="projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_design.gif" %>' width="66" height="62" alt="">
</logic:equal>
<logic:notEqual name="projectInfo" property="projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_development.gif" %>' width="66" height="62" alt="">
</logic:notEqual>
					</td>
                    <td width="5%">
<logic:equal name="projectInfo" property="catalog" value="Java">
                        <img src="/images/smJava.gif" alt="" width="33" height="17" border="0">
</logic:equal>
<logic:equal name="projectInfo" property="catalog" value=".NET">
                        <img src="/images/netSm.gif" alt="" width="33" height="17" border="0">
</logic:equal>
					</td>
					<td width="90%" nowrap class="tableHeader">
					    <strong><bean:write name="projectInfo" property="projectName" /></strong>
    				    <bean:message key="prompt.version" />
    				    <bean:write name="projectInfo" property="projectVersion" /></td>
				</tr>
				<tr>
					<td class="whiteBkgnd" colspan="4"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
				</tr>
			</table>
            <!-- Start Text -->

  <table class="forumBkgd" cellspacing="1" cellpadding="0" width="100%" border="0">
    <tbody>
      <tr>
        <td class="forumTextEven" colspan="5"><strong>Appeals</strong></td>
      </tr>
      <tr>
        <td class="forumTitleCenter" width="20%">Appeals</td>
        <td class="forumTitleCenter" width="20%">Appealer</td>
        <td class="forumTitleCenter" width="20%">Submitter</td>
        <td class="forumTitleCenter" width="20%">Reviewer</td>
        <td class="forumTitleCenter" width="20%">Status</td>
      </tr>
<logic:iterate id="appeal" indexId="appealIdx" name="appeals" type="com.topcoder.apps.review.document.Appeal">
<% String rowClassAppeal=(appealIdx.intValue()%2==0)?"forumTextCenterOdd":"forumTextCenterEven"; %>
<bean:define id="gLoc" name="appeal" property="question.scorecardSection.sectionGroup.sequenceLocation" />
<bean:define id="sLoc" name="appeal" property="question.scorecardSection.sequenceLocation" />
<bean:define id="qLoc" name="appeal" property="question.sequenceLocation" />
      <tr>
        <td class="<%=rowClassAppeal%>" nowrap>

          <bean:define id="projectId" name="project" property="id" />
          <bean:define id="aidValue" name="appeal" property="id" />
          <html:link page='<%="/appeal.do?id="+projectId+"&qid=-1&aid="+aidValue %>'>
            Response Q<bean:write name="gLoc"/>.<bean:write name="sLoc"/>.<bean:write name="qLoc"/>
          </html:link>

        </td>
        <td class="<%=rowClassAppeal%>" nowrap>
          <bean:write name="appeal" property="appealerSubmissionId" />
        </td>
        <td class="<%=rowClassAppeal%>" nowrap>
          <bean:write name="appeal" property="submissionId" />
        </td>
        <td class="<%=rowClassAppeal%>">
          <bean:write name="appeal" property="reviewer.handle" />
        </td>
        <td class="<%=rowClassAppeal%>" nowrap>
<logic:equal name="appeal" property="resolved" value="true">
          Resolved
</logic:equal>
<logic:equal name="appeal" property="resolved" value="false">
          Unresolved
</logic:equal>
        </td>
      </tr>
</logic:iterate>
    </tbody>
  </table>
  <table border="0" cellpadding="0" cellspacing="1" class="whiteBkgd" width="100%">
    <tr>
      <td class="forumTextOdd"><img src="/images/clear.gif" alt="" width="1" height="5" border="0"></td>
    </tr>
 </table>

		</td>
	</tr>
	<tr>
		<td align="center" class="lightBkgnd">
			<table border="0" cellpadding="0" cellspacing="4">
				<tr>
				    <form action="javascript:history.back()">
					<td><html:submit styleClass="submitButton"><bean:message key="button.back" /></html:submit></td></form>
				</tr>
			</table>
		</td>

	</tr>

<!-- End lists -->


</table>

