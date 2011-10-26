<%@ page import="com.topcoder.shared.dataAccess.DataAccess" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessInt" %>
<%@ page import="com.topcoder.shared.dataAccess.Request" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.security.SimpleResource" %>
<%@ page import="com.topcoder.shared.security.SimpleUser" %>
<%@ page import="com.topcoder.shared.util.DBMS" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.PermissionException" %>
<%@ page import="com.topcoder.web.common.SessionInfo" %>
<%@ page import="com.topcoder.web.common.model.Question" %>
<%@ page import="com.topcoder.web.common.voting.*" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.model.Survey" %>
<%@ page import="javax.servlet.ServletRequest" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.*" %>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% CondorcetSchulzeResults results = getResults(request);%>
<% Survey surveyInfo = createSurvey(request);%>


<%!

    protected final Survey createSurvey(ServletRequest request) throws Exception {
        String sid = request.getParameter(Constants.SURVEY_ID);
        Request r = new Request();
        r.setContentHandle("survey_info");
        r.setProperty("sid", sid);
        //chaching should be ok, i don't think the actual survey will change much
        DataAccessInt dataAccess = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
        Map map = dataAccess.getData(r);
        ResultSetContainer rsc = (ResultSetContainer) map.get("survey_info");
        Survey ret = null;
        if (rsc != null && !rsc.isEmpty()) {
            ret = new Survey();
            ret.setId(rsc.getRow(0).getLongItem("survey_id"));
            ret.setName(rsc.getRow(0).getStringItem("name"));
            ret.setStatusId(rsc.getRow(0).getIntItem("status_id"));
            ret.setText(rsc.getRow(0).getStringItem("text"));
            ret.setStartDate(new Date(((Timestamp) rsc.getItem(0, "start_date").getResultData()).getTime()));
            ret.setEndDate(new Date(((Timestamp) rsc.getItem(0, "end_date").getResultData()).getTime()));
            ret.setResultsViewable(rsc.getRow(0).getIntItem("results_viewable") == 1);
        }
        return ret;
    }

    protected CondorcetSchulzeResults getResults(ServletRequest request) throws Exception {

        String sid = request.getParameter(Constants.SURVEY_ID);
        CondorcetSchulzeResults results = null;
        DataAccessInt dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("condorcet_schulze_results");
        r.setProperty(Constants.SURVEY_ID, sid);
        ResultSetContainer rsc = (ResultSetContainer) dai.getData(r).get("condorcet_schulze_results");

        Candidate[] candidates = getCandidates(request, sid);

        //build a mapping for candidates so that we don't have to create a
        //bunch of Candidates objects when we create the votes
        HashMap map = new HashMap();
        for (int i = 0; i < candidates.length; i++) {
            map.put(new Long(candidates[i].getId()), candidates[i]);
        }

        CondorcetSchulzeElection election = new CondorcetSchulzeElection();
        ResultSetContainer.ResultSetRow curr;
        long lastUserId = 0;
        RankBallot ballot = null;
        //create the ballots/votes and add them to the election
        for (Iterator it = rsc.iterator(); it.hasNext();) {
            curr = (ResultSetContainer.ResultSetRow) it.next();
            if (lastUserId != curr.getLongItem("user_id")) {
                if (ballot != null) {
                    election.addBalot(ballot);
                }
                ballot = new RankBallot(candidates);
            }
            ballot.add(new Vote((Candidate) map.get(new Long(curr.getLongItem("question_id"))),
                    Integer.parseInt(curr.getStringItem("sort_order"))));
            lastUserId = curr.getLongItem("user_id");
        }
        if (ballot != null) {
            election.addBalot(ballot);
        }
        results = new CondorcetSchulzeResults(election);

        return results;
    }

    protected final List makeAnswerInfo(ServletRequest request, long questionId) throws Exception {
        String sid = request.getParameter(Constants.SURVEY_ID);
        Request responseRequest = new Request();
        DataAccessInt dataAccess = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
        responseRequest.setContentHandle("survey_responses");
        responseRequest.setProperty("qid", String.valueOf(questionId));
        responseRequest.setProperty("cr", String.valueOf(((SessionInfo) request.getAttribute(BaseServlet.SESSION_INFO_KEY)).getUserId()));
        return (ResultSetContainer) dataAccess.getData(responseRequest).get("response_info");
    }

    protected final Question makeQuestion(ServletRequest request, ResultSetContainer.ResultSetRow row) throws Exception {

        Question q = new Question();
        q.setId(row.getLongItem("question_id"));
        q.setStyleId(row.getIntItem("question_style_id"));
        q.setTypeId(row.getIntItem("question_type_id"));
        q.setText(row.getStringItem("question_text"));
        q.setRequired(row.getIntItem("is_required") == 1);
        q.setImagePath(row.getStringItem("image"));
        q.setLink(row.getStringItem("link"));
        q.setAnswerInfo(makeAnswerInfo(request, q.getId()));
        return q;
    }

    protected final List getQuestionInfo(ServletRequest request, long surveyId) throws Exception {
        Request r = new Request();
        r.setContentHandle("survey_questions");
        r.setProperty("sid", String.valueOf(surveyId));
        DataAccessInt dataAccess = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
        Map qMap = dataAccess.getData(r);
        ResultSetContainer questions = (ResultSetContainer) qMap.get("question_list");


        ResultSetContainer.ResultSetRow question = null;
        List questionList = new ArrayList(questions.size());
        for (Iterator it = questions.iterator(); it.hasNext();) {
            question = (ResultSetContainer.ResultSetRow) it.next();
            questionList.add(makeQuestion(request, question));
        }
        return questionList;
    }


    protected final Candidate[] getCandidates(ServletRequest request, String sid) throws Exception {
        List questionInfo = getQuestionInfo(request, Long.parseLong(sid));
        Candidate[] ret = new Candidate[questionInfo.size()];
        Question q;
        for (int i = 0; i < questionInfo.size(); i++) {
            q = (Question) questionInfo.get(i);
            ret[i] = new Candidate(q.getText(), q.getId());
        }
        return ret;
    }

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
<%
    if (!((SessionInfo) request.getAttribute("sessionInfo")).isAdmin()) {
        throw new PermissionException(new SimpleUser(0L, "", ""), new SimpleResource(""));
    }
%>
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
        <h3 align="left" class="bodyTitle"><%=surveyInfo.getText()%>
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
        <table width="600" border="0" cellpadding="0" cellspacing="0" class="formFrame" align="center">
            <% int size = results.getSumMatrix().getCandidates().length;
            %>
            <tr>
                <td></td>
                <%
                    for (int i = 0; i < size; i++) {
                %>
                <td valign="top" style="padding:6px;"><%=
                trimPopup(results.getSumMatrix().getCandidates()[i].getName())%>
                </td>
                <%
                    } %>
            </tr>
            <% for (int i = 0; i < size; i++) {%>
            <tr>
                <td valign="top" style="padding:6px;"><%=
                trimPopup(results.getSumMatrix().getCandidates()[i].getName())%>
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
        <p><br></p>

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