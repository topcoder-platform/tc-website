<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java"
         import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.controller.request.hs.ListInfo,
                 com.topcoder.web.tc.controller.request.hs.RoundInfo,
                 com.topcoder.web.tc.Constants,
                 java.util.Map" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>TopCoder High School Competitions</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

    <%
        Map resultMap = (Map) request.getAttribute("resultMap");
        ResultSetContainer seasons = (ResultSetContainer) resultMap.get("seasons");
        ResultSetContainer result = (ResultSetContainer) resultMap.get("hs_coder_rank");

        RoundInfo round = (RoundInfo) request.getAttribute("roundInfo");
        ListInfo li = (ListInfo) request.getAttribute("listInfo");

        int totalRows = Integer.parseInt((String) request.getAttribute("totalRows"));

    %>

    <script language="JavaScript">
        <!--

        function selectSeason(selection)
        {
            window.location = "/tc?module=HSRank&snid=" + selection.options[selection.selectedIndex].value;
        }

        function clickColumn(n)
        {
            var sd = "asc";

            if (n == <%= li.getSortColumn() %>) {
                if ("asc" == "<%= li.getSortDirection() %>") {
                    sd = "desc";
                }
            }

            window.location = "/tc?module=HSRank&snid=<%= round.getSeasonId() %>&sc=" + n + "&sd=" + sd;
        }


        function showRows(sr, nr, adjust)
        {

            if (adjust) {
                if (sr > <%= totalRows %>) sr = <%= totalRows %>;
                if (sr < 1) sr = 1;
            } else {

                if (isNaN(parseInt(nr)) || parseInt(nr) < 1)
                {
                    alert(nr + " is not a valid positive integer");
                    return;
                }
                if (isNaN(parseInt(sr)) || parseInt(sr) < 1)
                {
                    alert(sr + " is not a valid positive integer");
                    return;
                }
            }

            window.location = "/tc?module=HSRank&snid=<%= round.getSeasonId() %>&rd=<%= round.getRoundId() %>" +
                              "&sc=<%= li.getSortColumn() %>&sd=<%= li.getSortDirection() %>&sr=" + sr + "&nr=" + nr;

        }

        function submitEnter(e)
        {
            var keycode;
            if (window.event) keycode = window.event.keyCode;
            else if (e) keycode = e.which;
            else return true;
            if (keycode == 13) {
                showRows(document.pagingForm.sr.value, document.pagingForm.nr.value, false);
            } else return true;
        }


        function clickColumn(n)
        {
            var sd = "asc";
            if ((n == <%= li.getSortColumn() %>) && ("asc" == "<%= li.getSortDirection() %>")) {
                sd = "desc";
            }
            window.location = "/tc?module=HSRank&snid=<%= round.getSeasonId() %>&rd=<%= round.getRoundId() %>" +
                              "&sc=" + n + "&sd=" + sd;

        }

        // -->
    </script>
</head>

<body>

<jsp:include page="/top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="top_rated_hs"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
        <td width="100%" align="center" class="bodyColumn">

            <div class="fixedWidthBody">
                <jsp:include page="/page_title.jsp">
                    <jsp:param name="image" value="top_ranked"/>
                    <jsp:param name="title" value="High School Competitions"/>
                </jsp:include>

                <div style="float:right; padding-left:10px;" align="right">
                    <% if (seasons.getRowCount() > 1) { %>
                    <div style="padding-bottom:5px;">
                        <tc-webtag:rscSelect name="snid" list="<%=seasons%>" fieldText="name" fieldValue="season_id" selectedValue="<%= round.getSeasonId() + ""%>" useTopValue="false" onChange="selectSeason(this)"/>
                    </div>
                    <% } %>
                </div>

                <span class="subtitle">Top Ranked > High School Competitions</span><br>
                <span class="subtitle">Season: <%= round.getSeasonName() %></span><br>

<span class="bc">
Coders |
<a href="/tc?module=HSTeamRank&snid=<%= round.getSeasonId() %>" class="bcLink">Teams</a> |
<a href="/tc?module=HSCountryRank&snid=<%= round.getSeasonId() %>" class="bcLink">Countries</a>
</span>

                <div class="pagingBox">
                    <%=(result.croppedDataBefore() ? ("<a href='Javascript:showRows(" + (li.getStartRow() - li.getNumberOfRows()) + "," + li.getNumberOfRows() + ", true)'>&lt;&lt; prev</a>") : "&lt;&lt; prev")%>
                    | <%=(result.croppedDataAfter() ? ("<a href='Javascript:showRows(" + (li.getStartRow() + li.getNumberOfRows()) + "," + li.getNumberOfRows() + ", true)'>next &gt;&gt;</a>") : "next &gt;&gt;")%>
                </div>

                <table class="stat" cellpadding="0" cellspacing="0" width="100%">
                    <tr><td class="title" colspan="4">Top Ranked > High School Coders</td></tr>
                    <tr>
                        <td class="header">&#160;</td>
                        <td class="header" width="30%">
				            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRank<tc-webtag:sort column="<%=result.getColumnIndex("handle")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
					            Coder
					        </A>                        
						</td>
                        <td class="header" width="70%">
				            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRank<tc-webtag:sort column="<%=result.getColumnIndex("name")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
					            Team
					        </A>                                                
                        </td>
                        <td class="header">
							<A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=HSRank<tc-webtag:sort column="<%=result.getColumnIndex("rating")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">
					            Rating
					        </A>                        
						</td>
                    </tr>
                    <% boolean even = true; %>
                    <rsc:iterator list="<%= result%>" id="resultRow">
                        <% even = !even; %>
                        <tr class="<%=even?"dark":"light"%>">
                            <td class="valueC"><rsc:item name="rank" row="<%=resultRow%>"/></td>
                            <td class="value">
                                <tc-webtag:handle coderId='<%= resultRow.getItem("coder_id").toString() %>' context='hs_algorithm'/>
                            </td>
                            <td class="value"><rsc:item name="name" row="<%=resultRow%>"/></td>
                            <td class="valueR"><rsc:item name="rating" row="<%=resultRow%>"/></td>
                        </tr>
                    </rsc:iterator>
                </table>

                <div class="pagingBox">
                    <%=(result.croppedDataBefore() ? ("<a href='Javascript:showRows(" + (li.getStartRow() - li.getNumberOfRows()) + "," + li.getNumberOfRows() + ", true)'>&lt;&lt; prev</a>") : "&lt;&lt; prev")%>
                    | <%=(result.croppedDataAfter() ? ("<a href='Javascript:showRows(" + (li.getStartRow() + li.getNumberOfRows()) + "," + li.getNumberOfRows() + ", true)'>next &gt;&gt;</a>") : "next &gt;&gt;")%>
                </div>

                <form name="pagingForm">
                    View &nbsp;
                    <input name="nr" size="4" maxlength="4" onkeypress="submitEnter(event)" value="<%= li.getNumberOfRows() %>" type="text">

                    &nbsp;at a time starting with &nbsp;

                    <input name="sr" size="4" maxlength="4" onkeypress="submitEnter(event)" value="<%= li.getStartRow() %>" type="text">
                    <a href="Javascript:showRows(document.pagingForm.sr.value, document.pagingForm.nr.value, false)" class="bcLink">
                        &nbsp;[ submit ]</a>
                </form>

                <br><br>
            </div>
        </td>
        <!-- Center Column Ends -->

        <!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="/public_right.jsp">
                <jsp:param name="level1" value="tchs"/>
            </jsp:include>
        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
        <!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>
