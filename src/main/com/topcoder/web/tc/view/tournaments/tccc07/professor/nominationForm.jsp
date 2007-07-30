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
                <jsp:param name="tabLev1" value="algorithm"/>
                <jsp:param name="tabLev2" value="register"/>
                <jsp:param name="tabLev3" value=""/>
            </jsp:include>

            <div id="pageBody">

                <h1><span>Registration</span></h1>

                <form name="terms" method="post" action="/tc">
                    <input name="module" value="TCCC07SubmitProfessorNomination" type="hidden">
                    <input name="<%=Constants.EVENT_ID%>" value="${event.id}" type="hidden">


                    <tc-webtag:errorIterator id="err" name="<%=Constants.FULL_NAME%>"><span class="bigRed">${err}</span>&nbsp;<br/></tc-webtag:errorIterator>
                    Professor's Full Name* <tc-webtag:textInput name="<%=Constants.FULL_NAME%>" size="25" maxlength="100"/>

                    <br /><br />

                    <tc-webtag:errorIterator id="err" name="<%=Constants.SCHOOL_NAME%>"><span class="bigRed">${err}</span>&nbsp;<br /></tc-webtag:errorIterator>
                    Professor's School* <tc-webtag:textInput name="<%=Constants.SCHOOL_NAME%>" size="25" maxlength="100"/>

                    <br /><br />

                    <tc-webtag:errorIterator id="err" name="<%=Constants.URL%>"><span class="bigRed">${err}</span>&nbsp;<br/></tc-webtag:errorIterator>
                    School Website <tc-webtag:textInput name="<%=Constants.URL%>" size="25" maxlength="100"/>

                    <br /><br />

                    <tc-webtag:errorIterator id="err" name="<%=Constants.FIELD_OF_INSTRUCTION%>"><span class="bigRed">${err}</span>&nbsp;<br /></tc-webtag:errorIterator>
                    Field of Instruction* <tc-webtag:listSelect name="<%=Constants.FIELD_OF_INSTRUCTION%>" list="<%=fields%>"/>

                    <br /><br />

                    <tc-webtag:errorIterator id="err" name="<%=Constants.OTHER_FIELD_OF_INSTRUCTION%>"><span class="bigRed">${err}</span>&nbsp;<br /></tc-webtag:errorIterator>
                    Other Field of Instruction <tc-webtag:textInput name="<%=Constants.OTHER_FIELD_OF_INSTRUCTION%>" size="25" maxlength="100"/>

                    <br /><br />

                    <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><span class="bigRed">${err}</span>&nbsp;<br /></tc-webtag:errorIterator>
                    Professor Email Address* <tc-webtag:textInput name="<%=Constants.EMAIL%>" size="25" maxlength="100"/>

                    <br /><br />

                    <tc-webtag:errorIterator id="err" name="<%=Constants.NOMINATION_TEXT%>"><span class="bigRed">${err}</span>&nbsp;<br /></tc-webtag:errorIterator>
                    Reason you're are making this nomination* <tc-webtag:textArea name="<%=Constants.NOMINATION_TEXT%>" rows="8" cols="80"/>

                    <br /><br />

                    <div align="center">
                        <button name="submit" value="submit" type="submit">Submit</button>
                    </div>
                </form>


            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </div>
</div>
</body>
</html>
