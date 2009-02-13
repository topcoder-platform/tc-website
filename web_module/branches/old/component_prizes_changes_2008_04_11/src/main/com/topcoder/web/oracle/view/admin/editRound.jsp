<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.oracle.Constants" %>
<%@ page import="com.topcoder.web.oracle.model.Phase" %>
<%@ page import="com.topcoder.web.oracle.model.RoundProperty" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>

</head>

<body>

<div align="center">
<div id="contentOut" class="contentOut">
<jsp:include page="../top.jsp">
    <jsp:param name="section" value="admin"/>
</jsp:include>
<jsp:include page="../topNav.jsp">
    <jsp:param name="node" value="contests"/>
</jsp:include>
<div id="contentIn" class="contentIn">
<img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

<div class="contentSpacer">

<div class="linkBox"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewContests">back to
    Contests</A></div>

<h1>Edit Round Details</h1>

<p><a href="${sessionInfo.servletPath}?module=AdminViewContest&amp;<%=Constants.CONTEST_ID%>=${round.contest.id}">edit contest</a></p>

<form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="editForm">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminEditRound"/>
<tc-webtag:hiddenInput name="<%=Constants.ROUND_ID%>"/>
<tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>

<div class="header">Round Details</div>

<table cellpadding="0" cellspacing="0" class="input">
<tbody>
<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.ROUND_NAME%>">
            <span class="bigRed">${err}<br/></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="name">
        Round Name:
    </td>
    <td class="value" width="100%">
        <tc-webtag:textInput name="<%=Constants.ROUND_NAME%>"/>
    </td>
</tr>
<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.ROUND_STATUS_ID%>"><span class="bigRed">${err}
            <br/></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="name">
        Status:
    </td>
    <td class="value">
        <tc-webtag:objectSelect name="<%=Constants.ROUND_STATUS_ID%>" list="${roundStatuses}" valueField="id"
                                textField="description"/>
    </td>
</tr>

<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.START_TIME+Phase.REGISTRATION%>"><span class="bigRed">${err}
            <br/></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="name" nowrap="nowrap">
        Reg Start<br/>(Eastern Time):
    </td>
    <td class="value">
        <tc-webtag:textInput name="<%=Constants.START_TIME+Phase.REGISTRATION%>" id="<%=Constants.START_TIME+Phase.REGISTRATION%>"/>
        <button id="trigger<%=Constants.START_TIME+Phase.REGISTRATION%>">Set</button>
    </td>
</tr>
<tr>
    <td colspan="2">
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.END_TIME+Phase.REGISTRATION%>">${err}
                    <br/></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td class="name" nowrap="nowrap">
        Reg End<br/>(Eastern Time):
    </td>
    <td class="value">
        <tc-webtag:textInput name="<%=Constants.END_TIME+Phase.REGISTRATION%>" id="<%=Constants.END_TIME+Phase.REGISTRATION%>"/>
        <button id="trigger<%=Constants.END_TIME+Phase.REGISTRATION%>">Set</button>
    </td>
</tr>


<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.START_TIME+Phase.SUBMISSION%>"><span class="bigRed">${err}
            <br/></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="name" nowrap="nowrap">
        Submission Start<br/>(Eastern Time):
    </td>
    <td class="value">
        <tc-webtag:textInput name="<%=Constants.START_TIME+Phase.SUBMISSION%>" id="<%=Constants.START_TIME+Phase.SUBMISSION%>"/>
        <button id="trigger<%=Constants.START_TIME+Phase.SUBMISSION%>">Set</button>
    </td>
</tr>
<tr>
    <td colspan="2">
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.END_TIME+Phase.SUBMISSION%>">${err}
                    <br/></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td class="name" nowrap="nowrap">
        Submission End<br/>(Eastern Time):
    </td>
    <td class="value">
        <tc-webtag:textInput name="<%=Constants.END_TIME+Phase.SUBMISSION%>" id="<%=Constants.END_TIME+Phase.SUBMISSION%>"/>
        <button id="trigger<%=Constants.END_TIME+Phase.SUBMISSION%>">Set</button>
    </td>
</tr>


<c:set value="<%=Constants.ROUND_PROPERTY+RoundProperty.MAX_SELECTED_CANDIDATES%>" var="maxSelected"/>
<c:set value="<%=Constants.ROUND_PROPERTY+RoundProperty.NUMBER_OF_CANDIDDATE_ADVANCERS%>" var="numAdvancers"/>
<c:set value="<%=Constants.ROUND_PROPERTY+RoundProperty.MAX_ROOM_SIZE%>" var="maxRoomSize"/>

<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="${maxSelected}"><span class="bigRed">${err}
            <br/></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="name">
        Max Selected:
    </td>
    <td class="value">
        <tc-webtag:textInput name="${maxSelected}" size="2"/>
    </td>
</tr>

<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="${numAdvancers}"><span class="bigRed">${err}
            <br/></span></tc-webtag:errorIterator>
    </td>
</tr>

<tr>
    <td class="name">
        Number of Advancers:
    </td>
    <td class="value">
        <tc-webtag:textInput name="${numAdvancers}" size="4"/>
    </td>
</tr>

<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="${maxRoomSize}"><span class="bigRed">${err}
            <br/></span></tc-webtag:errorIterator>
    </td>
</tr>

<tr>
    <td class="name">
        Max Room Size:
    </td>
    <td class="value">
        <tc-webtag:textInput name="${maxRoomSize}" size="4"/>
    </td>
</tr>


</tbody>
</table>


<script language="javascript" type="text/javascript">
    Calendar.setup(
    {
        inputField  : "<%=Constants.START_TIME+Phase.REGISTRATION%>",         // ID of the input field
        ifFormat    : "<%=Constants.JS_DATE_FORMAT%>",    // the date format
        button      : "trigger<%=Constants.START_TIME+Phase.REGISTRATION%>",       // ID of the button
        showsTime   : true,
        singleClick  : false,
        cache       : true
    }
            );
    Calendar.setup(
    {
        inputField  : "<%=Constants.END_TIME+Phase.REGISTRATION%>",         // ID of the input field
        ifFormat    : "<%=Constants.JS_DATE_FORMAT%>",    // the date format
        button      : "trigger<%=Constants.END_TIME+Phase.REGISTRATION%>",      // ID of the button
        showsTime    : true,
        singleClick  : false,
        cache       : true
    }
            );

    Calendar.setup(
    {
        inputField  : "<%=Constants.START_TIME+Phase.SUBMISSION%>",         // ID of the input field
        ifFormat    : "<%=Constants.JS_DATE_FORMAT%>",    // the date format
        button      : "trigger<%=Constants.START_TIME+Phase.SUBMISSION%>",       // ID of the button
        showsTime   : true,
        singleClick  : false,
        cache       : true
    }
            );
    Calendar.setup(
    {
        inputField  : "<%=Constants.END_TIME+Phase.SUBMISSION%>",         // ID of the input field
        ifFormat    : "<%=Constants.JS_DATE_FORMAT%>",    // the date format
        button      : "trigger<%=Constants.END_TIME+Phase.SUBMISSION%>",      // ID of the button
        showsTime    : true,
        singleClick  : false,
        cache       : true
    }
            );
</script>


<p>
    <button name="submit" value="submit" type="submit">Save</button>
</p>


</form>


<c:if test="${round!=null && !round.new}">
    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="advanceForm">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminAdvanceCandidates"/>
        <tc-webtag:hiddenInput name="<%=Constants.ROUND_ID%>"/>
        <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
        <p>
            Advance candidates from:
            <tc-webtag:objectSelect name="<%=Constants.PRIOR_ROUND_ID%>" list="${round.contest.rounds}" valueField="id"
                                    textField="name"/>
            <button name="submit" value="submit" type="submit">Do It!</button>
        </p>

    </form>

    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="studioContestForm">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminAddCandidatesFromStudio"/>
        <tc-webtag:hiddenInput name="<%=Constants.ROUND_ID%>"/>

        <tc-webtag:errorIterator id="err" name="<%=Constants.STUDIO_CONTEST_ID%>"><span class="bigRed">${err}
            <br/></span></tc-webtag:errorIterator>
        Create Round From Studio Contest:

        <tc-webtag:rscSelect name="<%=Constants.STUDIO_CONTEST_ID%>"
                             list="<%=(ResultSetContainer)request.getAttribute("studio_contests")%>" fieldText="name"
                             fieldValue="contest_id"/>

        <button name="submit" value="submit" type="submit">Create</button>

    </form>


</c:if>


</div>
<img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
</div>
<jsp:include page="../foot.jsp"/>
<img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>