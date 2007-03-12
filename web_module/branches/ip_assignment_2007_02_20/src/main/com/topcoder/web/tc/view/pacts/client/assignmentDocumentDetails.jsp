<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.controller.request.member.AssignmentDocumentHistory" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.common.model.AssignmentDocumentStatus" %>
<%@ page language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<c:set var="fullList" value="<%= request.getAttribute(AssignmentDocumentHistory.FULL_LIST) %>"/>
<c:set var="assignment_documents" value="<%= request.getAttribute(AssignmentDocumentHistory.ASSIGNMENT_DOCUMENTS) %>"/>
<c:set value="<%=AssignmentDocumentHistory.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>
<c:set value="<%=DataAccessConstants.END_RANK%>" var="endRank"/>

<c:set var="PENDING_STATUS_ID" value="<%= AssignmentDocumentStatus.PENDING_STATUS_ID + "" %>" />
<c:set var="AFFIRMED_STATUS_ID" value="<%= AssignmentDocumentStatus.AFFIRMED_STATUS_ID + "" %>" />
<c:set var="REJECTED_STATUS_ID" value="<%= AssignmentDocumentStatus.REJECTED_STATUS_ID + "" %>" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - PACTs</title>


<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

<script type="text/javascript">
        var sr = <c:out value="${requestScope[defaults][startRank]}"/>;
        var er = <c:out value="${requestScope[defaults][endRank]}"/>;

        function next() {
            var myForm = document.f;
            myForm.<%=DataAccessConstants.START_RANK%>.value = er + 1;
            myForm.<%=DataAccessConstants.END_RANK%>.value = 2 * er - sr + 1;
            myForm.submit();
        }
        function previous() {
            var myForm = document.f;
            myForm.<%=DataAccessConstants.END_RANK%>.value = sr - 1;
            myForm.<%=DataAccessConstants.START_RANK%>.value = 2 * sr - er - 1;
            myForm.submit();
        }
</script>

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
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
        
            <jsp:include page="../../page_title.jsp" >
            <jsp:param name="image" value="pact_s"/>
            <jsp:param name="title" value="Assignment Documents"/>
            </jsp:include>
    
            <p><a href="/PactsMemberServlet?module=ViewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}">click here for a printer friendly version of the assignment document</a></p>
            <center>
                <p><iframe  width="50%" height="300" marginWidth="5"
                    src="/tc?module=Static&d1=pacts&d2=client&d3=viewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}"></iframe>
                </p>
    
                <table>
                    <tr>
                        <td class="bodyText">
                            <form action="/PactsMemberServlet" method="post">
                                <input type="hidden" name="<%=PactsConstants.ASSIGNMENT_DOCUMENT_ID%>" value="${assignment_document.id}"/>
                                <input type="hidden" name="module" value="AffirmAssignmentDocument"/> 
                                <input type="submit" value="affirm assignment document"/>
                            </form>
                        </td>
                        <td class="bodyText">
                            <form action="/PactsMemberServlet" method="post">
                                <input type="hidden" name="<%=PactsConstants.ASSIGNMENT_DOCUMENT_ID%>" value="${assignment_document.id}"/>
                                <input type="hidden" name="module" value="RejectAssignmentDocument"/> 
                                <input type="submit" value="reject assignment document"/>
                            </form>
                        </td>
                        <td>
                            <form action="/reg/?nrg=false">
                                <input type="submit" value="Edit Personal Information">
                            </form>
                        </td>
                    </tr>
                </table>
            </center>
        </TD>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
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
