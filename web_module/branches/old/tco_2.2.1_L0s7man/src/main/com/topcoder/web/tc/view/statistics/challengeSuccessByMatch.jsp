<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,com.topcoder.web.common.tag.HandleTag,java.util.Map"

        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>

<% ResultSetContainer rsc = (ResultSetContainer) ((Map) request.getAttribute("QUERY_RESPONSE")).get("successful_challenges");
%>
<html>
<head>
<TITLE>TopCoder Statistics - Challenge Success for a Single Match</TITLE>
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
</HEAD>
<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="algo_recordbook"/>
            </jsp:include>
        </td>

<%-- Center Column Begins --%>
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Algorithm Competition Record Book"/>
</jsp:include>

<div style="float:right; padding-left: 20px;"><A href="/tc?module=Static&d1=statistics&d2=recordbook_home">back to table of contents</A></div>
<br><br>
<strong>Record:</strong> This chart shows the coders that have gotten the most successful challenges in a single match.

<br><br>
<table class="stat" cellpadding="0" cellspacing="0" style="float: left; width: 100%; margin-right: 15px; margin-bottom: 15px;">
<thead>
    <tr><td class="title" colspan="8">Challenge Success for a Single Match</td></tr>
    <tr>
        <td class="headerC">Rank</td>
        <td class="header" width="20%">Coder</td>
        <td class="headerC" width="13%">Successful<br>Challenges</td>
        <td class="headerC" width="13%">Failed<br>Challenges</td>
        <td class="headerC" width="13%">Net<br>Challenge Points</td>
        <td class="headerC" width="13%">Positive<br>Challenge Points</td>
        <td class="headerC" width="13%">Division</td>
        <td class="headerC" width="13%">Event</td>
    </tr>
</thead>
<tbody>

    <% boolean even = false; %>
    <rsc:iterator list="<%=rsc%>" id="row">

    <tr class="<%=even?"dark":"light"%>">
        <td class="valueC"><rsc:item name="rank" row="<%=row%>"/></td>
        <td class="value" nowrap>
            <A HREF="/stat?c=coder_room_stats&amp;rd=<rsc:item name="round_id" row="<%=row%>"/>&cr=<rsc:item name="coder_id" row="<%=row%>"/>"><IMG SRC="/i/interface/exp_w.gif" ALT="Expand" /></A>
            <tc-webtag:handle coderId='<%=row.getLongItem("coder_id")%>' context='<%=HandleTag.ALGORITHM%>'/>
        </td>
        <td class="valueC"><rsc:item name="challenges_made_successful" row="<%=row%>"/></td>
        <td class="valueC"><rsc:item name="challenges_made_failed" row="<%=row%>"/></td>
        <td class="valueC"><rsc:item name="challenge_points" row="<%=row%>" format="#.##"/></td>
        <td class="valueC"><rsc:item name="positive_challenge_points" row="<%=row%>" format="#.##"/></td>
        <td class="valueC" nowrap><rsc:item name="division_desc" row="<%=row%>"/></td>
        <td class="valueC">
            <a href="/stat?c=round_overview&amp;rd=<rsc:item name="round_id" row="<%=row%>"/>">
            <rsc:item name="short_name" row="<%=row%>"/>
            </a>
        </td>
    </tr>

    <% even = !even;%>
    </rsc:iterator>

</tbody>
</table>



</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>