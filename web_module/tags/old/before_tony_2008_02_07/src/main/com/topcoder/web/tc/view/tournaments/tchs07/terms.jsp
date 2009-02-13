<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.common.model.Event,
                 com.topcoder.web.common.model.Question,
                 com.topcoder.web.common.tag.AnswerInput,
                 com.topcoder.web.tc.controller.request.tournament.RegistrationBase,
                 com.topcoder.web.common.BaseProcessor" %>
<%@ page import="java.util.Collections,
                 java.util.Set,
                 java.util.ArrayList,
                 java.util.List,
                 java.util.HashMap" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% Event event = (Event) request.getAttribute("event"); 
   List questionInfo = new ArrayList(event.getSurvey().getQuestions()); 
   HashMap defaults = (HashMap) pageContext.getRequest().getAttribute(BaseProcessor.DEFAULTS_KEY);
   %>
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
            <jsp:param name="tabLev1" value="register"/>
            <jsp:param name="tabLev2" value=""/>
            <jsp:param name="tabLev3" value=""/>
        </jsp:include>

        <div class="contentSpacer">
            <h2>Registration</h2>

            <form name="terms" method="POST" action="${sessionInfo.servletPath}">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="TCHS07SubmitRegistration"/>
                <tc-webtag:hiddenInput name="<%=Constants.EVENT_ID%>" value="<%=event.getId().toString()%>"/>

                <p align="left">To complete your registration for the <%=event.getDescription()%> you
                    must <b>read and agree to</b> the terms listed below.</p>

                <div align="center">
	                <iframe width="590" height="300" marginWidth="5" src="/tc?module=Static&d1=tournaments&d2=tchs07&d3=termsContent&<%=Constants.TERMS_OF_USE_ID%>=<%=event.getTerms().getId().intValue()%>"></iframe>
                </div>

                <div align="center">
                    <tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>">
                        <span class="bigRed">${err}</span>
                        <br/></tc-webtag:errorIterator>
                    <br/>
                    <tc-webtag:chkBox name="<%=Constants.TERMS_AGREE%>"/>
                    I agree
                </div>
                <br/>

            <tc:questionIterator list="<%=questionInfo%>" id="question">
                <table cellpadding="0" cellspacing="0" class="stat" align="center">
	                <tr>
	                    <td align="center">
	                        <span class="bigRed">
	                        <tc-webtag:errorIterator id="err"
	                            name="<%=AnswerInput.PREFIX+question.getId()%>"><%=err%><br/>
	                        </tc-webtag:errorIterator>
	                        </span>
	                    </td>
	                </tr>
	                <tr>
                	<% if (question.getKeyword().equals(RegistrationBase.AGE)) { %>
	                    <td align="center">
	                        <jsp:getProperty name="question" property="text"/> 
	                        <input type="text" size="3" maxlength="3" name="<%=AnswerInput.PREFIX + question.getId()%>" id ="answerInput" value="<%= defaults.containsKey(AnswerInput.PREFIX + question.getId()) ? defaults.get(AnswerInput.PREFIX + question.getId()) : "" %>"/>
	                    </td>
                	<% } else { %>
	                    <td align="center">
	                        <jsp:getProperty name="question" property="text"/>
 	                        <br/>
			                  <tc:answerInput id="answerInput" question="<%=question%>">
			                         <%=answerInput%>
			                         <%=answerText%>&nbsp;&nbsp;&nbsp;
			                  </tc:answerInput>
	                    </td>
                	<% }%>
	                </tr>
                </table>
                <br/>
            </tc:questionIterator>
                
                <div align="center">
                    <button name="submit" value="submit" type="submit">Submit</button>
                </div>

            </form>

        </div>
        <div class="footer">
            Copyright &#169; 2000-2007, TopCoder, Inc. All rights reserved.
        </div>
        <img src="/i/tournament/tchs07/contentS.png" alt="contentS" style="display: block;"/>
    </div>
</div>

</body>
</html>

