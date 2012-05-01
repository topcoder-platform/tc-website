<%@ page import="com.topcoder.web.common.BaseProcessor" %>
<%@ page import="com.topcoder.web.common.model.Event,
                 com.topcoder.web.common.tag.AnswerInput,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.web.tc.controller.request.tournament.RegistrationBase,
                 java.util.ArrayList" %>
<%@ page import="java.util.HashMap,
                 java.util.List" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String eventType = (String) request.getAttribute("et");
    Event event = (Event) request.getAttribute("event");
    List questionInfo = new ArrayList(event.getSurvey().getQuestions());
    HashMap defaults = (HashMap) pageContext.getRequest().getAttribute(BaseProcessor.DEFAULTS_KEY);
%>
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

<div align="center" style="background: transparent;">
    <div id="containAll">
        <div id="content">

            <jsp:include page="nav.jsp">
                <jsp:param name="tabLev1" value="<%=eventType%>"/>
                <jsp:param name="tabLev2" value="register"/>
                <jsp:param name="tabLev3" value=""/>
            </jsp:include>

            <div id="pageBody">

                <h1><span>Registration</span></h1>

                        <form name="terms" method="post" action="/tc">
                            <input name="module" value="TCCC07SubmitRegistration" type="hidden">
                            <input name="et" value="<%=eventType%>" type="hidden">

                            <p align="center">To complete your registration for the <%=event.getDescription()%> you must
                                <br /><strong>read and agree to</strong> the terms listed below.</p>

                            <div align="center">
                                <iframe width="640" height="300" marginWidth="5" src="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=termsContent&<%=Constants.TERMS_OF_USE_ID%>=<%=event.getTerms().getId()%>"></iframe>
                            </div>

                            <div align="center">
                                <tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>">
                                    <span class="bigRed">${err}</span>
                                    &nbsp;<br />
                                </tc-webtag:errorIterator>
                                <tc-webtag:chkBox name="<%=Constants.TERMS_AGREE%>"/>
                                I agree
                            </div>


                            <tc:questionIterator list="<%=questionInfo%>" id="question">
                                <% if (question.getKeyword().equals(RegistrationBase.AGE)) { %>
                                <p align="center">
                                    <span class="bigRed">
                                    <tc-webtag:errorIterator id="err"
                                                             name="<%=AnswerInput.PREFIX+question.getId()%>"><%=err%>
                                        <br />
                                    </tc-webtag:errorIterator>
                                    </span>&nbsp;<br>
                                    <jsp:getProperty name="question" property="text"/>
                                    <input type="text" size="3" maxlength="3" name="<%=AnswerInput.PREFIX + question.getId()%>" id="answerInput" value="<%= defaults.containsKey(AnswerInput.PREFIX + question.getId()) ? defaults.get(AnswerInput.PREFIX + question.getId()) : "" %>"/>
                                </p>
                                <% } else { %>
                                <p align="center">
                                    <span class="bigRed">
                                    <tc-webtag:errorIterator id="err"
                                                             name="<%=AnswerInput.PREFIX+question.getId()%>"><%=err%>
                                        <br />
                                    </tc-webtag:errorIterator>
                                    </span>&nbsp;<br>
                                    <jsp:getProperty name="question" property="text"/>
                                    <br />
                                    <tc:answerInput id="answerInput" question="<%=question%>">
                                        <%=answerInput%>
                                        <%=answerText%>&nbsp;&nbsp;&nbsp;
                                    </tc:answerInput>
                                </p>
                                <% }%>

                            </tc:questionIterator>

                            <div align="center">
                                <button name="submit" value="submit" type="submit">Submit</button>
                            </div>
                        </form>


            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </div>
</div>
</body>
</html>
