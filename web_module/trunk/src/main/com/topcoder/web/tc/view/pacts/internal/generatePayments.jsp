<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<html>
    <head>
        <title>PACTS</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    </head>
    <body>
        <h1>PACTS</h1>
        <h2 align="center">Generate Payments</h2>

        <center>
            <form name="paymentForm" action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
                <input type="hidden" name="<%=PactsConstants.MODULE_KEY%>" value="GeneratePayments"/>
                <table border="1" cellpadding="5" cellspacing="0">
                    <tr><td><font color="FF0000"><tc-webtag:errorIterator id="err" name="<%=PactsConstants.ROUND_ID%>"><%=err%></tc-webtag:errorIterator></font></td></tr>
                    <tr>
                        <td align="center">
                            Round Id: <input type="text" name="<%=PactsConstants.ROUND_ID%>" maxlength="10" size="10"/> <a href="JavaScript:document.paymentForm.submit();">submit</a>
                        </td>
                    </tr>
                </table>
            </form>
        </center>
        <jsp:include page="InternalFooter.jsp" flush="true" />
    </body>
</html>
