<%--
/**
 *  profile.jsp
 */
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page
        language="java"
        import="com.topcoder.common.web.data.report.Constants,
                com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                java.util.ArrayList"

        %>
<%@ page import="java.util.Map" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<%
    ResultSetContainer profiles = null;
    ResultSetContainer demographicList = null;
    ResultSetContainer notifyList = null;
    ResultSetContainer handleList = null;
	ResultSetContainer emailList = null;
    ResultSetContainer ratingList = null;
    ResultSetContainer addressList = null;
    ResultSetContainer violationList = null;
    ResultSetContainer statusList = null;
    ResultSetContainer jobList = null;
    ResultSetContainer regTypeList = null;
    ResultSetContainer termsList = null;
    ResultSetContainer specReviewInfoList = null;
    ResultSetContainer.ResultSetRow p = null;
    ArrayList detailList = null;
    Boolean processed = (Boolean) request.getAttribute(Constants.PROCESSED_KEY);
    if (processed != null && processed.booleanValue()) {
        profiles = (ResultSetContainer) request.getAttribute(Constants.REPORT_PROFILE_LIST_KEY);
        detailList = (ArrayList) request.getAttribute(Constants.REPORT_PROFILE_DETAIL_KEY);
    } else if (request.getParameter(Constants.TASK_NAME_KEY) != null && request.getParameter(Constants.REPORT_HANDLE_KEY) != null) {
        String dest = Constants.SERVLET_ADDR + "?" + request.getQueryString();
%>
<jsp:forward page="<%=dest%>"/>
<%
    }
%>

<html>
<head>
    <font face="arial">
    <title>TopCoder Reporting</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <style type="text/css">
        TABLE.entry TD{
                font-size: 12px;
            font-weight: normal;
        }
        A:link {
                COLOR: #4444bb; TEXT-DECORATION: none
        }
        A:visited {
                COLOR: #4444bb; TEXT-DECORATION: none
        }
        A:active {
                COLOR: #7777FF; TEXT-DECORATION: none
        }
        A:hover {
                COLOR: #7777FF; TEXT-DECORATION: none
        }
        tr.shaded {
          background-color: #ECE5B6; color: black;
        }
        tr.shaded2 {
          background-color: #EEEEEE; color: black;
        }


    </style>

</head>

<body>
<font face="arial" size="2">
<a href=<%=Constants.SERVLET_ADDR%>>&lt;&lt;back to main menu</a><br/>
(Use % for a wildcard.)
<form name="profileForm" method="get" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
    <input type="hidden" name="module" value="LegacyReport"/>
    <input type="hidden" name="<%=Constants.TASK_NAME_KEY%>" value="<%=Constants.REPORT_PROFILE_KEY%>"/>
    <table class="entry" cellspacing="1" cellpadding="1">
    <tr>
    <td align="right">
    <b>Handle: </b>
    </td>
    <td>
    <input type="text" onKeyPress="submitEnter(event)" name="<%=Constants.REPORT_HANDLE_KEY%>"/>
    </td>
    </tr>
    <tr>
    <td align="right">
    <b>First Name: </b>
    </td>
    <td>
    <input type="text" onKeyPress="submitEnter(event)" name="<%=Constants.REPORT_FIRST_NAME_KEY%>"/>
    </td>
    </tr>
    <tr>
    <td align="right">
    <b>Last Name: </b>
    </td>
    <td>
    <input type="text" onKeyPress="submitEnter(event)" name="<%=Constants.REPORT_LAST_NAME_KEY%>"/>
    </td>
    </tr>
    <tr>
    <td align="right">
    <b>Email Address: </b>
    </td>
    <td>
    <input type="text" onKeyPress="submitEnter(event)" name="<%=Constants.REPORT_EMAIL_KEY%>"/>
    </td>
    </tr>
    </table>
    <a href="Javascript:document.profileForm.submit()"><b>&lt;SUBMIT&gt;</b></a>
</form>
<script language="javascript">
    <!--
    document.profileForm.<%=Constants.REPORT_HANDLE_KEY%>.focus();
    function submitEnter(e) {
        var keycode;
        if (window.event) keycode = window.event.keyCode;
        else if (e) keycode = e.which;
        else return true;
        if (keycode == 13) {
            document.profileForm.submit();
            return false;
        } else return true;
    }
    // -->
</script>

<%

    if (profiles != null && request.getParameter(Constants.TASK_NAME_KEY) != null) {
        for (int k = 0; k < profiles.size() && k < 100; k++) {
            p = profiles.getRow(k);
            demographicList = (ResultSetContainer) ((Map) detailList.get(k)).get("coder_demographics");
            notifyList = (ResultSetContainer) ((Map) detailList.get(k)).get("notify");
            handleList = (ResultSetContainer) ((Map) detailList.get(k)).get("handle_history");
            ratingList = (ResultSetContainer) ((Map) detailList.get(k)).get("user_rating_list");
            addressList = (ResultSetContainer) ((Map) detailList.get(k)).get("address_history");
            violationList = (ResultSetContainer) ((Map) detailList.get(k)).get("violations");
            statusList = (ResultSetContainer) ((Map) detailList.get(k)).get("status_changed");
            jobList = (ResultSetContainer) ((Map) detailList.get(k)).get("job_list");
            regTypeList = (ResultSetContainer) ((Map) detailList.get(k)).get("registration_types");
            termsList = (ResultSetContainer) ((Map) detailList.get(k)).get("user_terms_of_use");
            specReviewInfoList = (ResultSetContainer) ((Map) detailList.get(k)).get("spec_review_stats");
			emailList = (ResultSetContainer) ((Map) detailList.get(k)).get("email_history");
%>

<hr size="3"/>



<table class="entry" cellspacing="1" cellpadding="1">
<tr class="shaded">
    <td colspan="3" align="center"><font size="+2"><b><rsc:item name="handle" row="<%=p%>"/></b></font></td>
</tr>

<tr>
  <% if (p.getItem("image_path").toString().length() > 0 ) { %> 
    <td>
      <img src="<rsc:item name="image_path" row="<%=p%>"/>" />
    </td>
  <% } %>
  <td valign="top">
    <br>
    <rsc:item name="first_name" row="<%=p%>"/> <rsc:item name="last_name" row="<%=p%>"/> <br>

    <% if (p.getItem("name_in_another_language") != null && p.getItem("name_in_another_language").toString().length() > 0 ) { %> 
    Name in another language: <rsc:item name="name_in_another_language" row="<%=p%>"/> <br>
    <% } %>

    User ID:   <rsc:item name="user_id" row="<%=p%>"/>  <br>
    Email: <rsc:item name="email" row="<%=p%>"/>  ( <a href="mailto:<rsc:item name="email" row="<%=p%>"/>" class="">
        Send Now</a> )  <br>
    Account Status:  <rsc:item name="user_status_desc" row="<%=p%>"/> <br>
    Phone:  <rsc:item name="home_phone" row="<%=p%>"/> <br>
    Account Status:  <rsc:item name="user_status_desc" row="<%=p%>"/> <br>
    Activation Link: <rsc:item name="activation_link" row="<%=p%>"/> <br>
    <a href=/tc?module=DownloadVCard&<%=Constants.USER_ID%>=<rsc:item name="user_id" row="<%=p%>"/> >Download contact as vCard</a>


  </td>
</tr>

<tr>
    <td><br/></td>
</tr>

<tr>
    <td>
      <A HREF="/tc?module=MemberProfile&cr=<rsc:item name="user_id" row="<%=p%>"/>" CLASS="">Public Profile</A>
    </td>
    <td>
      <% if (p.getStringItem("has_notes").equals("1")) { %>
        <A HREF="/tc?module=ViewNotes&uid=<rsc:item name="user_id" row="<%=p%>"/>">View/Edit Notes</A>
      <% } else { %>
        <A HREF="/tc?module=EditNote&uid=<rsc:item name="user_id" row="<%=p%>"/>">Add Note</A>
      <% } %>
    </td>
    <td>
    </td>
</tr>

<tr>
    <td><br/></td>
</tr>

<tr>
    <td>Member Since</td>
    <td><rsc:item name="member_since" row="<%=p%>" format="MM/dd/yyyy hh:mm a" /></td>
</tr>
<tr>
    <td>Referral Type</td>
    <td><rsc:item name="referral_desc" row="<%=p%>"/>&#160; - <rsc:item name="referral_info" row="<%=p%>"/></td>
</tr>
<tr>
    <td>Status</td>
    <td><rsc:item name="user_status_desc" row="<%=p%>"/></td>
</tr>
<tr>
    <td>Placement</td>
    <td>
        <% if (p.getStringItem("registered_for_placement").equals("1")) { %>
        <A HREF="/tc?module=PlacementInfoDetail&uid=<rsc:item name="user_id" row="<%=p%>"/>">View Placement
            Information</A>
        <% } else { %>
        Not registered
        <% } %>
    </td>
</tr>

<tr><td><br/></td></tr>
<tr>
    <td valign="top">Street Address</td>
    <td>
        <rsc:item name="address1" row="<%=p%>"/><br/>
        <% if (p.getItem("address2").toString().length() > 0 ) { %>
          <rsc:item name="address2" row="<%=p%>"/><br/>
        <% } %>
        <rsc:item name="city" row="<%=p%>"/>, <rsc:item name="state_code" row="<%=p%>"/>
        <rsc:item name="zip" row="<%=p%>"/> <rsc:item name="country_name" row="<%=p%>"/>
    </td>
</tr>
<tr><td><br/></td></tr>

<tr>
    <td>Coder Type</td>
    <td><rsc:item name="coder_type_desc" row="<%=p%>"/></td>
</tr>
<% if (p.getItem("school_name") != null) { %>
<tr>
    <td>School</td>
    <td><rsc:item name="school_name" row="<%=p%>"/></td>
</tr>
<% } %>
<% if (p.getItem("company") != null) { %>
<tr>
    <td>Company</td>
    <td><rsc:item name="company" row="<%=p%>"/></td>
</tr>
<% } %>
<% if (p.getItem("title") != null) { %>
<tr>
    <td>Title</td>
    <td><rsc:item name="title" row="<%=p%>"/></td>
</tr>
<% } %>
</table>


<% if (!ratingList.isEmpty()) { %>

<br/><br/>
<table class="entry" cellspacing="2" cellpadding="2">
    <tr class="shaded2"><td colspan="3"><b>TopCoder Ratings</b></td></tr>

    <tr><td><b>Category</b></td>
        <td><b>Rating</b></td>
        <td><b>Events</b></td>
    </tr>
    <rsc:iterator list="<%=ratingList%>" id="resultRow">
        <tr><td><rsc:item name="rating_type" row="<%=resultRow%>"/></td>
            <td><rsc:item name="rating" row="<%=resultRow%>"/></td>
            <td><rsc:item name="num_ratings" row="<%=resultRow%>"/></td>
        </tr>
    </rsc:iterator>
</table>
<% } %>

<%

    if (!demographicList.isEmpty()) {

%>
<br/><br/>
<table class="entry" cellspacing="0">

    <tr class="shaded2"><td colspan="3"><b>Demographic Information</b></td></tr>

    <tr><td><b>Question</b></td>
        <td>&#160;</b></td>
        <td><b>Response</b></td>
    </tr>

    <rsc:iterator list="<%=demographicList%>" id="resultRow">
        <tr>
            <td><rsc:item name="demographic_question_text" row="<%=resultRow%>"/></td>
            <td>&#160;&#160;&#160;</td>
            <td><rsc:item name="demographic_answer_text" row="<%=resultRow%>"/></td>
        </tr>
    </rsc:iterator>
</table>
<%

    }

%>

<%

    if (!notifyList.isEmpty()) {

%>
<br/><br/>
<table class="entry" cellspacing="0">
    <tr class="shaded2"><td><b>Notifications</b></td></tr>

    <rsc:iterator list="<%=notifyList%>" id="resultRow">
        <tr>
            <td>
                <rsc:item name="name" row="<%=resultRow%>"/>

            </td>
        </tr>
    </rsc:iterator>
</table>
<%

    }

%>

<%

    if (!handleList.isEmpty()) {

%>
<br/><br/>
<table class="entry" cellspacing="2" cellpadding="2">
    <tr class="shaded2"><td colspan="3"><b>Handle History</b></td></tr>
    <tr>
        <td><b>old handle</b></td>
        <td><b>new handle</b></td>
        <td><b>date of change</b></td>
    </tr>

    <rsc:iterator list="<%=handleList%>" id="resultRow">
        <tr>
            <td><rsc:item name="old_value" row="<%=resultRow%>"/></td>
            <td><rsc:item name="new_value" row="<%=resultRow%>"/></td>
            <td><rsc:item name="timestamp" row="<%=resultRow%>" format="MM/dd/yyyy hh:mm a"/></td>
        </tr>
    </rsc:iterator>
</table>

<%
	}
    if (!emailList.isEmpty()) {

%>
<br/><br/>
<table class="entry" cellspacing="2" cellpadding="2">
    <tr class="shaded2"><td colspan="3"><b>Email History</b></td></tr>
    <tr>
        <td><b>old handle</b></td>
        <td><b>new handle</b></td>
        <td><b>date of change</b></td>
    </tr>

    <rsc:iterator list="<%=emailList%>" id="resultRow">
        <tr>
            <td><rsc:item name="old_value" row="<%=resultRow%>"/></td>
            <td><rsc:item name="new_value" row="<%=resultRow%>"/></td>
            <td><rsc:item name="timestamp" row="<%=resultRow%>" format="MM/dd/yyyy hh:mm a"/></td>
        </tr>
    </rsc:iterator>
</table>
<%
    }
    if (!addressList.isEmpty()) {

%>
<br/><br/>
<table class="entry" cellspacing="2" cellpadding="2">
    <tr class="shaded2"><td colspan="4"><b>Address History</b></td></tr>

    <tr><td><b>Field</b></td>
        <td><b>Old Address</b></td>
        <td><b>New Address</b></td>
        <td><b>Timestamp</b></td>
    </tr>
    <rsc:iterator list="<%=addressList%>" id="resultRow">
        <tr><td><rsc:item name="field" row="<%=resultRow%>"/></td>
            <td><rsc:item name="old_value" row="<%=resultRow%>"/></td>
            <td><rsc:item name="new_value" row="<%=resultRow%>"/></td>
            <td><rsc:item name="timestamp" row="<%=resultRow%>" format="MM/dd/yyyy hh:mm a"/></td>
        </tr>
    </rsc:iterator>
</table>
<%

    }
    if (!violationList.isEmpty()) {
%>
<br/><br/>
<table class="entry" cellspacing="2" cellpadding="2">
    <tr><td colspan="3"><b>Violations</b></td></tr>

    <tr>
        <td><b>Date</b></td>
        <td><b>Violation</b></td>
    </tr>
    <rsc:iterator list="<%=violationList%>" id="resultRow">
        <tr>
            <td><rsc:item name="date" row="<%=resultRow%>" format="MM/dd/yyyy"/></td>
            <td><rsc:item name="description" row="<%=resultRow%>"/></td>
        </tr>
    </rsc:iterator>
</table>

<%

    }

%>
<%

    if (!statusList.isEmpty()) {

%>
<br/><br/>
<table class="entry" cellspacing="2" cellpadding="2">
    <tr class="shaded2"><td colspan="3"><b>Status History</b></td></tr>
    <tr>
        <td><b>Old</b></td>
        <td><b>New</b></td>
        <td><b>Timestamp</b></td>
    </tr>

    <rsc:iterator list="<%=statusList%>" id="resultRow">
        <tr>
            <td><rsc:item name="old_value" row="<%=resultRow%>"/></td>
            <td><rsc:item name="new_value" row="<%=resultRow%>"/></td>
            <td><rsc:item name="timestamp" row="<%=resultRow%>" format="MM/dd/yyyy hh:mm a"/></td>
        </tr>
    </rsc:iterator>
</table>
<%

    }

%>

<% if (!termsList.isEmpty()) { %>
<br/><br/>
<table class="entry" cellpadding="2" cellspacing="2">
    <tr class="shaded2"><td colspan="3"><b>Terms Of Use</b></td></tr>
    <tr>
        <td><b>Date</b></td>
        <td>&#160;&#160;&#160;</td>
        <td><b>Terms</b></td>
    </tr>
    <rsc:iterator list="<%= termsList %>" id="resultRow">
        <tr>
            <td><rsc:item name="date" row="<%= resultRow %>" format="MM/dd/yyyy"/></td>
            <td>&#160;&#160;&#160;</td>
            <td><rsc:item name="terms" row="<%= resultRow %>"/></td>
        </tr>
    </rsc:iterator>
</table>
<% } %>

<% if (!specReviewInfoList.isEmpty()) { %>
<br/>
<br/>
<table class="entry" cellpadding="2" cellspacing="2">
    <tr class="shaded2">
        <td colspan="5"><b>Specification Reviews</b></td>
    </tr>
    <tr>
        <td><b>Track</b></td>
        <td>&#160;&#160;&#160;</td>
        <td><b>Reviews</b></td>
        <td><b>Successful</b></td>
        <td><b>Success Rate</b></td>
    </tr>
    <rsc:iterator id="resultRow" list="<%= specReviewInfoList %>">
        <tr>
            <td><rsc:item name="track" row="<%= resultRow %>"/></td>
            <td>&#160;&#160;&#160;</td>
            <td align="right"><rsc:item name="reviews" row="<%= resultRow %>"/></td>
            <td align="right"><rsc:item name="successful" row="<%= resultRow %>"/></td>
            <td align="right"><rsc:item name="success_rate" row="<%= resultRow %>"/>%</td>
        </tr>
    </rsc:iterator>
</table>
<% } %>

<%

    if (!regTypeList.isEmpty()) {

%>
<br/><br/>
<table class="entry" cellspacing="2" cellpadding="2">
    <tr class="shaded2"><td><b>Registration Types</b></td></tr>
    <tr>
        <td><b>Type</b></td>
    </tr>

    <rsc:iterator list="<%=regTypeList%>" id="resultRow">
        <tr>
            <td><rsc:item name="registration_type_name" row="<%=resultRow%>"/></td>
        </tr>
    </rsc:iterator>
</table>
<%

    }

%>




<%

    if (!jobList.isEmpty()) {

%>
<br/><br/>
<table class="entry" cellspacing="2" cellpadding="2">
    <tr class="shaded2"><td colspan="3"><b>Job Hits</b></td></tr>
    <tr>
        <td><b>Company</b></td>
        <td><b>Campaign</b></td>
        <td><b>Job</b></td>
        <td><b>Date</b></td>
    </tr>

    <rsc:iterator list="<%=jobList%>" id="resultRow">
        <tr>
            <td><rsc:item name="company_name" row="<%=resultRow%>"/></td>
            <td><rsc:item name="campaign_name" row="<%=resultRow%>"/></td>
            <td><rsc:item name="job_desc" row="<%=resultRow%>"/></td>
            <td><rsc:item name="timestamp" row="<%=resultRow%>" format="MM/dd/yyyy hh:mm a"/></td>
        </tr>
    </rsc:iterator>
</table>
<%

    }

%>


<br/>
<br/>

<%

        }
    }
    if (p == null && processed != null && processed.booleanValue()) {

%>
<b>Unknown user, try again...</b>
<%

    }

%>

</body>
</html>


