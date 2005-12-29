<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="java.util.Map" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer results = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("long_comp_history"); %>

<HTML>
<HEAD>
    <TITLE>TopCoder Statistics</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <jsp:include page="baseHRef.jsp"/>
    <jsp:include page="../script.jsp"/>
</HEAD>

<BODY>
<jsp:include page="../top.jsp"/>

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR valign="top">

        <TD WIDTH="180">
            <!-- Left nav begins -->
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
            </jsp:include>
            <!-- Left nav ends -->
        </TD>

        <!-- Center Column Begins -->
        <td class="statTableSpacer" width="100%" valign="top">

            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="statistics_w"/>
                <jsp:param name="title" value="Long Contest Competition History"/>
            </jsp:include>

            <% if (results!=null && !results.isEmpty()) { %>
            <span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='<%=results.getLongItem(0, "coder_id")%>'/></span>
            <br>
            <span class="bodySubtitle">Marathon Match Statistics&#160;>&#160;</span><br>
            <span class="bc">
<A HREF="/" class="bcLink">Member Profile</A>
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

            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
                            <tr><td class="tableTitle" colspan="4">Long Contest Competition History</td></tr>
                            <tr>
                                <TD CLASS="tableHeader" width="25%">Competition</TD>
                                <TD CLASS="tableHeader" width="25%" align="right">Rank</TD>
                                <TD CLASS="tableHeader" width="25%" align="right">Score</TD>
                                <TD CLASS="tableHeader" width="25%" align="right">&#160;</TD>
                            </tr>
                            <%boolean even = true;%>
                            <rsc:iterator list="<%=results%>" id="resultRow">
                                <tr>
                                    <TD class="<%=even?"statLt":"statDk"%>"><A href="/longcontest/?module=ViewOverview&rd=<rsc:item row="<%=resultRow%>" name="round_id"/>">Long Contest</A>
                                    </TD>
                                    <TD class="<%=even?"statLt":"statDk"%>" align="right"><rsc:item row="<%=resultRow%>" name="placed"/></TD>
                                    <TD class="<%=even?"statLt":"statDk"%>" align="right"><rsc:item row="<%=resultRow%>" name="point_total" format="0.00"/></TD>
                                    <TD class="<%=even?"statLt":"statDk"%>" align="right">
                                        <a href="/longcontest/longcontest?module=ViewSystemTestResults&pm=<rsc:item row="<%=resultRow%>" name="problem_id"/>&rd=<rsc:item row="<%=resultRow%>" name="round_id"/>">Results</a>
                                    </TD>
                                </tr>
                            <%even=!even;%>
                            </rsc:iterator>


                            <%-- else for no competition history
                                     <TR>
                                        <TD COLSPAN="7" class="bcLink">This member has no component history.</TD>
                                     </TR>
                            --%>
                        </TABLE>
                    </TD>
                </TR>
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
