<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Registration</title>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
    <script language="javascript" type="text/javascript">
        <!--
            function submit(name,id) {
                    putValue("window.opener.document.secondaryForm", "<%=Constants.SCHOOL_ID%>", id);
                    updateDivOrSpan(window.opener.document, "schoolName", name);
                    window.close();
            }
        -->
    </script>
</head>

<body>
<div align="center">
    <div style="width:500px;padding:15px;text-align:left;">

        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="registration_w"/>
            <jsp:param name="title" value="School Search"/>
        </jsp:include>

        <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="schoolSearchForm">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SchoolSearch"/>

            <span class="subtitle">School Search</span>
            <br><br>

            <strong>School Name:</strong><br>
            <c:set value="<%=Constants.SCHOOL_NAME%>" var="schoolName"/>
            <tc-webtag:errorIterator id="err" name="${schoolName}"><%=err%><br></tc-webtag:errorIterator>
            <tc-webtag:textInput name="${schoolName}" size="50" maxlength="<%=Constants.MAX_SCHOOL_NAME_LENGTH%>" editable="true"/>
            <A href="#" onclick="document.schoolSearchForm.submit();return false;">Search</A>
            <br>
            Just enter a few characters of the name to increase the chances of finding your school in our system.
            For example, if you attend  Indiana University, you might search for indi
            <br><br>
        </form>

        <c:if test="${results!=null}">
            <c:choose>
                <c:when test="${fn:length(results)==0}">
                    <span class="bigRed">Your search returned no records.</span><br/><br/>
                    You may search again or click
                    <A href="${sessionInfo.secureAbsoluteServletPath}?<%=Constants.MODULE_KEY%>=ViewSchoolAdd">here</A>
                    to add
                    your school.

                </c:when>
                <c:otherwise>
                    <strong>Results</strong><br>
                    Lists includes only up to the first <strong><%=Constants.MAX_SCHOOL_RESULTS%></strong> schools. If
                    you see a
                    duplicate, <strong>please choose the school with the greatest number of registrants</strong>.
                    <br><br>
                    If any information about your school is missing or incorrect and you'd like to send us the correct
                    information, <A href="mailto:service@topcoder.com?subject=School%20Information%20Correction">click
                    here</A>.
                    <br><br>
                    Please <strong>select</strong> your school from list below.<br />
                    <span id="submitMessage"></span><br/>
                    <span class="small">
                        <c:forEach items="${results}" var="result">
                            ${result[1].name}<br/>
                            <c:if test="${result[1].address.city!=null||result[1].address.state!=null||result[1].address.postalCode!=null||result[1].address.province!=null||result[1].address.country!=null}">
                                <c:if test="${result[1].address.city!=null}">${result[1].address.city},</c:if>
                                <c:if test="${result[1].address.state!=null}">${result[1].address.state.code},</c:if>
                                <c:if test="${result[1].address.postalCode!=null}">${result[1].address.postalCode}
                                    ,</c:if>
                                <c:if test="${result[1].address.province!=null}">${result[1].address.province},</c:if>
                                <c:if test="${result[1].address.country!=null}">${result[1].address.country.name}</c:if>
                                <br/>
                            </c:if>
                            Registrants: ${result[0]}<br/>
                            <c:set value="\"" var="quote"/>
                            <c:set value="\\\"" var="escapedQuote"/>

                            <A class="small" href="#" onclick='Javascript:submit("${fn:replace(result[1].name, quote, escapedQuote)}",${result[1].id});'>Select</A>
                            <br/><br/>
                        </c:forEach>
                    </span>
                    <br><br>
                    <strong>OR</strong><br>
                    If your school is not in the list above, click
                    <A href="${sessionInfo.secureAbsoluteServletPath}?<%=Constants.MODULE_KEY%>=ViewSchoolAdd">here</A>
                    to add
                    your school.
                </c:otherwise>
            </c:choose>
        </c:if>

    </div>
</div>
</body>
</html>
