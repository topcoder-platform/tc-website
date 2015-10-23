<%--
  - Author: isv, TCSDEVELOPER
  - Date: 21 Jan 2009
  - Version: 1.1
  - Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This is the page for listing the members of the review board of requested type. It displays the list of
  - reviewers along with their handles and photos. The page also contains the links for viewing the reviewers from
  - Design and Development review boards.
--%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page language="java" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% ResultSetContainer memberList = (ResultSetContainer) request.getAttribute("memberList"); %>
<c:set var="rowsCount" value="<%=memberList.getRowCount()%>"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Assembly Review Board at TopCoder</title>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>
<body>

<jsp:include page="/top.jsp"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

        <!-- Left Column Begins -->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="assembly_review_board"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt=""></td>
        <!-- Gutter Ends -->

        <!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="software_assembly"/>
                <jsp:param name="title" value="Meet the Assembly Review Board"/>
            </jsp:include>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td class="bodyText"><img src="/i/clear.gif" width="240" height="1" border="0" alt=""><br>

                        <p align="right">
                            <a href="/tc?module=ReviewBoard&amp;pt=1" class="bodyText">
                                <strong>Go to Design Review Board</strong>
                            </a>
                        </p>

                        <p align="right">
                            <a href="/tc?module=ReviewBoard&amp;pt=2" class="bodyText">
                                <strong>Go to Development Review Board</strong>
                            </a>
                        </p>

                        <p>TopCoder Software utilizes past software assembly winners and accomplished TopCoder
                            competitors to staff the Assembly Review Board. These reviewers verify that each assembly
                            submission meets the required functionality, coding style, adheres to the assembly
                            requirements and contains a suitable test suite.</p>

                        <p>The following members have agreed to participate on the TopCoder Assembly Review Board:</p>
                    </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade"/>

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <c:set var="i" value="0"/>
                <rsc:iterator list="<%=memberList%>" id="resultRow">
                    <c:if test="${i % 3 eq 0}">
                        <tr valign="top">
                    </c:if>
                    <td>
                        <div align="center">
                            <a href="/tc?module=MemberProfile&amp;cr=<rsc:item row="<%=resultRow%>" name="user_id"/>">
                                <img src="<rsc:item row="<%=resultRow%>" name="image_path" ifNull="/i/m/nophoto.jpg"/>"
                                     alt="<rsc:item row="<%=resultRow%>" name="handle"/>" width="126" height="140"
                                     border="0" class="myStatsPhoto"/></a><br/>
                            <span class="bodyText">
                                <tc-webtag:handle coderId='<%=resultRow.getIntItem("user_id")%>' context="assembly"/>
                            </span>
                        </div>
                    </td>
                    <c:if test="${(i % 3 eq 2) || (i eq (rowsCount - 1))}">
                        </tr>
                    </c:if>
                    <c:set var="i" value="${i + 1}"/>
                </rsc:iterator>
            </table>
            <p align="middle"><a href="mailto:support@topcoder.com" class="bodyText">Have a question about the
                TopCoder Assembly Review Board?</a></p>
            <p><br/></p>
        </td>
        <!-- Center Column Ends -->

        <!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" alt=""></td>
        <!-- Gutter Ends -->

        <!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0" alt=""><br/>
            <jsp:include page="/public_right.jsp">
                <jsp:param name="level1" value="review_board"/>
                <jsp:param name="level2" value="assembly"/>
            </jsp:include>
        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" alt=""></td>
        <!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp"/>
</body>
</html>
