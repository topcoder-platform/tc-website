<%@ page
        language="java"
        import="com.topcoder.common.web.data.report.Constants"
        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>TopCoder Reporting</title>
</head>

<body>
<a href=<%=Constants.SERVLET_ADDR%>>&lt;&lt; back to main menu</a><br/><br/>
<center>
    <br/>
    <br/>

    <table width="100%" border="0" cellpadding="3" cellspacing="0">
        <form action="/tc" method=post name="noteForm">
            <input type="hidden" name="module" value="UpdateNote"/>
            <tc-webtag:hiddenInput name="<%=com.topcoder.web.tc.Constants.NOTE_ID%>"/>
            <tc-webtag:hiddenInput name="<%=Constants.USER_ID%>"/>
            <c:set value="<%=Constants.HANDLE%>" var="handle"/>
            <c:set value="<%=Constants.GIVEN_NAME%>" var="givenName"/>
            <c:set value="<%=Constants.SURNAME%>" var="surname"/>
            <tr><td align=center><b><font size="+2">${requestScope[handle]}</font></b></td></tr>
            <tr><td align=center>${requestScope[givenName]} ${requestScope[surname]}</td></tr>
            <tr><td align=center>
                <a href="/tc?module=LegacyReport&t=profile&ha=<%=request.getAttribute(Constants.HANDLE)%>">View Report
                    Profile</a></td></tr>
            <tr><td align=center><A HREF="mailto:<%=request.getAttribute(Constants.EMAIL).toString()%>">Send Email</A>
            </td></tr>
            <tr>
                <td align=center>
                    <tc-webtag:textArea name="<%=com.topcoder.web.tc.Constants.NOTE_TEXT%>" rows="20" cols="100"/>
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
