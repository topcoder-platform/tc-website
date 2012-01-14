<%--
  - Author: isv
  - Version: 1.0 (Miscellaneous TC Improvements 1.0)
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page provides a template for response to AJAX request for resolving client name per project ID.
--%>
<%@page contentType="text/xml" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<taconite-root xml:space="preserve">
    <taconite-replace-children contextNodeID="runJS" parseInBrowser="true">
        <c:set var="clientInfo" value="${requestScope.clientInfo}"/>
        <c:choose>
            <c:when test="${not empty clientInfo}">
                <script type="text/javascript">
                    <rsc:iterator id="client" list="${clientInfo}">
                        setClient('<rsc:item row="<%=client%>" name="name" escapeHtml="true"/>');
                    </rsc:iterator>
                </script>
            </c:when>
            <c:otherwise>
                <script type="text/javascript">
                    setClient('');
                </script>
            </c:otherwise>
        </c:choose>
    </taconite-replace-children>
</taconite-root>
