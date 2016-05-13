<%@ page import="com.topcoder.web.common.voting.Candidate" %>
<%@ page import="com.topcoder.web.common.voting.CondorcetSchulzeResults" %>
<%@ page import="java.util.StringTokenizer" %>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% CondorcetSchulzeResults results = (CondorcetSchulzeResults) request.getAttribute("results");%>
<jsp:useBean id="surveyInfo" scope="request" class="com.topcoder.web.tc.model.Survey"/>
<%!
    protected String trimPopup(String s) {
        if (s.startsWith("<img")) {
            StringTokenizer st = new StringTokenizer(s, " ");
            StringBuffer ret = new StringBuffer(100);
            ret.append("<img ");
            String tok;
            while (st.hasMoreTokens()) {
                tok = st.nextToken();
                if (tok.startsWith("src") || tok.startsWith("alt") || tok.startsWith("class")) {
                    ret.append(" ");
                    ret.append(tok);
                    if (tok.indexOf(">") >= 0) {
                        break;
                    }
                }
                //we know that it's not one of the tags we care about
                if (tok.endsWith(">") || tok.endsWith("/>")) {
                    break;
                }
                //we know that it's not one of the tags we care about
                if (tok.indexOf(">") >= 0) {
                    ret.append(" />");
                    break;
                }
            }
            return ret.toString();
        } else {
            return s;
        }
    }
%>

<html>

<head>

    <title>Member Surveys</title>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_main"/>
    </jsp:include>
    <STYLE TYPE="text/css">
        .logoSmall {
            width: 50px;
            height: 50px;
        }
    </STYLE>
    <script type="text/javascript" src="/js/popup.js"></script>
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

<!-- Gutter Begins -->
<td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

    <div class="maxWidthBody">

        <jsp:include page="../page_title.jsp">
            <jsp:param name="image" value="surveys"/>
            <jsp:param name="title" value="Results"/>
        </jsp:include>

        <div align="right"><a href="/tc?module=SurveyList" class="bcLink">Archive</a></div>

        <% if (surveyInfo.getText() != null) { %>
        <h3 align="left" class="bodyTitle">
            <jsp:getProperty name="surveyInfo" property="text"/>
        </h3>
        <% } %>

        <br><br>

        <table border="0" cellpadding="0" cellspacing="0" class="bodyText" align="center">
            <tr>
                <td style="padding-right: 10px;"><b>Rank</b></td>
                <td><b>Candidate</b></td>
            </tr>
            <tc-webtag:listIterator list="<%=results.getResults()%>" id="result"
                                    type="com.topcoder.web.common.voting.RankedResult">
                <tr>
                    <td valign="top">
                        <jsp:getProperty name="result" property="rank"/>
                    </td>
                    <tc-webtag:useBean id="candidate" name="result" type="com.topcoder.web.common.voting.Candidate"
                                       toScope="page" property="candidate"/>
                    <td valign="top" align="left">
                            ${candidate.name}
                            <%--
                                                            <img src="${candidate.name}" alt="" class="logoSmall" id="popper${candidate.id}"
                                                                 onmouseover="popUp(this.id,'pop${candidate.id}')" onmouseout="popHide()"/>

                                                            <div id="pop${candidate.id}" class="popUp"><img src="${candidate.name}"/></div>
                            --%>
                    </td>
                </tr>
            </tc-webtag:listIterator>
        </table>
        <br><br>

        <p>
            When calculating the winner in this type of election, one can organize the data into a matrix.
            You can see that matrix here. Each cell (row,col) indicates how many times row was preferred over col.
            If row beat col, the cell will be red.
        </p>
        <table border="0" cellpadding="0" cellspacing="0" class="formFrame" align="center">
            <% int size = results.getSumMatrix().getCandidates().size();
            %>
            <tr>
                <td></td>
                <%
                    for (int i = 0; i < size; i++) {
                %>
                <td valign="top" style="padding:6px;"><%=trimPopup(((Candidate) results.getSumMatrix().getCandidates().get(i)).getName())%>
                </td>
                <%
                    } %>
            </tr>
            <% for (int i = 0; i < size; i++) {%>
            <tr>
            <tr>
                <td valign="top" style="padding:6px;"><%=trimPopup(((Candidate) results.getSumMatrix().getCandidates().get(i)).getName())%>
                </td>
                <%for (int j = 0; j < size; j++) {%>
                <td class="bodyText" align="center">
                    <%if (results.getSumMatrix().getValue(i, j) >= 0) {%>
                    <% if (results.getSumMatrix().getValue(i, j) > results.getSumMatrix().getValue(j, i)) { %>
                    <span class="bigRed"><%=results.getSumMatrix().getValue(i, j)%></span>
                    <% } else { %>
                    <%=results.getSumMatrix().getValue(i, j)%>
                    <% } %>
                    <%}%>
                </td>
                <% } %>
            </tr>
            <% } %>
        </table>

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