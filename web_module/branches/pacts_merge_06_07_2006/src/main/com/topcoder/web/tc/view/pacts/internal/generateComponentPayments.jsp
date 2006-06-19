<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants,
				 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
				 com.topcoder.web.common.StringUtils" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%
	ResultSetContainer statusList = (ResultSetContainer)
		request.getAttribute(PactsConstants.PROJECT_TERMINATION_STATUS_LIST);
	String projID = StringUtils.checkNull((String)request.getParameter(PactsConstants.PROJECT_ID)).trim();
	String projTermStatus = StringUtils.checkNull((String)request.getParameter(PactsConstants.PROJECT_TERMINATION_STATUS)).trim();
	String client = StringUtils.checkNull((String)request.getParameter(PactsConstants.PROJECT_CLIENT)).trim();
%>
<html>
    <head>
        <title>PACTS</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    </head>
    <body>
        <h1>PACTS</h1>
        <h2 align="center">Generate Component Payments</h2>
        <center>
            <form name="paymentForm" action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
                <input type="hidden" name="<%=PactsConstants.MODULE_KEY%>" value="GenerateComponentPayments"/>
                <table border="1" cellpadding="5" cellspacing="0">
                    <tr>
                    	<td colspan="3" align="left">
                    		<%	int errCount = 0; %>
                    		<tc-webtag:errorIterator id="err" name="<%=PactsConstants.PROJECT_ID%>">
                    			<%	String errStr = (String)err; %>
                    			<% 	if (errCount > 0) { %><br><% } %>
                    			<% 	if (errStr.indexOf("Error:") != -1) { %>
                    					<font color="red"><%=errStr%></font>
                    			<% 	} else if (errStr.indexOf("Success:") != -1) { %>
                    					<font color="green"><%=errStr%>
                    					(<a href="/PactsInternalServlet?<%=PactsConstants.PROJECT_ID%>=<%=projID%>&c=payment&t=list">view</a>)</font>
                    			<% 	} %>
                    			<% 	if (err!=null && !err.equals("")) { errCount++; } %>
                    		</tc-webtag:errorIterator>
                    		<tc-webtag:errorIterator id="err" name="<%=PactsConstants.PROJECT_TERMINATION_STATUS%>">
                    			<%	String errStr = (String)err; %>
                    			<% 	if (errCount > 0) { %><br><% } %>
                    				<font color="red"><%=errStr%></font>
                    			<% 	if (errStr!=null && !errStr.equals("")) { errCount++; } %>
                    		</tc-webtag:errorIterator>
                    	</td>
                    </tr>
                    <tr>
                        <td align="center">
                            Project Id: <input type="text" name="<%=PactsConstants.PROJECT_ID%>" maxlength="10" size="10" value="<%=projID%>"/>
                        </td>
                        <td align="center">
                            Status: <tc-webtag:rscSelect name="<%=PactsConstants.PROJECT_TERMINATION_STATUS%>" list='<%=statusList%>' fieldText="project_stat_name" fieldValue="project_stat_id" selectedValue="<%=projTermStatus%>"/>
                        </td>
                        <td align="center">
                            Client: <input type="text" name="<%=PactsConstants.PROJECT_CLIENT%>" maxlength="100" size="25" value="<%=client%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <a href="JavaScript:document.paymentForm.submit();">Generate Component Payments</a><br/>
                        </td>
                    </tr>
                </table>
            </form>
        </center>
        <jsp:include page="InternalFooter.jsp" flush="true" />
    </body>
</html>
