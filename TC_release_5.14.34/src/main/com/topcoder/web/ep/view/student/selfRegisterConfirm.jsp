<%@ page import="com.topcoder.web.ep.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>TopCoder :: Education Platform</title>
    <meta http-equiv="content-type" 
        content="text/html;charset=utf-8" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <script language="JavaScript" type="text/javascript" src="/js/ep/arena.js"></script>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_ep"/>
    </jsp:include>
<%-- each school requires its own stylesheet, linked in here --%>
    <link type="text/css" rel="stylesheet" href="/css/ep/default.css" />
    <script type="text/javascript">
        function submit() {
            var myForm = document.f;
            myForm.submit();
        }
    </script>
</head>


<body>

<div align="center">
    <div id="widther">
        <img src="/i/ep/widtherN.png" alt="" style="display:block;" />
        <div id="pageFrame">

            <jsp:include page="../header.jsp" />

            <div id="pageContent" align="left">
                <div class="N">
                    <img src="/i/ep/contentNW.png" alt="" class="NW" />
                    <img src="/i/ep/contentNE.png" alt="" class="NE" />
                </div>
                <div class="spacer">

                <jsp:include page="../nav.jsp" >
                    <jsp:param name="user" value="student"/>
                    <jsp:param name="node" value="home"/>
                </jsp:include>

<%-- CONTENT BEGINS --%>

<div class="window" align="left">
    <div class="spacer">

        <h2>Confirm your registration</h2>

        <div style="margin: 40px 0px;">

            <form name="f" action="${sessionInfo.servletPath}" method="post">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SelfRegisterConfirm"/>

            <p align="center">Are you sure you want to register for these classes?</p>
        
            <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                <tr>
                    <td class="header">School</td>
                    <td class="header">Classroom</td>
                    <td class="header">Professor</td>
                    <td class="header">Term</td>
                    <td class="header">Description</td>
                </tr>
                <%int i = 0;%>
                <c:forEach items="${classrooms}" var="classroom">                
                    <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                        <td class="value">${school.name}</td>
                        <td class="value">${classroom.name}</td>
                        <td class="value">${classroom.professor.user.lastName}, ${classroom.professor.user.firstName}</td>
                        <td class="value">${classroom.academicPeriod}</td>
                        <td class="value">${classroom.description}</td>
                    </tr>
                <%i++;%>
                </c:forEach>
            </table> 

            <div align="center">
                <a href="javascript:submit()"><img src="/i/ep/buttons/submit.png" alt="Submit" /></a>
            </div>

            </form>

        </div>

        <div style="margin-top: 10px;">
            <a href="/education" class="button"><img src="/i/ep/buttons/cancel.png" alt="Cancel" /></a>
        </div>

    </div>
</div>

<%-- CONTENT ENDS --%>

                </div>
                <div class="S">
                    <img src="/i/ep/contentSW.png" alt="" class="SW" />
                    <img src="/i/ep/contentSE.png" alt="" class="SE" />
                </div>
            </div>

            <jsp:include page="../footer.jsp"/>

        </div>
        <img src="/i/ep/widtherS.png" alt="" style="display:block;" />
    </div>
</div>

</body>
</html>