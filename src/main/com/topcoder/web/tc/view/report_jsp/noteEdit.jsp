<%@  page
  language="java"
  import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"
%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<html>
  <head>
    <title>TopCoder Reporting</title>
  </head>
  <body>
<%--    <a href=<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY%>><< back to main menu<a><br/><br/>--%>
    <center>
    <br/>
    <br/>

    <table width="100%" border="0" cellpadding="3" cellspacing="0">

        <tr><td>Note for <%=request.getAttribute(com.topcoder.web.tc.Constants.HANDLE)%></td></tr>

        <tr>
            <td>
                <form action="/tc" method=post name="noteForm">
                <input type="hidden" name="module" value="UpdateNote"/>
                    <tc-webtag:textArea name="<%=com.topcoder.web.tc.Constants.NOTE_TEXT%>" rows="3" cols="40"/>
                    <input type="submit" name="submit" value="Update"/>
                </form>
            </td>
        </tr>


    </table><br/><br/>

    </center>
  </body>
</html>
