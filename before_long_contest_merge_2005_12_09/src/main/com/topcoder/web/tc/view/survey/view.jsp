<%@ page import="com.topcoder.web.tc.Constants,
                 com.topcoder.web.tc.view.tag.AnswerInput,
                 com.topcoder.web.tc.model.Question,
                 java.util.List"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% List questionInfo = (List)request.getAttribute("questionInfo");%>
<jsp:useBean id="surveyInfo" scope="request" class="com.topcoder.web.tc.model.Survey" />
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>

<head>

<title>Member Surveys</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="member_surveys"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td width="100%" class="bodyText" valign="top">
                  <table width="100%" border="0" cellpadding="10" cellspacing="0" class="bodyText">
                     <tr>
                        <td class ="bodyText" width="100%"><img src="/i/header_questions.gif" width="210" height="26" border="0"><br/>
                        <p align="right" class="bodyText"><a href="/tc?module=SurveyList">Archive</a></p></td>
                     </tr>
                  </table>

            <div align="center">
            <div align="left" style="width: 600px;">

             <% if (surveyInfo.getText()!=null) { %>
                <span class="bodyTitle"><jsp:getProperty name="surveyInfo" property="text"/></span><br>
             <% } %>

             <% if (questionInfo.size()>0 && ((Question)questionInfo.get(0)).getTypeId()==Question.SCHULZE_ELECTION_TYPE) { %>
                 <p>
                     In this election we will be using the <a href="http://en.wikipedia.org/wiki/Schulze_method" target="blank">Schulze Method</a> to
                     determine a winner.  When voting, you are asked to rank the candidates where 1 is most preferred and <%= questionInfo.size() %> is least preferred.
                     You may choose to rank more than one candidate the same, and you may choose not to rank a candidate.  If you choose
                     not to rank a candidate, it is assumed that you prefer ranked candidates over unranked candidates.
                 </p>
             <% } %>
               <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="surveyForm">
                  <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="SubmitSurvey"/>
                  <input type="hidden" name="<%=Constants.SURVEY_ID%>" value="<%=surveyInfo.getId()%>"/>
                  <% int i=1; %>
                  <% boolean resultsViewable = false;%>
                  <%--todo move this to the controller, that's where it belongs --%>
                  <tc:questionIterator list="<%=questionInfo%>" id="question">
                  <% resultsViewable |= (!(question.getStyleId() == Question.LONG_ANSWER || question.getStyleId()== Question.SHORT_ANSWER) && question.getTypeId() != Question.GENERAL_DO_NOT_SHOW_RESULTS_TYPE && surveyInfo.areResultsViewable());%>
                  <table width="510" border="0" cellpadding="5" cellspacing="0" class="formFrame" align="center">
                        <tr>
                           <td colspan="2" class="bodySubtitle" valign="top" width="100%" align="center">
                           <tc:sponsorImage src="<%=question.getImagePath()%>" href="<%=question.getLink()%>" alt="survey logo" width="160" height="95" align="center" border="0"/>
                           </td>
                        </tr>
                        <tr>
                           <td colspan="2" class="bodySubtitle" valign="top" width="100%">
                              <%=questionInfo.size()>1?i+". ":""%><jsp:getProperty name="question" property="text"/><br/><br/>
                              <hr width="100%" size="1" noshade/>
                           </td>

                           </tr>
                           <tr>
                              <td colspan="2" class="errorText">
                                 <tc-webtag:errorIterator id="err" name="<%=AnswerInput.PREFIX+question.getId()%>"><%=err%><br/></tc-webtag:errorIterator>
                              </td>
                           </tr>
                           <% boolean even = false; %>
                        <tc:answerInput id="answerInput" question="<%=question%>">
                           <tr class="<%=even?"formTextOdd":"formTextEven"%>">
                              <td width="100%">
                                 <%=answerText%>
                              </td>
                              <td align="right">
                                 <%=answerInput%>
                              </td>
                           </tr>
                           <% even = !even; %>
                        </tc:answerInput>
                     </table>
                     <p><br/></p>
                     <% i++;%>
                  </tc:questionIterator>
                     <table class="bodyText" align="center">
                        <tr>
                        <td>
                  <% if (resultsViewable) { %>

                        <a href="?<%=Constants.MODULE_KEY%>=SurveyResults&<%=Constants.SURVEY_ID%>=<%=surveyInfo.getId()%>"><img src="/i/results.gif" width="60" height="18" border="0"/></a>
                                     <img src="/i/clear.gif" width="10" height="18" border="0"/>
                   <% } %>

                                     <a href="javascript: document.surveyForm.submit();"><img src="/i/submit.gif" width="60" height="18" border="0"/></a>
                               </td>
                        </tr>
                     </table>
                  </form>
            </div>
            </div>

         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
       <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="review_board"/>
                <jsp:param name="level2" value="competition"/>
            </jsp:include>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
      <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
