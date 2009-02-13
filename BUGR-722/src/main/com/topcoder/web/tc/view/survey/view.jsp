<%@ page import="com.topcoder.web.common.model.Question,
                 com.topcoder.web.common.tag.AnswerInput,
                 com.topcoder.web.tc.Constants,
                 java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% List questionInfo = (List) request.getAttribute("questionInfo");
 Boolean alreadyResponded = (Boolean) request.getAttribute("alreadyResponded");%>
<jsp:useBean id="surveyInfo" scope="request" class="com.topcoder.web.tc.model.Survey"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<html>

<head>

    <title>Member Surveys</title>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

    <STYLE TYPE="text/css">
        .logoSmall {
        }
        #container img {
            background: #FFFFFF;
        }
    </STYLE>
    <script type="text/javascript">
        <!--
    var objPopUp = null;
    function popUp(event,objectID){
    //don't do anything.  this is really just here so that we don't
    //generate errors  the real popping up/hiding is on the results page
    }
    function popHide(){
    }
        -->
    </script>

</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">

<!-- Left Column Begins -->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="competitor_surveys"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<td width="100%" align="center" class="bodyColumn">

<div class="maxWidthBody">

            <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="surveys"/>
            <jsp:param name="title" value="Vote"/>
            </jsp:include>

            <div align="right"><a href="/tc?module=SurveyList" class="bcLink">Archive</a></div>

        <% if (alreadyResponded.booleanValue()) { %>
             <span class="bigRed">You have already voted for this survey.  Your response is below:</span>
        <% } %>

        <% if (surveyInfo.getText() != null) { %>
        <p class="bodyTitle">
            <jsp:getProperty name="surveyInfo" property="text"/>
        </p>
        <% } %>

        <% if (questionInfo.size() > 0 && ((Question) questionInfo.get(0)).getTypeId() == Question.SCHULZE_ELECTION_TYPE) {
            Collections.shuffle(questionInfo);
        %>
        <p>
            In this election we will be using the <a href="http://en.wikipedia.org/wiki/Schulze_method"
                                                     target="blank">Schulze Method</a> to
            determine a winner. When voting, you are asked to <b>rank (not rate)</b> the candidates where
            <b>1 is most preferred and <%= questionInfo.size() %> is least preferred</b>.
            You may choose to rank more than one candidate the same, and you may choose not to rank a candidate. If
            you choose
            not to rank a candidate, it is assumed that you prefer ranked candidates over unranked candidates.
            The actual value you assign to each of the candidates does not matter, only the relationship between
            them.
            For example, if there are three candidates and you rank them 1,1,2 it's the same as if you ranked them
            2,2,3.
        </p>
        <% } %>
        <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="surveyForm">
            <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="SubmitSurvey"/>
            <input type="hidden" name="<%=Constants.SURVEY_ID%>" value="<%=surveyInfo.getId()%>"/>
            <% int i = 1; %>
            <% boolean resultsViewable = false;%>
            <%--todo move this to the controller, that's where it belongs --%>
            <tc:questionIterator list="<%=questionInfo%>" id="question">
                <% resultsViewable |= (!(question.getStyleId() == Question.LONG_ANSWER || question.getStyleId() == Question.SHORT_ANSWER) && question.getTypeId() != Question.GENERAL_DO_NOT_SHOW_RESULTS_TYPE && surveyInfo.areResultsViewable());%>
                <table cellpadding="0" cellspacing="0" class="stat">
                <tbody>
                    <tr class="light">
                        <td colspan="2" align="center">
                            <tc:sponsorImage src="<%=question.getImagePath()%>" href="<%=question.getLink()%>"
                                             alt="survey logo" width="160" height="95" align="center" border="0"/>
                        </td>
                    </tr>
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
                    <tc:answerInput id="answerInput" question="<%=question%>" enabled="<%=!alreadyResponded.booleanValue()%>">
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
            <div align="center">
            <table cellpadding="6" cellspacing="0">
                <tr>
                        <% if (resultsViewable) { %>
                        <td>
                        <a class="button" href="?<%=Constants.MODULE_KEY%>=SurveyResults&<%=Constants.SURVEY_ID%>=<%=surveyInfo.getId()%>">Results</a>
                        </td>
                        <% } %>
                        <% if (!alreadyResponded.booleanValue()) { %>
                        <td>
                        <a class="button" href="javascript: document.surveyForm.submit();">Submit</a>
                        </td>
                        <% } %>
                </tr>
            </table>
            </div>
        </form>

</div>
</td>
<!-- Center Column Ends -->


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

<jsp:include page="../foot.jsp"/>

</body>

</html>