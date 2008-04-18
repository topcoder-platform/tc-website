<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% List questionInfo = (List) request.getAttribute("questionInfo");
   int projectTypeId = ((Integer) request.getAttribute(Constants.PROJECT_TYPE_ID)).intValue();
%>
<html>
<%@ page import="com.topcoder.web.tc.controller.request.development.Base"%>
<%@ page import="com.topcoder.web.common.model.SoftwareComponent" %>
<%@ page import="com.topcoder.web.common.tag.AnswerInput" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.List" %>
<head>
    <title>TopCoder - Message</title>
    <jsp:include page="../script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
               <%                 
                    switch (projectTypeId) {
                        case Base.COMPONENT_DESIGN_PROJECT_TYPE:%>
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="des_compete"/>
                            </jsp:include>
                <%      break;
                        case Base.COMPONENT_DEVELOPMENT_PROJECT_TYPE: %>
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="dev_compete"/>
                            </jsp:include>
                <%      break;
                        case Base.ASSEMBLY_PROJECT_TYPE: %>
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="assembly_compete"/>
                            </jsp:include>
                <%      break;
                        case Base.ARCHITECTURE_PROJECT_TYPE: %>
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="architecture_compete"/>
                            </jsp:include>
                <%      break;
                    }
                %>
        </td>
        <!-- Left Column Ends -->

        <!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
        <!-- Gutter Ends -->

        <!-- Center Column Begins -->
        <td width="100%" align="center" class="bodyText">

               <%                 
                    switch (projectTypeId) {
                        case Base.COMPONENT_DESIGN_PROJECT_TYPE:%>
                			<jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="comp_design"/>
                			    <jsp:param name="title" value="Active Contests"/>
                			</jsp:include>
                <%      break;
                        case Base.COMPONENT_DEVELOPMENT_PROJECT_TYPE: %>
                			<jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="comp_development"/>
                			    <jsp:param name="title" value="Active Contests"/>
                			</jsp:include>
                <%      break;
                        case Base.ASSEMBLY_PROJECT_TYPE: %>
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="assembly"/>
                                <jsp:param name="title" value="Active Contests"/>
                            </jsp:include>
                <%      break;
                        case Base.ARCHITECTURE_PROJECT_TYPE: %>
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="architecture"/>
                                <jsp:param name="title" value="Active Contests"/>
                            </jsp:include>
                <%      break;
                    }
                %>                

            <form action="${sessionInfo.servletPath}" method="POST" name="regForm">
               <%                 
                    switch (projectTypeId) {
                        case Base.COMPONENT_DESIGN_PROJECT_TYPE:
                        case Base.COMPONENT_DEVELOPMENT_PROJECT_TYPE: %>
                            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="ProjectRegister"/>
                <%      break;
                        case Base.ASSEMBLY_PROJECT_TYPE: %>
                            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="AssemblyProjectRegister"/>
                <%      break;
                        case Base.ARCHITECTURE_PROJECT_TYPE: %>
                        <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="ArchitectureProjectRegister"/>
                <%      break;
                    }
                %>                
                <tc-webtag:hiddenInput name="<%=Constants.PROJECT_ID%>"/>
                <% if (projectTypeId == 1 || projectTypeId == 2) { %>
                        <tc:questionIterator list="<%=questionInfo%>" id="question">
                            <table width="510" border="0" cellpadding="5" cellspacing="0" class="formFrame" align="center">
                                <tr>
                                    <td colspan="2" class="bodySubtitle" valign="top" width="100%">
                                        <jsp:getProperty name="question" property="text"/>
                                        <br/><br/>
                                        <hr width="100%" size="1" noshade/>
                                    </td>
        
                                </tr>
                                <tr>
                                    <td colspan="2" class="errorText">
                                        <tc-webtag:errorIterator id="err" name="<%=AnswerInput.PREFIX+question.getId()%>"><%=err%>
                                            <br/></tc-webtag:errorIterator>
                                    </td>
                                </tr>
                                <% boolean even = false; %>
                                <tc:answerInput id="answerInput" question="<%=question%>">
                                    <tr class="<%=even?"formTextOdd":"formTextEven"%>">
                                        <td width="100%">
                                            <%=answerText%>
                                        </td>
                                        <td align="center">
                                            <%=answerInput%>
                                        </td>
                                    </tr>
                                    <% even = !even; %>
                                </tc:answerInput>
                            </table>
                            <p><br/></p>
                        </tc:questionIterator>
                <% } %>
                <tc-webtag:textArea name="<%=Constants.TERMS%>" rows="10" cols="60"/>

                <p style="width: 510px;">
                    <% if ((projectTypeId == 1 || projectTypeId == 2) && request.getAttribute("notRegistered") != null) { %>
                    <span class="errorText">
                     Please be aware that you are NOT REGISTERED for the tournament, and registering for this contest will not register you for the tournament.  If you don't register for the tournament prior to registering for this contest, it will not count in the tournament standings even if you sign up at a later date.
                     </span><br><br>
                    <% }%>
                    <c:if test="${not empty has_global_ad and not has_global_ad}">
                        <span class="errorText">
                         You have not yet signed the Assignment Version 2.0 that is required in order to be paid for this contest.  Please go <a href="/tc?module=Static&amp;d1=help&amp;d2=assignmentDocFaq">here</a> to read more about the Assignment Document and what you need to do.
                         </span><br><br>
                    </c:if>
                    <span class="errorText"><tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>"><%=err%>
                        <br/></tc-webtag:errorIterator></span>

                    I Agree to the Terms and Conditions stated above&#160;
                    <tc-webtag:chkBox name="<%=Constants.TERMS_AGREE%>"/>
                </p>

                <p style="width: 510px;">
                    <A href="Javascript:document.regForm.submit();">Register</A>
                </p>

                <p><br></p>
            </form>
        </td>
        <!-- Center Column Ends -->

        <!-- Gutter -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
        <!-- Gutter Ends -->

        <!-- Right Column Begins -->
        <td width="180">
            <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>

        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
        <!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>


