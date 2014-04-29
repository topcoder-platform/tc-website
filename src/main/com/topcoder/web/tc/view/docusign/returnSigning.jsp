<%--
  - Author: vangavroche, gonia_119
  - Version: 1.0
  - Copyright (C) - 2014 TopCoder Inc., All Rights Reserved.
  -
  - Version 1.0 (Module Assembly - DocuSign Integration v1.0)
  - add return signing page when return from docusign website.
  - -
--%>
<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Return Signing</title>
<jsp:include page="/style.jsp">
    <jsp:param name="key" value="tc_stats"/>
</jsp:include>
</head>
<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
        <td width="100%" align="center" class="bodyColumn">
            <strong>
                <c:choose>
                    <c:when test="${event eq 'decline'}">
                        You have declined the document. You can sign the document at a later time by starting the signing process again.
                    </c:when>
                    <c:when test="${event eq 'ttl_expired' or event eq 'session_timeout' or event eq 'ttl_complete'}">
                        The document has expired. Please start the signing procedure again.
                    </c:when>
                    <c:when test="${event eq 'cancel'}">
                        You have cancelled signing the document. You can sign the document at a later time by starting the signing process again.
                    </c:when>
                    <c:when test="${event eq 'signing_complete'}">
                        You have successfully signed the document. Depending on the type of the signed document, it may now be forwarded for countersignature to the Appirio Legal team, or processed immediatelly.<br/>
                        You will get a email notification when your document is fully signed by all parties and completed.
                    </c:when>
                    <c:otherwise>
                        There was an unexpected error while processing your signature.<br/>
                        Please report this to support@topcoder.com and be sure to include this timestamp: <%=new Date().toString()%>
                    </c:otherwise>
                </c:choose>
            </strong>
        </td>
    </tr>
</tbody>
</table>


</body>
</html>
