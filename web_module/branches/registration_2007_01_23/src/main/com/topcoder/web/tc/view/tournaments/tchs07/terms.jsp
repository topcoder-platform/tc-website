<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.tchs07.RegistrationBase" %>
<%@ page import="com.topcoder.web.common.model.Question,
                 com.topcoder.web.common.tag.AnswerInput,
                 java.util.Collections" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% List questionInfo = new ArrayList(((Set) request.getAttribute("questionInfo"))); %>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/coders.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tchs07.css"/>
    <title>TopCoder High School 2007</title>
</head>
<body>

<div align="center" style="background: transparent;">
    <div class="content">
        <img src="/i/tournament/tchs07/contentN.png" alt="contentN" style="display: block;"/>

        <jsp:include page="links.jsp">
            <jsp:param name="tabLev1" value="rules"/>
            <jsp:param name="tabLev2" value=""/>
            <jsp:param name="tabLev3" value=""/>
        </jsp:include>

        <div class="contentSpacer">
            <h2>Registration</h2>

            <form name="terms" method="POST" action="${sessionInfo.servletPath}">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="TCHS07SubmitRegistration"/>

                <p> question size 1: <%=questionInfo.getAnswerInfo().size()%>.</p>
                <p> question size 2: <%=questionInfo.getAnswers().size()%>.</p>

            <% int i = 1; %>
            <tc:questionIterator list="<%=questionInfo%>" id="question">
                <p> answers size: <%=questionInfo[0].%>.</p>
                <table cellpadding="0" cellspacing="0" class="stat">
                <tbody>
                    <tr class="light">
                        <td colspan="2"><span class="subtitle">
                            <%=questionInfo.size() > 1 ? i + ". " : ""%>
                            <jsp:getProperty name="question" property="text"/>
                            <br /><br />
                            </span>
                            <hr width="100%" size="1" noshade/>
                        </td>

                    </tr>
                    <tr class="light">
                        <td colspan="2">
                            <span class="bigRed">
                            <tc-webtag:errorIterator id="err"
                                name="<%=AnswerInput.PREFIX+question.getId()%>"><%=err%><br />
                            </tc-webtag:errorIterator>
                            </span>
                        </td>
                    </tr>
                    <% boolean even = false; %>
                    <tc:answerInput id="answerInput" question="<%=question%>">
                        <tr class="<%=even?"light":"dark"%>">
                            <td class="value" width="100%">
                                <%=answerText%>
                            </td>
                            <td class="valueR">
                                <%=answerInput%>
                            </td>
                        </tr>
                        <% even = !even; %>
                    </tc:answerInput>
                </tbody>
                </table>
                <p><br /></p>
                <% i++;%>
            </tc:questionIterator>


                <p align="left">To complete your registration for the 2007 TopCoder&#174; High School Tournament you
                    must <b>read and agree to</b> the terms listed below.</p>

                <div align="center">
                    <iframe width="590" height="300" marginWidth="5" src="/tc?module=Static&d1=tournaments&d2=tchs07&d3=termsContent&<%=Constants.TERMS_OF_USE_ID%>=<%=Constants.TCHS07_TERMS_OF_USE_ID%>"></iframe>
                </div>

                <div align="center">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>">
                        <span class="bigRed">${err}</span>
                        <br/></tc-webtag:errorIterator>
                    <br/>
                    <tc-webtag:chkBox name="<%=Constants.TERMS_AGREE%>"/>
                    I agree
                </div>

                <p align="center">
                    <tc-webtag:errorIterator id="err" name="<%=RegistrationBase.AGE%>"><span class="bigRed">${err}
                        <br/></span>
                    </tc-webtag:errorIterator>
                    How old will you be on February 26? <tc-webtag:textInput name="<%=RegistrationBase.AGE%>" size="3" maxlength="3"/>
                </p>


                <p align="center">
                    <tc-webtag:errorIterator id="err" name="<%=RegistrationBase.IN_COLLEGE%>"><span class="bigRed">${err}
                        <br/></span></tc-webtag:errorIterator>
                    Are you enrolled full time at a college or university?<%-- <tc-webtag:listSelect name='<%=RegistrationBase.IN_COLLEGE%>' list="<%=RegistrationBase.YES_NO_ANSWERS%>"/>--%>
                    <br><input name="college" value="Yes" onchange="" type="radio">Yes&nbsp;&nbsp;&nbsp;
                    <input name="college" value="No" onchange="" type="radio"> No
                </p>

                <p align="center">
                    <tc-webtag:errorIterator id="err" name="<%=RegistrationBase.IN_HIGH_SCHOOL%>"><span class="bigRed">${err}
                        <br/></span></tc-webtag:errorIterator>
                    Are you enrolled full time at a secondary school (high school)?<%-- <tc-webtag:listSelect name='<%=RegistrationBase.IN_HIGH_SCHOOL%>' list="<%=RegistrationBase.YES_NO_ANSWERS%>"/>--%>
                    <br><input name="college" value="Yes" onchange="" type="radio">Yes&nbsp;&nbsp;&nbsp;
                    <input name="college" value="No" onchange="" type="radio"> No
                </p>


                <div align="center">
                    <button name="submit" value="submit" type="submit">Submit</button>
                </div>

            </form>

        </div>
        <div class="footer">
            Copyright &#169; 2000-2006, TopCoder, Inc. All rights reserved.
        </div>
        <img src="/i/tournament/tchs07/contentS.png" alt="contentS" style="display: block;"/>
    </div>
</div>

</body>
</html>

