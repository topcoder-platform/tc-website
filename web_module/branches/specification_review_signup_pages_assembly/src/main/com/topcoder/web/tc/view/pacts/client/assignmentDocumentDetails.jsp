<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*"%>
<%@ page import="com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentStatus" %>
<%@ page language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="PENDING_STATUS_ID" value="<%= AssignmentDocumentStatus.PENDING_STATUS_ID + "" %>" />
<c:set var="assignment_document"
    value="<%= request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT) %>" />
<c:set var="ASSIGNMENT_DOCUMENT_ID"
    value="<%= PactsConstants.ASSIGNMENT_DOCUMENT_ID + "" %>" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - PACTs</title>


<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="my_topcoder"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">
<div class="maxWidthBody">
        
            <jsp:include page="/page_title.jsp" >
            <jsp:param name="image" value="pact_s"/>
            <jsp:param name="title" value="Assignment Documents"/>
            </jsp:include>
    
                <p align="right"><a href="/PactsMemberServlet?module=ViewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}">Printer friendly version</a></p>

                <iframe  width="100%" height="500" marginWidth="5" style="margin-bottom: 10px;"
                    src="/tc?module=Static&d1=pacts&d2=client&d3=viewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}"></iframe>
    
                <div align="center">

                <c:if test="${assignment_document.status.id == PENDING_STATUS_ID}">
                    <form action="/PactsMemberServlet" method="post">
                        <input type="hidden" name="<%=PactsConstants.ASSIGNMENT_DOCUMENT_ID%>" value="${assignment_document.id}"/>
                        <input type="hidden" name="module" value="AffirmAssignmentDocument"/> 
                        <input type="submit" value="Affirm"/>
                    </form>

                    <p>If the personal information in this document is incorrect,<br />please <A href="/reg/?nrg=false">update your profile</A> before affirming.</p>
                    <c:choose>
                        <c:when test="${has_hard_copy}">
                            <p>
                                You have already sent a signed hard copy of the Assignment Document.
                            </p>
                        </c:when>
                        <c:otherwise>
                            <p>
                                You will need to send a signed hard copy of the Assignment Document in order to be able to affirm it in the future. You can get a printer friendly version <a href="/PactsMemberServlet?module=ViewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}">here</a>.
                            </p>
                        </c:otherwise>
                    </c:choose>
                </c:if>
         </div>
</div>
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

<jsp:include page="/foot.jsp" />

</body>

</html>
