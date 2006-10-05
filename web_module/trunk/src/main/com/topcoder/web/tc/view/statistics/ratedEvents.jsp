<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,com.topcoder.web.common.tag.HandleTag,java.util.Map"

        %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>

<% ResultSetContainer rsc = (ResultSetContainer) ((Map) request.getAttribute("QUERY_RESPONSE")).get("rated_events");
%>
<html>
<head>
<TITLE>TopCoder Statistics - Most Rated Events</TITLE>
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

<br><br>
<table class="stat" cellpadding="0" cellspacing="0" style="float: left; width: 270px; margin-right: 15px; margin-bottom: 15px;">
<thead>
    <tr><td class="title" colspan="5">Most Rated Events</td></tr>
    <tr>
        <td class="headerC">Rank</td>
        <td class="header" width="70%">Handle</td>
        <td class="headerC" width="30%">Events</td>
    </tr>
</thead>
<tbody>
    <% boolean even = false; %>
    <rsc:iterator list="<%=rsc%>" id="row">

    <tr class="<%=even?"dark":"light"%>">
        <td class="valueC"><rsc:item name="rank" row="<%=row%>"/></td>
        <td class="value" nowrap><tc-webtag:handle coderId='<%=row.getLongItem("coder_id")%>' context='<%=HandleTag.ALGORITHM%>'/></td>
        <td class="valueC"><rsc:item name="num_ratings" row="<%=row%>"/></td>
    </tr>

    <% even = !even;%>
    </rsc:iterator>

</tbody>
</table>
<strong>Record:</strong> This chart shows the coders that have participated in the most rated events..


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
                <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                    <TR>
                        <TD VALIGN="top" WIDTH="100%">
                            <IMG src="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

                            <P CLASS="statText">
                                This chart shows the coders that have participated in the most rated events.
                            </P>

                            <!-- Stats Intro Begins -->
                            <jsp:include page="qsIntro.jsp"/>

                            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001B35" WIDTH="100%">
                                <TR>
                                    <TD COLSPAN="3" CLASS="smallFoot">
                                        <IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"></TD>
                                </TR>
                                <TR>
                                    <TD background="/i/steel_gray_bg.gif" COLSPAN="3" CLASS="statTextBig" VALIGN="middle" HEIGHT="18">
                                        &nbsp;Most Rated Events</TD>
                                </TR>
                                <TR>
                                    <TD COLSPAN="3" CLASS="smallFoot" WIDTH="1">
                                        <IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                                </TR>
                                <TR VALIGN="middle">
                                    <TD class="statText">&nbsp;</TD><TD class="statText">Handle</TD>
                                    <TD class="statText"># of Events</TD>
                                </TR>
                                <TR>
                                    <TD COLSPAN="3" CLASS="smallFoot" WIDTH="1">
                                        <IMG src="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                                </TR>
                                <rsc:iterator list="<%=rsc%>" id="row">
                                    <tr>
                                        <td class="statText" width="33%" align="right">
                                            <rsc:item name="rank" row="<%=row%>"/>&#160;</td>
                                        <td class="statText" width="33%">
                                            <tc-webtag:handle coderId='<%=row.getLongItem("coder_id")%>' context='<%=HandleTag.ALGORITHM%>'/></td>
                                        <td class="statText" width="33%">
                                            <rsc:item name="num_ratings" row="<%=row%>"/></td>
                                    </tr>
                                </rsc:iterator>
                                <TR>

--%>
