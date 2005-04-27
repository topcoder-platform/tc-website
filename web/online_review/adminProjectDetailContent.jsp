<%@ page language="java" %>
<%@ page import="com.topcoder.apps.review.projecttracker.ProjectType, com.topcoder.apps.review.AdminScreeningScorecardBean" %> 
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
                <tr>
                    <td width="5%" align="left">
<logic:equal name="project" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">                    
						<img src='<%="images/icon_design.gif" %>' width="66" height="62" alt="">
</logic:equal>						
<logic:notEqual name="project" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">                    
						<img src='<%="images/icon_development.gif" %>' width="66" height="62" alt="">
</logic:notEqual>						
					</td>
                    <td width="5%">
<logic:equal name="project" property="project.catalog" value="Java">
                        <img src="images/smJava.gif" alt="" width="33" height="17" border="0">
</logic:equal>
<logic:equal name="project" property="project.catalog" value=".NET">
                        <img src="images/netSm.gif" alt="" width="33" height="17" border="0">
</logic:equal>
					</td>
                    <td width="40%" nowrap class="tableHeader">
                        <strong><bean:write name="project" property="name" /></strong> 
                        <bean:message key="prompt.version" />
                        <bean:write name="project" property="version" /></td>
                    <bean:define id="compId" name="project" property="project.catalogueId" />
                    <bean:define id="forumId" name="project" property="project.forumId" />
                    <td width="50%" valign="bottom" align="right" class="breadcrumb"><html:link href='<%="/catalog/c_component.jsp?comp="+compId%>' styleClass="breadcrumbLinks"><bean:message key="prompt.componentDesc" /></html:link> |
                        <html:link href='<%="/forum/c_forum.jsp?f="+forumId%>' styleClass="breadcrumbLinks"><bean:message key="prompt.developForum" /></html:link></td>
                </tr>
<logic:notEqual name="project" property="action" value="partial">
                <tr>
                    <td class="forumTextOdd" colspan="4"><strong><bean:message key="prompt.overview" /></strong><br>
                    <review:showString name="project" property="overview" /></td>
                </tr>
</logic:notEqual>                
                <tr>
                    <td class="whiteBkgnd" colspan="4"><img src="images/clear.gif" alt="" width="1" height="1" border="0"></td>
                </tr>
            </table>
                        
<!-- Time Line -->
<logic:notEqual name="project" property="action" value="partial">                
            <table border="0" cellpadding="0" cellspacing="1" class="forumBkgd" width="100%">
                <tr>
                    <bean:define id="theProject" name="project" property="project" type="com.topcoder.apps.review.projecttracker.Project" />
                    <td colspan="<%=theProject.getTimeline().length+1%>" class="forumTextEven"><strong><bean:message key="prompt.timeline" /></strong></td>
                </tr>
                <tr>
                    <td class="forumTitleCenter"><img src="images/clear.gif" alt="" width="1" height="1" border="0"></td>
    <logic:iterate id="phaseInstance" name="project" property="timeline">
                    <td class="forumTitleCenter"><bean:write name="phaseInstance" property="phase.name" /></td>
    </logic:iterate>
                </tr>
                <tr>
                    <td class="forumTextCenterOdd"><strong><bean:message key="prompt.timelineStart" /></strong></td>
    <bean:define id="currentPhase" name="project" property="currentPhase" />
    <logic:iterate id="phaseInstance" name="project" property="timeline">
        <logic:equal name="phaseInstance" property="phase.name" value="<%=currentPhase.toString()%>">
                    <td class="forumTextCenterEven">
                        <strong><review:showDate name="phaseInstance" property="startDate" /></strong></td>
        </logic:equal>            
        <logic:notEqual name="phaseInstance" property="phase.name" value="<%=currentPhase.toString()%>">
                    <td class="forumTextCenterOdd">
                        <review:showDate name="phaseInstance" property="startDate" /></td>
        </logic:notEqual>            
    </logic:iterate>
                </tr>
                <tr>
                    <td class="forumTextCenterOdd"><strong><bean:message key="prompt.timelineEnd" /></strong></td>
    <logic:iterate id="phaseInstance" name="project" property="timeline">
        <logic:equal name="phaseInstance" property="phase.name" value="<%=currentPhase.toString()%>">
                    <td class="forumTextCenterEven">
                        <strong><review:showDate name="phaseInstance" property="endDate" /></strong></td>
        </logic:equal>            
        <logic:notEqual name="phaseInstance" property="phase.name" value="<%=currentPhase.toString()%>">
                    <td class="forumTextCenterOdd">
                        <review:showDate name="phaseInstance" property="endDate" /></td>
        </logic:notEqual>            
    </logic:iterate>
                </tr>
            </table>
            
            <table border="0" cellpadding="0" cellspacing="1" class="whiteBkgd" width="100%">
                <tr>
                    <td class="forumTextOdd"><img src="images/clear.gif" alt="" width="1" height="5" border="0"></td>
                </tr>
            </table>
                        
            <table border="0" cellpadding="0" cellspacing="1" class="forumBkgd" width="100%">
                <tr>
                    <td class="forumTextEven"><strong><bean:message key="prompt.projectNotes" /></strong></td>
                </tr>
                <tr>
                    <td class="forumTextOdd"><review:showString name="project" property="notes" /></td>
                </tr>
            </table>
            
            <table border="0" cellpadding="0" cellspacing="1" class="whiteBkgd" width="100%">
                <tr>
                    <td class="forumTextOdd"><img src="images/clear.gif" alt="" width="1" height="5" border="0"></td>
                </tr>
            </table>
            Screening scorecard:
            <bean:write name="project" property="screeningTemplate" /><br>
            Review scorecard:
            <bean:write name="project" property="reviewTemplate" /><br><br>
</logic:notEqual>
            
<!-- Submission List -->

<logic:present name="submissions">            
            <table border="0" cellpadding="0" cellspacing="1" class="forumBkgd" width="100%">
                <tr>
                    <td colspan="4" class="forumTextEven"><strong><bean:message key="prompt.submissionAdmin" /></strong></td>
                </tr>
                <tr>
                    <td width="20%" class="forumTitleCenter"><bean:message key="heading.submitter" /></td>
                    <td width="20%" class="forumTitleCenter"><bean:message key="heading.remove" /></td>
                    <td width="40%" class="forumTitleCenter"><bean:message key="heading.download" /></td>
                                
                </tr>
    <logic:iterate id="submission" indexId="sIdx" name="submissions" type="com.topcoder.apps.review.document.AbstractSubmission" >
        <% String rowClass=(sIdx.intValue()%2==0)?"forumTextCenterOdd":"forumTextCenterEven"; %>
                <tr>
                    <td class="<%=rowClass%>">
                        <bean:message key="prompt.submitter" /> <review:showSubmissionId name="submission" /> 
                        (<bean:write name="submission" property="submitter.handle" />)</td>
                    <td class="<%=rowClass%>">
                        <review:linkSubmission page="/removeSubmission.do" name="submission"><bean:message key="prompt.remove" /></review:linkSubmission></td>
                    <td class="<%=rowClass%>">
                        <html:link page='<%="/submissionDownload.do?id="+submission.getProject().getId()+"&sid="+submission.getId()%>'><bean:message key="prompt.submission" /></html:link></td>
                                
                </tr>
    </logic:iterate>
            </table>
</logic:present>

<!-- Screening Scorecards List -->

<logic:present name="screenings">
            <table border="0" cellpadding="0" cellspacing="1" class="forumBkgd" width="100%">
                <tr>
                    <td colspan="4" class="forumTextEven"><strong><bean:message key="prompt.screeningAdmin" /></strong></td>
                </tr>
                <tr>
                    <td class="forumTitleCenter"><bean:message key="prompt.submission" /></td>
                    <td class="forumTitleCenter"><bean:message key="prompt.screening" /></td>
                    <td class="forumTitleCenter"><bean:message key="prompt.advancedToReview" /></td>
                    <td class="forumTitleCenter"><bean:message key="prompt.pmReview" /></td>
                </tr>
    <logic:iterate id="adminBean" indexId="aIdx" name="screenings">
        <% String rowClass2=(aIdx.intValue()%2==0)?"forumTextCenterOdd":"forumTextCenterEven"; %>
                <tr>
                    <td class="<%=rowClass2%>">
                        <bean:message key="prompt.submission" /> <review:showSubmissionId name="adminBean" property="submission" /> (<bean:write name="adminBean" property="submission.submitter.handle" />)</td>
                    <td class="<%=rowClass2%>">
        <logic:equal name="adminBean" property="scorecardExists" value="false">
                        <bean:message key="prompt.nonAvailable" />
        </logic:equal>
        <logic:equal name="adminBean" property="scorecardExists" value="true">
            <bean:define id="scorecard" name="adminBean" property="scorecard" type="com.topcoder.apps.review.document.AbstractScorecard" />
                        <review:linkScorecard page="/screeningScorecard.do?action=admin" name="scorecard">
            <bean:define id="completed" value="<%=String.valueOf(scorecard.isCompleted())%>" />
            <logic:equal name="completed" value="true">
                            <bean:write name="adminBean" property="score" /> 
				<logic:equal name="adminBean" property="passed" value="true">
							(Passed)
				</logic:equal>
				<logic:equal name="adminBean" property="passed" value="false">
							(Not Passed)
				</logic:equal>
            </logic:equal>
            <logic:equal name="completed" value="false">
                            <bean:message key="prompt.pending" />
            </logic:equal>
                        </review:linkScorecard>
        </logic:equal>                
                    </td>
                    <td class="<%=rowClass2%>">
        <logic:equal name="adminBean" property="scorecardExists" value="true">
                   <bean:define id="completed" value="<%=((AdminScreeningScorecardBean)adminBean).getAdvancedToReview()%>" />
                   <bean:write name="completed" /> 
        </logic:equal>
		<logic:equal name="adminBean" property="scorecardExists" value="false">
                        <bean:message key="prompt.nonAvailable" />
        </logic:equal>                    
                    </td>
                    <td class="<%=rowClass2%>">
        <logic:equal name="adminBean" property="scorecardExists" value="true">
                        <review:linkSubmission page="/projectManagerReview.do" name="adminBean" property="submission">
			<logic:equal name="adminBean" property="isPMReviewed" value="true">
                            <bean:message key="prompt.complete" />
			</logic:equal>
			<logic:equal name="adminBean" property="isPMReviewed" value="false">
                            <bean:message key="prompt.incomplete" />
			</logic:equal>
                        </review:linkSubmission>
		</logic:equal>                        
		<logic:equal name="adminBean" property="scorecardExists" value="false">
                        <bean:message key="prompt.nonAvailable" />
        </logic:equal>
                    </td>
                </tr>
    </logic:iterate>
            </table>
</logic:present>

<!-- Review Scorecards List -->

<logic:present name="reviews">
            <table border="0" cellpadding="0" cellspacing="1" class="whiteBkgd" width="100%">
                <tr>
                    <td class="forumTextOdd"><img src="images/clear.gif" alt="" width="1" height="5" border="0"></td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="1" class="forumBkgd" width="100%">
                <tr>
                    <td colspan="6" class="forumTextEven"><strong><bean:message key="prompt.reviewAdmin" /></strong></td>
                </tr>
                <tr>
                    <td class="forumTitleCenter"><bean:message key="prompt.submission" /></td>
                    <td class="forumTitleCenter"><bean:message key="prompt.score" /></td>
    <logic:iterate id="participant" indexId="pIdx" name="project" property="participants">
        <logic:notEqual name="project" property='<%="reviewerSeqs["+pIdx+"]"%>' value="0">
                    <td class="forumTitleCenter">
                        <bean:message key="prompt.reviewer" /> (<bean:write name="project" property='<%="user["+pIdx+"]"%>' />)</td>
        </logic:notEqual>
    </logic:iterate>
                    <td class="forumTitleCenter"><bean:message key="prompt.pmReview" /></td>
                </tr>
    <logic:iterate id="adminBean" indexId="aIdx" name="reviews" >
        <% String rowClass3=(aIdx.intValue()%2==0)?"forumTextCenterOdd":"forumTextCenterEven"; %>
                <tr>
                    <td class="<%=rowClass3%>">
                        <bean:message key="prompt.submission" /> <review:showSubmissionId name="adminBean" property="submission" /> (<bean:write name="adminBean" property="submission.submitter.handle" />)</td>
                    <td class="<%=rowClass3%>">
        <logic:equal name="adminBean" property="avgScoreReady" value="true">
                        <review:linkSubmission page="/reviewScorecardOverview.do" name="adminBean" property="submission">
                            <bean:write name="adminBean" property="avgScore" />
                        </review:linkSubmission>
        </logic:equal>
        <logic:equal name="adminBean" property="avgScoreReady" value="false">
                        <bean:write name="adminBean" property="avgScore" />
        </logic:equal>
                    </td>
        <logic:iterate id="scorecard" indexId="sIdx" name="adminBean" property="scorecards" type="com.topcoder.apps.review.document.AbstractScorecard">
                    <td class="<%=rowClass3%>">
            <logic:equal name="adminBean" property='<%="scorecardExists["+sIdx+"]"%>' value="true">
                        <review:linkScorecard page="/reviewScorecard.do?action=admin" name="scorecard">
                <bean:define id="completed" value="<%=String.valueOf(scorecard.isCompleted())%>" />
                <logic:equal name="completed" value="true">
                            <bean:write name="adminBean" property='<%="score["+sIdx+"]"%>' />
                </logic:equal>
                <logic:equal name="completed" value="false">
                            <bean:message key="prompt.pending" />
                </logic:equal>
                        </review:linkScorecard>
            </logic:equal>
            <logic:equal name="adminBean" property='<%="scorecardExists["+sIdx+"]"%>' value="false">
                        <bean:message key="prompt.nonAvailable" />
            </logic:equal>
                    </td>
            
        </logic:iterate>
                    <td class="<%=rowClass3%>">
		<logic:equal name="adminBean" property="avgScoreReady" value="true">                    
                        <review:linkSubmission page="/projectManagerReview.do" name="adminBean" property="submission">
			<logic:equal name="adminBean" property="isPMReviewed" value="true">
                            <bean:message key="prompt.complete" />
			</logic:equal>
			<logic:equal name="adminBean" property="isPMReviewed" value="false">
                            <bean:message key="prompt.incomplete" />
			</logic:equal>
                        </review:linkSubmission>
        </logic:equal>                
		<logic:equal name="adminBean" property="avgScoreReady" value="false">
                        <bean:message key="prompt.nonAvailable" />
        </logic:equal>                        
                    </td>
                </tr>
    </logic:iterate>
            </table>
</logic:present>

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
        <!-- <td class="forumTitleCenter" width="20%">Submitter</td> -->
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
          <bean:define id="qidValue" name="appeal" property="question.id" />
          <bean:define id="aidValue" name="appeal" property="appealer.id" />
          <html:link page='<%="/appeal.do?action=admin&id="+projectId+"&qid="+qidValue+"&aid="+aidValue %>'>
          Response Q<bean:write name="gLoc"/>.<bean:write name="sLoc"/>.<bean:write name="qLoc"/>
          </html:link>
        </td>
        <td class="<%=rowClassAppeal%>" nowrap>
          <bean:write name="appeal" property="appealer.handle" />
        </td>
        <!--
        <td class="<%=rowClassAppeal%>" nowrap>
          <bean:write name="appeal" property="submitter.handle" />
        </td>
        -->
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
      <td class="forumTextOdd"><img src="images/clear.gif" alt="" width="1" height="5" border="0"></td>
    </tr>
 </table>
</logic:present>

<!-- Aggregation Worksheet -->

<logic:present name="aggregation">
            <table border="0" cellpadding="0" cellspacing="1" class="forumBkgd" width="50%">
                <tr>
                    <td colspan="2" class="forumTextEven"><strong><bean:message key="prompt.aggregationAdmin" /></strong></td>
                </tr>
                <tr>
                    <td class="forumTitleCenter"><bean:message key="prompt.boardMember" /></td>
                    <td class="forumTitleCenter"><bean:message key="prompt.status" /></td>
                </tr>
                <tr>
                    <td class="forumTextCenterOdd"><bean:message key="prompt.aggregator" /></td>
                    <td class="forumTextCenterOdd">
                        <bean:define id="worksheet" name="aggregation" type="com.topcoder.apps.review.document.AggregationWorksheet" />
                        <bean:define id="completed" value="<%=String.valueOf(worksheet.isCompleted())%>" />
                        <html:link page="/aggregation.do?action=admin" paramId="id" paramName="worksheet" paramProperty="project.id">
    <logic:equal name="completed" value="true">
                            <bean:message key="prompt.complete" />
    </logic:equal>
    <logic:equal name="completed" value="false">
                            <bean:message key="prompt.incomplete" />
    </logic:equal>
                        </html:link>
                    </td>
                </tr>
            </table>
</logic:present>

<!-- Aggregation Review List-->

<logic:present name="aggreviews">
            <table border="0" cellpadding="0" cellspacing="1" class="forumBkgd" width="50%">
                <tr>
                    <td colspan="2" class="forumTextEven"><strong><bean:message key="prompt.aggregationReviewAdmin" /></strong></td>
                </tr>
                <tr>
                    <td class="forumTitleCenter"><bean:message key="prompt.boardMember" /></td>
                    <td class="forumTitleCenter"><bean:message key="prompt.status" /></td>
                </tr>
    <logic:iterate id="aggreview" indexId="aIdx" name="aggreviews">    
        <% String rowClass4=(aIdx.intValue()%2==0)?"forumTextCenterOdd":"forumTextCenterEven"; %>
                <tr>
                    <td class="<%=rowClass4%>"><bean:message key="prompt.reviewer" /> (<bean:write name="aggreview" property="reviewer.handle" />)</td>
                    <td class="<%=rowClass4%>">
        <logic:equal name="aggreview" property="exists" value="false">
                        <bean:message key="prompt.nonAvailable" />
        </logic:equal>                    
        <logic:equal name="aggreview" property="exists" value="true">
                        <html:link page="/aggregationReview.do?action=admin" name="aggreview" property="mapping">
                        <logic:present name="aggreview" property="review.status">
                            <bean:write name="aggreview" property="review.status.name" />
                        </logic:present>
                        <logic:notPresent name="aggreview" property="review.status">
                            Incomplete
                        </logic:notPresent>
                        </html:link>
        </logic:equal>
                    </td>
                </tr>
    </logic:iterate>
            </table>
</logic:present>

<!-- Final Fix -->

<logic:present name="finalfix">            
            <table border="0" cellpadding="0" cellspacing="1" class="forumBkgd" width="100%">
                <tr>
                    <td colspan="4" class="forumTextEven"><strong><bean:message key="prompt.finalFixAdmin" /></strong></td>
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

<!-- Final Review -->

<logic:present name="finalreview">
            <table border="0" cellpadding="0" cellspacing="1" class="forumBkgd" width="50%">
                <tr>
                    <td colspan="2" class="forumTextEven"><strong><bean:message key="prompt.finalReviewAdmin" /></strong></td>
                </tr>
                <tr>
                    <td class="forumTitleCenter"><bean:message key="prompt.boardMember" /></td>
                    <td class="forumTitleCenter"><bean:message key="prompt.status" /></td>
                </tr>
                <tr>
                    <td class="forumTextCenterOdd"><bean:message key="prompt.reviewer" /></td>
                    <td class="forumTextCenterOdd">
    <logic:equal name="finalreview" value="false">
                        <bean:message key="prompt.nonAvailable" />
    </logic:equal>                                            
    <logic:notEqual name="finalreview" value="false">
                        <bean:define id="bean" name="finalreview" type="com.topcoder.apps.review.document.FinalReview" />
                        <bean:define id="completed" value="<%=String.valueOf(bean.isCompleted())%>" />
                        <html:link page="/finalReview.do?action=admin" paramId="id" paramName="finalreview" paramProperty="aggregationWorkSheet.project.id">
        <logic:equal name="completed" value="true">
                            <bean:message key="prompt.complete" />
        </logic:equal>
        <logic:equal name="completed" value="false">
                            <bean:message key="prompt.incomplete" />
        </logic:equal>
                        </html:link>
    </logic:notEqual>                        
                    </td>
                </tr>
            </table>
</logic:present>

<!-- Resources -->
<logic:notEqual name="project" property="action" value="partial">                    
            <table border="0" cellpadding="0" cellspacing="1" class="whiteBkgd" width="100%">
                <tr>
                    <td class="forumTextOdd"><img src="images/clear.gif" alt="" width="1" height="5" border="0"></td>
                </tr>
            </table>
                        
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
        </td>
    </tr>
    <tr>
        <td align="center" class="lightBkgnd">
            <table border="0" cellpadding="0" cellspacing="4">
                <tr>
                    <td>
                        <review:showDeliverable name="project" property="project" button="true" styleClass="submitButton" />
                        <review:contactPM name="project" property="id" button="true" styleClass="submitButton" /></td>
                </tr>
            </table>
        </td>
    </tr>
</logic:notEqual>
<logic:equal name="project" property="action" value="partial">
    <tr>
        <td align="center" class="lightBkgnd">
            <table border="0" cellpadding="0" cellspacing="4">
                <tr>
                    <form action="javascript:history.back()">
                    <td>
                        <html:submit styleClass="submitButton"><bean:message key="button.back" /></html:submit></td></form>
                </tr>
            </table>
        </td>
    </tr>
</logic:equal>
    <tr>
        <td class="normal" colspan="2"><img src="images/clear.gif" alt="" width="1" height="5" border="0"></td>
    </tr>
            
<!-- End lists -->
                
                 
</table>

