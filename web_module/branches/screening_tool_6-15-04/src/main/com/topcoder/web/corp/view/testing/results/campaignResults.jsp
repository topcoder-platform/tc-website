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
    String sortBy = request.getParameter(Constants.SORT_BY);
    if (sortBy != null) {
        if (results != null) {
            results.sortByColumn(sortBy, true);
        }
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
                            info = (List) request.getAttribute(Constants.COMPANY_INFO);
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
                    <td class="bodyText" align=right>Showing 1-20:&#160;&#160;&#160;<A href="/">Prev 20</A> | <A href="/">Next 20</a></td>
                </tr>
            </table>

            <br/>

            <table cellspacing="0" cellpadding="0" width="600" class="screeningFrame">
                <tr>
                    <td class="screeningHeader" width="10%">
                        <A class=screeningHeader href="/testing/results/campaignResults.jsp?<%=Constants.SORT_BY%>=first_name">
                            Name
                        </A>
                    </td>
                    <td class="screeningHeader" width="10%">
                        <A class=screeningHeader href="/testing/results/campaignResults.jsp?<%=Constants.SORT_BY%>=state_code">
                            State/<br/>Province
                        </A>
                    </td>
                    <td class="screeningHeader" width="10%">
                        <A class=screeningHeader href="/testing/results/campaignResults.jsp?<%=Constants.SORT_BY%>=country_name">Country</A>
                    </td>
                    <td class="screeningHeader" width="10%" align=center>
                        <A class=screeningHeader href="/testing/results/campaignResults.jsp?<%=Constants.SORT_BY%>=coder_type_desc">Type</A>
                    </td>
                    <td class="screeningHeader" width="10%">
                        <A class=screeningHeader href="/testing/results/campaignResults.jsp?<%=Constants.SORT_BY%>=job_desc">Position</A>
                    </td>
                    <td class="screeningHeader" width="10%">
                        <A class=screeningHeader href="/testing/results/campaignResults.jsp?<%=Constants.SORT_BY%>=problem_name">Problem</A>
                    </td>
                    <td class="screeningHeader" width="10%" align=center>
                        <A class=screeningHeader href="/testing/results/campaignResults.jsp?<%=Constants.SORT_BY%>=total_time">
                            Time
                        </A>
                    </td>
                    <td class="screeningHeader" width="10%" align=center>
                        <A class=screeningHeader href="/">Problem<br/>Results</A>
                    </td>
                    <td class="screeningHeader" width="10%" align=center>
                        <A class=screeningHeader href="/">Preference<br/>Level</A>
                    </td>
                    <td class="screeningHeader" width="10%" align=center>
                        <A class=screeningHeader href="/">Notes</A>
                    </td>
                </tr>

                <%
                    int counter = 0;
                    String[] cssClasses = {"screeningCellEven", "screeningCellOdd"};
                    String[] swfFiles = {"/i/corp/screeningRatingEven.swf", "/i/corp/screeningRatingOdd.swf"};

                    for (int i = 0; i < info.size(); i++) {
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
                        <%=row.getStringItem("state_code")%>
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
                        <A href='/corp/testing/?<%=Constants.MODULE_KEY%>=PopulateProblemDetail&<%=Constants.ROUND_PROBLEM_ID%>=<%=row.getStringItem("problem_id")%>'>
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
                    <td class="bodyText" align=right>
                    Showing 1-20:&#160;&#160;&#160;<A href="/">Prev 20</A> | <A href="/">Next 20</a></td>
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
