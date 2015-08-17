<%@ page
         contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet,
                 com.topcoder.web.corp.model.TransactionInfo"
%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Terms</title>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top_generic.jsp"/>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
            <jsp:include page="../includes/left_generic.jsp" />
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="99%" class="bodyText"><img src="/i/corp/clear.gif" width="400" height="11" alt="" border="0"><br>

            <p>In order to process your order, you must agree to the Customer Terms below. Please read the Terms and select the checkbox next to "I Agree to the
            Customer Terms and Conditions stated above" to continue.</p>

            <div align="center">

            <form action="<%=request.getContextPath()+"/Tx/"%>" method="POST" name="frmTerms">

            <table border="0" cellspacing="0" cellpadding="5">
            <jsp:useBean id="TransactionInfo" scope="request" class="com.topcoder.web.corp.model.TransactionInfo" />
                <tr valign="middle"><td class="bodyText"><strong>Customer Terms and Conditions ("Customer Terms")</strong></td></tr>
                <tr valign="middle"><td class="bodyText"><tc-webtag:textArea name="<%=Constants.KEY_TERMS%>" text="<%=TransactionInfo.getTerms()%>" rows="10" cols="80" readOnly="true" styleClass="bodyText"/></td></tr>
                <tr valign="middle"><td class="errorForm"><tc-webtag:errorIterator id="err" name="<%=Constants.KEY_AGREE_TO_TERMS%>"><%=err%></tc-webtag:errorIterator></td></tr>
                <tr valign="middle"><td class="bodyText">I Agree to the Terms and Conditions stated above&#160;<tc-webtag:chkBox name="<%=Constants.KEY_AGREE_TO_TERMS%>" value="<%=TransactionInfo.hasAgreed()%>"/></td></tr>
                <tr valign="middle"><td align="center">
                        <input type="hidden" name="<%=TransactionServlet.KEY_OPERATION%>" value="<%=TransactionServlet.OP_TX_BEGIN%>"/>
                        <input type="hidden" name="module" value="Registration"/>
                        <input type="hidden" name="pid" value="<jsp:getProperty name="TransactionInfo" property="productID" />"/>
                        <input type="submit" onClick="" name="submit" value=" Continue"/>
                    </td>
                </tr>
            </table>

            </form>

            </div>

            <p><br></p>

        </td>
<!-- Center Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>

