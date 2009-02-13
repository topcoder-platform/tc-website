<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<%
	ResultSetContainer affidavitTypes = (ResultSetContainer)
		request.getAttribute(PactsConstants.AFFIDAVIT_TYPE_LIST);
    %>

<html>
    <head>
        <title>PACTS</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    </head>
    <body>
        <h1>PACTS</h1>
        <h2 align="center">Create Affidavit Template</h2>

        <center>
            <form name="paymentForm" action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
                <input type="hidden" name="<%=PactsConstants.MODULE_KEY%>" value="CreateAffidavitTemplate"/>
                <table border="1" cellpadding="5" cellspacing="0">
                    <tr><td><tc-webtag:errorIterator id="err" name="<%=PactsConstants.AFFIDAVIT_TEXT%>"><%=err%></tc-webtag:errorIterator></td></tr>
                    <tr>
                        <td align="center">
                        <tc-webtag:rscSelect name="<%=PactsConstants.AFFIDAVIT_TYPE_ID%>" list='<%=affidavitTypes%>' fieldText="affidavit_type_desc" fieldValue="affidavit_type_id"/>
                        </td>
                    </tr>
                    <tr><td>
                        <textarea class=codingArea name="<%=PactsConstants.AFFIDAVIT_TEXT%>" rows="20" cols="60" wrap="off"></textarea>
                    </td></tr>
                    <tr>
                        <td align="center">
                            <a href="JavaScript:document.paymentForm.submit();">Submit</a> <br />
                        </td>
                    </tr>
                </table>
            </form>
        </center>
        <jsp:include page="InternalFooter.jsp" flush="true" />
    </body>
</html>
