<%@ page language="java" %>
<%@ page import="com.topcoder.apps.review.projecttracker.ProjectType" %> 
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<script language="javascript">
function editTimeline()
{
	document.projectForm.action='<html:rewrite page="/editTimeline.do?action=load" />';
	document.projectForm.submit.click();
}

</script>


<!-- Start Title -->            
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="forumBkgd">
<logic:equal name="projectForm" property="submitterRemoval" value="true">
	<tr>
		<td class="errorText">
		<ul><bean:message key="error.submitterRemoval" />
        <logic:iterate id="submitter" indexId="pIdx" name="projectForm" property="submitterRemovalSet">
            <li><%= pIdx.intValue()+1 %>. <bean:write name="submitter" property="handle" /></td></li>
        </logic:iterate>
		</ul>
    </td></tr>
</logic:equal>
<logic:equal name="projectForm" property="valid" value="false">
	<tr>
		<td class="errorText"><UL><bean:message key="error.invalidData" /></UL></td></tr>
</logic:equal>
    <html:form action="/saveProject">    
    <html:hidden property="id" />
    <html:hidden property="currentEdition" value="project"/>
    <tr>
        <td class="whiteBkgnd">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr valign="middle">
                    <td width="5%" align="left">
<logic:equal name="projectForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">                    
						<img src='<%="images/icon_design.gif" %>' width="66" height="62" alt="">
</logic:equal>						
<logic:notEqual name="projectForm" property="project.projectType.id" value="<%=String.valueOf(ProjectType.ID_DESIGN)%>">                    
						<img src='<%="images/icon_development.gif" %>' width="66" height="62" alt="">
</logic:notEqual>
                    </td>
                    <td width="5%">
<logic:equal name="projectForm" property="project.catalog" value="Java">
                        <img src="images/smJava.gif" alt="" width="33" height="17" border="0">
</logic:equal>
<logic:equal name="projectForm" property="project.catalog" value=".NET">
                        <img src="images/netSm.gif" alt="" width="33" height="17" border="0">
</logic:equal>
					</td>
                    <td width="40%" nowrap class="tableHeader">
                        <strong><bean:write name="projectForm" property="name" /></strong> 
                        <bean:message key="prompt.version" />
                        <bean:write name="projectForm" property="version" /></td>
                    <bean:define id="compId" name="projectForm" property="project.catalogueId" />
                    <bean:define id="forumId" name="projectForm" property="project.forumId" />
                    <td width="50%" align="right" class="breadcrumb">
                        <html:link href='<%="/catalog/c_component.jsp?comp="+compId%>' styleClass="breadcrumbLinks"><bean:message key="prompt.componentDesc" /></html:link> |
                        <html:link href='<%="/forum/c_forum.jsp?f="+forumId%>' styleClass="breadcrumbLinks"><bean:message key="prompt.developForum" /></html:link></td>
                </tr>
                            
                <tr>
                    <td class="bodyText" colspan="4"><strong><bean:message key="prompt.overview" /></strong><br>
                        <review:showString name="projectForm" property="overview" /></td>
                </tr>
                <tr>
                    <td colspan="4"><img src="images/clear.gif" alt="" width="1" height="1" border="0"></td>
                </tr>
            </table>
            
<logic:notEqual name="projectForm" property="submitterRemoval" value="true">
<!-- Start Text -->
            
<bean:define id="theProject" name="projectForm" property="project" type="com.topcoder.apps.review.projecttracker.Project" />







<!-- Time Line -->
                
            <table border="0" cellpadding="0" cellspacing="1" class="forumBkgd" width="100%">
                <tr>
                    <td colspan="<%=theProject.getTimeline().length+1%>" class="timelineSubtitle"><strong><bean:message key="prompt.timeline" /></strong>                   
		<a href="javascript:editTimeline()" >Edit Timeline</a>
                    
                    </td>
                </tr>
                <tr>
                    <td class="timelineTitleCenter" width="1"><img src="images/clear.gif" alt="" width="1" height="1" border="0"></td>
                    <logic:iterate id="phaseInstance" name="projectForm" property="timeline">
                        <td class="timelineTitleCenter" width="12%">
                            <bean:define id="phaseName" name="phaseInstance" property="phase.name" />
			    <html:radio property="currentPhase" value="<%=phaseName.toString()%>" />
			       <br/>
			   <bean:write name="phaseName" />
			 </td>                  
                    </logic:iterate>
                </tr>
                <tr>
                    <td class="timelineTitleCenter"><strong><bean:message key="prompt.timelineStart" /></strong></td>
                    <bean:define id="currentPhase" name="projectForm" property="currentPhase" />
                    


                    
                    <logic:iterate id="phaseInstance" name="projectForm" property="timeline">
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
                    <logic:iterate id="phaseInstance" name="projectForm" property="timeline">
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

<logic:equal name="projectForm" property="templatesValid" value="false">
            <table border="0" cellpadding="0" cellspacing="0">
               <tr>
                    <td width="100%" class="errorText">
                        <html:errors property='templates' /></td>
                </tr>
            </table>
</logic:equal>

            <br/>

            Screening scorecard:
            <html:select property="screeningTemplate" styleClass="searchForm">
              <html:options property="screeningTemplates" />
            </html:select><br>
            Review scorecard:
            <html:select property="reviewTemplate" styleClass="searchForm">
              <html:options property="reviewTemplates" />
            </html:select><br>

            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="whiteBkgnd" colspan="3"><img src="images/clear.gif" alt="" width="1" height="1" border="0"></td>
                </tr>
            </table>
                        
            <table width="100%" border="0" cellpadding="0" cellspacing="1" align="center" class="forumBkgd">
                <tr>
                    <td width="100%" class="forumTextEven"><strong><bean:message key="prompt.projectNotes" /></strong> Add explanation for changes to the EXPLANATION field at the bottom of this page</td>
                </tr>
                <tr>
                    <td class="whiteBkgnd" align="left">
                        <html:textarea property="notes" rows="10" cols="80" /></td>
                </tr>
            </table>
                        
            <table border="0" cellpadding="0" cellspacing="0">
                <tr><td class="whiteBkgnd"><img src="images/clear.gif" alt="" width="1" height="5" border="0"></td></tr>
            </table>

            <table border="0" cellpadding="0" cellspacing="1" class="forumBkgd" width="100%">
                <tr><td colspan="6" class="forumTextEven"><strong><bean:message key="prompt.projectResource" /></strong></td></tr>
                
                <tr>
                    <td class="forumTitleCenter"><bean:message key="heading.role" /></td>
                    <td width="1" class="forumTitleCenter"><bean:message key="heading.name" /></td>
                    <td width="1" class="forumTitleCenter"><bean:message key="heading.testCase" /></td>
                    <td width="1" class="forumTitleCenter"><bean:message key="heading.payment" /></td>
                    <td class="forumTitleCenter" colspan="2"><bean:message key="heading.paymentSent" /></td>
                </tr>
                
                <tr>
                    <td colspan="4" class="forumTextCenterEven"><img src="images/clear.gif" alt="" width="1" height="1" border="0"></td>
<logic:iterate id="status" name="projectForm" property="paymentStatusAnswers">
                    <td width="5%" class="forumTextCenterEven"><strong><bean:write name="status" property="name" /></strong></td>
</logic:iterate>
                </tr>
<logic:iterate id="participant" indexId="pIdx" name="projectForm" property="participants">            
    <% String rowClass=(pIdx.intValue()%2==1)?"forumTextCenterOdd":"forumTextCenterEven"; %>
    <logic:notEqual name="projectForm" property='<%="showParticipants["+pIdx+"]"%>' value="0">
        <logic:equal name="projectForm" property='<%="participantsValid["+pIdx+"]"%>' value="false">
                <tr>
                    <td colspan="8" width="100%" class="errorText">
                        <html:errors property='<%="participants["+pIdx+"]"%>' /></td>
                </tr>
        </logic:equal>
                <tr>
                    <td nowrap class="<%=rowClass%>"><bean:write name="participant" property="role.name" /></td>
                    <td nowrap class="<%=rowClass%>">
                        <html:text property='<%="user["+pIdx+"]"%>' styleClass="searchForm" size="25" /></td>
        <logic:equal name="projectForm" property='<%="reviewerSeqs["+pIdx+"]"%>' value="0">
                    <td class="<%=rowClass%>">&nbsp;</td>
        </logic:equal>
        <logic:notEqual name="projectForm" property='<%="reviewerSeqs["+pIdx+"]"%>' value="0">
                    <td class="<%=rowClass%>">
                        <html:select property='<%="responsibility["+pIdx+"]"%>' styleClass="searchForm">
                            <html:options property="responsibilityAnswers" />
                        </html:select></td>
        </logic:notEqual>
        <logic:equal name="projectForm" property='<%="projectManager["+pIdx+"]"%>' value="true">
                    <td nowrap class="<%=rowClass%>">&nbsp;</td>
        </logic:equal>
        <logic:notEqual name="projectForm" property='<%="projectManager["+pIdx+"]"%>' value="true">
                    <td nowrap class="<%=rowClass%>">
                        <html:text property='<%="payment["+pIdx+"]"%>' styleClass="searchForm" size="15" /></td>
        </logic:notEqual>
        <logic:iterate id="status" name="projectForm" property="paymentStatusAnswers">            
            <logic:notEqual name="projectForm" property='<%="projectManager["+pIdx+"]"%>' value="true">            
                    <td class="<%=rowClass%>" align="center">
                        <bean:define id="statusName" name="status" property="name" />
                        <html:radio property='<%="paymentStatus["+pIdx+"]"%>' value="<%=statusName.toString()%>" /></td>
            </logic:notEqual>
            <logic:equal name="projectForm" property='<%="projectManager["+pIdx+"]"%>' value="true">
                        <td class="<%=rowClass%>" align="center">&nbsp;</td>
            </logic:equal>
        </logic:iterate>
                </tr>
    </logic:notEqual>
</logic:iterate>
            </table>
                        
            <table border="0" cellpadding="0" cellspacing="0">
                <tr><td class="whiteBkgnd"><img src="images/clear.gif" alt="" width="1" height="5" border="0"></td></tr>
            </table>
                        
            <table width="100%" border="0" cellpadding="0" cellspacing="1" align="center" class="forumBkgd">
<logic:equal name="projectForm" property="reasonValid" value="false">
                <tr><td width="100%" class="errorText"><html:errors property='reason' /></td></tr>
</logic:equal>            
                <tr><td width="100%" class="forumTextEven"><strong>Explanation</strong> You must include an explanation if you make any changes to the project</td></tr>
                <tr><td class="whiteBkgnd" align="left"><html:textarea property="reason" rows="10" cols="80" /></td></tr>
            </table>
            
            <table border="0" cellpadding="0" cellspacing="0">
                <tr><td class="whiteBkgnd"><img src="images/clear.gif" alt="" width="1" height="5" border="0"></td></tr>
            </table>
                        
            <table width="100%" border="0" cellpadding="0" cellspacing="1" align="center" class="forumBkgd">
                <tr><td width="100%" class="forumTextEven"><strong>Auto Pilot</strong> <html:radio property='<%="autoPilot"%>' value="true" /> Enabled <html:radio property='<%="autoPilot"%>' value="false" /> Disabled  </td></tr>
            </table>
        </td>
    </tr>
                
</logic:notEqual>
<!-- Submit Button -->

    <tr>
        <td align="center" class="lightBkgnd">
            <table border="0" cellpadding="0" cellspacing="4">
                <tr>
                    <td><html:checkbox property="sendMail"/>Send email notifications</td>
					<td><html:submit styleClass="submitButton"><bean:message key="button.apply" /></html:submit></td></html:form>             
<logic:equal name="projectForm" property="submitterRemoval" value="true">
					<bean:define id="projectId" name="projectForm" property="project.id" />
					<bean:define id="url" value='<%="/editProject.do?action=edit&id="+projectId%>' />
					<form action='<html:rewrite page="<%=String.valueOf(url)%>" />' method="post" >
					<td><html:submit styleClass="submitButton"><bean:message key="button.backToEditProject" /></html:submit></td></form>
</logic:equal>
<logic:notEqual name="projectForm" property="submitterRemoval" value="true">
					<bean:define id="projectId" name="projectForm" property="project.id" />
					<bean:define id="url" value='<%="/projectDetail.do?id="+projectId%>' />
					<form action='<html:rewrite page="<%=String.valueOf(url)%>" />' method="post" >
					<td><html:submit styleClass="submitButton"><bean:message key="button.cancel" /></html:submit></td></form>

</logic:notEqual>
				</tr>
            </table>
        </td>
    </tr>

    <tr><td class="normal"><img src="images/clear.gif" alt="" width="1" height="5" border="0"></td></tr>

       
</table>
                        
<!-- End lists -->
