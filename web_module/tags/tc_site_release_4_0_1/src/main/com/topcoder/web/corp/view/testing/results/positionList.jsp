<%@ page import="com.topcoder.web.corp.common.Constants,java.util.List"%>
<%@ taglib uri="screening.tld" prefix="screen" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Topcoder | Technical Assessment Application Management Tool</title>
<jsp:include page="../includes/script.jsp"/>

</HEAD>
<body>

<!-- Header begins -->
<%--<jsp:include page="../includes/top.jsp" />--%>
<jsp:include page="../includes/top.jsp" />
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="50%"></td>
        <td align="center"><img src="/i/corp/clear.gif" width="700" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText">
                        <p><span class=testHead>Position List</span><br/>
                        <rsc:iterator id="row"
                                list="<%=(List) request.getAttribute(Constants.COMPANY_INFO)%>">
                        <rsc:item row="<%=row%>" name="company_name" /><br/>
                        </rsc:iterator>
                        <rsc:iterator id="row"
                                list="<%=(List) request.getAttribute(Constants.CAMPAIGN_INFO)%>">
                        Campaign Name: <rsc:item row="<%=row%>" name="campaign_name" /><br/>
                        </rsc:iterator>
                        </p>
                    </td>
                </tr>
            </table>

            <br/>

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
                <tr>
                    <td class="screeningHeader" width="33%">Position Name</td>
                    <td class="screeningHeader" width="33%" align=center>Most Recent Activity</td>
                    <td class="screeningHeader" width="33%" align=right>Candidates</td>
                </tr>

                <%
                    int counter = 0;
                    String[] cssClasses = {"screeningCellOdd", "screeningCellEven"};
                %>
                <rsc:iterator id="row"
                        list="<%=(List) request.getAttribute(Constants.CAMPAIGN_POSITIONS_LIST)%>">
                <tr>
                    <td class="<%=cssClasses[counter % 2]%>" nowrap="nowrap">
                        <a href="?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_RESULTS_PROCESSOR%>&<%=Constants.JOB_POSITION_ID%>=<rsc:item row="<%=row%>" name="job_id" />">
                            <rsc:item row="<%=row%>" name="job_desc" />
                        </a>
                    </td>
                    <td class="<%=cssClasses[counter % 2]%>" align="center">
                        <rsc:item format="MM/dd/yyyy hh:mm a z" row="<%=row%>" name="most_recent_activity" timeZone="timezone_desc"/>
                    </td>
                    <td class="<%=cssClasses[counter++ % 2]%>" align="right">
                        <rsc:item row="<%=row%>" name="candidates_num" />
                    </td>
                </tr>
                </rsc:iterator>
            </table>

            <p><br></p>
        </td>
        <td width="50%"></td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="/foot.jsp" />

</body>
</html>
