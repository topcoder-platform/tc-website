<%@ page language="java" %>
<%@ page import="com.topcoder.apps.review.projecttracker.ProjectType" %>
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<!-- Start Title -->
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="forumBkgd">
    <tr>
        <td class="whiteBkgnd">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
<logic:equal name="utility" property="emptyNotice" value="false">
                <tr>
                    <td colspan="3" class="yellowBkgnd"><strong><bean:write name="utility" property="notice" /></strong></td>
                </tr>
</logic:equal>
                <tr valign="middle">
                    <td width="5%" align="left">
<logic:equal name="project" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_design.gif" %>' width="66" height="62" alt="">
</logic:equal>
<logic:notEqual name="project" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">
						<img src='<%="/images/icon_development.gif" %>' width="66" height="62" alt="">
</logic:notEqual>

					</td>
                    <td width="5%">
<logic:equal name="project" property="project.catalog" value="Java">
                        <img src="/images/smJava.gif" alt="" width="33" height="17" border="0">
</logic:equal>
<logic:equal name="project" property="project.catalog" value=".NET">
                        <img src="/images/netSm.gif" alt="" width="33" height="17" border="0">
</logic:equal>
					</td>
                    <td width="40%" nowrap class="tableHeader">
                        <strong><bean:write name="project" property="name" /></strong>
                        <bean:message key="prompt.version" />
                        <bean:write name="project" property="version" /></td>
                    <bean:define id="compId" name="project" property="project.catalogueId" />
                    <bean:define id="forumId" name="project" property="project.forumId" />
                    <td width="50%" align="right" class="breadcrumb"><html:link href='<%="/catalog/c_component.jsp?comp="+compId%>' styleClass="breadcrumbLinks"><bean:message key="prompt.componentDesc" /></html:link> |
                        <html:link href='<%="/forum/c_forum.jsp?f="+forumId%>' styleClass="breadcrumbLinks"><bean:message key="prompt.developForum" /></html:link></td>
                </tr>

                <tr>
                    <td class="bodyText" colspan="4"><strong><bean:message key="prompt.overview" /></strong><br>
                    <review:showString name="project" property="overview" /></td>
                </tr>
                <tr>
                    <td class="whiteBkgnd" colspan="4"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
                </tr>
            </table>

<!-- Time Line -->

            <table border="0" cellpadding="0" cellspacing="1" class="forumBkgd" width="100%">
                <tr>
                    <bean:define id="theProject" name="project" property="project" type="com.topcoder.apps.review.projecttracker.Project" />
                    <td colspan="<%=theProject.getTimeline().length+1%>" class="timelineSubtitle"><strong><bean:message key="prompt.timeline" /></strong></td>
                </tr>
                <tr>
                    <td class="timelineTitleCenter" width="1"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
                    <logic:iterate id="phaseInstance" name="project" property="timeline">
                        <td class="timelineTitleCenter" width="12%"><bean:write name="phaseInstance" property="phase.name" /></td>
                    </logic:iterate>
                </tr>
                <tr>
                    <td class="timelineTitleCenter"><strong><bean:message key="prompt.timelineStart" /></strong></td>
                    <bean:define id="currentPhase" name="project" property="currentPhase" />
                    <logic:iterate id="phaseInstance" name="project" property="timeline">
                        <logic:equal name="phaseInstance" property="phase.name" value="<%=currentPhase.toString()%>">
                            <td class="timelineHiliteCenter">
                                <strong><review:showDate name="phaseInstance" property="startDate" /></strong></td>
                        </logic:equal>
                        <logic:notEqual name="phaseInstance" property="phase.name" value="<%=currentPhase.toString()%>">
                            <td class="timelineCenter">
                                <review:showDate name="phaseInstance" property="startDate" /></td>
                        </logic:notEqual>
                    </logic:iterate>
                </tr>
                <tr>
                    <td class="timelineTitleCenter"><strong><bean:message key="prompt.timelineEnd" /></strong></td>
                    <logic:iterate id="phaseInstance" name="project" property="timeline">
                        <logic:equal name="phaseInstance" property="phase.name" value="<%=currentPhase.toString()%>">
                            <td class="timelineHiliteCenter">
                                <strong><review:showDate name="phaseInstance" property="endDate" /></strong></td>
                        </logic:equal>
                        <logic:notEqual name="phaseInstance" property="phase.name" value="<%=currentPhase.toString()%>">
                            <td class="timelineCenter">
                                <review:showDate name="phaseInstance" property="endDate" /></td>
                        </logic:notEqual>
                    </logic:iterate>
                </tr>
            </table>

<!-- Notes -->

            <img src="/images/clear.gif" alt="" width="1" height="5" border="0"><br/>

            <table border="0" cellpadding="0" cellspacing="1" class="forumBkgd" width="100%">
                <tr>
                    <td class="forumTextEven"><strong><bean:message key="prompt.projectNotes" /></strong></td>
                </tr>
                <tr>
                    <td class="forumTextOdd"><review:showString name="project" property="notes" /></td>
                </tr>
            </table>

            <img src="/images/clear.gif" alt="" width="1" height="5" border="0"><br/>

<!-- Appeals List -->

<logic:present name="appeals">
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
<logic:iterate id="appeal" indexId="appealIdx" name="appeals">
<% String rowClassAppeal=(appealIdx.intValue()%2==0)?"forumTextCenterOdd":"forumTextCenterEven"; %>
<bean:define id="gLoc" name="appeal" property="question.scorecardSection.sectionGroup.sequenceLocation" />
<bean:define id="sLoc" name="appeal" property="question.scorecardSection.sequenceLocation" />
<bean:define id="qLoc" name="appeal" property="question.sequenceLocation" />
      <tr>
        <td class="<%=rowClassAppeal%>" nowrap>
          <bean:define id="projectId" name="project" property="project.id" />
          <bean:define id="aidValue" name="appeal" property="id" />
          <html:link page='<%="/appeal.do?id="+projectId+"&qid=-1&aid="+aidValue %>'>
            Response Q<bean:write name="gLoc"/>.<bean:write name="sLoc"/>.<bean:write name="qLoc"/>
          </html:link>
        </td>
<%--
        <td class="<%=rowClassAppeal%>" nowrap>
          <bean:write name="appeal" property="appealer.handle" />
        </td>
        <td class="<%=rowClassAppeal%>" nowrap>
          <bean:write name="appeal" property="submitter.handle" />
        </td>
--%>
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
</logic:present>

<!-- Resources -->

            <table border="0" cellpadding="0" cellspacing="0" class="whiteBkgnd">
<logic:present name="submission">
<logic:greaterThan name="submission" property="finalScore" value="0">
                <tr>
                    <td class="forumText">Final Score: <bean:write name="submission" property="finalScore"/></td>
                </tr>
                <tr>
                    <td class="forumText">Placement: <bean:write name="submission" property="placement"/></td>
                </tr>
</logic:greaterThan>
</logic:present>
                <tr>
                    <td class="forumText"><strong><bean:message key="prompt.projectMyRole" /></strong></td>
                </tr>
                <tr>
                    <td class="forumTextOdd"><review:showRoles name="project" property="project" /></td>
                </tr>
                <tr>
                    <td class="forumText"><strong><bean:message key="prompt.deliverable" /></strong></td>
                </tr>
                <tr>
                    <td class="forumTextOdd"><review:showDeliverable name="project" property="project" date="true" /></td>
                </tr>
<logic:present name="submission">
                <tr>
                    <td class="forumTextOdd">
						<bean:define id="projectId" name="project" property="id" />
						<bean:define id="submissionId" name="sid" />
					    <html:link page='<%="/submissionDownload.do?id="+projectId+"&sid="+submissionId %>' styleClass="breadcrumbLinks"><bean:message key="prompt.download" /></html:link></td>
                </tr>
</logic:present>
            </table>
<logic:present name="finalfix">
            <table border="0" cellpadding="0" cellspacing="1" class="forumBkgd" width="100%">
                <tr>
                    <td colspan="4" class="forumTextEven"><strong><bean:message key="prompt.finalFix" /></strong></td>
                </tr>
                <tr>
                    <td width="20%" class="forumTitleCenter"><bean:message key="heading.submitter" /></td>
                    <td width="40%" class="forumTitleCenter"><bean:message key="heading.download" /></td>

                </tr>
                <tr>
                    <td class="forumTextCenterOdd">
                        <bean:message key="prompt.submitter" />
                        (<bean:write name="project" property="winner.handle" />)</td>
                    <td class="forumTextCenterOdd">
    <logic:equal name="finalfix" value="false">
                        <bean:message key="prompt.nonAvailable" />
    </logic:equal>
    <logic:notEqual name="finalfix" value="false">
                        <a href='/review/submissionDownload.do?id=<bean:write name="finalfix" />&sid=-1'><bean:message key="prompt.download" /></a></td>
    </logic:notEqual>
                </tr>
            </table>
</logic:present>
            <table border="0" cellpadding="0" cellspacing="1" class="whiteBkgd" width="100%">
                <tr>
                    <td class="forumTextOdd"><img src="/images/clear.gif" alt="" width="1" height="5" border="0"></td>
                </tr>
            </table>
<logic:equal name="utility" property="board" value="true">
            <table border="0" cellpadding="0" cellspacing="1" class="forumBkgd" width="100%">
                <tr>
                    <td colspan="5" class="forumTextEven"><strong><bean:message key="prompt.projectResource" /></strong></td>
                </tr>
                <tr>
                    <td width="25" class="forumTitleCenter"><bean:message key="heading.role" /></td>
                    <td width="25" class="forumTitleCenter"><bean:message key="heading.name" /></td>
                    <td width="15" class="forumTitleCenter"><bean:message key="heading.testCase" /></td>
                    <td width="30" class="forumTitleCenter"><bean:message key="heading.payment" /></td>
                    <td width="5" class="forumTitleCenter"><bean:message key="heading.paymentSent" /></td>
                </tr>
    <logic:equal name="project" property='winnerValid' value="true">
                <tr>
                    <td nowrap class="forumTextCenterEven">
                        Winner</td>
                    <td nowrap class="forumTextCenterEven">
                        <bean:write name="project" property='winner.handle' /></td>
                    <td class="forumTextCenterEven">
                        &nbsp;</td>
                    <td nowrap class="forumTextCenterEven">
                        &nbsp;</td>
                    <td class="forumTextCenterEven">
                        &nbsp;</td>
                </tr>
    </logic:equal>
    <logic:iterate id="participant" indexId="pIdx" name="project" property="participants">
        <logic:equal name="project" property='<%="showParticipants["+pIdx+"]"%>' value="1">
                <tr>
                    <td nowrap class="forumTextCenterOdd">
                        <bean:write name="participant" property="role.name" /></td>
                    <td nowrap class="forumTextCenterOdd">
                        <bean:write name="project" property='<%="user["+pIdx+"]"%>' /></td>
                    <td class="forumTextCenterOdd">
                        <bean:write name="project" property='<%="responsibility["+pIdx+"]"%>' /></td>
                    <td nowrap class="forumTextCenterOdd">
                        <bean:write name="project" property='<%="payment["+pIdx+"]"%>' /></td>
                    <td class="forumTextCenterOdd">
                        <bean:write name="project" property='<%="paymentStatus["+pIdx+"]"%>' /></td>
                </tr>
        </logic:equal>
        <logic:equal name="project" property='<%="showParticipants["+pIdx+"]"%>' value="2">
                <tr>
                    <td nowrap class="forumTextCenterEven">
                        <bean:write name="participant" property="role.name" /></td>
                    <td nowrap class="forumTextCenterEven">
                        <bean:write name="project" property='<%="user["+pIdx+"]"%>' /></td>
                    <td class="forumTextCenterEven">
                        <bean:write name="project" property='<%="responsibility["+pIdx+"]"%>' /></td>
                    <td nowrap class="forumTextCenterEven">
                        <bean:write name="project" property='<%="payment["+pIdx+"]"%>' /></td>
                    <td class="forumTextCenterEven">
                        <bean:write name="project" property='<%="paymentStatus["+pIdx+"]"%>' /></td>
                </tr>
        </logic:equal>
    </logic:iterate>
            </table>
</logic:equal>
        </td>
    </tr>
    <tr>
        <td align="center" class="lightBkgnd">
            <table border="0" cellpadding="0" cellspacing="4">
                <tr>
                    <td><review:showDeliverable name="project" property="project" button="true" styleClass="submitButton" />
                    <review:contactPM name="project" property="id" button="true" styleClass="submitButton" /></td>
                </tr>
            </table>
        </td>

    </tr>
</table>

    <img src="/images/clear.gif" alt="" width="1" height="5" border="0"><br/>

<!-- End lists -->


