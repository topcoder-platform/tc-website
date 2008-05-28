<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.DataAccessConstants,
                com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.shared.util.ApplicationServer,
                com.topcoder.web.common.model.SoftwareComponent,
                com.topcoder.web.tc.Constants" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="<%=com.topcoder.web.common.BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>
<c:set value="<%=DataAccessConstants.END_RANK%>" var="endRank"/>

<HTML>
<HEAD>
    <TITLE>TopCoder Statistics</TITLE>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <jsp:include page="baseHRef.jsp"/>
    <jsp:include page="../script.jsp"/>
    <script type="text/javascript" src="/js/popup.js"></script>
    <script type="text/javascript">
        var sr = <c:out value="${requestScope[defaults][startRank]}"/>;
        var er = <c:out value="${requestScope[defaults][endRank]}"/>;
    
        function next() {        
            var myForm = document.competitionHistoryForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value = er + 1;
            myForm.<%=DataAccessConstants.END_RANK%>.value = 2 * er - sr + 1;
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
        }
        function previous() {
            var myForm = document.competitionHistoryForm;
            myForm.<%=DataAccessConstants.END_RANK%>.value = sr - 1;
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

<%
    ResultSetContainer rsc2 = (ResultSetContainer) request.getAttribute(Constants.HISTORY_LIST_KEY);
    //String type = (String) request.getAttribute(Constants.TYPE_KEY);
    //String projectTypeId = (String) request.getParameter(Constants.PROJECT_TYPE_ID);
    //String coderId = (String) request.getParameter(Constants.CODER_ID);
%>

<c:set value="<%=Constants.DESIGN_PROJECT_TYPE%>" var="DESIGN_PROJECT_TYPE"/>
<c:set value="<%=Constants.DEVELOPMENT_PROJECT_TYPE%>" var="DEVELOPMENT_PROJECT_TYPE"/>
<c:set value="<%=Constants.ASSEMBLY_PROJECT_TYPE%>" var="ASSEMBLY_PROJECT_TYPE"/>

<TD WIDTH="180">
    <!-- Left nav begins -->
    <c:choose>
        <c:when test="${pt == DESIGN_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_des_competitions"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_dev_competitions"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_assembly_competitions"/>
            </jsp:include>
        </c:when>        
    </c:choose>
    <!-- Left nav ends -->
</TD>

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">

    <c:choose>
        <c:when test="${pt == DESIGN_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="comp_design"/>
                <jsp:param name="title" value="Component Design Competition History"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="comp_development"/>
                <jsp:param name="title" value="Component Development Competition History"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="assembly"/>
                <jsp:param name="title" value="Assembly Competition History"/>
            </jsp:include>
        </c:when>        
    </c:choose>

<span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='${cr}' context='${type}'/></span>
<br>
    <c:choose>
        <c:when test="${pt == DESIGN_PROJECT_TYPE}">
            <span class="bodySubtitle">Design Statistics&#160;>&#160;</span><br>
        </c:when>
        <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
            <span class="bodySubtitle">Development Statistics&#160;>&#160;</span><br>
        </c:when>
        <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
            <span class="bodySubtitle">Assembly Statistics&#160;>&#160;</span><br>
        </c:when>        
    </c:choose>

    <span class="bc">
    <A HREF="/tc?module=MemberProfile&cr=${cr}" class="bcLink">Member Profile</A>
 | Competition History
 | <A HREF="/tc?module=OutstandingProjects&cr=${cr}&pt=${pt}" class="bcLink">Current Contests</A>
    <c:choose>
        <c:when test="${pt == DESIGN_PROJECT_TYPE}">
             | <A HREF="/tc?module=ReliabilityDetail&ph=112&uid=${cr}" class="bcLink">Reliability Detail</A>
        </c:when>
        <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
             | <A HREF="/tc?module=ReliabilityDetail&ph=113&uid=${cr}" class="bcLink">Reliability Detail</A>
        </c:when>
    </c:choose>
</span>


<div class="pagingBox" style="clear:both;">
    <% if (rsc2.croppedDataBefore() || rsc2.croppedDataAfter()) { %>
    <%=(rsc2.croppedDataBefore() ? "<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
    | <%=(rsc2.croppedDataAfter() ? "<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
    <% } else { %>
    &#160;
    <% } %>
</div>

<form name="competitionHistoryForm" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="get">
    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="CompetitionHistory"/>
    <tc-webtag:hiddenInput name="<%=Constants.PROJECT_TYPE_ID%>" value="${pt}"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.START_RANK%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.END_RANK%>"/>
    <tc-webtag:hiddenInput name="<%=Constants.CODER_ID%>" value="${cr}"/>
    <table class="stat" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <c:choose>
                <c:when test="${pt == DESIGN_PROJECT_TYPE}">
                    <td class="title" colspan="10">
                    Design
                </c:when>
                <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
                    <td class="title" colspan="10">
                    Development
                </c:when>
                <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
                    <td class="title" colspan="8">
                    Assembly
                </c:when>        
            </c:choose>
            Competition History
        </td></tr>
        <tr>
            <TD CLASS="header">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Date</a>
            </TD>
            <c:choose>
                <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
                    <TD CLASS="header" WIDTH="54%">
                </c:when>
                <c:otherwise>
                    <TD CLASS="header" WIDTH="36%">
                </c:otherwise>        
            </c:choose>
            
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="4" includeParams="true"/>">Component</a>
            </TD>
            <c:if test="${pt != ASSEMBLY_PROJECT_TYPE}">
            <TD CLASS="header" WIDTH="8%">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=rsc2.getColumnIndex("category_desc")%>" includeParams="true"/>">Category</a>
            </TD>
            </c:if>
            <TD CLASS="headerR" WIDTH="8%">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="8" includeParams="true"/>">Score</a>
            </TD>
            <TD CLASS="headerC" WIDTH="8%">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=rsc2.getColumnIndex("num_submissions")%>" includeParams="true"/>">Submissions</a>
            </TD>
            <TD CLASS="headerC" WIDTH="8%">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="5" includeParams="true"/>">Passed<br>
                    Review</a></TD>
            <TD CLASS="headerC" WIDTH="8%">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="6" includeParams="true"/>">Place</a>
            </TD>
            <c:if test="${pt != ASSEMBLY_PROJECT_TYPE}">
            <TD CLASS="headerR" WIDTH="8%">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="10" includeParams="true"/>">Rating</a>
            </TD>
            </c:if>
            <TD CLASS="headerC" WIDTH="8%">
                <div id="popDR" class="popUp"><div>Digital Run</div></div>
                <div align="center"><a href='/tc?module=Static&d1=digital_run&d2=description'><img src="/i/interface/emblem/digitalrun.png" alt="" border="0" onmouseover="popUp(this,'popDR')" onmouseout="popHide()" /></a></div>
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="7" includeParams="true"/>">Points</a>
            </TD>
            <TD CLASS="headerR" WIDTH="8%" align="right">&#160;</TD>
        </tr>
        <%boolean even = false;%>
        <rsc:iterator list="<%=rsc2%>" id="resultRow">
            <tr class="<%=even?"dark":"light"%>">
                <TD class="value"><rsc:item name="rating_date" row="<%=resultRow%>" format="MM.dd.yy"/></TD>
                <TD class="value">
                    <% if (resultRow.getItem("component_id").getResultData() != null && resultRow.getIntItem("viewable_category_ind") == 1) { %>
                    <A HREF="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" row="<%=resultRow%>"/>" CLASS="statLink">
                        <rsc:item name="component_name" row="<%=resultRow%>"/>
                    </A>
                    <% } else { %>
                    <rsc:item name="component_name" row="<%=resultRow%>"/>
                    <% } %>
                </TD>
                <c:if test="${pt != ASSEMBLY_PROJECT_TYPE}">
                <TD class="value"><rsc:item name="category_desc" row="<%=resultRow%>"/></TD>
                </c:if>
                <TD class="valueR"><rsc:item name="final_score" row="<%=resultRow%>" format="0.00"/></TD>
                <TD class="valueC"><rsc:item name="num_submissions" row="<%=resultRow%>" ifNull=""/></TD>
                <TD class="valueC"><rsc:item name="num_submissions_passed_review" row="<%=resultRow%>"/></TD>
                <TD class="valueC"><rsc:item name="placed" row="<%=resultRow%>"/></TD>
                <c:if test="${pt != ASSEMBLY_PROJECT_TYPE}">
                <TD class="valueR"><rsc:item name="new_rating" row="<%=resultRow%>"/></TD>
                </c:if>
                <TD class="valueC">
                    <% if (resultRow.getItem("final_points").getResultData() != null) { %>
                    <rsc:item name="final_points" row="<%=resultRow%>" format="0.00"/>
                    <% } else { %>
                    &nbsp;
                    <% } %>
                </TD>
                <TD class="valueR" nowrap="nowrap">
                    <c:if test="${pt != ASSEMBLY_PROJECT_TYPE}">
                        <% if (resultRow.getItem("project_id").getResultData() != null) { %>
                        <A HREF="/tc?module=CompContestDetails&pj=<rsc:item name="project_id" row="<%=resultRow%>"/>" CLASS="statLink">
                            Contest Details
                        </A>
                        <% } %>
                    </c:if>
                </TD>
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
