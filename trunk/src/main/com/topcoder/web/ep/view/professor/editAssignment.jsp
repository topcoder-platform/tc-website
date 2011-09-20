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
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <script language="JavaScript" type="text/javascript" src="/js/ep/arena.js"></script>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_ep"/>
    </jsp:include>
<%-- each school requires its own stylesheet, linked in here --%>
    <link type="text/css" rel="stylesheet" href="/css/ep/default.css" />
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css" />
    <script type="text/javascript" src="/js/ep/popup.js"></script>
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
<c:set value="<%=Constants.COMPONENT_ID%>" var="COMPONENT_ID"/>
<c:set value="<%=Constants.PROBLEM_SET_ID%>" var="PROBLEM_SET_ID"/>

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
            <c:when test="${not empty ea_assignment.roundId}">Edit Assignment</c:when>
            <c:otherwise>Add Assignment</c:otherwise>
        </c:choose>
        </h2>
        <form name="f" action="${sessionInfo.servletPath}" method="post">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="EditAssignment"/>
            <tc-webtag:errorIterator id="err" name="error">
            <p class="bigRed" align="center">
                <%=err%>
            </p>
            </tc-webtag:errorIterator>
            <p align="center">
                <strong>Class:</strong> ${ea_assignment.classroomName}
            </p>

            <div align="center">
                <table cellpadding="4" cellspacing="0">
                <tbody>
                    <tr>
                        <td align="left">
                            <strong>Assignment title:</strong>
                        </td>
                        <td align="left">
                            <tc-webtag:textInput name="assignment_name" size="60" editable="true" />
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <strong>Start date:</strong>
                        </td>
                        <td align="left">
                            <tc-webtag:textInput name="assignment_start" id="assignment_start" format="yyyy.MM.dd HH:mm" size="16" maxlength="16" editable="true" />
                            <button id="trigger_assignment_start">Select</button>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <strong>End date:</strong>
                        </td>
                        <td align="left">
                            <tc-webtag:textInput name="assignment_end" id="assignment_end" format="yyyy.MM.dd HH:mm" size="16" maxlength="16" editable="true" />
                            <button id="trigger_assignment_end">Select</button>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <div class="popper" onmouseover="postPopUpText('This designates how long students have to complete the assignment, starting when they open it in the Arena. Entering <strong>0</strong> will give students the entire assignment phase, from start date to end date.'); popUp(this,'myPopUp')" onmouseout="popHide()"><strong>Coding phase duration:</strong></div>
                        </td>
                        <td align="left">
                            <tc-webtag:textInput name="assignment_coding_phase_length" size="10" editable="true" /> minutes
                        </td>
                    </tr>
                    <tr>
                        <td align="left">&nbsp;
                            
                        </td>
                        <td align="left">
                            (Entering <strong>0</strong> will give students the entire assignment phase, from start date to end date.)
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <div class="popper" onmouseover="postPopUpText('Check this box if you would like students to be able to see the status and scores of the rest of the class.'); popUp(this,'myPopUp')" onmouseout="popHide()"><strong>Share status & scores:</strong></div>
                        </td>
                        <td align="left">
                            <tc-webtag:chkBox name="assignment_show_all_scores"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <div class="popper" onmouseover="postPopUpText('You can select one of several scoring criteria for this assignment.  Your reports will show you the resulting scores for all the types of scoring, but students will only see the results for the selected type.'); popUp(this,'myPopUp')" onmouseout="popHide()"><strong>Score type:</strong></div>
                        </td>
                        <td align="left">
                            <tc-webtag:objectSelect name="assignment_score_type" useTopValue="false" list="${assignment_score_types}" valueField="id" textField="description"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <div class="popper" onmouseover="postPopUpText('Check off all the programming languages that students are allowed to use for their submission.'); popUp(this,'myPopUp')" onmouseout="popHide()"><strong>Available languages:</strong></div>
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

            <c:if test="${empty ea_assignment.roundId}">
                <div align="center">
                    <table cellpadding="0" cellspacing="0" class="stat">
                    <tbody>
                        <tr><td class="title" colspan="3">Problem sets</td></tr>
                        <tr>
                            <td class="header">Problem set</td>
                            <td class="header">Problem(s)</td>
                            <td class="header C">Select</td>
                        </tr>
                        <%int i = 0;%>
                        <c:forEach items="${problem_sets}" var="problem_set">
                            <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                <td class="value"><a href="Javascript:openWin('/education/?module=ViewProblemSet&amp;${PROBLEM_SET_ID}=${problem_set.id}','problemSetDescription',600,600);">${problem_set.name}</a></td>
                                <td class="value">
                                    <c:forEach items="${problem_set.components}" var="component">
                                        <a href="Javascript:openWin('/education/?module=ViewProblem&amp;${COMPONENT_ID}=${component.id}','problemStatement',600,600);">${component.problem.name}</a>
                                        <c:if test="${fn:length(problem_set.components) > 1}">
                                            <br />
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td class="value C"><tc-webtag:radioButton name="${PROBLEM_SET_ID}" value="${problem_set.id}"/></td>
                            </tr>
                            <%i++;%>
                        </c:forEach>
                    </tbody>
                    </table>
                </div>
            </c:if>

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
<script language="javascript" type="text/javascript">
<!--
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
//-->
</script>
</html>