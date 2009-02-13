<%@ page import="com.topcoder.web.studio.controller.request.mystudio.AssignmentDocumentHistory" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentStatus" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set value="<%=AssignmentDocumentHistory.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>
<c:set value="<%=DataAccessConstants.END_RANK%>" var="endRank"/>

<c:set var="PENDING_STATUS_ID" value="<%= AssignmentDocumentStatus.PENDING_STATUS_ID + "" %>" />
<c:set var="AFFIRMED_STATUS_ID" value="<%= AssignmentDocumentStatus.AFFIRMED_STATUS_ID + "" %>" />

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script type="text/javascript" src="/js/popup.js"></script>

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

<div align="center">
<div id="contentOut" class="contentOut">
<jsp:include page="../top.jsp"/>
<jsp:include page="../topNav.jsp">
    <jsp:param name="node" value="myStudio"/>
</jsp:include>
<div id="contentIn" class="contentIn">
<img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

<div class="contentSpacer" style="padding-bottom:100px;">


<h1>Assignment Documents</h1>
    <div align="right">
        <a class="bcLink" href="/?module=Static&d1=support&d2=assignmentDocFaq">What is an Assignment Document?</a><br /><br />
    </div>

<table cellpadding="0" cellspacing="0" border="0" style="clear:both; margin-left: 10px;">
    <tr>
        <c:if test="${full_list}" >
            <td width="50%"><A href="/?module=AssignmentDocumentHistory&full_list=true" class="statTabLinkOn"><span>View all</span></A>
            </td>
            <td width="50%">
                <A href="/?module=AssignmentDocumentHistory&full_list=false" class="statTabLinkOff"><span>View pending</span></A>
            </td>
        </c:if>
        <c:if test="${not full_list}" >
            <td width="50%"><A href="/?module=AssignmentDocumentHistory&full_list=true" class="statTabLinkOff"><span>View all</span></A>
            </td>
            <td width="50%">
                <A href="/?module=AssignmentDocumentHistory&full_list=false" class="statTabLinkOn"><span>View pending</span></A>
            </td>
        </c:if>
    </tr>
</table>

<table class="stat" cellpadding="0" cellspacing="0" style="width:740px">
<tbody>
        <form name="f" action="/" method="get">
         <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AssignmentDocumentHistory"/>
         <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
         <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
         <tc-webtag:hiddenInput name="<%=DataAccessConstants.START_RANK%>"/>
         <tc-webtag:hiddenInput name="<%=DataAccessConstants.END_RANK%>"/>
         <input type="hidden" name="<%= AssignmentDocumentHistory.FULL_LIST %>" value="<c:out value="${full_list}"/>" />

    <tr>
        <td class="NW">&nbsp;</td>
        <td class="title" colspan="4">Assignment Documents</td>
        <td class="NE">&nbsp;</td>
    </tr>
    <tr>
        <td class="headerW">
            <div>&nbsp;</div>
        </td>
        <td class="header">
            <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="1" includeParams="true"/>">Description</a>
        </td>
        <td class="headerC">
            <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="3" includeParams="true"/>">Affirmation</a>
        </td>
        <td class="headerC">
            <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="2" includeParams="true"/>">Time Left</a>
       </td>
        <td class="headerC">
            <a href="${sessionInfo.servletPath}?<tc-webtag:sort column="3" includeParams="true"/>">Status</a>
        </td>
        <td class="headerE">
            <div>&nbsp;</div>
        </td>
    </tr>
    <c:choose>
        <c:when test="${empty assignment_documents}">
            <tr class="light">
                <td class="valueW">
                    <div>&nbsp;</div>
                </td>
                <td class="valueC" colspan="4">
                    <div align="center" style="margin: 40px 0px 40px 0px;">
                        There are currently no assignment documents.
                    </div>
                </td>
                <td class="valueE">
                    <div>&nbsp;</div>
                </td>
            </tr>
        </c:when>
        <c:otherwise>    
            <form name="f" action="${sessionInfo.servletPath}" method="get">
            <% boolean even = true;%>
            <c:forEach items="${assignment_documents}" var="ad">
                <tr class="<%=even?"light":"dark"%>">
                    <td class="valueW">
                        <div>&nbsp;</div>
                    </td>
                    <td class="value">
                        <c:out value="${ad.submissionTitle}"/>                
                    </td>
                    <c:choose>
                        <c:when test="${ad.status.id == AFFIRMED_STATUS_ID}">
                            <td class="valueC">
                                <a href="/?module=AssignmentDocumentDetails&assignment_document_id=${ad.id}">
                                    Affirmed on<br><fmt:formatDate value="${ad.affirmedDate}" pattern="MM.dd.yyyy"/>
                                </a>                
                            </td>
                            <td class="valueC">&nbsp;</td>
                        </c:when>
                        <c:when test="${ad.status.id == PENDING_STATUS_ID}">
                            <td class="valueC">
                                <strong><a href="/?module=AssignmentDocumentDetails&assignment_document_id=${ad.id}">
                                    Affirm now
                                </a></strong>
                            </td>
                            <td class="valueC">
                                <strong><a href="/?module=AssignmentDocumentDetails&assignment_document_id=${ad.id}">
                                     <c:out value="${ad.daysLeftToExpire}"/> days
                                </a></strong>            
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td class="valueC">
                                <a href="/?module=AssignmentDocumentDetails&assignment_document_id=${ad.id}" class="bigRed">
                                    Expired
                                </a>
                            </td>
                            <td class="valueC">
                                &nbsp;
                            </td>
                        </c:otherwise>
                    </c:choose>
                    <td class="valueC">
                        <c:out value="${ad.status.description}"/>
                    </td>

                    <td class="valueE">
                        <div>&nbsp;</div>
                    </td>
                </tr>
                <% even = !even;%>
            </c:forEach>
        </c:otherwise>
    </c:choose>
    <tr>
        <td class="SW" colspan="5">&nbsp;</td>
        <td class="SE">&nbsp;</td>
    </tr>
    </form>            
</tbody>
</table>
    <c:if test="${not empty assignment_documents}" >
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
    </c:if>


</div>
<img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
</div>
<jsp:include page="../foot.jsp"/>
<img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>