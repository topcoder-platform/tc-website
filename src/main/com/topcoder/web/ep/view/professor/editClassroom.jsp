<%@ page import="com.topcoder.web.ep.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="common-functions" prefix="cf" %>
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

    <script type="text/javascript" src="/js/ep/popup.js"></script>
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
                    <jsp:param name="user" value="professor"/>
                    <jsp:param name="node" value="home"/>
                </jsp:include>

<%-- CONTENT BEGINS --%>

<div class="window" align="left">
    <div class="spacer">

        <h2>
        <c:choose>
            <c:when test="${not empty ec_classroom.id}">Edit class</c:when>
            <c:otherwise>Add class</c:otherwise>
        </c:choose>
        </h2>

        <form name="f" action="${sessionInfo.servletPath}" method="post">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="EditClassroom"/>
            <tc-webtag:errorIterator id="err" name="error">
                <span class="bigRed"><%=err%></span><br />
            </tc-webtag:errorIterator>
            <br />
                <c:forEach items="${ec_classroom.professor.user.schools}" var="school">
                    <c:choose>
                        <c:when test="${fn:length(ec_classroom.professor.user.schools) > 1}">
                            <tc-webtag:radioButton name="<%=Constants.SCHOOL_ID%>" value="${school.school.id}"/>${school.school.name}&nbsp;&nbsp;
                        </c:when>
                        <c:otherwise><tc-webtag:hiddenInput name="<%=Constants.SCHOOL_ID%>" value="${school.school.id}"/></c:otherwise>
                    </c:choose>
                </c:forEach>
            <br />

            <div align="center">
                <table cellpadding="4" cellspacing="0">
                <tbody>
                    <tr>
                        <td align="left">
                            <div class="popper" onmouseover="postPopUpText('Please be specific and unique in naming your class, so that students can find it easily.'); popUp(this,'myPopUp')" onmouseout="popHide()"><strong>Class title:</strong></div>
                        </td>
                        <td align="left">
                            <tc-webtag:textInput name="classroom_name" size="60" editable="true" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <div class="popper" onmouseover="postPopUpText('When is this class?  Season, semester/trimester, however your school designates class sessions.'); popUp(this,'myPopUp')" onmouseout="popHide()"><strong>Term:</strong></div>
                        </td>
                        <td align="left">
                            <tc-webtag:textInput name="classroom_academic_period" size="60" editable="true" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            &nbsp;
                        </td>
                        <td align="left">
                            (Example: "Spring 2007")
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <div class="popper" onmouseover="postPopUpText('Describe this class.'); popUp(this,'myPopUp')" onmouseout="popHide()"><strong>Description:</strong></div>
                        </td>
                        <td align="left">
                            <tc-webtag:textInput name="classroom_description" size="60" editable="true" />
                        </td>
                    </tr>
                </tbody>
                </table>
            </div>

            <div class="popUp" id="myPopUp">
                <div id="popUpText" style="width: 300px; white-space: normal;">&nbsp;</div>
            </div>

            <div align="center">
                <a href="javascript:submit()"><img src="/i/ep/buttons/continue.png" alt="Continue" /></a>
            </div>
        </form>            

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