<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%
    String section = request.getParameter("section") == null ? "" : request.getParameter("section");
%>

            <div id="pageHeader">
                <a href="/education/" id="logo">&nbsp;</a>
                <div class="schoolName">
                    TopCoder Educational Platform<br />
                    <% if (!"introduction".equals(section)) {%>
                        <c:if test="${not empty schoolName}">
                            <a href="/education/">${schoolName}</a>
                        </c:if>
                    <% } %>
                </div>
                <% if (!"no_login".equals(section)) {%>
                    <div class="login">
                        <span>
                    <c:choose>
                        <c:when test="${sessionInfo.anonymous}">
                            <strong><a href="/education/?module=Login">Log in</a></strong>
                        </c:when>
                        <c:otherwise>
                            Hello, <tc-webtag:handle coderId='${sessionInfo.userId}'/>.
                            <strong><a href="/education/?module=Logout">Log out</a></strong>
                        </c:otherwise>
                    </c:choose>
                        </span>
                    </div>
                <% } %>
            </div>
