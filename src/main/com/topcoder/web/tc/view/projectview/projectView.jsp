<%--
  - Author: pulky
  - Version: 1.0
  - Since: Project View
  - Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page shows aggregated information about contests in the specified date range grouped
  -              by client and project name.
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set value="<%=Constants.MODULE_KEY%>" var="MODULE_KEY"/>
<c:set value="<%=Constants.START_DATE%>" var="START_DATE"/>
<c:set value="<%=Constants.END_DATE%>" var="END_DATE"/>
<c:set value="<%=Constants.PROJECT_VIEW_DATE_FORMAT%>" var="PROJECT_VIEW_DATE_FORMAT"/>
<c:set value="<%=Constants.ALTERNATE_PROJECT_VIEW_DATE_FORMAT%>" var="ALTERNATE_PROJECT_VIEW_DATE_FORMAT"/>

<html>
    <head>
        <title>Project View report</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>

        <script src="/js/jquery-1.2.3.pack.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                // manage expand/collapse
                $("td.open").click(function () {
                    var elementId = $(this).attr("id");
                    var open = $(this).attr("class") == "open";

                    if (open) {
                        // show immediate child
                        $("tbody[id='" + elementId + "']").show();

                        // look for childs that were collapsed while still open
                        var openElements = $("td[id^='" + elementId + "'].close");
                        for (var i = 0; i < openElements.length; i++) {
                            // get id
                            var openElement = $($(openElements).get(i)).attr("id");

                            // show this element
                            $("tbody[id='" + openElement + "']").show();
                        }
                    } else {
                        // hide all "childs"
                        $("tbody[id^='" + elementId + "']").hide();
                    }

                    // change class
                    $("td[id='" + elementId + "']").attr("class", open ? "close" : "open");

                    // change expand/collapse image
                    $("img[id='" + elementId + "']").attr("src", "/i/interface/" + (open ? "close" : "open") + ".gif");
                    $("img[id='" + elementId + "']").attr("alt", open ? "Close" : "Open");
                });
            });
        </script>
        <jsp:include page="../style.jsp">
            <jsp:param name="key" value="tc_stats"/>
        </jsp:include>
    </head>

    <body>
        <jsp:include page="../top.jsp" >
            <jsp:param name="level1" value=""/>
        </jsp:include>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tbody>
                <tr valign="top">
                    <%-- Left Column Begins--%>
                    <td width="180">
                        <jsp:include page="../includes/global_left.jsp">
                            <jsp:param name="node" value=""/>
                        </jsp:include>
                    </td>
                    <%-- Left Column Ends --%>

                    <%-- Center Column Begins --%>
                    <td width="100%" align="center" class="bodyColumn">
                        <div class="maxWidthBody" align="left">
                            <b>Project View Reports</b>
                            <table cellspacing="0" cellpadding="0" class="stat" style="width: 100%; margin-bottom: 15px;">
                                <thead>
                                    <tr>
                                        <td class="header">
                                            Report's filter:
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <form action="${sessionInfo.servletPath}" method="POST" name="projectViewForm">
                                                <input type="hidden" name="${MODULE_KEY}" value="ProjectView"/>
                                                <table>
                                                    <thead>
                                                        <tr>
                                                            <td align="left">
                                                                Start Date:
                                                            </td>
                                                            <td align="left">
                                                                <tc-webtag:textInput name="${START_DATE}" size="20" maxlength="20"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="errorText" colspan="2">
                                                                <tc-webtag:errorIterator id="err" name="${START_DATE}">${err}</tc-webtag:errorIterator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                End Date: 
                                                            </td>
                                                            <td align="left">
                                                                <tc-webtag:textInput name="${END_DATE}" size="20" maxlength="20"/>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="errorText" colspan="2">
                                                                <tc-webtag:errorIterator id="err" name="${END_DATE}">${err}</tc-webtag:errorIterator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" colspan="2">
                                                                * You may use <strong>${PROJECT_VIEW_DATE_FORMAT}</strong> 
                                                                or <strong>${ALTERNATE_PROJECT_VIEW_DATE_FORMAT}</strong> as date formats.
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <input type="submit" name="submit" value="Filter"/>
                                                            </td>
                                                        </tr>
                                                    </thead>
                                                </table>
                                            </form>
                                        </td>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="maxWidthBody" align="left">
                            <c:choose>
                                <c:when test="${not empty clients}">
                                    <table cellspacing="0" cellpadding="0" class="stat" style="width: 100%; margin-bottom: 15px;">
                                        <tbody class="clientHeader">
                                            <tr>
                                                <td class="header" width="3%">&nbsp;</td>
                                                <td class="header" width="16%">Client Name</td>
                                                <td class="header" width="3%">&nbsp;</td>
                                                <td class="header" width="16%">Project Name</td>
                                                <td class="header" width="16%">Contest Name</td>
                                                <td class="header" width="16%">Contest Category</td>
                                                <td class="header" width="14%">Status</td>
                                                <td class="header" width="16%">Contest Fee</td>
                                            </tr>
                                        </tbody>
                                        <c:forEach items="${clients}" var="client" varStatus="statusCli">
                                            <tbody class="clientHeader">
                                                <c:set value="${statusCli.index % 2 == 1? 'dark' : 'light'}" 
                                                    var="trClass"/>
                                                <tr class="${trClass}">
                                                    <td class="open" id="cli${statusCli.index}">
                                                        <img id="cli${statusCli.index}" src="/i/interface/open.gif" 
                                                            alt="open"/>
                                                    </td>
                                                    <td>${client.name}</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td align="right">
                                                        <fmt:formatNumber value="${client.totalFee}" type="currency" 
                                                            currencySymbol="$"/>
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <c:forEach items="${client.projects}" var="project" varStatus="statusPrj">
                                                <tbody id="cli${statusCli.index}" class="details" style="display: none">
                                                    <tr class="${trClass}">
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                        <td class="open" id="cli${statusCli.index}prj${statusPrj.index}">
                                                            <img id="cli${statusCli.index}prj${statusPrj.index}" 
                                                                src="/i/interface/open.gif" alt="open"/>
                                                        </td>
                                                        <td>${project.name}</td>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                        <td align="right">
                                                            <fmt:formatNumber value="${project.totalFee}"
                                                                type="currency" currencySymbol="$"/>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                                <c:forEach items="${project.contests}" var="contest">
                                                    <tbody id="cli${statusCli.index}prj${statusPrj.index}" 
                                                        class="details" style="display: none">
                                                        <tr class="${trClass}">
                                                            <td>&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                            <td>${contest.name}</td>
                                                            <td>${contest.category}</td>
                                                            <td>${contest.status}</td>
                                                            <td align="right">
                                                                <fmt:formatNumber value="${contest.fee}" 
                                                                    type="currency" currencySymbol="$"/>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </c:forEach>
                                            </c:forEach>
                                        </c:forEach>
                                    </table>
                                </c:when>
                                <c:otherwise>
                                    No clients were found.
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </td>
                    <%-- Center Column Ends --%>

                    <%-- Right Column Begins --%>
                    <td width="170">
                        <jsp:include page="../public_right.jsp">
                            <jsp:param name="level1" value="default"/>
                        </jsp:include>
                    </td>
                    <%-- Right Column Ends --%>
                </tr>
            </tbody>
        </table>
        <jsp:include page="../foot.jsp" />
    </body>
</html>
