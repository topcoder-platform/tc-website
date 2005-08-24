<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<table width="100%" border="0" cellpadding="0" cellspacing="1" class="forumBkgd">
    <tr>
        <td class="whiteBkgnd">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="100%" nowrap class="tableHeader">
<logic:equal name="utility" property="viewAllProjects" value="false">
                        <strong><bean:message key="prompt.viewOpenProjects"/></strong>
</logic:equal>
<logic:equal name="utility" property="viewAllProjects" value="true">
                        <strong><bean:message key="prompt.viewAllProjects"/></strong>
</logic:equal>
                    </td>
                    <td align="right"><img src="/images/statusKey_small.gif" width="289" height="35" alt=""></td>
                </tr>
                <tr>
                    <td class="whiteBkgnd" colspan="3"><img src="/images/clear.gif" alt="" width="1" height="1" border="0"></td>
                </tr>
            </table>

<!-- All My Projects -->
<logic:iterate id="projectType" indexId="tIdx" name="projectTypes" type="com.topcoder.apps.review.OpenProjectBean">
    <% String icon=(tIdx.intValue()==0)?"/images/iconStatusSpecSm.gif":"/images/iconStatusDevSm.gif"; %>
            <table width="100%" border="0" cellpadding="0" cellspacing="1" class="forumBkgd">
                <tr valign="top">
                    <td colspan="5" width="100%" class="forumTextEven">
                        <strong><bean:message key="viewOpenProjects.subcaption" arg0="<%=projectType.getTypeName()%>"/></strong></td>
                </tr>

                <tr valign="top">
                    <td width="25%" class="forumTitle"><bean:message key="heading.project"/></td>
                    <td width="20%" class="forumTitle"><bean:message key="heading.myRole"/></td>
                    <td width="20%" class="forumTitle"><bean:message key="heading.step"/></td>
                    <td width="20%" class="forumTitle"><bean:message key="heading.endDate"/></td>
                    <td width="15%" class="forumTitle"><bean:message key="heading.deliverable"/></td>
                </tr>
<!--Begin lists -->
    <logic:iterate id="project" indexId="pIdx" name="projectType" property="projectList" type="com.topcoder.apps.review.projecttracker.UserProjectInfo">
        <% String rowClass=(pIdx.intValue()%2==0)?"forumTextOdd":"forumTextEven"; %>
                <tr valign="top">
                    <td class="<%=rowClass%>">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="middle">
                                <td class="forumText"><img src="<%=icon%>" alt="" width="25" height="17" border="0"></td>
                                <td class="forumText"><img src="/images/clear.gif" alt="" width="5" height="5" border="0"/></td>
                                <td class="forumText">
<logic:equal name="project" property="catalog" value="Java">
                                <img src="/images/javaSm.gif" alt="" border="0">
</logic:equal>
<logic:equal name="project" property="catalog" value=".NET">
                                <img src="/images/dotnetSm.gif" alt="" border="0">
</logic:equal>
<logic:equal name="project" property="catalog" value="Java Custom">
                                <img src="/images/javaCustomSm.gif" alt="" border="0">
</logic:equal>
<logic:equal name="project" property="catalog" value=".NET Custom">
                                <img src="/images/dotnetCustomSm.gif" alt="" border="0">
</logic:equal>
<logic:equal name="project" property="catalog" value="Application">
                                <img src="/images/appSm.gif" alt="" border="0">
</logic:equal>
                                </td>
                                <td class="forumText"><img src="/images/clear.gif" alt="" width="5" height="5" border="0"/></td>
                                <td nowrap class="forumText">
                                    <html:link page="/projectDetail.do" paramId="id" paramName="project" paramProperty="id">
                                        <strong><bean:write name="project" property="projectName" /></strong>
                                        <bean:message key="prompt.version" />
                                        <bean:write name="project" property="projectVersion" />
                                    </html:link>
                                    </td>
                            </tr>
                        </table></td>
                    <td class="<%=rowClass%>"><review:showRoles name="project" /></td>
                    <td class="<%=rowClass%>"><bean:write name="project" property="currentPhaseInstance.phase.name" /></td>
                    <td class="<%=rowClass%>">
                        <review:showDate name="project" property="currentPhaseInstance.endDate" /></td>
                    <td class="<%=rowClass%>">
                        <review:showDeliverable name="project" /></td>

                </tr>
    </logic:iterate>
    <logic:equal name="projectType" property="size" value="0">
                <tr valign="top">
                    <td colspan="5" class="forumTextOdd"><strong><bean:message key="prompt.noProject" arg0="<%=projectType.getTypeName()%>" /></strong></td>
                </tr>
    </logic:equal>

<!-- End lists -->

                <tr>
                    <td class="forumHeadFoot" colspan="5" height="5"><img src="/images/clear.gif" alt="" width="10" height="5" border="0"/></td>
                </tr>
            </table>
<!-- Spacer -->
            <table border="0" cellpadding="0" cellspacing="1" class="whiteBkgd" width="100%">
                <tr>
                    <td class="forumTextOdd"><img src="/images/clear.gif" alt="" width="1" height="5" border="0"></td>
                </tr>
            </table>

</logic:iterate>
        </td>
    </tr>
</table>



