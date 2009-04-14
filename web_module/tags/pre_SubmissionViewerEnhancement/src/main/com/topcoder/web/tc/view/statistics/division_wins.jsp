<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,java.util.Map, com.topcoder.web.common.StringUtils"

%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>

<% //common code that pulls out the request bean.
Request srb = (Request) request.getAttribute("REQUEST_BEAN");
ResultSetContainer rsc = (ResultSetContainer) ((Map) request.getAttribute("QUERY_RESPONSE")).get("division_wins");
boolean div1 = !StringUtils.checkNull(request.getParameter("dn")).equals("2");
%>
<html>
<head>
<TITLE>TopCoder Statistics - Most SRM Wins</TITLE>
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
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Algorithm Competition Record Book"/>
</jsp:include>

<div style="float:right; padding-left: 20px;"><A href="/tc?module=Static&d1=statistics&d2=recordbook_home">back to table of contents</A></div>
<%= div1 ? "Div I | <A href='/stat?&c=division_wins&dn=2'>Div II</A>" : "<A href='/stat?&c=division_wins&dn=1'>Div I</A> | Div II" %>

<br><br>
<table class="stat" cellpadding="0" cellspacing="0" style="float: left; width: 270px; margin-right: 15px; margin-bottom: 15px;">
<thead>
    <tr><td class="title" colspan="5">Most SRM Wins</td></tr>
    <tr>
        <td class="headerC">Rank</td>
        <td class="header" width="70%">Handle</td>
        <td class="headerC" width="30%">Wins</td>
    </tr>
</thead>
<tbody>
    <% boolean even = false; %>
    <rsc:iterator list="<%=rsc%>" id="row">

    <tr class="<%=even?"dark":"light"%>">
        <td class="valueC"><rsc:item name="rank" row="<%=row%>"/></td>
        <td class="value" nowrap><tc-webtag:handle coderId="<%=row.getLongItem("coder_id")%>" context="algorithm"/></td>
        <td class="valueC"><rsc:item name="wins" row="<%=row%>"/></td>
    </tr>

    <% even = !even;%>
    </rsc:iterator>

</tbody>
</table>
<strong>Record:</strong> This chart represents the most Single Round Match wins in Division <%= div1 ? "I" : "II" %>.


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

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>

