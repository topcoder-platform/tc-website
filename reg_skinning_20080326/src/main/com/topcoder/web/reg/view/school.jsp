<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="reg_tags" tagdir="/WEB-INF/tags" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Registration</title>
    <reg_tags:style/>
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
<div id="schoolPageAligner" align="center">
    <div id="schoolPageSpacer">

        <div id="pageTitle"><div>&nbsp;</div></div>

        <form action="${sessionInfo.secureAbsoluteServletPath}" method="post" name="schoolSearchForm">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SchoolSearch"/>

            <div class="regSection">
                School Search
            </div>

            <p>
                <strong>School Name:</strong>
            </p>
            <p>
                <c:set value="<%=Constants.SCHOOL_NAME%>" var="schoolName"/>
                <tc-webtag:errorIterator id="err" name="${schoolName}"><%=err%><br /></tc-webtag:errorIterator>
                <tc-webtag:textInput name="${schoolName}" size="50" maxlength="<%=Constants.MAX_SCHOOL_NAME_LENGTH%>" editable="true"/>
                <button onclick="document.schoolSearchForm.submit();return false;">Search</button>
            </p>

            <p>
                Just enter a few characters of the name to increase the chances of finding your school in our system.
                For example, if you attend  Indiana University, you might search for <em>indi</em>.
            </p>
        </form>

        <c:if test="${results!=null}">
            <c:choose>
                <c:when test="${fn:length(results)==0}">
                    <div class="error">Your search returned no records.</div>
                    <p>
                        You may search again or click
                        <a href="${sessionInfo.secureAbsoluteServletPath}?<%=Constants.MODULE_KEY%>=ViewSchoolAdd">here</a>
                        to add
                        your school.
                    </p>

                </c:when>
                <c:otherwise>
                    <p>
                        <strong>Results</strong>
                    </p>
                    <p>
                        Lists includes only up to the first <strong><%=Constants.MAX_SCHOOL_RESULTS%></strong> schools. If
                        you see a
                        duplicate, <strong>please choose the school with the greatest number of registrants</strong>.
                    </p>
                    <p>
                        If any information about your school is missing or incorrect and you'd like to send us the correct
                        information, <a href="mailto:service@topcoder.com?subject=School%20Information%20Correction">click
                        here</a>.
                    </p>
                    <p>
                        Please <strong>select</strong> your school from list below.
                    </p>
                    <p>
                        <span id="submitMessage"></span>
                    </p>
                    
                        <c:forEach items="${results}" var="result">
                            <p class="small">
                            ${result[1].name}<br />
                            <c:if test="${result[1].address.city!=null||result[1].address.state!=null||result[1].address.postalCode!=null||result[1].address.province!=null||result[1].address.country!=null}">
                                <c:if test="${result[1].address.city!=null}">${result[1].address.city},</c:if>
                                <c:if test="${result[1].address.state!=null}">${result[1].address.state.code},</c:if>
                                <c:if test="${result[1].address.postalCode!=null}">${result[1].address.postalCode}
                                    ,</c:if>
                                <c:if test="${result[1].address.province!=null}">${result[1].address.province},</c:if>
                                <c:if test="${result[1].address.country!=null}">${result[1].address.country.name}</c:if>
                                <br />
                            </c:if>
                            Registrants: ${result[0]}<br />
                            <c:set value="\"" var="quote"/>
                            <c:set value="\\\"" var="escapedQuote"/>

                            <a class="small" href="#" onclick='Javascript:submit("${fn:replace(result[1].name, quote, escapedQuote)}",${result[1].id});'>Select</a>
                            </p>
                        </c:forEach>
                    <p>
                        <strong>OR</strong><br />
                        If your school is not in the list above, click
                        <a href="${sessionInfo.secureAbsoluteServletPath}?<%=Constants.MODULE_KEY%>=ViewSchoolAdd">here</a>
                        to add your school.
                    </p>
                </c:otherwise>
            </c:choose>
        </c:if>

    </div>
</div>
</body>
</html>
