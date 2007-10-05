<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%
    String schoolname = request.getParameter("schoolname") == null ? "" : request.getParameter("schoolname");
%>

            <div id="pageHeader">
                <a href="/ep" id="logo">&nbsp;</a>
                <div class="schoolName">
                    TopCoder College Platform<br />
                    <a href="/ep">University of TopCoder</a>
                </div>
                <div class="login">
                    <span>
                <c:choose>
                    <c:when test="${sessionInfo.anonymous}">
                        <strong><a href="/ep/tc?module=Login">Log in</a></strong>
                    </c:when>
                    <c:otherwise>
                        Hello, <tc-webtag:handle coderId='${sessionInfo.userId}'/>.
                        <strong><a href="/ep/?module=Logout">Log out</a></strong>
                    </c:otherwise>
                </c:choose>
                    </span>
                </div>
            </div>
