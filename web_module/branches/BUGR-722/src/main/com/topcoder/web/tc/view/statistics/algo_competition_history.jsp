<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.DataAccessConstants,
                com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.web.tc.Constants" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=com.topcoder.web.common.BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>

<HTML>
<HEAD>
    <TITLE>TopCoder Statistics</TITLE>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <jsp:include page="baseHRef.jsp"/>
    <jsp:include page="../script.jsp"/>
    <script type="text/javascript">
        var sr = <c:out value="${requestScope[defaults][startRank]}"/>;
        var er = <c:out value="${requestScope[defaults][endRank]}"/>;
    
        function next() {
            var myForm = document.algoCompetitionHistoryForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value = er + 1;
            myForm.<%=DataAccessConstants.END_RANK%>.value = 2 * er - sr + 1;
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
        }
        function previous() {
            var myForm = document.algoCompetitionHistoryForm;
            myForm.<%=DataAccessConstants.END_RANK%>.value =sr - 1;
            myForm.<%=DataAccessConstants.START_RANK%>.value = 2 * sr - er - 1;
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
        }
    </script>
</HEAD>

<BODY>
<jsp:include page="../top.jsp"/>

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR valign="top">

<TD WIDTH="180">
    <!-- Left nav begins -->
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="m_competitor_stats"/>
    </jsp:include>
    <!-- Left nav ends -->
</TD>

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">

    <%
        ResultSetContainer rsc2 = (ResultSetContainer) request.getAttribute(Constants.CODER_LIST_KEY);
        String coderId = (String) request.getParameter(Constants.CODER_ID);
    %>

    <jsp:include page="../page_title.jsp">
        <jsp:param name="image" value="statistics_w"/>
        <jsp:param name="title" value="Algorithm Competition History"/>
    </jsp:include>

    <span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='<%=coderId%>' context='algorithm'/></span>
    <br>
    <span class="bodySubtitle">Algorithm Statistics&#160;>&#160;</span><br>
    <span class="bc">
    <A HREF="/tc?module=MemberProfile&cr=<%=coderId%>" class="bcLink">Member Profile</A>
    &#160;|&#160;Competition History
</span>


    <div class="pagingBox" style="clear:both;">
        <% if (rsc2.croppedDataBefore() || rsc2.croppedDataAfter()) { %>
        <%=(rsc2.croppedDataBefore() ? "<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
        | <%=(rsc2.croppedDataAfter() ? "<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
        <% } else { %>
        &#160;
        <% } %>
    </div>

    <form name="algoCompetitionHistoryForm" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="get">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AlgoCompetitionHistory"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.START_RANK%>"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.END_RANK%>"/>
        <tc-webtag:hiddenInput name="<%=Constants.CODER_ID%>"/>
        <table class="stat" cellpadding="0" cellspacing="0" width="100%">
            <tr><td class="title" colspan="9">
                Algorithm Competition History
            </td></tr>
            <tr>
                <TD CLASS="header">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="0" includeParams="true"/>">Date</a>
                </TD>
                <TD CLASS="header" WIDTH="50%">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true"/>">Contest</a>
                </TD>
                <TD CLASS="header" WIDTH="50%">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>">Round</a>
                </TD>
                <TD CLASS="headerC">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Place</a>
                </TD>
                <TD CLASS="headerR">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="4" includeParams="true"/>">Rating</a>
                </TD>
                <TD CLASS="headerR">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="5" includeParams="true"/>">Volatility</a>
                </TD>
                <TD CLASS="headerC">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="6" includeParams="true"/>">Rank</a>
                </TD>
                <TD CLASS="headerR">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="7" includeParams="true"/>">Earnings</a>
                </TD>
                <TD CLASS="headerC">
                    <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="8" includeParams="true"/>">Payment
                        Type</a></TD>
            </tr>
            <%boolean even = true;%>
            <rsc:iterator list="<%=rsc2%>" id="resultRow">
                <tr class="<%=even?"dark":"light"%>">
                    <TD class="value"><rsc:item name="date" row="<%=resultRow%>" format="MM.dd.yy"/></TD>
                    <TD class="value">
                        <A HREF="/stat?c=coder_room_stats&cr=<%=coderId%>&rd=<rsc:item name="round_id" row="<%=resultRow%>"/>&rm=<rsc:item name="room_id" row="<%=resultRow%>"/>" CLASS="statLink">
                            <rsc:item name="contest_name" row="<%=resultRow%>"/>
                        </A>
                    </TD>
                    <TD class="value">
                        <A HREF="/stat?c=coder_room_stats&cr=<%=coderId%>&rd=<rsc:item name="round_id" row="<%=resultRow%>"/>&rm=<rsc:item name="room_id" row="<%=resultRow%>"/>" CLASS="statLink">
                            <rsc:item name="round_name" row="<%=resultRow%>"/>
                        </A>
                    </TD>
                    <TD class="valueC"><rsc:item name="room_placed" row="<%=resultRow%>"/></TD>
                    <TD class="valueR"><rsc:item name="new_rating" row="<%=resultRow%>"/></TD>
                    <TD class="valueR"><rsc:item name="vol" row="<%=resultRow%>"/></TD>
                    <TD class="valueC"><rsc:item name="rank" row="<%=resultRow%>"/></TD>
                    <TD class="valueR">
                        <% if (resultRow.getItem("paid").getResultData() != null && resultRow.getDoubleItem("paid") > 0) { %>
                        $&nbsp;<rsc:item name="paid" row="<%=resultRow%>" format="0.00"/>
                        <% } else { %>
                        &nbsp;
                        <% } %>
                    </TD>
                    <TD class="valueC" nowrap="nowrap"><rsc:item name="payment_type_desc" row="<%=resultRow%>"/></TD>
                </tr>
                <%even = !even;%>
            </rsc:iterator>
        </TABLE>
    </FORM>

    <div class="pagingBox">
        <% if (rsc2.croppedDataBefore() || rsc2.croppedDataAfter()) { %>
        <%=(rsc2.croppedDataBefore() ? "<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
        | <%=(rsc2.croppedDataAfter() ? "<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
        <% } else { %>
        &#160;
        <% } %>
    </div>

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
