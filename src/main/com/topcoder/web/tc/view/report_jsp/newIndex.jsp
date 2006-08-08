<%@ page
        language="java"
        import="com.topcoder.common.web.data.report.Constants,
                com.topcoder.common.web.data.report.Query,
                com.topcoder.shared.dataAccess.DataAccessConstants,
                com.topcoder.shared.util.DBMS"

        %>


<html>
<head>
    <title>TopCoder Reporting</title>
</head>

<body>
<font size="6">
    <b>
        TopCoder Reporting II
    </b>
</font>
<br/>
<br/>
<br/>
<a href="<%=Constants.SERVLET_ADDR%>">&lt;&lt;back to regular reporting page</a><br/><br/>
<br/>

<ul>
    <li><a href="/report_jsp/srm_index.jsp">SRM Report</a></li>
    <li>
        <a href="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=srm_summary"%>">SRM
            Summary</a></li>
</ul>

<br/>

Software
<UL>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=ComponentPricing&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Pricing
            Report</A></LI>
    <%--
            <LI><A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=component_subscriptions"%>">Subscriptions</A></LI>
    --%>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=inquiry_trend_report&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">TCS
            Inquiry Trend Report</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=inquiries_last_week&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">TCS
            Inquiries in Last 7 days</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=inquiry_detail&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">TCS
            Inquiry Detail Report</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=Catalog_Totals&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Catalog
            Totals</A></LI>
    <%--
            <LI><A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=component_status&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Component Status</A></LI>
    --%>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=Component_Downloads&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Component
            Downloads by Member</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=Component%20Downloads%20by%20Customer&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Component
            Downloads by Customer</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=Component%20Downloads%20by%20Day&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Component
            Downloads Summary by Day</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=Component%20Downloads%20by%20Month&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Component
            Downloads Summary by Month</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=Component%20Downloads%20by%20Month%20-%20Customer&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Component
            Downloads Summary by Month / Customer</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=Component%20Downloads%20by%20Month%20-%20Component&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Component
            Downloads Summary by Month / Component</A></LI>
    <%--
            <LI><A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=ComponentPricing&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Component Pricing</A></LI>
            <LI><A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=ready_components&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Ready Components</A></LI>
            <LI><A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=reviewer_activity&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Reviewer Activity</A></LI>
    --%>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=reviewers&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Reviewer
            List</A></LI>
    <br/>
    <% String baseURL = Constants.SERVLET_ADDR + "&" + Constants.TASK_NAME_KEY + "=" + Constants.NEW_REPORT_KEY + "&" + Constants.DB_KEY + "=" + DBMS.TCS_DW_DATASOURCE_NAME + "&" + DataAccessConstants.COMMAND + "=";%>
    <LI>Fulfillment rate: Projects posted in last <a href="<%=baseURL+"fulfillment_rate&days=90"%>">3 months?</a>
        <a href="<%=baseURL+"fulfillment_rate&days=180"%>">6 months?</a>
        <a href="<%=baseURL+"fulfillment_rate&days=3600"%>">all?</a></LI>
    <LI>Fulfillment rate by week by catalog: Posted in last <a href="<%=baseURL+"fulfillment_rate_week&days=90"%>">3
        months?</a> <a href="<%=baseURL+"fulfillment_rate_week&days=180"%>">6 months?</a>
        <a href="<%=baseURL+"fulfillment_rate_week&days=3600"%>">all?</a></LI>
    <LI><A HREF="<%=baseURL+"reposts"%>">Reposted projects</A></LI>
    <LI><A HREF="<%=baseURL+"reposts_month"%>">Average number of reposted projects per month</A></LI>
    <LI><A HREF="<%=baseURL+"new_participants_week"%>">New participants per week</A></LI>
    <LI><A HREF="<%=baseURL+"new_ratio"%>">Ratio of new members who participate in TCS</A></LI>
    <LI><A HREF="<%=baseURL+"drop_off"%>">Drop-off rates by month</A></LI>
    <LI>Submission rate per inquiry: Members who signed up in last - <A HREF="<%=baseURL+"submission_rate&days=90"%>">3
        months?</a> <a href="<%=baseURL+"submission_rate&days=180"%>">6 months?</a>
        <a href="<%=baseURL+"submission_rate&days=3600"%>">all?</a></LI>
    <LI>Average cost of component by phase - projects completed in last -
        <A HREF="<%=baseURL+"cost_by_phase&days=90"%>">3 months?</a> <a href="<%=baseURL+"cost_by_phase&days=180"%>">6
        months?</a> <a href="<%=baseURL+"cost_by_phase&days=3600"%>">all?</A></LI>
    <LI>Average cost of component by phase and catalog - projects completed in last -
        <A HREF="<%=baseURL+"cost_by_catalog&days=90"%>">3 months?</a>
        <a href="<%=baseURL+"cost_by_catalog&days=180"%>">6 months?</a>
        <a href="<%=baseURL+"cost_by_catalog&days=3600"%>">all?</A></LI>
    <LI><A HREF="<%=baseURL+"posted_components"%>">New components by year, month and week</a></LI>
</UL>
<br/>
Payment Reports
<UL>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=recently_completed_projects&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Recently
            Completed Projects</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=components_added_to_catalog&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Components
            Added to the Catalog</A></LI>
</UL>
<br/>
Submission Reports
<UL>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=SubmissionsByMonthByPhase&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Submissions
            by Month and Phase</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=ScoresBySubmitters&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Scores
            by Submitter - Last 6 Months</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=AverageCompTime&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Average
            Time by Phase</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=LateTCSReviews&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Late
            Reviews</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=WeeklyFillRate&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Weekly
            Fill Rate</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=submissions&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Submission
            Detail</A></LI>
</UL>
<br/>
Online Review Reports
<UL>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=roles_by_component&"+Constants.DB_KEY+"="+Query.TCS_CATALOG%>">Review
            Roles by Component</A></LI>
</UL>
<br/>
Private Label Reports
<UL>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=reg_info&"+Constants.DB_KEY+"=java:DC_OLTP"%>">DoubleClick
            Registration</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=google_reg&"+Constants.DB_KEY+"=java:GOOGLE_OLTP"%>">Google
            Registration</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=brooks_usage_report&"+Constants.DB_KEY%>=<%=DBMS.SCREENING_OLTP_DATASOURCE_NAME%>">Brooks
            Registration</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=google_reg&"+Constants.DB_KEY+"=java:GOOGLE_INDIA_OLTP"%>">Google
            India Registration</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=google_reg&"+Constants.DB_KEY+"=java:GOOGLE_CHINA_OLTP"%>">Google
            China Registration</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=google_reg&"+Constants.DB_KEY+"=java:GOOGLE_EUROPE_OLTP"%>">Google
            Europe Registration</A></LI>
</UL>
<br/>

Other
<UL>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=tccc06_reg&"+Constants.DB_KEY+"="+DBMS.OLTP_DATASOURCE_NAME%>">TCCC
            06 Reg Info</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=tco06_reg&"+Constants.DB_KEY+"="+DBMS.OLTP_DATASOURCE_NAME%>">TCO
            06 Reg Info</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=tco05_reg&"+Constants.DB_KEY+"="+DBMS.OLTP_DATASOURCE_NAME%>">TCO
            05 Reg Info</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=tccc05_reg&"+Constants.DB_KEY+"="+DBMS.OLTP_DATASOURCE_NAME%>">TCCC
            05 Reg Info</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=tccc04_reg_count&"+Constants.DB_KEY+"="+DBMS.OLTP_DATASOURCE_NAME%>">TCCC
            04 Reg Info</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=tco04_reg&"+Constants.DB_KEY+"="+DBMS.OLTP_DATASOURCE_NAME%>">TCO
            04 Reg Info</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=email_report&"+Constants.DB_KEY+"="+Query.TRANSACTIONAL%>">Email
            Tool Usage</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=address_change_report&"+Constants.DB_KEY+"="+Query.TRANSACTIONAL%>">Address
            Change Report</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=unlock_card_info&"+Constants.DB_KEY+"="+Query.TRANSACTIONAL%>">Unlocked
            Card Info</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=demo_users&"+Constants.DB_KEY+"="+DBMS.SCREENING_OLTP_DATASOURCE_NAME%>">Testing
            Demo Users</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=logo_submissions&"+Constants.DB_KEY+"="+Query.TRANSACTIONAL%>">Logo
            Submissions</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=member_contact_report&"+Constants.DB_KEY+"="+Query.TRANSACTIONAL%>">Member
            Contact</A></LI>
</UL>

High School
<ul>
    <li>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=hs_reg&"+Constants.DB_KEY+"="+Query.TRANSACTIONAL%>">Registration</A>
    </li>

</ul>


Placement
<UL>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=placement_counts&"+Constants.DB_KEY+"="+Query.TRANSACTIONAL%>">Placement
            Counts</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=placement_people&"+Constants.DB_KEY+"="+Query.TRANSACTIONAL%>">Placement
            Registrants</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=Recent%20Placement%20Signups&"+Constants.DB_KEY+"="+Query.TRANSACTIONAL%>">Recent
            Registrants</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=recent_contacts&"+Constants.DB_KEY+"="+Query.TRANSACTIONAL%>">Recent
            Contacts</A></LI>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=TCCC05%20Yahoo%20Members&"+Constants.DB_KEY+"="+Query.TRANSACTIONAL%>">TCCC05
            Yahoo Member List</A></LI>
</UL>


Technical Assessment
<UL>
    <LI>
        <A HREF="<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY+"&"+DataAccessConstants.COMMAND+"=technical_assessment_session_status&"+Constants.DB_KEY+"="+DBMS.SCREENING_OLTP_DATASOURCE_NAME%>">Technical
            Assessment Session Status</A></LI>
</UL>

</body>
</html>
