<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

            <div id="pageHeader">
                <a href="/ep" id="logo">&nbsp;</a>
                <div class="schoolName">
                    TopCoder College Platform<br />
                    <c:if test="${not empty schoolName}">
                        <a href="/ep">${schoolName}</a>
                    </c:if>
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
