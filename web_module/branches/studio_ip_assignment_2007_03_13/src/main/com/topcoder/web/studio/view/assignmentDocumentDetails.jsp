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
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script type="text/javascript" src="/js/popup.js"></script>

</head>

<body>


<div align="center">
<div id="contentOut" class="contentOut">
<jsp:include page="top.jsp"/>
<jsp:include page="topNav.jsp">
    <jsp:param name="node" value="contests"/>
</jsp:include>
<div id="contentIn" class="contentIn">
<img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

<div class="contentSpacer" style="padding-bottom:100px;">

<h1>Assignment Documents</h1>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="assignment_documents"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="left" class="bodyColumn">
        
            <jsp:include page="/page_title.jsp" >
            <jsp:param name="image" value="pact_s"/>
            <jsp:param name="title" value="Assignment Documents"/>
            </jsp:include>
    
                <p><a href="/?module=ViewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}">click here for a printer friendly version of the assignment document</a></p>
            <center>
                <p><iframe  width="100%" height="400" marginWidth="5"
                    src="/?module=Static&d1=viewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}"></iframe>
                </p>
    
                <c:if test="${assignment_document.status.id == PENDING_STATUS_ID}">
                    <table>
                        <tr>
                            <td class="bodyText">
                                <form action="/" method="post">
                                    <input type="hidden" name="<%=Constants.ASSIGNMENT_DOCUMENT_ID%>" value="${assignment_document.id}"/>
                                    <input type="hidden" name="module" value="AffirmAssignmentDocument"/> 
                                    <input type="submit" value="Affirm assignment document"/>
                                </form>
                            </td>
                            <td class="bodyText">
                                <form action="/" method="post">
                                    <input type="hidden" name="<%=Constants.ASSIGNMENT_DOCUMENT_ID%>" value="${assignment_document.id}"/>
                                    <input type="hidden" name="module" value="RejectAssignmentDocument"/> 
                                    <input type="submit" value="Reject assignment document"/>
                                </form>
                            </td>
                            <td>
                                <form action="http://<%=ApplicationServer.SERVER_NAME%>/reg/?nrg=false">
                                    <input type="submit" value="Edit Personal Information">
                                </form>
                            </td>
                        </tr>
                    </table>
                </c:if>
            </center>
        </TD>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>


</div>
<img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
</div>
<jsp:include page="foot.jsp"/>
<img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>

</html>
