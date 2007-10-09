<%@ page import="com.topcoder.web.ep.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

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
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_ep"/>
    </jsp:include>
    <%-- each school requires its own stylesheet, linked in here --%>
    <link type="text/css" rel="stylesheet" href="/css/ep/default.css" />
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css" />
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>

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

            <jsp:include page="../header.jsp">
                <jsp:param name="schoolname" value="University of TopCoder"/>
            </jsp:include>

            <div id="pageContent" align="left">
                <div class="N">
                    <img src="/i/ep/contentNW.png" alt="" class="NW" />
                    <img src="/i/ep/contentNE.png" alt="" class="NE" />
                </div>
                <div class="spacer">

<%-- CONTENT BEGINS --%>

<div class="window" align="left">
    <div class="spacer">

        <h1><span class="bg"><span class="spacer">
        <c:choose>
            <c:when test="${not empty ea_assignment.roundId}">Edit Assignment</c:when>
            <c:otherwise>Add Assignment</c:otherwise>
        </c:choose>
        </span></span></h1>
        <form name="f" action="${sessionInfo.servletPath}" method="post">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="EditAssignment"/>
            <tc-webtag:errorIterator id="err" name="error">
                <span class="bigRed"><%=err%></span><br />
            </tc-webtag:errorIterator>
            Selected classroom: ${ea_assignment.classroomName}
            <br />
            <br />

            <div align="center">
                <table cellpadding="4" cellspacing="0">
                <tbody>
                    <tr>
                        <td align="left">
                            <strong>Name:</strong>
                        </td>
                        <td align="left">
                            <tc-webtag:textInput name="assignment_name" size="60" editable="true" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <strong>Start:</strong>
                        </td>
                        <td align="left">
                            <tc-webtag:textInput name="assignment_start" id="assignment_start" format="yyyy.MM.dd HH:mm" size="16" maxlength="16" editable="true" />
                            <button id="trigger_assignment_start">Set</button>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <strong>Due:</strong>
                        </td>
                        <td align="left">
                            <tc-webtag:textInput name="assignment_end" id="assignment_end" format="yyyy.MM.dd HH:mm" size="16" maxlength="16" editable="true" />
                            <button id="trigger_assignment_end">Set</button>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <strong>Coding phase length:</strong>
                        </td>
                        <td align="left">
                            <tc-webtag:textInput name="assignment_coding_phase_length" size="60" editable="true" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <strong>Show all coders:</strong>
                        </td>
                        <td align="left">
                            <tc-webtag:chkBox name="assignment_show_all_scores"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <strong>Score type:</strong>
                        </td>
                        <td align="left">
                            <tc-webtag:objectSelect name="assignment_score_type" useTopValue="false" list="${assignment_score_types}" valueField="id" textField="description"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <strong>Languages:</strong>
                        </td>
                        <td align="left">
                            <c:forEach items="${languages}" var="language">
                                <c:choose>
                                    <c:when test="${not empty assignment_languages && cf:contains(assignment_languages, language.id)}">
                                       <input type="checkbox" name="lid" value="${language.id}" checked="checked" /></c:when>
                                    <c:otherwise>
                                       <input type="checkbox" name="lid" value="${language.id}" /></c:otherwise>
                                </c:choose>
                                ${language.name}
                            </c:forEach>
                        </td>
                    </tr>
                </tbody>
                </table>
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
<script language="javascript" type="text/javascript">
Calendar.setup(
{
    inputField  : "assignment_start",         // ID of the input field
    ifFormat    : "<%=Constants.JS_DATE_FORMAT%>",    // the date format
    button      : "trigger_assignment_start",       // ID of the button
    showsTime   : true,
    singleClick  : false,
    cache       : true
}
        );
Calendar.setup(
{
    inputField  : "assignment_end",         // ID of the input field
    ifFormat    : "<%=Constants.JS_DATE_FORMAT%>",    // the date format
    button      : "trigger_assignment_end",      // ID of the button
    showsTime    : true,
    singleClick  : false,
    cache       : true
}
        );
</script>
</html>