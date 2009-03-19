<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*"
%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>

<% //common code that pulls out the request bean.
Request srb = (Request) request.getAttribute("REQUEST_BEAN");
%>

<html>
<head>
<TITLE>TopCoder Statistics - All-Time Room Wins</TITLE>
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

<div style="float:right;"><A href="/tc?module=Static&d1=statistics&d2=recordbook_home">back to table of contents</A></div>
Overall
 | <A HREF="/stat?c=all_time_wins_by_div&dn=1">Div I</a>
 | <A HREF="/stat?c=all_time_wins_by_div&dn=2">Div II</a>
<br><br>

<table class="stat" cellpadding="0" cellspacing="0" style="float: left; width: 270px; margin-right: 15px; margin-bottom: 15px;">
<thead>
    <tr><td class="title" colspan="5">All-Time Algorithm Room Wins</td></tr>
    <tr>
        <td class="headerC">Rank</td>
        <td class="header" width="40%"><a href="/stat?c=all_time_wins&sq=All_Time_Wins&sc=0&sd=<%= "0".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Coder</a></td>
        <td class="headerC" width="20%"><a href="/stat?c=all_time_wins&sq=All_Time_Wins&sc=5&sd=<%= "5".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Overall</a></td>
        <td class="headerC" width="20%"><a href="/stat?c=all_time_wins&sq=All_Time_Wins&sc=3&sd=<%= "3".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Div I</a></td>
        <td class="headerC" width="20%"><a href="/stat?c=all_time_wins&sq=All_Time_Wins&sc=4&sd=<%= "4".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Div.&nbsp;II</a></td>
    </tr>
</thead>
<tbody>
    <% boolean even = false; %>
<%-- ICK --%>
<logic:present name="QUERY_RESPONSE" scope="request">
    <bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>
        <logic:iterate name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map.Entry" scope="request">
            <logic:equal name="queryEntries" property="key" value="All_Time_Wins">
                <logic:present name="queryEntries" property="value">
                    <bean:define id="resultSet" name="queryEntries" property="value" type="ResultSetContainer" />
                        <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow">

    <tr class="<%=even?"dark":"light"%>">
    <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 2 /*"coder_score"*/ + "]" %>'/>
        <td class="valueC"><bean:write name="resultRow" property='<%= "item[" + 6 /*"rank"*/ + "]" %>'/></td>
        <td class="value" nowrap><tc-webtag:handle coderId="<%=resultRow.getLongItem("coder_id")%>" context="algorithm"/></td>
        <td class="valueC"><bean:write name="resultRow" property='<%= "item[" + 5 /*"total"*/ + "]" %>'/></td>
        <td class="valueC"><bean:write name="resultRow" property='<%= "item[" + 3 /*"div 1"*/ + "]" %>'/></td>
        <td class="valueC"><bean:write name="resultRow" property='<%= "item[" + 4 /*"div 2"*/ + "]" %>'/></td>
    </tr>
    <% even = !even;%>
                        </logic:iterate>
                    </logic:present>
                </logic:equal>
            </logic:iterate>
        </logic:present>
</tbody>
</table>

<span class="bodyText">
<strong>Record:</strong> This chart represents the Top 10 in Overall Room Wins.
</span>





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
