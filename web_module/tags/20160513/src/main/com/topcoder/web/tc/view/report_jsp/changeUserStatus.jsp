<%--
  - Author: frozenfx
  - Version: 1.0
  - Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the form for changing the status of the user.
--%>
<%@ page
        language="java"
        import="com.topcoder.common.web.data.report.Constants"
        %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="NEW_STATUS" value="<%=com.topcoder.web.tc.Constants.NEW_STATUS%>"/>

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
        <tc-webtag:errorIterator id="err" name="${NEW_STATUS}">
            <br/><span style="color:red">${err}</span>
        </tc-webtag:errorIterator>
    </div>

    <table width="100%" border="0" cellpadding="3" cellspacing="0">
        <form action="/tc" method=post name="changeStatusForm">
            <input type="hidden" name="module" value="UpdateUserStatus"/>
            <tc-webtag:hiddenInput name="<%=Constants.USER_ID%>"/>
            <c:set value="<%=Constants.HANDLE%>" var="handle"/>
            <c:set value="<%=Constants.GIVEN_NAME%>" var="givenName"/>
            <c:set value="<%=Constants.SURNAME%>" var="surname"/>
            <c:set value="<%=com.topcoder.web.tc.Constants.OLD_STATUS_SELECT_VALUE%>" var="statusOldValue"/>
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
                    New Status:
                    <select name="<%=com.topcoder.web.tc.Constants.NEW_STATUS_SELECT%>">
						            <option value="A" <c:if test="${requestScope[statusOldValue]=='A'}">selected</c:if> >
						                Active</option>
						            <option value="5" <c:if test="${requestScope[statusOldValue]=='5'}">selected</c:if>>
						                Duplicate account</option>
						            <option value="4" <c:if test="${requestScope[statusOldValue]=='4'}">selected</c:if>>
						                Member wanted account removed</option>
						            <option value="6" <c:if test="${requestScope[statusOldValue]=='6'}">selected</c:if>>
						                Deactivated for cheating</option>
						        </select>
                </td>
            </tr>
            <tr>
                <td align=center>
                    <br/>
                    Comment (optional):<br/>
                    <tc-webtag:textArea name="<%=com.topcoder.web.tc.Constants.NEW_STATUS_COMMENT%>" rows="3" cols="60"/>
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
