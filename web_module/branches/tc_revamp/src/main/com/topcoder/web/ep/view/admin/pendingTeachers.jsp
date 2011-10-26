<%@ page import="com.topcoder.web.ep.Constants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder :: Education Platform Admin</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Content-Style-Type" content="text/css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_ep"/>
    </jsp:include>
    <%-- each school requires its own stylesheet, linked in here --%>
    <link type="text/css" rel="stylesheet" href="/css/ep/default.css"/>
    <script type="text/javascript"><!--
    function enable(id) {
        document.subForm.<%=Constants.PROFESSOR_ID%>.value = id;
        document.subForm.submit();
    }
    //--></script>

</head>

<body>

<div align="center">
    <div id="widther">
        <img src="/i/ep/widtherN.png" alt="" style="display:block;"/>

        <div id="pageFrame">

            <div id="pageContent" align="left">
                <div class="N">
                    <img src="/i/ep/contentNW.png" alt="" class="NW"/>
                    <img src="/i/ep/contentNE.png" alt="" class="NE"/>
                </div>
                <div class="spacer">

                    <%-- CONTENT BEGINS --%>
                        <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="subForm">
                        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="EnableTeacher"/>
                        <tc-webtag:hiddenInput name="<%=Constants.PROFESSOR_ID%>"/>

                    <div align="center">
                        <table>
                            <thead>
                                <tr>
                                    <td>Username</td>
                                    <td>Given Name</td>
                                    <td>Surname</td>
                                    <td>School</td>
                                    <td></td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${fn:length(teachers)==0}">
                                    There are no pending teachers.
                                </c:if>
                                <c:forEach items="${teachers}" var="teacher">
                                    <tr>
                                        <td>${teacher.map['handle']}</td>
                                        <td>${teacher.map['first_name']}</td>
                                        <td>${teacher.map['last_name']}</td>
                                        <td>${teacher.map['school_name']}</td>
                                        <td>
                                            <button name="submit" value="submit" type="submit" onclick="enable(${teacher.map['user_id']})">
                                                Enable
                                            </button>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                            </form>

                    <%-- CONTENT ENDS --%>

                </div>
                <div class="S">
                    <img src="/i/ep/contentSW.png" alt="" class="SW"/>
                    <img src="/i/ep/contentSE.png" alt="" class="SE"/>
                </div>
            </div>

            <jsp:include page="../footer.jsp"/>

        </div>
        <img src="/i/ep/widtherS.png" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>