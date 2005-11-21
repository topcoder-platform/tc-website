<%@ page import="com.topcoder.web.common.voting.CondorcetSchulzeResults" %>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% CondorcetSchulzeResults results = (CondorcetSchulzeResults) request.getAttribute("results");%>
<jsp:useBean id="surveyInfo" scope="request" class="com.topcoder.web.tc.model.Survey" />


<html>

<head>

    <title>Member Surveys</title>

    <jsp:include page="../script.jsp"/>
<STYLE TYPE="text/css">
.logoBig
{
width: 300px;
height: 300px;
}
.logoSmall
{
width: 60px;
height: 60px;
}
</STYLE>
</head>

<body>
<jsp:include page="../top.jsp">
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
                    <td class="bodyText" width="100%"><img src="/i/header_questions.gif" width="210" height="26"
                                                           border="0"><br/>

                        <p align="right" class="bodyText"><a href="/tc?module=SurveyList">Archive</a></p></td>
                </tr>
            </table>

            <div align="center">
            <div align="left" style="width: 600px;">

             <% if (surveyInfo.getText()!=null) { %>
            <span class="bodyTitle"><jsp:getProperty name="surveyInfo" property="text"/></span><br>
             <% } %>


            <table width="510" border="0" cellpadding="0" cellspacing="0" class="bodyText">
                <tr>
                    <td style="padding-right: 10px;"><b>Rank</b></td>
                    <td width="100%"><b>Candidate</b></td>
                </tr>
                <tc-webtag:listIterator list="<%=results.getResults()%>" id="result"
                                        type="com.topcoder.web.common.voting.RankedResult">
                    <tr>
                        <td>
                            <jsp:getProperty name="result" property="rank"/>
                        </td>
                        <tc-webtag:useBean id="candidate" name="result" type="com.topcoder.web.common.voting.Candidate"
                                           toScope="page" property="candidate"/>
                        <td>
                            <jsp:getProperty name="candidate" property="name"/>
                        </td>
                    </tr>
                </tc-webtag:listIterator>
            </table>
            <p>
                When calculating the winner in this type of election, one can organize the data into a matrix.
                You can see that matrix here. Each cell (row,col) indicates how many times row was preferred over col.
            </p>
            <table width="510" border="0" cellpadding="0" cellspacing="0" class="formFrame" align="center">
                <%  int size = results.getSumMatrix().getCandidates().length;
                %> <tr><td></td> <%
                for (int i = 0; i < size; i++) {
            %><td><%=results.getSumMatrix().getCandidates()[i].getName()%></td><%
                } %>
            </tr>
                <% for (int i = 0; i < size; i++) {%>
                <tr><td><%=results.getSumMatrix().getCandidates()[i].getName()%></td>
                    <%for (int j = 0; j < size; j++) {%>
                    <td class="bodyText" align="center">
                        <%if (results.getSumMatrix().getValue(i,j)>=0) {%>
                            <%=results.getSumMatrix().getValue(i,j)%>
                        <%}%>
                    </td>
                    <% } %>
                </tr>
                <% } %>
            </table>
            <p><br></p>
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

<jsp:include page="../foot.jsp"/>

</body>

</html>