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

        <%-- BRANDING --%>
        <c:if test="${row.map['mm_image_path']!=null}">
        <div style="padding: 0px 0px 0px 5px; float: right;">
            <img src="${row.map['mm_image_path']}" alt="Sponsor" border="0">
        </div>
        </c:if>

        <%-- BRANDING --%>
        <h2>${row.map['contest_name']} &gt; ${row.map['round_name']}</h2>

        <h3>Official Rules & Regulations</h3>

        <p align="justify">
        No purchase necessary to enter or win.
        </p>

        <div class="sectionHeader">About the Competition</div>

        <p align="justify">
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
        <p align="justify">
            <strong>Upon Entering a Marathon Match</strong><br />
            All competitors registered for a specific Marathon Match will see a Submit option 
            for that event. Clicking the Submit link will take you to a page that will 
            allow you to paste in a solution, select the proper language and either submit 
            (for compilation and testing) or save your code. When the Submit button is 
            selected, the code will be immediately compiled. Any compilation messages 
            or errors will be shown in the Messages Area. If the compilation was 
            successful, the submission will then be placed on a queue for automated testing. 
            Example test cases will not be tested. When your submission has been processed,
            you will receive an email indicating such and your place in the standings will 
            be adjusted accordingly. During the submission phase, overall ranking and 
            provisional score are the only pieces of information that will be made 
            available. A given competitor will only be allowed to submit once every 
            4 hours.  Additionally, if a competitor has a pending submission on the 
            testing queue it must finish testing before they may submit again.
        </p>
        <p align="justify">
            Clicking the Test Examples button will immediately compile and place your 
            submission on a queue for automated testing of just the example test cases. 
            Detailed feedback will be made available when the tests are complete, 
            including processing time, score, and any output from the program. 
            Competitors may submit test examples once every 30 minutes. The competitor's 
            rank and overall score will not be updated.
        </p>

        <%if(rsr.getIntItem("round_id") == 10834) {%>
        <div class="sectionHeader">Prizes</div>
        <p align="justify">
        There will be $5000 in total prize money. The first and second highest 
        scoring submissions in each of the five languages supported will 
        receive $750 and $250, respectively.
        </p>
        <p align="justify">
        In order to be eligible for prizes, a competitor must be a TopCoder 
        member in good standing, at least 18 years of age, and must not be a 
        resident of Cuba, Iran, Iraq, Libya, North Korea, Sudan, Syria, 
        the Quebec province of Canada, or anywhere else where this contest is 
        prohibited by applicable law.
        </p>
        <%}%>        

        <div class="sectionHeader">Conditions of Participation</div>

        <p align="justify">
        By participating in the competition round, you agree to be bound by these rules and to all decisions
        of TopCoder,
        which are final, binding and conclusive in all matters.
        </p>

        <%if(rsr.getIntItem("round_id") == 10834) {%>
        <p align="justify">
            By participating in this Competition, you agree to license any code you 
            submit in this Competition under the GNU General Public License as 
            published by the Free Software Foundation, Version 2.0 to all other
            competitors participating in this Competition (the terms and conditions
            of the license may be found at 
            <a href="http://www.opensource.org/licenses/gpl-license.php">http://www.opensource.org/licenses/gpl-license.php</a>.
        </p>
        <%}%>
        
        <p align="justify">
        Contestants must not cheat; all ideas for any code submitted must be the contestant's alone.
        </p>

        <p align="justify">
        The winner in each Marathon Match will be the competitor that scores the most points across all
        competitors who participate in that match. All decisions relating to the viability of submissions,
        the ranking of submissions and all other matters pertaining to the competition shall be within the
        sole discretion of TopCoder or its designee and shall be final and binding in all respects.
        </p>

        <p align="justify">
        By participating in a Marathon Match, a winner releases and agrees to hold harmless TopCoder, its
        affiliates, subsidiaries, sponsors, advertising and promotion agencies, and prize suppliers, and all
        of their respective directors, officers, employees, representatives and agents, from and against any
        and all liability for any loss, property damage or damage to person, including without limitation,
        death and injury, due in whole or in part, directly or indirectly, from or arising out of
        participation in this Marathon Match, or participation in any competition-related activity, or the
        receipt, use or misuse of a prize.
        </p>

        <p align="justify">
        TopCoder, in its sole discretion, reserves the right to disqualify any person tampering with the
        entry process, the operation of the Web site, the competition process, or is otherwise in violation
        of the rules. TopCoder reserves the right to cancel, terminate or modify the competition if it is
        not capable of completion as planned for any reason, including infection by computer virus, bugs,
        tampering, unauthorized intervention or technical failures of any sort.
        </p>

        <div class="sectionHeader">Eligibility</div>

        <p align="justify">
        The competition is open to all members who are at least 13 years of age.
        </p>

        <p align="justify">
        All competitors must be registered members of TopCoder, and must have agreed to the rules on this
        page prior to
        participating in this competition between the
        <rsc:item name="coding_start_time" row="<%=rsr%>" format="MM.dd.yyyy hh:mm a z"/>
        to
        <rsc:item name="coding_end_time" row="<%=rsr%>" format="MM.dd.yyyy hh:mm a z"/>
        competition submission deadline.
        </p>

        <p align="justify">
        Employees of TopCoder and those involved in the development, production (including prize suppliers
        and sponsors), implementation and distribution of this tournament and their advertising or promotion
        agencies, parent companies, service providers, agents, officers, subsidiaries or affiliates, or any
        other persons or entities directly associated with the competition and members of the immediate
        families and/or persons living in the same household as such persons, are ineligible to enter the
        competition.
        </p>

        <div class="sectionHeader">Other</div>
        
        <p align="justify">
        The competition is void in whole or in part where prohibited by law.
        </p>
        
        <p align="justify">
        A winners list of coder handles for all competitions will be available on the web site at http://www.topcoder.com
        displayed for at least 3 months after the end of the competition.
        </p>
        
        <p align="justify">
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