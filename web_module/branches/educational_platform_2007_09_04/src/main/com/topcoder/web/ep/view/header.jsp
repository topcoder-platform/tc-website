<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

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
                    <%-- show this if they're not logged in --%>
                    <strong><a href="/ep/tc?module=Login">Log in</a></strong>
                    </c:when>
                    <c:otherwise>
                    <%-- show this if they are logged in --%>
                    Hello, <tc-webtag:handle coderId='${user.id}'/>.
                    <strong><a href="/ep/?module=Logout">Log out</a></strong>
                    </c:otherwise>
                </c:choose>
                    </span>
                </div>
            </div>
