<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

            <div id="pageHeader">
                <a href="/ep" id="logo">&nbsp;</a>
                <div class="schoolName">
                    TopCoder College Platform<br />
                    <a href="/ep">University of TopCoder</a>
                </div>
                <div class="login">
                    <span>
                    <%-- show this if they're not logged in --%>
                    <strong><a href="/ep/tc?module=Login">Log in</a></strong>
                    <%-- show this if they are logged in 
                    Hello, <tc-webtag:handle coderId='${user.id}'/>.
                    <strong><a href="/ep/tc?module=Logout">Log out</a></strong>
                    --%>
                    </span>
                </div>
            </div>
