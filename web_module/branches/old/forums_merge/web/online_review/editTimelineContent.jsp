<%@ page language="java" %>
<%@ page import="com.topcoder.apps.review.projecttracker.ProjectType" %> 
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<script language="javascript">


function erase(f, n)
{
    v = null;
    s = 'forcedPhaseStart[' + n + ']';
    for (i=0; i < f.elements.length; i++)
        if (f.elements[i].name == s) v = f.elements[i];

    if (v != null)
        v.value="";
}

function checkFalse(f, n)
{
    v = null;
    s = 'adjustStartDate[' + n + ']';
    for (i=0; i < f.elements.length; i++)
        if (f.elements[i].name == s && f.elements[i].value == "false") v = f.elements[i];

    if (v != null)
        v.checked=true;

}

</script>


<!-- Start Title -->            
<table width="100%" border="0" cellpadding="0" cellspacing="1" class="forumBkgd">
<logic:equal name="projectForm" property="valid" value="false">
	<tr>
		<td class="errorText"><UL><bean:message key="error.invalidData" /></UL></td></tr>
</logic:equal>
    <html:form action="/editTimeline">    
    <html:hidden property="id" />
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
                    <td colspan="4"><img src="images/clear.gif" alt="" width="1" height="1" border="0"></td>
                </tr>
            </table>
            
<!-- Start Text -->
            
<bean:define id="theProject" name="projectForm" property="project" type="com.topcoder.apps.review.projecttracker.Project" />
            <table border="0" cellpadding="0" cellspacing="1" width="100%">

                <tr>
                    <td colspan="<%=theProject.getTimeline().length+1%>" class="forumTextEven"><strong><bean:message key="prompt.timeline" /></strong></td>
                </tr>

                
                <tr valign=top>

<td>
<table border="0" cellpadding="0" cellspacing="1" class="forumBkgd"  width="100%">
    <tr valign="top">
	<td class="forumTitleCenter"><img src="images/clear.gif" alt="" width="1" height="1" border="0"></td>
	<td class="forumTitleCenter" width="8%">
	    Start
	</td>
	<td class="forumTitleCenter" width="8%">
	    End
	</td>
	<td class="forumTitleCenter" width="59%">
	    Edit Start
	</td>
	<td class="forumTitleCenter"width="10%">
	    Edit Duration
	</td>
    </tr>

<logic:iterate id="phaseInstance" indexId="pIdx" name="projectForm" property="timeline">
        <logic:equal name="projectForm" property='<%="phaseValid["+pIdx+"]"%>' value="false">
                <tr>
                    <td colspan="5" width="100%" class="errorText">
                        <html:errors property='<%="phase["+pIdx+"]"%>' /></td>
                </tr>
        </logic:equal>
                           
                <tr valign="top">
                    <td class="forumTitleCenter">
                        <bean:define id="phaseName" name="phaseInstance" property="phase.name" />
                        <bean:write name="phaseName" /></td>
                    <td class="forumTextCenterOdd">
                        <bean:write name="projectForm" property='<%="phaseStart["+pIdx+"]"%>' />
                        
                        </td>
                    <td class="forumTextCenterOdd">
                        <bean:write name="projectForm" property='<%="phaseEnd["+pIdx+"]"%>' />
                        </td>
                        
                    <td class="forumTextCenterOdd">
			    <table border="0" width="100%">
				    <tr>
					<td width="50%" align="left">
				<logic:notEqual name="pIdx" value="0">
		                        <html:radio property='<%="adjustStartDate["+pIdx+"]"%>' onclick='<%= "erase(projectForm," + pIdx + ")" %>' value="true"  />
						When previous phase ends
				</logic:notEqual>						
					</td>
					<td width="50%">
			                        <html:radio property='<%="adjustStartDate["+pIdx+"]"%>' value="false" />
			                        <html:text property='<%="forcedPhaseStart["+pIdx+"]"%>' onkeydown='<%= "checkFalse(projectForm," + pIdx + ")" %>' size="20" />
					</td>
				    </tr>
			    </table>

		    </td>
                    <td class="forumTextCenterOdd">
                          <html:text property='<%="phaseLength["+pIdx+"]"%>' size="4" />
                    </td>
                        
                </tr>
</logic:iterate>
                          
</table>
                                        
<!-- Submit Button -->

    <tr>
        <td align="center" class="lightBkgnd">
            <table border="0" cellpadding="0" cellspacing="4">
                <tr>
               	 	<input type="hidden" name="action" value=""/>
               	 	<html:hidden property="currentEdition" value="timeline"/>
			<td>
			    <input type="button" value="Apply Changes" class="submitButton" onClick="action.value='store'; submit()" />
			</td>
			<td>
			    <input type="button" value="Refresh" class="submitButton" onClick="action.value='refresh'; submit()" />
			</td>
			<td>
			    <input type="button" value="Cancel" class="submitButton" onClick="action.value='cancel'; submit()" />
			</td>
			           
		</tr>
            </table>
        </td>
    </tr>

    <tr><td class="normal"><img src="images/clear.gif" alt="" width="1" height="5" border="0"></td></tr>

</html:form>         
</table>
                        
<!-- End lists -->
