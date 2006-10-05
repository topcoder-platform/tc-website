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
<script language="JavaScript">
<!--
function goTo(selection){
sel = selection.options[selection.selectedIndex].value;
if (sel && sel != '#'){
window.location=sel;
}
}
// -->
</script>
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
        <td class="header">Coder</td>
        <td class="headerC" width="100%" nowrap>Consecutive<br>Rating<br>Increases</td>
        <td class="headerC" colspan="3">Duration</td>
    </tr>
</thead>
<tbody>
    <% boolean even = false; %>
    <rsc:iterator list="<%=rsc%>" id="resultRow">
    <tr class="<%=even?"dark":"light"%>">
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="rank"/></td>
        <td class="value"><tc-webtag:handle coderId="<%=resultRow.getLongItem("coder_id")%>" context="algorithm"/></td>
        <td class="valueC"><rsc:item row="<%=resultRow%>" name="length"/></td>
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


<%--

<BODY>
  <jsp:include page="../top.jsp" />
  <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
  <TR>
  <TD WIDTH="180" VALIGN="top">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="algo_recordbook"/>
         </jsp:include>
            </TD>
            <TD WIDTH="10" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            <TD CLASS="bodyText" WIDTH="100%" VALIGN="top"><IMG src="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"/><BR/>
            <!-- BEGIN BODY -->
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
            <TR>
            <TD WIDTH="11" HEIGHT="26" ALIGN="left" VALIGN="bottom"><IMG WIDTH="11" HEIGHT="26" BORDER="0" src="/i/steelblue_top_left1.gif"></TD>
            <TD VALIGN="bottom" WIDTH="180" ALIGN="left"><IMG WIDTH="180" HEIGHT="26" BORDER="0" src="/i/header_statistics.gif"></TD>
            <TD CLASS="bodyTextBold" VALIGN="middle" WIDTH="100%">
            &#160;<SPAN CLASS="bodySubhead">&#160;&#160;Quick Stats&#160;&#160;</SPAN>
            </TD>
            <TD VALIGN="top" WIDTH="10" ALIGN="right"><IMG src="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD>
            </TR>
            </TABLE>
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="10" BGCOLOR="#001B35" WIDTH="100%">
            <TR>
            <TD VALIGN="top" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
            <TR>
            <TD VALIGN="top" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
            <P CLASS="statText">
            This chart represents the longest consecutive rating increase streaks.
            </P>
            <P CLASS="statText">
<% if (streakType.equals("4")){ %>
View consecutive rating increase streaks for <A CLASS="statText" HREF="/stat?c=consecutive_rating_increases&wst=3">Single Round Matches</A>
    <% } else { %>
    View consecutive rating increase streaks for <A CLASS="statText" HREF="/stat?c=consecutive_rating_increases&wst=4">Single Round Matches and Tournaments</A>
    <% } %>
    </P>
    <!-- Stats Intro Begins -->
        <jsp:include page="qsIntro.jsp" />

        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
            <TR>
                <TD COLSPAN="7" CLASS="smallFoot"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"></TD>
            </TR>
            <TR>
                <TD background="/i/steel_gray_bg.gif" COLSPAN="7" CLASS="statTextBig" VALIGN="middle" HEIGHT="18">&nbsp;Consecutive Rating Increases for <%=streakDesc%></TD>
            </TR>
            <TR>
                <TD COLSPAN="7" CLASS="smallFoot" WIDTH="1"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
            </TR>
            <TR VALIGN="middle">
                <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="10" HEIGHT="18">&nbsp;</TD>
                <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="20%">Handle</TD>
                <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="15%">Consecutive Rating Increases</TD>
                <TD colspan="3" CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="40%">Round Duration</TD>
                <TD CLASS="statText" background="/i/steel_bluebv_bg.gif" ALIGN="center" WIDTH="25%">Start/End Date</TD>
            </TR>
            <TR>
                <TD COLSPAN="7" CLASS="smallFoot" WIDTH="1"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
            </TR>

            <rsc:iterator list="<%=rsc%>" id="resultRow">
                <tr valign="middle">
                    <td CLASS="smallFoot" align="right" height="13"><rsc:item row="<%=resultRow%>" name="rank"/>&nbsp;</td>
                    <td CLASS="statText"><a href="/tc?module=MemberProfile&cr=<rsc:item row="<%=resultRow%>" name="coder_id"/>" class="<tc:ratingStyle rating='<%=resultRow.getIntItem("rating")%>'/>"><rsc:item row="<%=resultRow%>" name="handle"/></a></td>
                    <TD CLASS="statText" ALIGN="center"><rsc:item row="<%=resultRow%>" name="length"/></TD>
                    <TD CLASS="statText" ALIGN="right" width="18%"><rsc:item row="<%=resultRow%>" name="start_contest_name"/></td>
                    <TD CLASS="statText" ALIGN="center" width="4%">&nbsp;-&nbsp;</td>
                    <TD CLASS="statText" ALIGN="left" width="18%"><rsc:item row="<%=resultRow%>" name="end_contest_name"/></TD>
                    <TD CLASS="statText" ALIGN="center"><rsc:item row="<%=resultRow%>" name="start_date" format="MM.dd.yy"/>&nbsp;-&nbsp;<rsc:item row="<%=resultRow%>" name="end_date" format="MM.dd.yy"/></TD>
                </tr>
            </rsc:iterator>
            <TR>
                <TD background="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="7"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
            </TR>
            <TR>
                <TD CLASS="statText" COLSPAN="7"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"></TD>
            </TR>
        </TABLE>




</TD>
</TR>
</TABLE>
</TD>
</TR>
<TR>
<TD VALIGN="top" WIDTH="100%"><IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
</TR>
</TABLE>

<p><br></p>

<!-- END BODY -->

</TD>
<TD WIDTH="10"><IMG src="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
<TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="180" HEIGHT="1" BORDER="0">
         <jsp:include page="../public_right.jsp" />
         </TD>
         <!-- Gutter -->
         <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
         <!-- Gutter Ends -->
         </TR>
         </TABLE>
   <jsp:include page="../foot.jsp" />
</body>
</html>

--%>

