<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.common.model.SoftwareComponent" %>
<%@ page import="com.topcoder.web.common.tag.HandleTag" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% ResultSetContainer changeList = (ResultSetContainer) request.getAttribute("change_list");%>
<%
    //figure out what we should be linking to
    String context = (String) request.getAttribute("context");
    String typeParam;
    boolean isTCAlgo = false;
    boolean isHSAlgo = false;
    String titleName;
    String node;
    if (HandleTag.ALGORITHM.equals(context)) {
        typeParam = Constants.ALGO_RATING_TYPE_ID + "=" + Constants.TC_ALGO_RATING_TYPE_ID;
        isTCAlgo = true;
        titleName = "Algorithm";
        node = "algo_color_changes";
    } else if (HandleTag.HS_ALGORITHM.equals(context)) {
        typeParam = Constants.ALGO_RATING_TYPE_ID + "=" + Constants.HS_ALGO_RATING_TYPE_ID;
        isHSAlgo = true;
        titleName = "TCHS";
        node = "hs_algo_color_changes";
    } else if (HandleTag.DESIGN.equals(context)) {
        typeParam = Constants.PHASE_ID + "=" + SoftwareComponent.DESIGN_PHASE;
        titleName = "Design";
        node = "des_color_changes";
    } else {
        typeParam = Constants.PHASE_ID + "=" + SoftwareComponent.DEV_PHASE;
        titleName = "Development";
        node = "dev_color_changes";
    }
%>
<c:set value="<%=typeParam%>" var="typeParam"/>
<c:set value="<%=context%>" var="context"/>
<c:set value="<%=Boolean.valueOf(isTCAlgo)%>" var="isTCAlgo"/>
<c:set value="<%=Boolean.valueOf(isHSAlgo)%>" var="isHSAlgo"/>
<HTML>
<HEAD>
    <TITLE>TopCoder Statistics</TITLE>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <jsp:include page="../script.jsp"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript"><!--
    function next() {
        document.colorChangeForm.<%=DataAccessConstants.START_RANK%>.value =<%=changeList.getStartRow()+Constants.COLOR_CHANGE_SCROLL_SIZE%>;
        document.colorChangeForm.<%=DataAccessConstants.END_RANK%>.value =<%=changeList.getEndRow()+Constants.COLOR_CHANGE_SCROLL_SIZE%>;
        document.colorChangeForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
        document.colorChangeForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
        document.colorChangeForm.<%=Constants.COLOR%>.value = '<%=request.getParameter(Constants.COLOR)==null?"":request.getParameter(Constants.COLOR)%>';
        document.colorChangeForm.submit();
    }
    function previous() {
        document.colorChangeForm.<%=DataAccessConstants.START_RANK%>.value =<%=changeList.getStartRow()-Constants.COLOR_CHANGE_SCROLL_SIZE%>;
        document.colorChangeForm.<%=DataAccessConstants.END_RANK%>.value =<%=changeList.getEndRow()-Constants.COLOR_CHANGE_SCROLL_SIZE%>;
        document.colorChangeForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
        document.colorChangeForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
        document.colorChangeForm.<%=Constants.COLOR%>.value = '<%=request.getParameter(Constants.COLOR)==null?"":request.getParameter(Constants.COLOR)%>';
        document.colorChangeForm.submit();
    }
    //--></script>
</HEAD>
<BODY>
<jsp:include page="../top.jsp"/>
<table WIDTH="100%" border="0" CELLPADDING="0" CELLSPACING="0">
<tr>
<td WIDTH="180" VALIGN="top">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="<%=node%>"/>
    </jsp:include>
</TD>
<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="<%="Recent Handle Color Changes - "+titleName%>"/>
</jsp:include>


<div align="center" style="padding-bottom: 10px;">
This chart shows all instances of a member changing handle colors in the last 30 days.<br>
    <strong>
        <A href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ColorChange&amp;${typeParam}" class="bcLink">All
            changes</A>
        |
        <c:if test="${param.color=='Gray'}"><span class="selected"></c:if>
        <A href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ColorChange&amp;<%=Constants.COLOR%>=Gray&amp;${typeParam}" class="coderTextGray">Grays</A><c:if test="${param.color=='Gray'}"></span></c:if>

        |
        <c:if test="${param.color=='Green'}"><span class="selected"></c:if>
        <A href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ColorChange&amp;<%=Constants.COLOR%>=Green&amp;${typeParam}" class="coderTextGreen">Greens</A><c:if test="${param.color=='Green'}"></span></c:if>

        |
        <c:if test="${param.color=='Blue'}"><span class="selected"></c:if>
        <A href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ColorChange&amp;<%=Constants.COLOR%>=Blue&amp;${typeParam}" class="coderTextBlue">Blues</A><c:if test="${param.color=='Blue'}"></span></c:if>

        |
        <c:if test="${param.color=='Yellow'}"><span class="selected"></c:if>
        <A href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ColorChange&amp;<%=Constants.COLOR%>=Yellow&amp;${typeParam}" class="coderTextYellow">Yellows</A><c:if test="${param.color=='Yellow'}"></span></c:if>

        |
        <c:if test="${param.color=='Red'}"><span class="selected"></c:if>
        <A href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ColorChange&amp;<%=Constants.COLOR%>=Red&amp;${typeParam}" class="coderTextRed">Reds</A><c:if test="${param.color=='Red'}"></span></c:if>
    </strong>
</div>



<form name="colorChangeForm" method="get">
<input type="hidden" name="module" value="ColorChange"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.START_RANK%>"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.END_RANK%>"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
<tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
<tc-webtag:hiddenInput name="<%=Constants.PHASE_ID%>"/>
<tc-webtag:hiddenInput name="<%=Constants.ALGO_RATING_TYPE_ID%>"/>
<tc-webtag:hiddenInput name="<%=Constants.COLOR%>"/>

<div align="center">
Enter a member's handle here to narrow the chart down to just that member:<br>
<tc-webtag:textInput name="<%=Constants.HANDLE%>"/> <button name="handleSubmit" value="submit" type="submit">Submit</button>
</div>

<div class="pagingBox">
    <%=(changeList.croppedDataBefore() ? "<a href=\"Javascript:previous()\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
    | <%=(changeList.croppedDataAfter() ? "<a href=\"Javascript:next()\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
</div>
<table cellpadding="0" cellspacing="0" class="stat" width="100%">
    <tbody>
        <tr>
            <td class="title" colspan="6">
                Recent Handle Color Changes
            </td>
        </tr>
        <tr>
            <% String exclude = Constants.MODULE_KEY + " " + DataAccessConstants.START_RANK + " " + DataAccessConstants.END_RANK;%>
            <td class="header">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ColorChange<tc-webtag:sort column="<%=changeList.getColumnIndex("handle_lower")%>" includeParams="true" excludeParams="<%=exclude%>"/>">Handle</a>
            </td>
            <td class="header" width="100%">
                <c:choose>
                    <c:when test="${isTCAlgo||isHSAlgo}">
                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ColorChange<tc-webtag:sort column="<%=changeList.getColumnIndex("short_name")%>" includeParams="true" excludeParams="<%=exclude%>"/>">Event</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ColorChange<tc-webtag:sort column="<%=changeList.getColumnIndex("component_name")%>" includeParams="true" excludeParams="<%=exclude%>"/>">Event</a>
                    </c:otherwise>
                </c:choose>
            </td>
            <td class="headerC">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ColorChange<tc-webtag:sort column="<%=changeList.getColumnIndex("date")%>" includeParams="true" excludeParams="<%=exclude%>"/>">Date</a>
            </td>
            <td class="headerC" nowrap="nowrap">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ColorChange<tc-webtag:sort column="<%=changeList.getColumnIndex("old_rating")%>" includeParams="true" excludeParams="<%=exclude%>"/>">Old
                    Rating</a>
            </td>
            <td class="headerC" nowrap="nowrap">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ColorChange<tc-webtag:sort column="<%=changeList.getColumnIndex("new_rating")%>" includeParams="true" excludeParams="<%=exclude%>"/>">New
                    Rating</a>
            </td>
            <td class="headerC" nowrap="nowrap">
                <a onmouseover="document.images['up_or_down'].src = '/i/interface/up_or_down_on.png';" onmouseout="document.images['up_or_down'].src = '/i/interface/up_or_down.png';" href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ColorChange<tc-webtag:sort column="<%=changeList.getColumnIndex("color_increase")%>" includeParams="true" excludeParams="<%=exclude%>"/>"><img src="/i/interface/up_or_down.png" alt="" name="up_or_down" border="0"/></a>
            </td>
        </tr>
        <% boolean even = true; %>
        <% even = !even; %>

        <rsc:iterator list="<%=changeList%>" id="resultRow">
            <tr class="<%=even?"dark":"light"%>">
                <td class="value" nowrap>
                    <tc-webtag:handle coderId="<%=resultRow.getLongItem("user_id")%>" context="${context}"/>
                </td>
                <td class="value">
                    <c:choose>
                        <c:when test="${isTCAlgo}">
                            <A href="/stat?c=coder_room_stats&amp;cr=<rsc:item name="user_id" row="<%=resultRow%>"/>&amp;rd=<rsc:item name="round_id" row="<%=resultRow%>"/>">
                                <rsc:item name="short_name" row="<%=resultRow%>"/>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${isHSAlgo}">
                                    <A href="/tc?module=HSRoomStats&amp;rd=<rsc:item name="round_id" row="<%=resultRow%>"/>&amp;cr=<rsc:item name="user_id" row="<%=resultRow%>"/>">
                                        <rsc:item name="short_name" row="<%=resultRow%>"/>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/tc?module=CompContestDetails&amp;pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">
                                        <rsc:item name="component_name" row="<%=resultRow%>"/>
                                        <rsc:item name="version_text" row="<%=resultRow%>"/>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td class="valueC">
                    <rsc:item name="date" row="<%=resultRow%>" format="MM.dd.yyyy"/>
                </td>
                <td class="valueC"><span class="coderText<rsc:item name="old_color" row="<%=resultRow%>"/>"><rsc:item name="old_rating" row="<%=resultRow%>"/></span>
                </td>
                <td class="valueC"><span class="coderText<rsc:item name="new_color" row="<%=resultRow%>"/>"><rsc:item name="new_rating" row="<%=resultRow%>"/></span>
                </td>
                <td class="valueC" style="vertical-align: middle;">
                    <% if (resultRow.getBooleanItem("color_increase")) { %>
                    <img src="/i/interface/greenUp.gif" alt="Up"/>
                    <% } else { %>
                    <img src="/i/interface/redDown.gif" alt="Down"/>
                    <% } %>
                </td>
            </tr>
            <% even = !even; %>
        </rsc:iterator>
    </tbody>
</table>
<div class="pagingBox">
    <%=(changeList.croppedDataBefore() ? "<a href=\"Javascript:previous()\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
    | <%=(changeList.croppedDataAfter() ? "<a href=\"Javascript:next()\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
</div>
</form>

</div>
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