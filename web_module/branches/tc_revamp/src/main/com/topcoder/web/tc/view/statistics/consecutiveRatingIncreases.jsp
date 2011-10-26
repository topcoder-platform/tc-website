<%@ page
  language="java"
  import="com.topcoder.shared.dataAccess.*,com.topcoder.shared.dataAccess.resultSet.*,
          java.util.Map"

%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>

<%--<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>--%>

<% //common code that pulls out the request bean.
    Request srb = (Request) request.getAttribute("REQUEST_BEAN");

    String streakType = srb.getProperty("wst","4");
    String streakDesc = null;
    if (streakType.equals("3")) streakDesc = "Single Round Matches";
    else if (streakType.equals("4")) streakDesc = "Single Round Matches and Tournaments";
    ResultSetContainer rsc = (ResultSetContainer)((Map)request.getAttribute("QUERY_RESPONSE")).get("consecutive_rating_increases");
%>
<html>
<head>
    <TITLE>TopCoder Statistics - Consecutive Rating Increases</TITLE>
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

<div style="float:right;"><A href="/tc?module=Static&d1=statistics&d2=recordbook_home">back to table of contents</A></div>
<span class="bodyText">
<% if (streakType.equals("4")){ %>
<A HREF="/stat?c=consecutive_rating_increases&wst=3">SRMs</A> | SRMs and Tournaments
<% } else { %>
SRMs | <A HREF="/stat?c=consecutive_rating_increases&wst=4">SRMs and Tournaments</A>
<% } %>
<br><br>
<strong>Record:</strong> This chart represents the longest consecutive algorithm rating increase streaks.
</span>
<br><br>
<table class="stat" cellpadding="0" cellspacing="0" style="float: left; width: 510px; margin-right: 15px; margin-bottom: 15px;">
<thead>
    <tr><td class="title" colspan="6">Most Consecutive Algorithm Rating Increases</td></tr>
    <tr>
        <td class="headerC">Rank</td>
        <td class="header" width="100%">Coder</td>
        <td class="headerC" width="100px" nowrap>Consecutive<br>Rating<br>Increases</td>
        <td class="headerC" colspan="3">Duration</td>
    </tr>
</thead>
<tbody>
    <% boolean even = false; %>
    <rsc:iterator list="<%=rsc%>" id="resultRow">
    <tr class="<%=even?"dark":"light"%>">
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="rank"/></td>
        <td class="value"><tc-webtag:handle coderId="<%=resultRow.getLongItem("coder_id")%>" context="algorithm"/></td>
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
           <rsc:item row="<%=resultRow%>" name="length"/>
        </td>
        <td class="valueR" nowrap>
        <strong><rsc:item row="<%=resultRow%>" name="start_contest_name"/></strong><br>
        <rsc:item row="<%=resultRow%>" name="start_date" format="MM.dd.yy"/>
        </td>
        <td class="valueC">-</td>
        <td class="value" nowrap>
        <strong><rsc:item row="<%=resultRow%>" name="end_contest_name"/></strong><br>
        <rsc:item row="<%=resultRow%>" name="end_date" format="MM.dd.yy"/>
        </td>
    </tr>
    <% even = !even;%>
    </rsc:iterator>
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