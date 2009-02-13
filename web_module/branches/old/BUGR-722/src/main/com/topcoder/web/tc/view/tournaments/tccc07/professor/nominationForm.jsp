<%@ page import="com.topcoder.web.common.tag.ListSelectTag" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp"/>
</head>
<body>

<%
    ArrayList<ListSelectTag.Option> fields = new ArrayList<ListSelectTag.Option>();
    fields.add(new ListSelectTag.Option("Computer Science", "Computer Science"));
    fields.add(new ListSelectTag.Option("Statistical Mathematics", "Statistical Mathematics"));
    fields.add(new ListSelectTag.Option("Applied Mathematics", "Applied Mathematics"));
    fields.add(new ListSelectTag.Option("Software Engineering", "Software Engineering"));
    fields.add(new ListSelectTag.Option("Computer Engineering", "Computer Engineering"));
    fields.add(new ListSelectTag.Option("Management Information Systems (MIS)", "Management Information Systems (MIS)"));
    fields.add(new ListSelectTag.Option("Computer Information Systems (CIS)", "Computer Information Systems (CIS)"));
    fields.add(new ListSelectTag.Option("Graphic Design", "Graphic Design"));
    fields.add(new ListSelectTag.Option("Other", "Other"));

%>

<div align="center" style="background: transparent;">
    <div id="containAll">
        <div id="content">

            <jsp:include page="../nav.jsp">
                <jsp:param name="tabLev1" value="overview"/>
                <jsp:param name="tabLev2" value="joinus"/>
                <jsp:param name="tabLev3" value="professor"/>
            </jsp:include>

            <div id="pageBody">

                <h1><span>Nominate a Professor</span></h1>

                <form name="terms" method="post" action="/tc">
                    <input name="module" value="TCCC07SubmitProfessorNomination" type="hidden">
                    <input name="<%=Constants.EVENT_ID%>" value="${event.id}" type="hidden">


<table cellpadding="0" cellspacing="0">
<tbody>
    <tr>
        <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.FULL_NAME%>"><span class="bigRed">${err}</span>&nbsp;<br/></tc-webtag:errorIterator>
        </td>
    </tr>
    <tr>
        <td style="padding: 4px 4px 4px 0px;" nowrap="nowrap">
            Professor's Full Name*
        </td>
        <td style="padding: 4px 4px 4px 0px;" width="100%">
            <tc-webtag:textInput name="<%=Constants.FULL_NAME%>" size="25" maxlength="100"/>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.SCHOOL_NAME%>"><span class="bigRed">${err}</span>&nbsp;<br /></tc-webtag:errorIterator>
        </td>
    </tr>
    <tr>
        <td style="padding: 4px 4px 4px 0px;" nowrap="nowrap">
            Professor's School*
        </td>
        <td style="padding: 4px 4px 4px 0px;">
            <tc-webtag:textInput name="<%=Constants.SCHOOL_NAME%>" size="25" maxlength="100"/>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.URL%>"><span class="bigRed">${err}</span>&nbsp;<br/></tc-webtag:errorIterator>
        </td>
    </tr>
    <tr>
        <td style="padding: 4px 4px 4px 0px;" nowrap="nowrap">
            School Website
        </td>
        <td style="padding: 4px 4px 4px 0px;">
            <tc-webtag:textInput name="<%=Constants.URL%>" size="25" maxlength="100"/>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.FIELD_OF_INSTRUCTION%>"><span class="bigRed">${err}</span>&nbsp;<br /></tc-webtag:errorIterator>
        </td>
    </tr>
    <tr>
        <td style="padding: 4px 4px 4px 0px;" nowrap="nowrap">
            Field of Instruction*
        </td>
        <td style="padding: 4px 4px 4px 0px;">
            <tc-webtag:listSelect name="<%=Constants.FIELD_OF_INSTRUCTION%>" list="<%=fields%>"/>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.OTHER_FIELD_OF_INSTRUCTION%>"><span class="bigRed">${err}</span>&nbsp;<br /></tc-webtag:errorIterator>
        </td>
    </tr>
    <tr>
        <td style="padding: 4px 4px 4px 0px;" nowrap="nowrap">
            Other Field of Instruction
        </td>
        <td style="padding: 4px 4px 4px 0px;">
            <tc-webtag:textInput name="<%=Constants.OTHER_FIELD_OF_INSTRUCTION%>" size="25" maxlength="100"/>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><span class="bigRed">${err}</span>&nbsp;<br /></tc-webtag:errorIterator>
        </td>
    </tr>
    <tr>
        <td style="padding: 4px 4px 4px 0px;" nowrap="nowrap">
            Professor's Email Address*
        </td>
        <td style="padding: 4px 4px 4px 0px;">
            <tc-webtag:textInput name="<%=Constants.EMAIL%>" size="25" maxlength="100"/>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <tc-webtag:errorIterator id="err" name="<%=Constants.NOMINATION_TEXT%>"><span class="bigRed">${err}</span>&nbsp;<br /></tc-webtag:errorIterator>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="padding: 4px 4px 4px 0px;">
            Reason you're are making this nomination*
        </td>
    </tr>
    <tr>
        <td colspan="2" style="padding: 4px 4px 4px 0px;">
            <tc-webtag:textArea name="<%=Constants.NOMINATION_TEXT%>" rows="8" cols="80"/>
        </td>
    </tr>
</tbody>
</table>
<br />* required
            
            
            
            

                    <div align="center">
                        <button name="submit" value="submit" type="submit">Submit</button>
                    </div>
                </form>

                <p style="height:300px;">&nbsp;</p>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </div>
</div>
</body>
</html>
