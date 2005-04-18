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
        <form action="/tc" method=post name="dateForm">
            <input type="hidden" name="module" value="UpdateDate"/>
            <input type="hidden" name="<%=com.topcoder.web.tc.Constants.USER_ID%>" value="<%=request.getAttribute(com.topcoder.web.tc.Constants.USER_ID)%>"/>
            <tr><td align=center><b><font size="+2"><%=request.getAttribute(com.topcoder.web.tc.Constants.HANDLE)%></font></b></td></tr>
            <tr><td align=center><a href="/tc?module=&t=profile&ha=<%=request.getAttribute(com.topcoder.web.tc.Constants.HANDLE)%>">View Report Profile</a></p></td></tr>
            <tr>
                <td align=center>
                    Contact Date: (mm/dd/yyyy or blank to reset): <input type="textfield" name="<%=com.topcoder.web.tc.Constants.CONTACT_TEXT%>" size="20"/>
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
