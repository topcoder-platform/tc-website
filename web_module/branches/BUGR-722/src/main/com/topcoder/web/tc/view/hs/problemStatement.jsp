<%@ page contentType="text/html;charset=utf-8" %>
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer
         ,
                com.topcoder.shared.language.JavaLanguage,
                com.topcoder.shared.problem.Problem,
                com.topcoder.shared.problem.ProblemComponent,
                com.topcoder.shared.problemParser.ProblemComponentFactory,
                com.topcoder.web.common.render.ProblemRenderer,
                java.io.StringReader,
                java.util.Map"
        %>

<%@ page language="java" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>TopCoder High School Competitions</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>
<%
    Map queryEntries = (Map) request.getAttribute("QUERY_RESPONSE");
	ResultSetContainer rounds = (ResultSetContainer) queryEntries.get("rounds_for_problem");
    ResultSetContainer rsc = (ResultSetContainer) queryEntries.get("Problem_Statement");
    ResultSetContainer.ResultSetRow resultRow_0 = null;
    String sClassName = null;
    String sProblemText = null;
    Problem problem = null;
    if (rsc != null && !rsc.isEmpty()) {
        resultRow_0 = rsc.isValidRow(0) ? rsc.getRow(0) : null;
        sClassName = resultRow_0 != null ? resultRow_0.getItem("class_name").toString() : "";
        sProblemText = resultRow_0 != null ? resultRow_0.getItem("problem_text").toString() : "";
//        algoType = resultRow_0 != null ? resultRow_0.getIntItem("algo_rating_type_id") : 1;
        // jeddie 09/05/02 - put problem text into a Reader, create default language, and use ProblemComponentRenderer
        StringReader reader = new StringReader(sProblemText);
        ProblemComponent arrProblemComponent[] = new ProblemComponent[1];
        arrProblemComponent[0] = new ProblemComponentFactory().buildFromXML(reader, true);
        problem = new Problem();
        problem.setProblemComponents(arrProblemComponent);

    }


%>

<body>

<jsp:include page="/top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_hs_stats"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
        <td width="100%" align="left" class="bodyColumn">

            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="statistics_w"/>
                <jsp:param name="title" value="Problem Statement"/>
            </jsp:include>


            <span class="subtitle"><%= sClassName == null ? "" : sClassName %></span>
            <br><br>
            <% if (problem != null) {
                ProblemRenderer pr = new ProblemRenderer(problem);
                pr.setTdClass("bodyIndented");%>
            <%= pr.toHTML(JavaLanguage.JAVA_LANGUAGE) %>
            <% } else { %>
            Problem Statement not available.
            <% } %>
<br/>
                      This problem was used for:
   <rsc:iterator list="<%=rounds%>" id="resultRow">
   	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/tc?module=ProblemDetail&rd=<%= resultRow.getIntItem("round_id") %>&pm=<%=  resultRow.getIntItem("problem_id") %>"><rsc:item name="round_name" row="<%=resultRow%>"/></a>
   </rsc:iterator>
                   


        </td>
        <!-- Center Column Ends -->

        <!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="/public_right.jsp">
                <jsp:param name="level1" value="tchs"/>
            </jsp:include>
        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
        <!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>