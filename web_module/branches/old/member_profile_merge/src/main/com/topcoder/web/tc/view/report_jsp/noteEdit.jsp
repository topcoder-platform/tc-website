<%@  page
  language="java"
  import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
          com.topcoder.common.web.data.report.Constants"
%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>
  <head>
    <title>TopCoder Reporting</title>
  </head>
  <body>
     <a href=<%=Constants.SERVLET_ADDR%>><< back to main menu</a><br/><br/>
    <center>
    <br/>
    <br/>

    <table width="100%" border="0" cellpadding="3" cellspacing="0">
        <form action="/tc" method=post name="noteForm">
            <input type="hidden" name="module" value="UpdateNote"/>
            <tc-webtag:hiddenInput name="<%=com.topcoder.web.tc.Constants.NOTE_ID%>" />
            <tc-webtag:hiddenInput name="<%=com.topcoder.web.tc.Constants.USER_ID%>" />
            <tr><td align=center><b><font size="+2"><%=request.getAttribute(com.topcoder.web.tc.Constants.HANDLE)%></font></b></td></tr>
            <tr><td align=center><a href="/tc?module=LegacyReport&t=profile&ha=<%=request.getAttribute(com.topcoder.web.tc.Constants.HANDLE)%>">View Report Profile</a></p></td></tr>
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
