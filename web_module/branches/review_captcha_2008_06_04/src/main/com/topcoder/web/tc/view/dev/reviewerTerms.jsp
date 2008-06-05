<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.web.tc.Constants"%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>

<head>
<title>Programming Contests, Software Development, and Employment Services at TopCoder</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<% int phase_id = ((Integer)request.getAttribute("phase_id")).intValue(); %>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="<%= phase_id == 112 ? "des_review" : "dev_review"%>"/>
         </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Gutter Begins --%>
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<%-- Gutter Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="<%= phase_id == 112 ? "comp_design" : "comp_development"%>"/>
    <jsp:param name="title" value="Review Opportunities"/>
</jsp:include>

            <form action="<%=sessionInfo.getServletPath()%>" method="POST" name="frmTerms">
              <input type="hidden" name="<%=Constants.PROJECT_ID%>" value="<%=request.getParameter(Constants.PROJECT_ID)%>"/>
              <input type="hidden" name="<%=Constants.PHASE_ID%>" value="<%=request.getParameter(Constants.PHASE_ID)%>"/>
              <input type="hidden" name="<%=Constants.REVIEWER_TYPE_ID%>" value="<%=request.getParameter(Constants.REVIEWER_TYPE_ID)%>"/>
              <input type="hidden" name="<%=Constants.PRIMARY_FLAG%>" value="<%=request.getParameter(Constants.PRIMARY_FLAG)%>"/>
              <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="ProjectReviewTermsAgree"/>

            <table border="0" cellspacing="0" cellpadding="5">
                <tr valign="middle">
                    <td class="bodyText">
                        <strong>Reviewer Terms and Conditions ("Reviewer Terms")</strong>
                    </td>
                </tr>
                <tr valign="middle">
                    <td class="bodyText">
                        <tc-webtag:textArea name="<%=Constants.TERMS%>" rows="10" cols="80" readOnly="true" styleClass="bodyText"/>
                    </td>
                </tr>
                <tr valign="middle">
                    <td class="errorText">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>"><%=err%></tc-webtag:errorIterator>
                    </td>
                </tr>
                <tr valign="middle">
                    <td class="bodyText">
                        I Agree to the Terms and Conditions stated above&#160;<tc-webtag:chkBox name="<%=Constants.TERMS_AGREE%>"/>
                    </td>
                </tr>

                <c:set var="captchaFileName" value="<%=Constants.CAPTCHA_FILE_NAME%>"/>
                <tr valign="middle">
                    <td class="errorText">
                        <img src="/i/captcha/${requestScope[captchaFileName]}" alt=""/>
                    </td>
                </tr>

                <tr valign="middle">
                    <td class="errorText">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.CAPTCHA_RESPONSE%>">${err}<br /></tc-webtag:errorIterator>
                    </td>
                </tr>
                <tr valign="middle">
                    <td class="bodyText">
                        <tc-webtag:textInput name="<%=Constants.CAPTCHA_RESPONSE%>" />
                    </td>
                </tr>




                <tr valign="middle">
                    <td align="center">
                        <input type="submit" onClick="" name="submit" value=" Continue"/>
                    </td>
                </tr>
            </table>

            </form>
        </td>
<%-- Center Column Ends --%>

<%-- Gutter --%>
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<%-- Gutter Ends --%>

<%-- Right Column Begins --%>
         <td width="180">
            <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>

         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<%-- Gutter Ends --%>

    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>

