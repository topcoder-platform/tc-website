<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<html>
    <head>
        <title>PACTS</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    </head>
    <body>
        <h1>PACTS</h1>
        <h2 align="center">Generate Affidavits</h2>

        <center>
            <form name="paymentForm" action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
                <input type="hidden" name="<%=PactsConstants.MODULE_KEY%>" value="GeneratePayments"/>
                <input type="hidden" name="<%=PactsConstants.AFFIDAVIT_TYPE_ID%>"/>
                <table border="1" cellpadding="5" cellspacing="0">
                    <tr><td><tc-webtag:errorIterator id="err" name="<%=PactsConstants.ROUND_ID%>"><%=err%></tc-webtag:errorIterator></td></tr>
                    <tr>
                        <td align="center">
                            Round Id: <input type="text" name="<%=PactsConstants.ROUND_ID%>" maxlength="10" size="10"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <a href="JavaScript:document.paymentForm.submit();">Generate SRM Payments</a> <br />
                            <a href="JavaScript:document.paymentForm.<%=PactsConstants.AFFIDAVIT_TYPE_ID%>.value='<%=PactsConstants.TCCC05_ALGORITHM_AFFIDAVIT%>';document.paymentForm.submit();">Generate TCCC 05 Payments</a> <br />
                            <a href="JavaScript:document.paymentForm.<%=PactsConstants.AFFIDAVIT_TYPE_ID%>.value='11';document.paymentForm.submit();">Generate TCO 05 Round 1 Payments</a> <br />
                            <a href="JavaScript:document.paymentForm.<%=PactsConstants.AFFIDAVIT_TYPE_ID%>.value='12';document.paymentForm.submit();">Generate TCO 05 Round 2 Payments</a> <br />
                            <a href="JavaScript:document.paymentForm.<%=PactsConstants.AFFIDAVIT_TYPE_ID%>.value='13';document.paymentForm.submit();">Generate TCO 05 Round 3 Payments</a> <br />
                            <a href="JavaScript:document.paymentForm.<%=PactsConstants.AFFIDAVIT_TYPE_ID%>.value='14';document.paymentForm.submit();">Generate TCO 05 Round 4 Payments</a> <br />
                        </td>
                    </tr>
                </table>
            </form>
        </center>
        <jsp:include page="InternalFooter.jsp" flush="true" />
    </body>
</html>
