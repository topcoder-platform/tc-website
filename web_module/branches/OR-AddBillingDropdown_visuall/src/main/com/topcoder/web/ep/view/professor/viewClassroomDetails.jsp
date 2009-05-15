<%@ page import="com.topcoder.web.ep.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="text/javascript">
    <!--
        function submitActive() {
            var myForm = document.fActive;
            myForm.submit();
        }
        function submit(action) {
            var myForm = document.f;
            if (action == 'deactivate') {
                myForm.<%=Constants.MODULE_KEY%>.value = 'DeactivateStudent';
                myForm.submit();
            } else if (action = 'activate') {
                myForm.<%=Constants.MODULE_KEY%>.value = 'ActivateStudent';
                myForm.submit();
            }
        }
        
        function checkAllPending(check) {
            var elements = document.f.elements;
            for (i=0; i<document.f.elements.length; i++) {
                if (document.f.elements[i].type=="checkbox") {
                    document.f.elements[i].checked = (check==true);
                }
            }
        }
        
        function checkAllActive(check) {
            var elements = document.fActive.elements;
            for (i=0; i<document.fActive.elements.length; i++) {
                if (document.fActive.elements[i].type=="checkbox") {
                    document.fActive.elements[i].checked = (check==true);
                }
            }
        }
    //-->
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

        <h2>Students</h2>

        <div align="center" style="margin: 20px;">
            <table cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td style="padding-right: 10px; font-weight: bold;" align="left">
                        <p>Class:</p>
                    </td>
                    <td align="left">
                        <p>${classroom.name}</p>
                    </td>
                </tr>
            </tbody>
            </table>
        </div>

        <div style="float: right; width: 350px;">
        <c:choose>
            <c:when test="${not empty pendingStudents}">
                <form name="f" action="${sessionInfo.servletPath}professor/" method="post">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value=""/>
                    <tc-webtag:hiddenInput name="<%=Constants.CLASSROOM_ID%>" value="${classroom.id}"/>
                    
                    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                        <tr><td class="title" colspan="2">Students awaiting your approval to join this class</td></tr>
                        <tr><td class="header">Student (Handle)</td><td class="header C">Select</td></tr>
                        <%int i = 0;%>
                        <c:forEach items="${pendingStudents}" var="student">                
                            <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                <td class="value">${student.user.lastName}, ${student.user.firstName} (<tc-webtag:handle coderId='${student.id}'/>)</td>
                                <td class="value C"><input type="checkbox" name="stid" value="${student.id}" /></td>
                            </tr>
                        <%i++;%>
                        </c:forEach>
                            <tr>
                                <td width="100%">&nbsp;</td>
                                <td colspan="2" align="center" nowrap="nowrap"><a href="Javascript:checkAllPending(true)">Select all</a></td>
                            </tr>
                    </table>
                    <div>
                        <div style="float:right; margin-left: 10px;"><a href="javascript:submit('deactivate')"><img src="/i/ep/buttons/reject.png" alt="Reject" /></a></div>
                        <div style="float:right;"><a href="javascript:submit('activate')"><img src="/i/ep/buttons/accept.png" alt="Accept" /></a></div>
                    </div>
                </form>
            </c:when>
            <c:otherwise>
                    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                        <tr><td class="title" colspan="2">Students awaiting your approval to join this class</td></tr>
                        <tr><td class="header">Student (Handle)</td><td class="header C">Select</td></tr>
                        <tr class="light"><td class="value C" colspan="2"><div style="margin: 10px;">There are no pending students in this classroom.</div></td></tr>
                    </table>
            </c:otherwise>
        </c:choose>
        </div>

        <div style="width: 350px;">
        <c:choose>
            <c:when test="${not empty activeStudents}">
                <form name="fActive" action="${sessionInfo.servletPath}professor/" method="post">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="DeactivateStudent"/>
                    <tc-webtag:hiddenInput name="<%=Constants.CLASSROOM_ID%>" value="${classroom.id}"/>
                    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                        <tr><td class="title" colspan="2">Active Students</td></tr>
                        <tr><td class="header">Student (Handle)</td><td class="header C">Select</td></tr>
                        <%int i = 0;%>
                        <c:forEach items="${activeStudents}" var="student">
                            <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                <td class="value">${student.user.lastName}, ${student.user.firstName} (<tc-webtag:handle coderId='${student.id}'/>)</td>
                                <td class="value C"><input type="checkbox" name="stid" value="${student.id}" /></td>
                            </tr>
                        <%i++;%>
                        </c:forEach>
                            <tr>
                                <td width="100%">&nbsp;</td>
                                <td colspan="2" align="center" nowrap="nowrap"><a href="Javascript:checkAllActive(true)">Select all</a></td>
                            </tr>
                    </table>
                    <div align="right">
                        <a href="javascript:submitActive()"><img src="/i/ep/buttons/remove.png" alt="Remove" /></a>
                    </div>
                </form>
            </c:when>
            <c:otherwise>
                    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                        <tr><td class="title" colspan="2">Active Students</td></tr>
                        <tr><td class="header">Student (Handle)</td><td class="header C">Select</td></tr>
                        <tr class="light"><td class="value C" colspan="2"><div style="margin: 10px;">There are no active students in this classroom.</div></td></tr>
                    </table>
            </c:otherwise>
        </c:choose>
        </div>

    <br clear="all" />
    <div style="margin-top: 10px;">
        <a href="/education/"><img src="/i/ep/buttons/back.png" alt="Back" /></a>
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