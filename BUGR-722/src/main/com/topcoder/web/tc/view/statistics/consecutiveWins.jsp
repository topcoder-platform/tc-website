<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*"

%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>

<% //common code that pulls out the request bean.
Request srb = (Request) request.getAttribute("REQUEST_BEAN");

String sDivision = srb.getProperty("dn","1");
String romanDivision = null;
if (sDivision.equals("1")) romanDivision = "I";
else if (sDivision.equals("2")) romanDivision = "II";
%>
<html>
<head>
    <TITLE>TopCoder Statistics - Most Consecutive Wins</TITLE>
    <jsp:include page="/script.jsp" />
    <jsp:include page="/style.jsp">
      <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <script language="JavaScript" type="text/javascript" src="/js/popup.js"></script>
</head>
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
<% if (sDivision.equals("2")){ %>
<A HREF="/stat?c=most_consecutive_wins&dn=1">Div I</A>
 | Div II
<% } else { %>
Div I
 | <A HREF="/stat?c=most_consecutive_wins&dn=2">Div II</A>
<% } %>
<br><br>
<strong>Record:</strong> This chart represents the longest consecutive room win streaks in Single Round Matches.

<br><br>
<table class="stat" cellpadding="0" cellspacing="0" style="float: left; width: 510px; margin-right: 15px; margin-bottom: 15px;">
<thead>
    <tr><td class="title" colspan="6">Most Consecutive Wins</td></tr>
    <tr>
        <td class="headerC">Rank</td>
        <td class="header"><a href="/stat?c=highest_accuracy&sq=Highest_Submission_Accuracy&sc=0&sd=<%= "0".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Coder</a></td>
        <td class="headerC" width="100%"><a href="/stat?c=highest_accuracy&sq=Highest_Submission_Accuracy&sc=2&sd=<%= "2".equals(srb.getProperty("sc")) && srb.getProperty("sd","desc").equals("desc") ?"asc":"desc"%>">Wins</a></td>
        <td class="headerC" colspan="3">Duration</td>
    </tr>
</thead>
<tbody>
    <% boolean even = false; %>
<logic:present name="QUERY_RESPONSE" scope="request">
<bean:define id="nameColor" name="CODER_COLORS" scope="application" toScope="page"/>
<logic:iterate name="QUERY_RESPONSE" id="queryEntries" type="java.util.Map.Entry" scope="request">
  <logic:equal name="queryEntries" property="key" value="Most_Consecutive_Wins">
  <logic:present name="queryEntries" property="value">
    <bean:define id="resultSet" name="queryEntries" property="value" type="ResultSetContainer" />
    <logic:iterate name="resultSet" id="resultRow" type="ResultSetContainer.ResultSetRow">

    <tr class="<%=even?"dark":"light"%>">
        <bean:define id="coderrank" name="resultRow" property='<%= "item[" + 3 /*"coder_score"*/ + "]" %>'/>
        <td class="valueC"><bean:write name="resultRow" property='<%= "item[" + 11 /*"rank"*/ + "]" %>'/></td>
        <td class="value" nowrap><tc-webtag:handle coderId="<%=resultRow.getLongItem("coder_id")%>" context="algorithm"/></td>
        <td class="valueC" width="100px" nowrap>
           <% if (resultRow.getIntItem("is_current") == 1) { %>                        
            <div style="float: left; width: 30px;">
                &nbsp;
            </div>
            <div style="float: right; width: 30px;">                                    
                <img src="/i/interface/emblem/andclimbing.png" alt="" align="absmiddle" onmouseover="popUp(this,'emblemPopup')" onMouseOut="popHide()" />
            </div>
            <% } else { %>
            <div style="float: left; width: 30px;">
                &nbsp;
            </div>
            <div style="float: right; width: 30px;">                                    
                &nbsp;
            </div>
            <% } %>
            <bean:write name="resultRow" property='<%= "item[" + 2 /*"length"*/ + "]" %>'/>
        </td>
        <td class="valueR" nowrap>
        <strong><bean:write name="resultRow" property='<%= "item[" + 5 /*"contest"*/ + "]" %>'/></strong><br>
        <bean:write format="MM.dd.yy" name="resultRow" property='<%= "item[" + 4 /*"start_date"*/ + "].resultData" %>'/>
        </td>
        <td class="valueC">-</td>
        <td class="value" nowrap>
        <strong><bean:write name="resultRow" property='<%= "item[" + 8 /*"contest"*/ + "]" %>'/></strong><br>
        <bean:write format="MM.dd.yy" name="resultRow" property='<%= "item[" + 7 /*"end_date"*/ + "].resultData" %>'/>
        </td>
    </tr>

    <% even = !even;%>
    </logic:iterate>
  </logic:present>
  </logic:equal>
</logic:iterate>
</logic:present>

</tbody>
</table>

<div class="popUp" id="emblemPopup"><div>And climbing</div></div>

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