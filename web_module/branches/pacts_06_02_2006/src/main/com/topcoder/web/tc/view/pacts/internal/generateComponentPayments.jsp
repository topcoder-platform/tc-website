<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants,
				 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%
	ResultSetContainer statusList = (ResultSetContainer)
		request.getAttribute(PactsConstants.PROJECT_TERMINATION_STATUS_LIST);
%>
<html>
    <head>
        <title>PACTS</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    </head>
    <body>
        <h1>PACTS</h1>
        <h2 align="center">Generate Component Affidavits</h2>

        <center>
            <form name="paymentForm" action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
                <input type="hidden" name="<%=PactsConstants.MODULE_KEY%>" value="GenerateComponentPayments"/>
                <input type="hidden" name="<%=PactsConstants.PROJECT_TERMINATION_STATUS%>"/>
                <table border="1" cellpadding="5" cellspacing="0">
                    <tr><td><tc-webtag:errorIterator id="err" name="<%=PactsConstants.PROJECT_ID%>"><%=err%></tc-webtag:errorIterator></td></tr>
                    <tr>
                        <td align="center">
                            Project Id: <input type="text" name="<%=PactsConstants.PROJECT_ID%>" maxlength="10" size="10"/>
                        </td>
                        <td align="center">
                            Status: <tc-webtag:rscSelect name="<%=PactsConstants.PROJECT_TERMINATION_STATUS%>" list='<%=statusList%>' fieldText="project_stat_name" fieldValue="project_stat_id"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <a href="JavaScript:document.paymentForm.submit();">Generate Component Affidavits</a><br/>
                        </td>
                    </tr>
                </table>
            </form>
        </center>
        <jsp:include page="InternalFooter.jsp" flush="true" />
    </body>
</html>
