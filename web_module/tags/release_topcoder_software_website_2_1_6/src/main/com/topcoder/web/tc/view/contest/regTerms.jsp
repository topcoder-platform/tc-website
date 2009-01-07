<%@ page language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<% List questionInfo = (List) request.getAttribute("questionInfo");%>
<%@ page import="com.topcoder.web.tc.controller.request.development.Base"%>
<%@ page import="com.topcoder.web.common.model.SoftwareComponent" %>
<%@ page import="com.topcoder.web.common.tag.AnswerInput" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder :: Registration</title>
    <jsp:include page="../script.jsp"/>
    <jsp:include page="../style.jsp">
      <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<c:set value="<%=Constants.DESIGN_PROJECT_TYPE%>" var="DESIGN_PROJECT_TYPE"/>
<c:set value="<%=Constants.DEVELOPMENT_PROJECT_TYPE%>" var="DEVELOPMENT_PROJECT_TYPE"/>
<c:set value="<%=Constants.ASSEMBLY_PROJECT_TYPE%>" var="ASSEMBLY_PROJECT_TYPE"/>
<c:set value="<%=Constants.ARCHITECTURE_PROJECT_TYPE%>" var="ARCHITECTURE_PROJECT_TYPE"/>
<c:set value="<%=Constants.COMPONENT_TESTING_PROJECT_TYPE%>" var="COMPONENT_TESTING_PROJECT_TYPE"/>
<c:set value="<%=Constants.APPLICATION_TESTING_PROJECT_TYPE%>" var="APPLICATION_TESTING_PROJECT_TYPE"/>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <c:choose>
                <c:when test="${pt == DESIGN_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="des_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE || pt == COMPONENT_TESTING_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="dev_compete"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="assembly_compete"/>
                    </jsp:include>
                </c:when>        
                <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="architecture_compete"/>
                    </jsp:include>
                </c:when>        
                <c:when test="${pt == APPLICATION_TESTING_PROJECT_TYPE}">
                    <jsp:include page="/includes/global_left.jsp">
                        <jsp:param name="node" value="app_testing_compete"/>
                    </jsp:include>
                </c:when>        
            </c:choose>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">

            <c:choose>
                <c:when test="${pt == DESIGN_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="comp_design"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="comp_development"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>
                <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="assembly"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>        
                <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="architecture"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>        
                <c:when test="${pt == COMPONENT_TESTING_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="comp_testing"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>        
                <c:when test="${pt == APPLICATION_TESTING_PROJECT_TYPE}">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="app_testing"/>
                        <jsp:param name="title" value="Active Contests"/>
                    </jsp:include>
                </c:when>        
            </c:choose>

            <form action="${sessionInfo.servletPath}" method="POST" name="regForm">
                <c:choose>
                    <c:when test="${pt == DESIGN_PROJECT_TYPE || pt == DEVELOPMENT_PROJECT_TYPE}">
                        <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="ProjectRegister"/>
                    </c:when>
                    <c:otherwise>
                        <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="Register"/>
                    </c:otherwise>        
                </c:choose>
                
                <tc-webtag:hiddenInput name="<%=Constants.PROJECT_ID%>"/>

                <c:if test="${pt == DESIGN_PROJECT_TYPE || pt == DEVELOPMENT_PROJECT_TYPE}">
                    <tc:questionIterator list="<%=questionInfo%>" id="question">
                        <table width="510" border="0" cellpadding="5" cellspacing="0" class="formFrame" align="center">
                            <tr>
                                <td colspan="2" class="bodySubtitle" valign="top" width="100%">
                                    <jsp:getProperty name="question" property="text"/>
                                    <br /><br />
                                    <hr width="100%" size="1" noshade/>
                                </td>
    
                            </tr>
                            <tr>
                                <td colspan="2" class="errorText">
                                    <tc-webtag:errorIterator id="err" name="<%=AnswerInput.PREFIX+question.getId()%>"><%=err%>
                                        <br /></tc-webtag:errorIterator>
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
                        <p><br /></p>
                    </tc:questionIterator>
                </c:if>
                <tc-webtag:textArea name="<%=Constants.TERMS%>" rows="10" cols="60"/>

                <p style="width: 510px;">
                    <c:if test="${(pt == DESIGN_PROJECT_TYPE || pt == DEVELOPMENT_PROJECT_TYPE) and not empty notRegistered}">
                        <span class="errorText">
                         Please be aware that you are NOT REGISTERED for the tournament, and registering for this contest will not register you for the tournament.  If you don't register for the tournament prior to registering for this contest, it will not count in the tournament standings even if you sign up at a later date.
                         </span><br /><br />
                    </c:if>
                    <span class="errorText"><tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>"><%=err%>
                        <br /></tc-webtag:errorIterator></span>

                    I Agree to the Terms and Conditions stated above&#160;
                    <tc-webtag:chkBox name="<%=Constants.TERMS_AGREE%>"/>
                </p>

                <p style="width: 510px;">
                    <a class="button" href="Javascript:document.regForm.submit();" style="width:60px;">Register</a>
                </p>

            </form>

        </td>
<%-- Center Column Ends --%>
       
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="branded"/>
    </jsp:include>
        </td>
<%-- Right Column Ends --%>
       
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>