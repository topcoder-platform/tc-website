<%@ page import="com.topcoder.web.corp.common.Constants, java.util.List"%>
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
            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrameNB">
                <tr valign="top">
                    <td class="bodyText">
                        <p><span class=testHead>Campaign List</span><br/>
                        <rsc:iterator id="row"
                                list="<%=(List) request.getAttribute(Constants.COMPANY_INFO)%>">
                        <rsc:item row="<%=row%>" name="company_name" /><br/>
                        </rsc:iterator>
                        </p>
                    </td>
                </tr>
            </table>

            <br/>

            <table cellspacing="0" cellpadding="0" width="100%" class="screeningFrame">
                <tr>
                    <td class="screeningHeader" width="33%">Campaign Name</td>
                    <td class="screeningHeader" width="33%" align=center>Most Recent Activity</td>
                    <td class="screeningHeader" width="33%" align=center>Candidates</td>
                    <td class="screeningHeader" width="33%" align=center>Positions</td>
                    <td class="screeningHeader" width="33%" align=center>Collective Demographics</td>
                </tr>

                <%
                    int counter = 0;
                    String[] cssClasses = {"screeningCellOdd", "screeningCellEven"};
                %>
                <rsc:iterator id="row"
                        list="<%=(List) request.getAttribute(Constants.COMPANY_CAMPAIGNS_LIST)%>">
                <tr>
                    <td class="<%=cssClasses[counter % 2]%>" nowrap="nowrap">
                        <a href="?<%=Constants.MODULE_KEY%>=<%=Constants.CAMPAIGN_RESULTS_PROCESSOR%>&<%=Constants.CAMPAIGN_ID%>=<rsc:item row="<%=row%>" name="campaign_id" />">
                            <rsc:item row="<%=row%>" name="campaign_name" />
                        </a>
                    </td>
                    <td class="<%=cssClasses[counter % 2]%>" align="center">
                        <rsc:item row="<%=row%>" name="most_recent_activity" format="MM/dd/yyyy hh:mm a z" timeZone="timezone_desc" />
                    </td>
                    <td class="<%=cssClasses[counter % 2]%>" align="center">
                        <rsc:item row="<%=row%>" name="candidates_num" />
                    </td>
                    <td class="<%=cssClasses[counter % 2]%>" nowrap=nowrap align=center>
                        <A href='?<%=Constants.MODULE_KEY%>=<%=Constants.POSITION_LIST_PROCESSOR%>&<%=Constants.CAMPAIGN_ID%>=<rsc:item row="<%=row%>" name="campaign_id" />'>view</A>
                    </td>
                    <td class="<%=cssClasses[counter++ % 2]%>" nowrap=nowrap align=center>
                        <A href='?<%=Constants.MODULE_KEY%>=Demographics&<%=Constants.CAMPAIGN_ID%>=<rsc:item row="<%=row%>" name="campaign_id" />'>view</A>
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
