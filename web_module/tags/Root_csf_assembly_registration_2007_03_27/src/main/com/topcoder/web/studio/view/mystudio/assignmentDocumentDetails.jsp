<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants"%>
<%@ page import="com.topcoder.web.common.model.AssignmentDocumentStatus" %>
<%@ page language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="PENDING_STATUS_ID" value="<%= AssignmentDocumentStatus.PENDING_STATUS_ID + "" %>" />
<c:set var="assignment_document"
    value="<%= request.getAttribute(Constants.RESULT_KEY) %>" />
<c:set var="ASSIGNMENT_DOCUMENT_ID"
    value="<%= Constants.ASSIGNMENT_DOCUMENT_ID + "" %>" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script type="text/javascript" src="/js/popup.js"></script>

</head>

<body>


<div align="center">
<div id="contentOut" class="contentOut">
<jsp:include page="../top.jsp"/>
<jsp:include page="../topNav.jsp">
    <jsp:param name="node" value=""/>
</jsp:include>
<div id="contentIn" class="contentIn">
<img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

<div class="contentSpacer">

<h1>Intellectual Property Transfers</h1>

    
                <p align="right"><a href="/?module=ViewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}">Printer friendly version</a></p>
                <div align="center">

                <iframe  width="100%" height="400" marginWidth="5" style="margin-bottom: 10px;"
                    src="/?module=Static&d1=viewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}"></iframe>
    
                <c:if test="${assignment_document.status.id == PENDING_STATUS_ID}">
                    <c:choose>
                        <c:when test="${has_hard_copy}">
                            <form action="/" method="post">
                                <input type="hidden" name="<%=Constants.ASSIGNMENT_DOCUMENT_ID%>" value="${assignment_document.id}"/>
                                <input type="hidden" name="module" value="AffirmAssignmentDocument"/> 
                                <input type="submit" value="Affirm"/>
                            </form>
                            <p>If the personal information in this document is incorrect,<br>please <A href="http://<%=ApplicationServer.SERVER_NAME%>/reg/?nrg=false">update your profile</A> before affirming.</p>
                        </c:when>
                        <c:otherwise>
                            <p>
                                You'll need to send a signed hard copy of the Assignment Document in order to be able to affirm it in the future with the system. You can get a printer friendly version <a href="/PactsMemberServlet?module=ViewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}">here</a>.
                            </p>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </div>

</div>
<img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
</div>
<jsp:include page="../foot.jsp"/>
<img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>

</html>
