<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<%
    ResultSetContainer.ResultSetRow rsr = (ResultSetContainer.ResultSetRow) (((ResultSetContainer) request.getAttribute("rsc")).get(0));
    int round_id = rsr.getIntItem("round_id");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<HEAD>
    <TITLE>TopCoder - Schedule</TITLE>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>

    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <jsp:include page="/script.jsp"/>
</HEAD>

<body>
<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="m_long_contests"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div align="center">
    <div style="width: 500px; text-align: left;">

        <jsp:include page="page_title.jsp">
            <jsp:param name="image" value="long_comps_topcoder"/>
            <jsp:param name="title" value="Rules & Regulations"/>
        </jsp:include>

        <span class="bigTitle">Official Rules & Regulations</span>
        <br><br>
        No purchase necessary to enter or win.
        <br><br>
        <span class="bodySubtitle">About the Competition</span>
        <ul>
            <li><strong>When to start the Competition Round</strong><br>
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
            </li>
            <li><strong>Upon Entering a Marathon Match</strong><br>
                Each Marathon Match will contain a single problem. The problem statement will indicate both
                the question
                presented to the contestant as well as how submissions will be scored. Contestants will
                submit their
                solution which will immediately be put on a queue for system testing. Once system testing is
                complete,
                the competitor will be assigned a score which will be available on the website. Each
                competitor may
                submit as many times as they choose, however they may only submit once per hour.
            </li>
        </ul>
        <span class="bodySubtitle">Conditions of Participation</span>
        <br><br>
        By participating in the competition round, you agree to be bound by these rules and to all decisions
        of TopCoder,
        which are final, binding and conclusive in all matters.
        <br><br>
        Contestants must not cheat; all ideas for any code submitted must be the contestant's alone.
        <br><br>
        The winner in each Marathon Match will be the competitor that scores the most points across all
        competitors who participate in that match. All decisions relating to the viability of submissions,
        the ranking of submissions and all other matters pertaining to the competition shall be within the
        sole discretion of TopCoder or its designee and shall be final and binding in all respects.
        <br><br>
        By participating in a Marathon Match, a winner releases and agrees to hold harmless TopCoder, its
        affiliates, subsidiaries, sponsors, advertising and promotion agencies, and prize suppliers, and all
        of their respective directors, officers, employees, representatives and agents, from and against any
        and all liability for any loss, property damage or damage to person, including without limitation,
        death and injury, due in whole or in part, directly or indirectly, from or arising out of
        participation in this Marathon Match, or participation in any competition-related activity, or the
        receipt, use or misuse of a prize.
        <br><br>
        TopCoder, in its sole discretion, reserves the right to disqualify any person tampering with the
        entry process, the operation of the Web site, the competition process, or is otherwise in violation
        of the rules. TopCoder reserves the right to cancel, terminate or modify the competition if it is
        not capable of completion as planned for any reason, including infection by computer virus, bugs,
        tampering, unauthorized intervention or technical failures of any sort.
        <br><br>
        <span class="bodySubtitle">Participants</span><br>
        The competition is open to all members who are at least 13 years of age.
        <br><br>
        All competitors must be registered members of TopCoder, and must have agreed to the rules on this
        page prior to
        participating in this competition between the


        <rsc:item name="coding_start_time" row="<%=rsr%>" format="MM.dd.yyyy hh:mm a z"/>
        to
        <rsc:item name="coding_end_time" row="<%=rsr%>" format="MM.dd.yyyy hh:mm a z"/>

        competition submission deadline.
        <br><br>
        Employees of TopCoder and those involved in the development, production (including prize suppliers
        and sponsors), implementation and distribution of this tournament and their advertising or promotion
        agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any
        other persons or entities directly associated with the competition and members of the immediate
        families and/or persons living in the same household as such persons, are ineligible to enter the
        competition.
        <br><br>
        <span class="bodySubtitle">Other</span><br>
        The competition is void in whole or in part where prohibited by law.
        <br><br>
        A winners list of coder handles for all competitions will be available on the web site at
        http://www.topcoder.com displayed for at least 3 months after the end of the competition.
        <br><br>
        This tournament is brought to you by TopCoder, Inc., 703 Hebron Ave, Glastonbury, CT 06033.
        <br><br>

    </div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td width="170">
    <jsp:include page="public_right.jsp">
        <jsp:param name="level1" value="privatelabel"/>
    </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
</tr>
</table>

<jsp:include page="foot.jsp"/>

</body>

</html>


<!-- Body Begins -->
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="../includes/global_left.jsp">
        <jsp:param name="node" value="m_hs_competitions"/>
    </jsp:include>
</td>
<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">
<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="high_school"/>
    <jsp:param name="title" value="SRM Official Rules & Regulationss"/>
</jsp:include>


<span class="title">TopCoder High School <rsc:item name="contest_name" row="<%=rsr%>"/></span>
<br><br>
<span class="subtitle">Official Rules and Regulations</span>
<br><br>
No purchase necessary to enter or win. Void where prohibited.
<br/><br/>

<b>Rooms</b>

<p>Each competition room will have a maximum of 25 coders. Room assignments will be random, however,
    they will be weighted in such a way that members of the same team are more likely to each end up in different
    rooms.</p>


<b>About the TCHS SRM</b><br/>
<ul>
    <li><b>When to start the Single Round Match (SRM)</b><br/>
        TopCoder High School (TCHS) members must register for the SRM. Registration is from
        . To register, login
        to the TopCoder High School Arena application, click on the 'Active Contests' menu, choose the SRM to
        register for, and select the 'Register' option. <strong><em>TCHS members from all over the world may be
        participating in
        this SRM, but all start times will be communicated as Eastern Time, so contestants in different time zones must
        adjust accordingly.</em></strong> All competitors who have registered for the competition will be assigned to a
        specific
        competition room. TopCoder will perform the room assignments prior to the start of the competition.
    </li>
    <li>
        <b>Upon Entering the SRM</b><br/>
        Each SRM consists of three phases: Coding Phase, Challenge Phase, and Testing Phase.
        <p><b>The Coding Phase</b> is a timed event where all contestants are presented with the same three questions
            representing three levels of complexity and, accordingly, three levels of point earnings potential. Points
            for a problem are awarded upon submission of any solution that successfully compiles.</p>

        <p><b>The Challenge Phase</b> is a timed event wherein each competitor has a chance to challenge the
            functionality
            of other competitors' code. A successful challenge will award 50 points to the challenger, and any points
            gained by the submitter for the problem will be lost. Unsuccessful challenges will cost the challenger 25
            points as a penalty, applied to their total score in that round of competition.</p>

        <p><b>The Testing Phase</b> is applied to all submitted code that has not already been successfully challenged.
            If TopCoder finds code that is flawed, the author of that code submission will lose all of the points they
            earned for that code submission. The automated tester will apply a set of inputs, expecting the output from
            the code submission to be correct. If the output from a coder's submission does not match the expected
            output,
            the submission is considered flawed. The same set of input/output test cases will be applied to all code
            submissions for a given problem. Any correct challenges from the Challenge Phase will be used in the Testing
            Phase.</p>
    </li>
    <li>
        <b>Scoring during SRMs</b><br/>

        <p>All team members and individuals who opened any problem during the SRM will have their ratings adjusted up or
            down to reflect their performance, based on TopCoder's rating formula. Contestant ratings play no role in
            a Coder's final standing in the competition room.</p>
    </li>
</ul>

<b>Conditions of Participation</b><br/>
By participating in the SRM, you agree to be bound by these rules and to all decisions of TopCoder, which are final,
binding and conclusive in all matters.

<p><span class="bigRed">Contestants must not cheat. All ideas for code and/or challenge submitted must be the contestant's
    alone. TopCoder
    uses the word "cheat" to mean collaboration of any sort - including, but not limited to, working with another
    competitor, submitting code that was not fully authored by you, and using resources, software, etc. that
    are not allowed in TopCoder competitions. TopCoder reserves the right, in its sole discretion, to remove any
    competitor from the tournament who it suspects has cheated.</span></p>

<p>All decisions relating to the viability of submissions, the ranking of submissions and all other matters pertaining
    to
    the SRM shall be within the sole discretion of TopCoder or its designee and shall be final and binding in all
    respects.</p>

<p>By participating in this SRM, contestants release and agree to hold harmless TopCoder, its affiliates, subsidiaries,
    sponsors, advertising and promotion agencies, and prize suppliers, and all of their respective directors, officers,
    employees, representatives and agents, from and against any and all liability for any loss, property damage or
    damage to person, including without limitation, death and injury, due in whole or in part, directly or indirectly,
    from or arising out of participation in this SRM, or participation in any SRM-related activity, or the receipt,
    use or misuse of a prize.</p>

<p>TopCoder, in its sole discretion, reserves the right to disqualify any person tampering with the entry process,
    the operation of the Web site, the contest process, or is otherwise in violation of the rules. TopCoder reserves
    the right to cancel, terminate or modify the SRM if it is not capable of completion as planned for any reason,
    including
    infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort.</p>


<b>Participants</b><br/>
The SRM is open to all TCHS members who are between the ages of 13 and 20, inclusive, pursuing a secondary school
education and not matriculated full time at a college or university.

<p>All competitors must be registered members of TopCoder High School and must have agreed to the rules on this page by
    the
    <rsc:item name="reg_date" row="<%=rsr%>"/>
    &#160;
    <rsc:item name="reg_end" row="<%=rsr%>"/>
    registration
    deadline.</p>

<p>Employees of TopCoder and those involved in the development, production (including prize suppliers and sponsors),
    implementation and distribution of this SRM and their advertising or promotion agencies, parent companies,
    service providers, agents, officers, subsidiaries or affiliates, or any other persons or entities directly
    associated
    with the SRM and members of the immediate families and/or persons living in the same household as such persons,
    are ineligible to enter the SRM.
</p>

<b>Other</b><br/>

<p>The SRM is void in whole or in part where prohibited by law.</p>

<p>A list of competitor handles for all SRMs will be available on the web site at
    http://www.topcoder.com displayed for at least 3 months after the end of the SRM.</p>

<p>This SRM is brought to you by TopCoder, Inc., 703 Hebron Ave, Glastonbury, CT 06033.</p>


</div>
</TD>
<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br>
    <jsp:include page="/public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</TD>
</TR>
</TABLE>

<jsp:include page="/foot.jsp"/>

</BODY>

</HTML>