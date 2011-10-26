<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="java.util.Map" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% ResultSetContainer results = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("long_comp_history"); %>

<HTML>
<HEAD>
    <TITLE>TopCoder Statistics</TITLE>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
 <jsp:include page="baseHRef.jsp"/>
</HEAD>

<BODY>
<jsp:include page="../top.jsp"/>

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR valign="top">

        <TD WIDTH="180">
            <!-- Left nav begins -->
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="m_competitions"/>
         </jsp:include>
            <!-- Left nav ends -->
        </TD>

        <!-- Center Column Begins -->
        <td class="statTableSpacer" width="100%" valign="top">

            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="statistics_w"/>
                <jsp:param name="title" value="Marathon Match Competition History"/>
            </jsp:include>

            <% if (results!=null && !results.isEmpty()) { %>
            <span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='<%=results.getLongItem(0, "coder_id")%>'/></span>
            <br>
            <span class="bodySubtitle">Marathon Match Statistics&#160;>&#160;</span><br>
            <span class="bc">
<A HREF="/tc?module=MemberProfile&cr=<%=results.getLongItem(0, "coder_id")%>" class="bcLink">Member Profile</A>
&#160;|&#160;Competition History
</span>

<%--
            <div class="pagingBox">
                <a href="/" class="bcLink">&lt;&lt; previous</a>
                &nbsp;|&nbsp;
                <a href="/" class="bcLink">next &gt;&gt;</a>
            </div>
--%>
            <div class="pagingBox">&nbsp;</div>

            
<table cellpadding="0" cellspacing="0" width="100%" class="stat">
<tbody>
    <tr><td class="title" colspan="7">Marathon Match Competition History</td></tr>
    <tr>
        <TD CLASS="header" width="100%">Competition</TD>
        <TD CLASS="headerR" align="right">Rank</TD>
        <TD CLASS="headerR" align="right" nowrap="nowrap">Provisional Score</TD>
        <TD CLASS="headerR" align="right" nowrap="nowrap">Final Score</TD>
        <TD CLASS="headerR" align="right" nowrap="nowrap">Rating</TD>
        <TD CLASS="headerR" align="right" nowrap="nowrap">Volatility</TD>
        <TD CLASS="headerR" align="right">&#160;</TD>
    </tr>
    <%boolean even = true;%>
    <rsc:iterator list="<%=results%>" id="resultRow">
        <tr class="<%=even?"light":"dark"%>">
            <td class="value"><a href="/longcontest/stats/?module=ViewOverview&rd=<rsc:item row="<%=resultRow%>" name="round_id"/>">
                <c:choose>
                    <c:when test="${resultRow.map['round_type_id']==19}">
                        ${resultRow.map['contest_name']} ${resultRow.map['round_name']}
                    </c:when>
                    <c:otherwise>
                        ${resultRow.map['round_name']}
                    </c:otherwise>
                </c:choose>
                </a>
            </td>
            <td class="valueR"><rsc:item row="<%=resultRow%>" name="placed"/></TD>
            <td class="valueR"><rsc:item row="<%=resultRow%>" name="point_total" format="0.00"/></TD>
            <td class="valueR"><rsc:item row="<%=resultRow%>" name="system_point_total" format="0.00"/></TD>
            <td class="valueR"><rsc:item row="<%=resultRow%>" name="new_rating" /></TD>
            <td class="valueR"><rsc:item row="<%=resultRow%>" name="new_vol" /></TD>
            <td class="valueR">
                <a href="/longcontest/stats/?module=ViewSystemTestResults&pm=<rsc:item row="<%=resultRow%>" name="problem_id"/>&rd=<rsc:item row="<%=resultRow%>" name="round_id"/>&cr=<rsc:item row="<%=resultRow%>" name="coder_id"/>">Results</a>
            </td>
        </tr>
    <%even=!even;%>
    </rsc:iterator>


    <%-- else for no competition history
             <TR>
                <TD COLSPAN="7" class="value">This member has no competition history.</TD>
             </TR>
    --%>
</tbody>
</TABLE>

<%--
            <div class="pagingBox">
                <a href="/" class="bcLink">&lt;&lt; previous</a>
                &nbsp;|&nbsp;
                <a href="/" class="bcLink">next &gt;&gt;</a>
            </div>
--%>
            <div class="pagingBox">&nbsp;</div>

            <% } else { %>
            <p>This member has no history.</p>
            <% } %>
            <p><br></p>
            <!-- END BODY -->

        </TD>
        <td WIDTH="180" VALIGN="top">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="profile"/>
            </jsp:include>
        </TD>
        <!-- Gutter -->
        <td WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" border="0"/></TD>
        <!-- Gutter Ends -->
    </tr>
</TABLE>
<jsp:include page="../foot.jsp"/>
</BODY>
</HTML>
