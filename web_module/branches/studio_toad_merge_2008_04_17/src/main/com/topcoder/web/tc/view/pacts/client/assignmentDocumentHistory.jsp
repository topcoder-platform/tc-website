<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.controller.request.member.AssignmentDocumentHistory" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentStatus" %>
<%@ page language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<c:set value="<%=AssignmentDocumentHistory.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>
<c:set value="<%=DataAccessConstants.END_RANK%>" var="endRank"/>
<c:set var="show_asterix" value="false" />

<c:set var="PENDING_STATUS_ID" value="<%= AssignmentDocumentStatus.PENDING_STATUS_ID + "" %>" />
<c:set var="AFFIRMED_STATUS_ID" value="<%= AssignmentDocumentStatus.AFFIRMED_STATUS_ID + "" %>" />

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
            <jsp:param name="node" value="my_topcoder"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="pact_s"/>
<jsp:param name="title" value="Assignment Documents"/>
</jsp:include>


<div align="left">
    <div style="float:right;">
       <A href="/wiki/display/tc/How+to+Get+Paid+for+Competing"><img src="/i/pacts/howToGetPaid.png" alt="How to get paid" /></A>
    </div>
    <span class="bodySubtitle">Assignment Document > </span><br />
    <c:if test="${full_list}" >
        View all | <a href="/PactsMemberServlet?module=AssignmentDocumentHistory&full_list=false" class="bcLink">View pending</a>
    </c:if>
    <c:if test="${not full_list}" >
        <a href="/PactsMemberServlet?module=AssignmentDocumentHistory&full_list=true" class="bcLink">View all</a> | View pending
    </c:if>
    <div align="center">
        <a class="bcLink" href="/tc?module=Static&amp;d1=help&amp;d2=assignmentDocFaq">What is an Assignment Document?</a><br /><br />
    </div>

</div>

<c:if test="${not empty has_global_ad}">
    <div>
        <div align="right">
            <span class="bigRed"><a class="bcLink" target="_blank" href="/wiki/display/tc/The+Assignment+Document">Download Assignment Document</a></span><br /><br />
        </div>
        <table class="stat" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
            <tr><td class="title" colspan="4">Assignment Document Status</td></tr>
            <tr class="light">
                <td class="value"><strong>Assignment Document Received</strong></td>
                <td class="valueC">
                    <c:choose>
                        <c:when test="${has_global_ad}">
                            <img src="/i/interface/greenCheckDk.png" alt="Assignment Document - Yes" /> | <a href="/PactsMemberServlet?module=AssignmentDocumentDetails&assignment_document_id=${global_ad_id}">View Submitted Assignment Document</a>
                        </c:when>
                        <c:otherwise>
                            <img src="/i/interface/redXDk.png" alt="Assignment Document - No" />
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </tbody>
        </table>
    </div><br /><br />
</c:if>

<br clear="all" />

<c:choose>
    <c:when test="${not empty assignment_documents}">
        <form name="f" action="${sessionInfo.servletPath}" method="get">
    
    <c:if test="${croppedDataBefore or croppedDataAfter}" >
        <div class="pagingBox">
            <c:choose>
                <c:when test="${croppedDataBefore}">
                    <a href="Javascript:previous()" class="bcLink">&lt;&lt; prev</a>
                </c:when>
                <c:otherwise>
                    &lt;&lt; prev
                </c:otherwise>
            </c:choose>
            
            <c:choose>
                <c:when test="${croppedDataAfter}">
                    <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
                </c:when>
                <c:otherwise>
                    next &gt;&gt;
                </c:otherwise>
            </c:choose>
        </div>
    </c:if>
    
    <br />
    
    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
    <tbody>
        <tr>
            <td class="title" colspan="4">
                Assignment Documents
            </td>
        </tr>
        <tr>
            <td class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true"/>">
            Description</a>
            </td>
            <td class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">
            Affirmation</a>
            </td>
            <td class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>">
            Time Left</a>
            </td>
            <td class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">
            Status</a>
            </td>
        </tr>
    <% boolean even = true;%>
        <c:forEach items="${assignment_documents}" var="ad">
            <tr class="<%=even?"light":"dark"%>">
                <td class="value">
                    <c:out value="${ad.submissionTitle}"/>                
                </td>
                <c:choose>
                    <c:when test="${ad.status.id == AFFIRMED_STATUS_ID}">
                        <td class="valueC">
                            <a href="/PactsMemberServlet?module=AssignmentDocumentDetails&assignment_document_id=${ad.id}">
                                Affirmed on<br /><fmt:formatDate value="${ad.affirmedDate}" pattern="MM/dd/yyyy"/>
                            </a>                
                        </td>
                        <td class="valueC">&nbsp;</td>
                        <td class="valueC">
                            <c:out value="${ad.status.description}"/>
                        </td>
                    </c:when>
                    <c:when test="${ad.status.id == PENDING_STATUS_ID}">
                        <c:choose>
                            <c:when test="${not empty has_global_ad && has_global_ad}">
                                <td class="valueC">
                                    <strong>
                                        No need to Affirm *
                                    </strong>
                                </td>
                                <td class="valueC">
                                    &nbsp;
                                </td>
                                <td class="valueC">
                                    No need to Affirm *
                                </td>
                                <c:set var="show_asterix" value="true" />
                            </c:when>
                            <c:otherwise>
                                <td class="valueC">
                                    <strong><a href="/PactsMemberServlet?module=AssignmentDocumentDetails&assignment_document_id=${ad.id}">
                                        Affirm now
                                    </a></strong>
                                </td>
                                <td class="valueC">
                                    <strong><a href="/PactsMemberServlet?module=AssignmentDocumentDetails&assignment_document_id=${ad.id}">
                                         <c:out value="${ad.daysLeftToExpire}"/> days
                                    </a></strong>            
                                </td>
                                <td class="valueC">
                                    <c:out value="${ad.status.description}"/>
                                </td>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <td class="valueC">
                            <a href="/PactsMemberServlet?module=AssignmentDocumentDetails&assignment_document_id=${ad.id}" class="bigRed">
                                Expired
                            </a>
                        </td>
                        <td class="valueC">
                            <a href="/PactsMemberServlet?module=AssignmentDocumentDetails&assignment_document_id=${ad.id}" class="bigRed">
                                Expired
                            </a>                
                        </td>
                        <td class="valueC">
                            <c:out value="${ad.status.description}"/>
                        </td>
                    </c:otherwise>
                </c:choose>
            </tr>
            <% even = !even;%>
        </c:forEach>
    </tbody>
    </table>
    
    <c:if test="${not empty has_global_ad && has_global_ad && show_asterix}">
        <span class="bigRed">* You already have an Assignment Document on file</span>
    </c:if>
    
         <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AssignmentDocumentHistory"/>
         <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
         <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
         <tc-webtag:hiddenInput name="<%=DataAccessConstants.START_RANK%>"/>
         <tc-webtag:hiddenInput name="<%=DataAccessConstants.END_RANK%>"/>
         <input type="hidden" name="<%= AssignmentDocumentHistory.FULL_LIST %>" value="<c:out value="${full_list}"/>" />

         <c:if test="${croppedDataBefore or croppedDataAfter}" >
            <div class="pagingBox">
                <c:choose>
                    <c:when test="${croppedDataBefore}">
                        <a href="Javascript:previous()" class="bcLink">&lt;&lt; prev</a>
                    </c:when>
                    <c:otherwise>
                        &lt;&lt; prev
                    </c:otherwise>
                </c:choose>
                
                <c:choose>
                    <c:when test="${croppedDataBefore}">
                        <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
                    </c:when>
                    <c:otherwise>
                        next &gt;&gt;
                    </c:otherwise>
                </c:choose>
            </div>
        </c:if>

    </form>            
    </c:when>
    <c:otherwise>
        <div align="center">
        <strong>No Assignment Document Found</strong>
        </div>
    </c:otherwise>
</c:choose>

<br />

     


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