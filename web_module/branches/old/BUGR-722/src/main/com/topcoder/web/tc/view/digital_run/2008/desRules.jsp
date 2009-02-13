<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - The Digital Run</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../../script.jsp" />
</head>
<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="node" value="digital_run"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="digital_run_20061031"/>
<jsp:param name="title" value="2008 Design Cup Series"/>
</jsp:include>

<jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="design"/>
    <jsp:param name="tabLev2" value="rules"/>
</jsp:include>

<span class="title">Rules</span>
<br /><br />
Each component posted for a design competition will carry a "placement point" value equivalent to the prize money for the component. <A href="/tc?module=Static&d1=digital_run&d2=2008&d3=desOverview">Placement Points</A> will be awarded based on the number of submissions that pass review. By registering for any design competition, a competitor agrees to the items outlined on each component's Project Overview page, including the Eligibility requirements and the Terms of Work, and the completion of all paperwork required by TopCoder.
<br /><br />
TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in component design competitions, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site or the contest process, or other violation of any rule. TopCoder reserves the right to cancel, terminate or modify this program if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort. TopCoder reserves the right, in its sole discretion, to change any aspects of the component design competitions and the Design Cup, including but not limited to, these rules, the software methodology, the scorecard, the prize purse and the point distribution schedule, at any point during this program. TopCoder makes no guarantee as to the number of components that are open for competition in any particular development language for each weekly competition.
<br /><br />
</div>

</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>