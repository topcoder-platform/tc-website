<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.shared.util.ApplicationServer,
                com.topcoder.web.common.model.SoftwareComponent,
                com.topcoder.web.tc.Constants" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<HTML>
<HEAD>
    <TITLE>TopCoder Statistics</TITLE>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <jsp:include page="baseHRef.jsp"/>
    <jsp:include page="/script.jsp"/>
    <script type="text/javascript" src="/js/popup.js"></script>
</HEAD>

<BODY>
<jsp:include page="../top.jsp"/>

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR valign="top">
<%
    ResultSetContainer rsc2 = (ResultSetContainer) request.getAttribute(Constants.HISTORY_LIST_KEY);
    String type = (String) request.getAttribute(Constants.TYPE_KEY);
    String phaseId = (String) request.getParameter(Constants.PHASE_ID);
    String coderId = (String) request.getParameter(Constants.CODER_ID);
%>
<TD WIDTH="180">
    <!-- Left nav begins -->
    <% if (phaseId.equals(String.valueOf(SoftwareComponent.DEV_PHASE))) { %>
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="m_dev_competitions"/>
    </jsp:include>
    <% } else { %>
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="m_des_competitions"/>
    </jsp:include>
    <% } %>
    <!-- Left nav ends -->
</TD>

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">


    <% if (phaseId.equals(String.valueOf(SoftwareComponent.DEV_PHASE))) { %>
    <jsp:include page="../page_title.jsp">
        <jsp:param name="image" value="comp_development"/>
        <jsp:param name="title" value="Component Development Current Contests"/>
    </jsp:include>
    <% } else { %>
    <jsp:include page="../page_title.jsp">
        <jsp:param name="image" value="comp_design"/>
        <jsp:param name="title" value="Component Design Current Contests"/>
    </jsp:include>
    <% } %>

    <span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='<%=coderId%>' context='<%=type%>'/></span>
    <br>
    <% if (phaseId.equals(String.valueOf(SoftwareComponent.DEV_PHASE))) { %>
    <span class="bodySubtitle">Development Statistics&#160;>&#160;</span><br>
    <% } else { %>
    <span class="bodySubtitle">Design Statistics&#160;>&#160;</span><br>
    <% } %>
    <span class="bc">
    <A HREF="/tc?module=MemberProfile&cr=<%=coderId%>" class="bcLink">Member Profile</A>
 | <A HREF="/tc?module=CompetitionHistory&ph=<%=phaseId%>&cr=<%=coderId%>" class="bcLink">Competition History</A>
 | Current Contests
 | <A HREF="/tc?module=ReliabilityDetail&ph=<%=phaseId%>&uid=<%=coderId%>" class="bcLink">Reliability Detail</A>
   </span>

    <div class="pagingBox" style="clear:both;">&#160;</div>

    <table class="stat" cellpadding="0" cellspacing="0" width="100%">
        <tr><td class="title" colspan="10">
            Current
            <% if (phaseId.equals(String.valueOf(SoftwareComponent.DEV_PHASE))) {%>
            Development
            <% } else { %>
            Design
            <% } %>
            Contests
        </td></tr>
        <tr>
            <TD CLASS="header">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true"/>">Date</a>
            </TD>
            <TD CLASS="header" width="40%">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Component</a>
            </TD>
            <TD CLASS="headerC" width="20%">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="5" includeParams="true"/>">Submissions</a>
            </TD>
            <TD CLASS="headerC" width="20%">
                <div id="popDR" class="popUp"><div>Digital Run</div></div>
                <div align="center"><a href='/tc?module=Static&d1=digital_run&d2=description'><img class="emblem" src="/i/interface/emblem/digitalrun.png" alt="" border="0" onmouseover="popUp(this,'popDR')" onmouseout="popHide()" /></a></div>
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="6" includeParams="true"/>">Potential
                    Points</a>*
            </TD>
            <TD CLASS="headerR" width="20%">&#160;</TD>
        </tr>
        <% if (rsc2.isEmpty()) {%>
        <tr class="light">
            <TD class="value" colspan="5">
                <tc-webtag:handle coderId='<%=coderId%>' context='<%=type%>'/> has no current contests.
            </TD>
        </tr>
        <% } else { %>
        <%boolean even = false;%>
        <rsc:iterator list="<%=rsc2%>" id="resultRow">
            <tr class="<%=even?"dark":"light"%>">
                <TD class="value"><rsc:item name="posting_date" row="<%=resultRow%>" format="MM.dd.yy"/></TD>
                <TD class="value">
                    <% if (resultRow.getItem("component_id").getResultData() != null && resultRow.getIntItem("viewable_category_ind") == 1) { %>
                    <A HREF="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" row="<%=resultRow%>"/>" CLASS="statLink">
                        <rsc:item name="component_name" row="<%=resultRow%>"/>
                    </A>
                    <% } else { %>
                    <rsc:item name="component_name" row="<%=resultRow%>"/>
                    <% } %>
                </TD>
                <TD class="valueC"><rsc:item name="num_valid_submissions" row="<%=resultRow%>"/></TD>
                <TD class="valueC"><rsc:item name="outstanding_points" row="<%=resultRow%>"/></TD>
                <TD class="valueR" nowrap="nowrap">
                    <% if (resultRow.getItem("project_id").getResultData() != null) { %>
                    <A HREF="/tc?module=ViewRegistrants&pj=<rsc:item name="project_id" row="<%=resultRow%>"/>" CLASS="statLink">
                        Contest Details
                    </A>
                    <% } %>
                </TD>
            </tr>
            <%even = !even;%>
        </rsc:iterator>
        <% } %>
    </TABLE>
    * Assuming first place finish with all current contests with all competitors passing review

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
