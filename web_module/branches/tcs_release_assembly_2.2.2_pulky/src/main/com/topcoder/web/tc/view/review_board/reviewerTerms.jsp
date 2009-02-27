<%--
  - Author: TCSDEVELOPER
  - Version: 1.0
  - Since: TCS Release 2.2.2
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: Displays the Terms Of Use for Specification Project Review and provides 
  - a form for the user to accept them and continue registration.
--%>
<%@ page language="java" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Constants setup to use JSTL --%>
<c:set var="PROJECT_ID" value="<%=Constants.PROJECT_ID%>"/>
<c:set var="REVIEWER_TYPE_ID" value="<%=Constants.REVIEWER_TYPE_ID%>"/>
<c:set var="PRIMARY_FLAG" value="<%=Constants.PRIMARY_FLAG%>"/>
<c:set var="MODULE_KEY" value="<%=Constants.MODULE_KEY%>"/>
<c:set var="PROJECT_TYPE_ID" value="<%=Constants.PROJECT_TYPE_ID%>"/>
<c:set var="TERMS" value="<%=Constants.TERMS%>"/>
<c:set var="TERMS_AGREE" value="<%=Constants.TERMS_AGREE%>"/>
<c:set var="CAPTCHA_RESPONSE" value="<%=Constants.CAPTCHA_RESPONSE%>"/>
<c:set var="CAPTCHA_FILE_NAME" value="<%=Constants.CAPTCHA_FILE_NAME%>"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>Programming Contests, Software Development, and Employment Services at TopCoder</title>
    
        <jsp:include page="/script.jsp"/>
        <jsp:include page="/style.jsp">
            <jsp:param name="key" value="tc_stats"/>
        </jsp:include>
    </head>

    <body>
        <%-- ToDo: check --%>
        <jsp:include page="/top.jsp">
            <jsp:param name="level1" value="development"/>
        </jsp:include>
        
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <%-- Left Column Begins--%>
                <td width="180">
                    <jsp:include page="/includes/global_left.jsp">
                        <%-- ToDo: looks bad--%>
                        <jsp:param name="node" value="specification"/>
                    </jsp:include>
                </td>
                <%-- Left Column Ends --%>
                
                <%-- Gutter Begins --%>
                <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt=""/></td>
                <%-- Gutter Ends --%>
                
                <%-- Center Column Begins --%>
                <td width="100%" align="center">
                    <jsp:include page="/page_title.jsp">
                        <jsp:param name="image" value="specification"/>
                        <jsp:param name="title" value="Review Opportunities"/>
                    </jsp:include>
                
                    <form action="${sessionInfo.servletPath}" method="POST" name="frmTerms">
                        <input type="hidden" name="${PROJECT_ID}" value="${requestScope[PROJECT_ID]}"/>
                        <input type="hidden" name="${REVIEWER_TYPE_ID}" value="${requestScope[REVIEWER_TYPE_ID]}"/>
                        <input type="hidden" name="${PRIMARY_FLAG}" value="${requestScope[PRIMARY_FLAG]}"/>
                        <input type="hidden" name="${MODULE_KEY}" value="ProjectReviewTermsAgree"/>
                        <input type="hidden" name="${PROJECT_TYPE_ID}" value="${requestScope[PROJECT_TYPE_ID]}"/>
                
                        <table border="0" cellspacing="0" cellpadding="5">
                            <tr>
                                <td>
c                                    <strong>Reviewer Terms and Conditions ("Reviewer Terms")</strong>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <tc-webtag:textArea name="${TERMS}" rows="10" cols="80" readOnly="true"
                                                        styleClass="bodyText"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="errorText">
                                    <tc-webtag:errorIterator id="err" name="${TERMS_AGREE}"><%=err%>
                                    </tc-webtag:errorIterator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    I Agree to the Terms and Conditions stated above&#160;
                                    <tc-webtag:chkBox name="${TERMS_AGREE}"/>
                                </td>
                            </tr>
                
                            <tr>
                                <td class="errorText">
                                    <img src="/i/captcha/${requestScope[CAPTCHA_FILE_NAME]}" alt="captcha image"/>
                
                                    <p>
                                        <a href="javascript:window.location.reload()">This image is hard to read. 
                                            Show me a different one.</a>
                                    </p>
                                </td>
                            </tr>
                
                            <tr>
                                <td class="errorText">
                                    <tc-webtag:errorIterator id="err" name="${CAPTCHA_RESPONSE}">${err}
                                        <br/></tc-webtag:errorIterator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>
                                        Please enter the characters you see in the image above:
                                        <tc-webtag:textInput name="${CAPTCHA_RESPONSE}"/>
                                    </p>
                                </td>
                            </tr>
                
                
                            <tr>
                                <td align="center">
                                    <input type="submit" onClick="" name="submit" value=" Continue"/>
                                </td>
                            </tr>
                        </table>
                
                    </form>
                </td>
                <%-- Center Column Ends --%>
                
                <%-- Gutter --%>
                <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" alt=""></td>
                <%-- Gutter Ends --%>
                
                <%-- Right Column Begins --%>
                <td width="180">
                    <jsp:include page="/public_right.jsp">
                        <jsp:param name="level1" value="default"/>
                    </jsp:include>
                
                </td>
                <%-- Right Column Ends --%>
                
                <%-- Gutter --%>
                <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0" alt=""></td>
                <%-- Gutter Ends --%>
            </tr>
        </table>
        
        <jsp:include page="/foot.jsp"/>
    </body>
</html>
