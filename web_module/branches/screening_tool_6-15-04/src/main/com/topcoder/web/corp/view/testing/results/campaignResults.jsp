<%@ page import="com.topcoder.web.corp.common.Constants,
                 java.util.List,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.corp.common.JSPUtils"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Topcoder | Testing Application Management Tool</title>

<jsp:include page="../includes/script.jsp"/>

</HEAD>
<body>

<!-- Header begins -->
<%--<jsp:include page="../includes/top.jsp" />--%>
<jsp:include page="../includes/top.jsp" />
<!-- Header ends -->

<!-- Sort the list of results by desired column if required -->
<%
    ResultSetContainer results = (ResultSetContainer) request.getAttribute(Constants.CAMPAIGN_RESULTS_LIST);

    int startIndex = 0;

    try {
        startIndex = Integer.parseInt((String) request.getAttribute(Constants.PAGE_START_INDEX));
    } catch(Exception e) {
        startIndex = 0;
    }

    if (startIndex >= results.size() || startIndex < 0) {
        startIndex = 0;
    }

%>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="100%" align="center"><img src="/i/corp/clear.gif" width="200" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="600">
                <tr valign="top">
                    <td class="bodyText">
                        <%
                            List info = (List) request.getAttribute(Constants.COMPANY_INFO);
                            ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) info.get(0);
                        %>
                        <p><span class="testHead">Campaign Results</span><br/>
                        Company Name: <%=row.getStringItem("company_name")%><br/>
                        <%
                            info = (List) request.getAttribute(Constants.CAMPAIGN_INFO);
                            row = (ResultSetContainer.ResultSetRow) info.get(0);
                        %>
                        Campaign Name: <%=row.getStringItem("campaign_name")%><br/>
                        </p>
                    </td>
                </tr>
            </table>

            <br/>
            <%
                info = (List) request.getAttribute(Constants.CAMPAIGN_RESULTS_LIST);
            %>
            <table border="0" cellspacing="0" cellpadding="0" width="600">
                <tr valign="top">
                    <td class="bodyText">Total Candidates:
                        <b><%= info.size()%></b>
                    </td>
                    <td class="bodyText" align=right>Showing <%=startIndex + 1%>-<%=startIndex
                        + Math.min(info.size() -  startIndex,Constants.PAGE_SIZE)%>:&#160;&#160;&#160;
                    <%
                        if (startIndex > 0) {
                    %>
                    <A href="?<%=Constants.MODULE_KEY%>=<%=Constants.CAMPAIGN_RESULTS_PROCESSOR%>&<%=Constants.PAGE_START_INDEX%>=<%=startIndex - Constants.PAGE_SIZE%>&<%=Constants.CAMPAIGN_ID%>=<%=request.getAttribute(Constants.CAMPAIGN_ID)%>">
                        Prev <%=Math.min(startIndex, Constants.PAGE_SIZE)%>
                    </A>
                    <%  } %>

                    <%
                        if (startIndex + Constants.PAGE_SIZE < info.size()) {
                    %>
                    | <A href="?<%=Constants.MODULE_KEY%>=<%=Constants.CAMPAIGN_RESULTS_PROCESSOR%>&<%=Constants.PAGE_START_INDEX%>=<%=startIndex + Constants.PAGE_SIZE%>&<%=Constants.CAMPAIGN_ID%>=<%=request.getAttribute(Constants.CAMPAIGN_ID)%>">
                        Next <%=Math.min(info.size() - startIndex - Constants.PAGE_SIZE,Constants.PAGE_SIZE)%>
                      </a>
                    <%  } %>
                    </td>
                </tr>
            </table>

            <br/>

            <table cellspacing="0" cellpadding="0" width="600" class="screeningFrame">
                <tr>
                    <td class="screeningHeader" width="10%">
                        <A class=screeningHeader href="?<%=Constants.MODULE_KEY%>=<%=Constants.CAMPAIGN_RESULTS_PROCESSOR%>&<%=Constants.SORT_BY%>=first_name&<%=Constants.CAMPAIGN_ID%>=<%=request.getAttribute(Constants.CAMPAIGN_ID)%>">
                            Name
                        </A>
                    </td>
                    <td class="screeningHeader" width="10%">
                        <A class=screeningHeader href="?<%=Constants.MODULE_KEY%>=<%=Constants.CAMPAIGN_RESULTS_PROCESSOR%>&<%=Constants.SORT_BY%>=state_province&<%=Constants.CAMPAIGN_ID%>=<%=request.getAttribute(Constants.CAMPAIGN_ID)%>">
                            State/<br/>Province
                        </A>
                    </td>
                    <td class="screeningHeader" width="10%">
                        <A class=screeningHeader href="?<%=Constants.MODULE_KEY%>=<%=Constants.CAMPAIGN_RESULTS_PROCESSOR%>&<%=Constants.SORT_BY%>=country_name&<%=Constants.CAMPAIGN_ID%>=<%=request.getAttribute(Constants.CAMPAIGN_ID)%>">Country</A>
                    </td>
                    <td class="screeningHeader" width="10%" align=center>
                        <A class=screeningHeader href="?<%=Constants.MODULE_KEY%>=<%=Constants.CAMPAIGN_RESULTS_PROCESSOR%>&<%=Constants.SORT_BY%>=coder_type_desc&<%=Constants.CAMPAIGN_ID%>=<%=request.getAttribute(Constants.CAMPAIGN_ID)%>">Type</A>
                    </td>
                    <td class="screeningHeader" width="10%">
                        <A class=screeningHeader href="?<%=Constants.MODULE_KEY%>=<%=Constants.CAMPAIGN_RESULTS_PROCESSOR%>&<%=Constants.SORT_BY%>=job_desc&<%=Constants.CAMPAIGN_ID%>=<%=request.getAttribute(Constants.CAMPAIGN_ID)%>">Position</A>
                    </td>
                    <td class="screeningHeader" width="10%">
                        <A class=screeningHeader href="?<%=Constants.MODULE_KEY%>=<%=Constants.CAMPAIGN_RESULTS_PROCESSOR%>&<%=Constants.SORT_BY%>=problem_name&<%=Constants.CAMPAIGN_ID%>=<%=request.getAttribute(Constants.CAMPAIGN_ID)%>">Problem</A>
                    </td>
                    <td class="screeningHeader" width="10%" align=center>
                        <A class=screeningHeader href="?<%=Constants.MODULE_KEY%>=<%=Constants.CAMPAIGN_RESULTS_PROCESSOR%>&<%=Constants.SORT_BY%>=total_time&<%=Constants.CAMPAIGN_ID%>=<%=request.getAttribute(Constants.CAMPAIGN_ID)%>">
                            Time
                        </A>
                    </td>
                    <td class="screeningHeader" width="10%" align=center>
                        <A class=screeningHeader href="/">Problem<br/>Results</A>
                    </td>
                    <td class="screeningHeader" width="10%" align=center>
                        <A class=screeningHeader href="?<%=Constants.MODULE_KEY%>=<%=Constants.CAMPAIGN_RESULTS_PROCESSOR%>&<%=Constants.SORT_BY%>=preference_level&<%=Constants.CAMPAIGN_ID%>=<%=request.getAttribute(Constants.CAMPAIGN_ID)%>">Preference<br/>Level</A>
                    </td>
                    <td class="screeningHeader" width="10%" align=center>
                        <A class=screeningHeader href="/">Notes</A>
                    </td>
                </tr>

                <%
                    int counter = 0;
                    String[] cssClasses = {"screeningCellEven", "screeningCellOdd"};
                    String[] swfFiles = {"/i/corp/screeningRatingEven.swf", "/i/corp/screeningRatingOdd.swf"};

                    for (int i = startIndex; i < startIndex + Constants.PAGE_SIZE&& i < info.size(); i++) {
                        row = (ResultSetContainer.ResultSetRow) info.get(i);
                %>
                <tr>

                    <td class='<%=cssClasses[counter % 2]%>' nowrap=nowrap>
                        <A href='?<%=Constants.MODULE_KEY%>=<%=Constants.POPULATE_CANDIDATE_PROCESSOR%>&<%=Constants.CANDIDATE_ID%>=<%=row.getStringItem("user_id")%>'>
                            <%=row.getStringItem("first_name") + " " + row.getStringItem("middle_name") + " "
                               + row.getStringItem("last_name") %>
                        </A>
                    </td>

                    <td class='<%=cssClasses[counter % 2]%>'>
                        <%=row.getStringItem("state_province")%>
                    </td>

                    <td class='<%=cssClasses[counter % 2]%>' nowrap=nowrap>
                        <%=row.getStringItem("country_name")%>
                    </td>

                    <td class='<%=cssClasses[counter % 2]%>' align=center>
                        <%=row.getStringItem("coder_type_desc")%>
                    </td>

                    <td class='<%=cssClasses[counter % 2]%>'>
                        <A href='?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_RESULTS_PROCESSOR%>&<%=Constants.JOB_POSITION_ID%>=<%=row.getStringItem("job_id")%>'>
                            <%=row.getStringItem("job_desc")%>
                        </A>
                    </td>

                    <td class='<%=cssClasses[counter % 2]%>'>
                        <A href='?<%=Constants.MODULE_KEY%>=<%=Constants.PROBLEM_DETAIL_PAGE%>&<%=Constants.PROBLEM_ID%>=<%=row.getStringItem("problem_id")%>'>
                            <%=row.getStringItem("problem_name")%>
                        </A>
                    </td>

                    <td class='<%=cssClasses[counter % 2]%>' align=center>
                        <%=JSPUtils.timeFormat(row.getLongItem("total_time"))%>
                    </td>

                    <td class='<%=cssClasses[counter % 2]%>' align=center>
                        <A href='?<%=Constants.MODULE_KEY%>=ProblemResult&<%=Constants.PROBLEM_ID%>=<%=row.getStringItem("problem_id")%>&<%=Constants.SESSION_ID%>=<%=row.getStringItem("session_id")%>&<%=Constants.PROBLEM_TYPE_ID%>=<%=row.getStringItem("problem_type_id")%>&<%=Constants.ROUND_ID%>=<%=row.getStringItem("session_round_id")%>'>
                            view
                        </A>
                    </td>

                    <td class='<%=cssClasses[counter % 2]%>' align=center>
                        <script language="javascript">
                            document.write(' <object ');
                            document.write(' classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ');
                            document.write(' codebase="http://fpdownload.macromedia.com" ');
                            document.write('/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" ');
                            document.write(' width="80" ');
                            document.write(' height="12" ');
                            document.write(' id="tc_card" ');
                            document.write(' align="middle">');
                            document.write(' <param name="allowScriptAccess" value="sameDomain" />');
                            document.write(' <param name="movie" ');
                            document.write(' value="<%=swfFiles[counter % 2]%>"/>');
                            document.write(' <param name="menu" value="false" />');
                            document.write(' <param name="quality" value="high" />');
                            document.write(' <param name="bgcolor" value="#ffffff" />');
                            document.write(' <embed ');
                            document.write(' src="<%=swfFiles[counter % 2]%>" ');
                            document.write(' menu="false" ');
                            document.write(' quality="high" ');
                            document.write(' bgcolor="#ffffff" ');
                            document.write(' width="80" ');
                            document.write(' height="12" ');
                            document.write(' name="tc_card" ');
                            document.write(' align="middle" ');
                            document.write(' allowScriptAccess="sameDomain" ');
                            document.write(' type="application/x-shockwave-flash" ');
                            document.write(' pluginspage="http://www.macromedia.com/go/getflashplayer" /> ');
                            document.write(' </object> ');
                        </script>
                    </td>

                    <td class='<%=cssClasses[counter++ % 2]%>' align=center>
                        <A href='?<%=Constants.MODULE_KEY%>=<%=Constants.POPULATE_CANDIDATE_PROCESSOR%>&<%=Constants.CANDIDATE_ID%>=<%=row.getStringItem("user_id")%>'>
                        view
                        </A>
                    </td>
                </tr>
                <%
                    }
                %>

            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="600">
                <tr valign="top">
                    <td class="bodyText" align=right>Showing <%=startIndex + 1%>-<%=startIndex
                        + Math.min(info.size() -  startIndex,Constants.PAGE_SIZE)%>:&#160;&#160;&#160;
                    <%
                        if (startIndex > 0) {
                    %>
                    <A href="?<%=Constants.MODULE_KEY%>=<%=Constants.CAMPAIGN_RESULTS_PROCESSOR%>&<%=Constants.PAGE_START_INDEX%>=<%=startIndex - Constants.PAGE_SIZE%>&<%=Constants.CAMPAIGN_ID%>=<%=request.getAttribute(Constants.CAMPAIGN_ID)%>">
                        Prev <%=Math.min(startIndex, Constants.PAGE_SIZE)%>
                    </A>
                    <%  } %>

                    <%
                        if (startIndex + Constants.PAGE_SIZE < info.size()) {
                    %>
                    | <A href="?<%=Constants.MODULE_KEY%>=<%=Constants.CAMPAIGN_RESULTS_PROCESSOR%>&<%=Constants.PAGE_START_INDEX%>=<%=startIndex + Constants.PAGE_SIZE%>&<%=Constants.CAMPAIGN_ID%>=<%=request.getAttribute(Constants.CAMPAIGN_ID)%>">
                        Next <%=Math.min(info.size() - startIndex - Constants.PAGE_SIZE,Constants.PAGE_SIZE)%>
                      </a>
                    <%  } %>
                    </td>
                </tr>
            </table>

            <p><br></p>
        </td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

    </tr>
</table>


<jsp:include page="../../foot.jsp" />

</body>
</html>
