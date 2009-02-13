<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    ResultSetContainer.ResultSetRow rsr = (ResultSetContainer.ResultSetRow) (((ResultSetContainer) request.getAttribute("rsc")).get(0));
    int round_id = rsr.getIntItem("round_id");

%>
<c:set var="row" value="<%=rsr%>" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="m_long_contests"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

        <jsp:include page="../page_title.jsp">
            <jsp:param name="image" value="long_comps_topcoder"/>
            <jsp:param name="title" value="Contest Details"/>
        </jsp:include>

        <h2>Official Rules & Regulations</h2>

        <p>
        No purchase necessary to enter or win.
        </p>

        <div class="sectionHeader">About the Competition</div>

        <p>
            <strong>When to start the Competition Round</strong><br />
            TopCoder members must register for the competition round. Registration may occur at any time
            from.
            <rsc:item name="reg_start_time" row="<%=rsr%>" format="MM.dd.yyyy hh:mm a z"/>
            to
            <rsc:item name="reg_end_time" row="<%=rsr%>" format="MM.dd.yyyy hh:mm a z"/>
            
            All competitors who have registered for the competition round will immediately be given
            access
            to the competition problem statement for that round. The competition round will begin
            at
            <rsc:item name="coding_start_time" row="<%=rsr%>" format="MM.dd.yyyy hh:mm a z"/>
            which is the
            earliest time that any member will be given
            access to the problem statement.
        </p>
        <p>
            <strong>Upon Entering a Marathon Match</strong><br />
            Each Marathon Match will contain a single problem. The problem statement will indicate both
            the question
            presented to the contestant as well as how submissions will be scored. Contestants will
            submit their
            solution which will immediately be put on a queue for system testing. Once system testing is
            complete,
            the competitor will be assigned a score which will be available on the website. Each
            competitor may
            submit as many times as they choose, however they may only submit once per hour.
        </p>

        <div class="sectionHeader">Conditions of Participation</div>

        <p>
        By participating in the competition round, you agree to be bound by these rules and to all decisions
        of TopCoder,
        which are final, binding and conclusive in all matters.
        </p>

        <p>
        Contestants must not cheat; all ideas for any code submitted must be the contestant's alone.
        </p>

        <p>
        The winner in each Marathon Match will be the competitor that scores the most points across all
        competitors who participate in that match. All decisions relating to the viability of submissions,
        the ranking of submissions and all other matters pertaining to the competition shall be within the
        sole discretion of TopCoder or its designee and shall be final and binding in all respects.
        </p>

        <p>
        By participating in a Marathon Match, a winner releases and agrees to hold harmless TopCoder, its
        affiliates, subsidiaries, sponsors, advertising and promotion agencies, and prize suppliers, and all
        of their respective directors, officers, employees, representatives and agents, from and against any
        and all liability for any loss, property damage or damage to person, including without limitation,
        death and injury, due in whole or in part, directly or indirectly, from or arising out of
        participation in this Marathon Match, or participation in any competition-related activity, or the
        receipt, use or misuse of a prize.
        </p>

        <p>
        TopCoder, in its sole discretion, reserves the right to disqualify any person tampering with the
        entry process, the operation of the Web site, the competition process, or is otherwise in violation
        of the rules. TopCoder reserves the right to cancel, terminate or modify the competition if it is
        not capable of completion as planned for any reason, including infection by computer virus, bugs,
        tampering, unauthorized intervention or technical failures of any sort.
        </p>

        <div class="sectionHeader">Eligibility</div>

        <p>
        The competition is open to all members who are at least 13 years of age.
        </p>

        <p>
        All competitors must be registered members of TopCoder, and must have agreed to the rules on this
        page prior to
        participating in this competition between the
        <rsc:item name="coding_start_time" row="<%=rsr%>" format="MM.dd.yyyy hh:mm a z"/>
        to
        <rsc:item name="coding_end_time" row="<%=rsr%>" format="MM.dd.yyyy hh:mm a z"/>
        competition submission deadline.
        </p>

        <p>
        Employees of TopCoder and those involved in the development, production (including prize suppliers
        and sponsors), implementation and distribution of this tournament and their advertising or promotion
        agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any
        other persons or entities directly associated with the competition and members of the immediate
        families and/or persons living in the same household as such persons, are ineligible to enter the
        competition.
        </p>

        <div class="sectionHeader">Other</div>
        
        <p>
        The competition is void in whole or in part where prohibited by law.
        </p>
        
        <p>
        A winners list of coder handles for all competitions will be available on the web site at http://www.topcoder.com
        displayed for at least 3 months after the end of the competition.
        </p>
        
        <p>
        This tournament is brought to you by TopCoder, Inc., 703 Hebron Ave, Glastonbury, CT 06033.
        </p>

<h2 align="center">
    <a href="?<%=Constants.MODULE_KEY%>=MatchDetails&amp;<%=Constants.ROUND_ID%>=${row.map['round_id']}" class="bcLink">Back to Contest Details</a>
</h2>

            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>