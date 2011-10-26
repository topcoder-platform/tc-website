<%@ page import="com.topcoder.web.common.model.Event" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<% Event event = (Event) request.getAttribute("event"); 
   //List questionInfo = new ArrayList(event.getSurvey().getQuestions()); 
   //HashMap defaults = (HashMap) pageContext.getRequest().getAttribute(BaseProcessor.DEFAULTS_KEY);
   %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>TopCoder High School 2008</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tchs08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<div id="wrapper">

    <jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="registrants"/>
    <jsp:param name="tabLev2" value=""/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>
    
    
    
        <div id="title">
            <h2>Registration</h2>
        </div><%-- #title --%>
        
        <div id="content">

            <form name="terms" method="POST" action="${sessionInfo.servletPath}">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SubmitRegistration"/>
                <tc-webtag:hiddenInput name="<%=Constants.EVENT_ID%>" value="<%=event.getId().toString()%>"/>

                <p align="left">To complete your registration for the <%=event.getDescription()%> you
                    must <b>read and agree to</b> the terms listed below.</p>

                <div align="center">
                    <iframe width="590" height="300" marginWidth="5" src="/tc?module=Static&d1=tournaments&d2=tchs08&d3=termsContent&<%=Constants.TERMS_OF_USE_ID%>=<%=event.getTerms().getId().intValue()%>"></iframe>
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

<%--
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
--%>

                <div align="center">
                    <button name="submit" value="submit" type="submit">Submit</button>
                </div>

            </form>
            
        </div><%-- #content --%>
        
        <jsp:include page="footer.jsp" />


</div><%-- #wrapper --%>

</body>
</html>