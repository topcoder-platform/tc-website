<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.ep.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
    <head>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>
            <c:choose>
                <c:when test="${not empty ea_assignment.roundId}">Edit Assignment</c:when>
                <c:otherwise>Add Assignment</c:otherwise>
            </c:choose>
        </title>
        <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
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
        <form name="f" action="${sessionInfo.servletPath}" method="post">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="EditAssignment"/>
            <tc-webtag:errorIterator id="err" name="error">
                <font color="#FF0000"><%=err%></font><br/>
            </tc-webtag:errorIterator>
            Selected classroom: ${ea_assignment.classroomName}
            <br/>
            <br/>
            Name: <tc-webtag:textInput name="assignment_name" size="60" editable="true" />
            <br/>
            Start : <tc-webtag:textInput name="assignment_start" id="assignment_start" format="yyyy.MM.dd HH:mm" size="16" maxlength="16" editable="true" />
            <button id="trigger_assignment_start">Set</button>
            <br/>
            End: <tc-webtag:textInput name="assignment_end" id="assignment_end" format="yyyy.MM.dd HH:mm" size="16" maxlength="16" editable="true" />
            <button id="trigger_assignment_end">Set</button>
            <br/>
            Coding phase length : <tc-webtag:textInput name="assignment_coding_phase_length" size="60" editable="true" />
            <br/>
            Show all coders: <tc-webtag:chkBox name="assignment_show_all_scores"/>
            <br/>
            Score type : <tc-webtag:objectSelect name="assignment_score_type" useTopValue="false" list="${assignment_score_types}" valueField="id" textField="description"/>
            <br/>
            Languages: 
            <c:forEach items="${languages}" var="language">
                <c:choose>
                    <c:when test="${not empty assignment_languages && cf:contains(assignment_languages, language.id)}">
                       <input type="checkbox" name="lid" value="${language.id}" checked="checked"></c:when>
                    <c:otherwise>
                       <input type="checkbox" name="lid" value="${language.id}"></c:otherwise>
                </c:choose>
                ${language.name}
            </c:forEach>
            <br/>
            <p>
                <a href="javascript:submit()" class="button" style="width: 60px; margin-right: 10px;">Continue</a>
            </p>
        </form>            
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