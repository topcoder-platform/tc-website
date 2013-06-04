<%--
  - Author: isv
  - Version: 1.0
  - Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the form for editing government issued ID for user.
--%>
<%@ page
        language="java"
        import="com.topcoder.common.web.data.report.Constants"
        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="COUNTRIES" value="<%=com.topcoder.web.tc.Constants.COUNTRIES%>"/>
<c:set var="GOVERNMENT_ID" value="<%=com.topcoder.web.tc.Constants.GOVERNMENT_ID%>"/>

<html>
<head>
    <title>TopCoder Reporting</title>
</head>

<body>
<a href=<%=Constants.SERVLET_ADDR%>>&lt;&lt; back to main menu</a><br/><br/>
<center>
    <br/>
    <br/>

    <div>
        <tc-webtag:errorIterator id="err" name="${GOVERNMENT_ID}">
            <br/><span style="color:red">${err}</span>
        </tc-webtag:errorIterator>
    </div>

    <table width="100%" border="0" cellpadding="3" cellspacing="0">
        <form action="/tc" method=post name="noteForm">
            <input type="hidden" name="module" value="UpdateGovernmentID"/>
            <tc-webtag:hiddenInput name="<%=Constants.USER_ID%>"/>
            <c:set value="<%=Constants.HANDLE%>" var="handle"/>
            <c:set value="<%=Constants.GIVEN_NAME%>" var="givenName"/>
            <c:set value="<%=Constants.SURNAME%>" var="surname"/>
            <tr>
                <td align=center><b><font size="+2">${requestScope[handle]}</font></b></td>
            </tr>
            <tr>
                <td align=center>${requestScope[givenName]} ${requestScope[surname]}</td>
            </tr>
            <tr>
                <td align=center>
                    <a href="/tc?module=LegacyReport&t=profile&ha=${requestScope[handle]}">View Report Profile</a>
                </td>
            </tr>
            <tr>
                <td align=center>
                    Country:
                    <tc-webtag:listSelect name="<%=com.topcoder.web.tc.Constants.COUNTRY_CODE%>"
                                         list="${requestScope[COUNTRIES]}"/>
                </td>
            </tr>
            <tr>
                <td align=center>
                    ID Number:
                    <tc-webtag:textInput name="<%=com.topcoder.web.tc.Constants.GOVERNMENT_ID_NUMBER%>" maxlength="64" 
                                         size="32"/>
                </td>
            </tr>
            <tr>
                <td align=center>
                    Received Date:
                    <tc-webtag:textInput name="<%=com.topcoder.web.tc.Constants.GOVERNMENT_ID_RECEIVED%>"
                                         size="32"/>
                </td>
            </tr>
            <tr>
                <td align=center>
                    Expired Date:
                    <tc-webtag:textInput name="<%=com.topcoder.web.tc.Constants.GOVERNMENT_ID_EXPIRES%>"
                                         size="32"/>
                </td>
            </tr>
            <tr>
                <td align=center>
                    <input type="submit" name="submit" value="Update"/>
                </td>
            </tr>
        </form>
    </table>
    <br/><br/>

</center>
</body>
</html>
