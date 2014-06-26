<%--
  - Author: frozenfx
  - Version: 1.0
  - Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the form for changing the handle of the user.
--%>
<%@ page
        language="java"
        import="com.topcoder.common.web.data.report.Constants"
        %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="NEW_HANDLE" value="<%=com.topcoder.web.tc.Constants.NEW_HANDLE%>"/>

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
        <tc-webtag:errorIterator id="err" name="${NEW_HANDLE}">
            <br/><span style="color:red">${err}</span>
        </tc-webtag:errorIterator>
    </div>

    <table width="100%" border="0" cellpadding="3" cellspacing="0">
        <form action="/tc" method=post name="changeHandleForm">
            <input type="hidden" name="module" value="UpdateUserHandle"/>
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
                    New Handle:
                    <tc-webtag:textInput name="<%=com.topcoder.web.tc.Constants.NEW_HANDLE_INPUT%>" maxlength="64" 
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
