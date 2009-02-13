<%--
/**
 *  profile.jsp
 */
--%>
<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.common.web.data.report.*,
          com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"

%>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>


<%
  ResultSetContainer profiles = null;
  ResultSetContainer demographicList = null;
  ResultSetContainer notifyList = null;
  ResultSetContainer handleList = null;
  ResultSetContainer addressList = null;
  ResultSetContainer violationList = null;
  ResultSetContainer statusList = null;
  ResultSetContainer jobList = null;
  ResultSetContainer.ResultSetRow p = null;
  ArrayList detailList = null;
  Boolean processed = (Boolean)request.getAttribute(Constants.PROCESSED_KEY);
  if (processed!=null && processed.booleanValue()) {
    profiles = (ResultSetContainer)request.getAttribute(Constants.REPORT_PROFILE_LIST_KEY);
    detailList = (ArrayList)request.getAttribute(Constants.REPORT_PROFILE_DETAIL_KEY);
  } else if (request.getParameter(Constants.TASK_NAME_KEY)!=null && request.getParameter(Constants.REPORT_HANDLE_KEY)!=null) {
    String dest = Constants.SERVLET_ADDR + "?" + request.getQueryString();
%>
    <jsp:forward page = "<%=dest%>"/>
<%
  }
%>

<html>
  <head>
    <title>TopCoder Reporting</title>
  </head>
  <body>
    <a href=<%=Constants.SERVLET_ADDR%>><< back to main menu<a><br/><br/>
    (Use % for a wildcard.)
    <form name="profileForm" method="get" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
      <input type="hidden" name="module" value="LegacyReport"/>
      <input type="hidden" name="<%=Constants.TASK_NAME_KEY%>" value="<%=Constants.REPORT_PROFILE_KEY%>"/>
      <b>Handle: </b>
      <input type="text" onKeyPress="submitEnter(event)" name="<%=Constants.REPORT_HANDLE_KEY%>"/><br/>
      <b>First Name: </b>
      <input type="text" onKeyPress="submitEnter(event)" name="<%=Constants.REPORT_FIRST_NAME_KEY%>"/><br/>
      <b>Last Name: </b>
      <input type="text" onKeyPress="submitEnter(event)" name="<%=Constants.REPORT_LAST_NAME_KEY%>"/><br/><br/>
      <b>Email Address: </b>
      <input type="text" onKeyPress="submitEnter(event)" name="<%=Constants.REPORT_EMAIL_KEY%>"/><br/><br/>
      <a href="Javascript:document.profileForm.submit()">Submit</a>
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
  if (profiles != null && request.getParameter(Constants.TASK_NAME_KEY) != null ) {
    for (int k=0; k<profiles.size(); k++) {
      p = profiles.getRow(k);
      demographicList = (ResultSetContainer)((Map)detailList.get(k)).get("coder_demographics");
      notifyList = (ResultSetContainer)((Map)detailList.get(k)).get("notify");
      handleList = (ResultSetContainer)((Map)detailList.get(k)).get("handle_history");
      addressList = (ResultSetContainer)((Map)detailList.get(k)).get("address_history");
      violationList = (ResultSetContainer)((Map)detailList.get(k)).get("violations");
      statusList = (ResultSetContainer)((Map)detailList.get(k)).get("status_changed");
        jobList = (ResultSetContainer)((Map)detailList.get(k)).get("job_list");

%>

  <table cellpadding="0" cellspacing="0" border="0">
    <tr>
      <td colspan="3"><font size="+2"><center><b><rsc:item name="handle" row="<%=p%>"/></b></center></font></td>
    </tr>
    <tr>
      <td colspan="3"><center><b><rsc:item name="user_id" row="<%=p%>"/></b></center></td>
    </tr>
    <tr>
      <td><br/></td>
    </tr>
    <tr>
      <td colspan="3"><center><A HREF="/tc?module=MemberProfile&cr=<rsc:item name="user_id" row="<%=p%>"/>" CLASS="">View Member Profile</A></center></td>
    </tr>
    <tr>
      <td colspan="3"><center><A HREF="mailto:<rsc:item name="email" row="<%=p%>"/>" CLASS="">Send email to <rsc:item name="handle" row="<%=p%>"/></A></center></td>
    </tr>
    <tr>
      <td colspan="3"><center>
        <% if (p.getStringItem("has_notes").equals("1")) { %>
             <A HREF="/tc?module=ViewNotes&uid=<rsc:item name="user_id" row="<%=p%>"/>">View Notes</A>
        <% } else { %>
             <A HREF="/tc?module=EditNote&uid=<rsc:item name="user_id" row="<%=p%>"/>">Add Note</A>
        <% } %>
        </center>
        </td>
    </tr>
    <tr>
      <td><br/></td>
    </tr>
    <tr>
      <td>Last Rated Event</td>
      <td>&#160;&#160;&#160;</td>
      <td><rsc:item name="last_rated_event" row="<%=p%>" ifNull="Never Competed" format="MM/dd/yyyy hh:mm a"/></td>
    </tr>
    <tr>
      <td>Referral Type</td>
      <td>&#160;&#160;&#160;</td>
      <td><rsc:item name="referral_desc" row="<%=p%>"/>&#160;<rsc:item name="referral_info" row="<%=p%>"/></td>
    </tr>
    <tr>
      <td>Status</td>
      <td>&#160;&#160;&#160;</td>
      <td><rsc:item name="user_status_desc" row="<%=p%>"/></td>
    </tr>
    <tr>
      <td>Placement</td>
      <td>&#160;&#160;&#160;</td>
      <td>
        <% if (p.getStringItem("registered_for_placement").equals("1")) { %>
             <A HREF="/tc?module=PlacementInfoDetail&uid=<rsc:item name="user_id" row="<%=p%>"/>">View Placement Information</A>
        <% } else { %>
            Not registered
        <% } %>
        </td>
    </tr>
    <tr><td><br/></td></tr>
    <br/><br/>
    <tr>
      <td>First Name</td>
      <td>&#160;&#160;&#160;</td>
      <td><rsc:item name="first_name" row="<%=p%>"/></td>
    </tr>
    <tr>
      <td>Last Name</td>
      <td>&#160;&#160;&#160;</td>
      <td><rsc:item name="last_name" row="<%=p%>"/></td>
    </tr>
    <tr>
      <td>Email Address</td>
      <td>&#160;&#160;&#160;</td>
      <td><rsc:item name="email" row="<%=p%>"/></td>
    </tr>
    <tr><td><br/></td></tr>
    <tr>
      <td>Rating</td>
      <td>&#160;&#160;&#160;</td>
      <td><rsc:item name="rating" row="<%=p%>"/></td>
    </tr>
    <tr>
      <td>Events</td>
      <td>&#160;&#160;&#160;</td>
      <td><rsc:item name="num_ratings" row="<%=p%>"/></td>
    </tr>
    <tr>
      <td>Member Since</td>
      <td>&#160;&#160;&#160;</td>
      <td><rsc:item name="member_since" row="<%=p%>"/></td>
    </tr>
    <tr>
      <td>Default Language</td>
      <td>&#160;&#160;&#160;</td>
      <td><rsc:item name="language_name" row="<%=p%>"/></td>
    </tr>



    <tr><td><br/></td></tr>
    <tr>
      <td valign="top">Street Address</td>
      <td>&#160;&#160;&#160;</td>
      <td>
        <rsc:item name="address1" row="<%=p%>"/>
<%
    if (p.getItem("address2") != null)
%>
        <br/><rsc:item name="address2" row="<%=p%>"/><br/>
        <rsc:item name="city" row="<%=p%>"/>, <rsc:item name="state_code" row="<%=p%>"/> <rsc:item name="zip" row="<%=p%>"/> <rsc:item name="country_name" row="<%=p%>"/>
      </td>
    </tr>
    <tr><td><br/></td></tr>
    <tr>
      <td>Home Phone</td>
      <td>&#160;&#160;&#160;</td>
      <td><rsc:item name="home_phone" row="<%=p%>"/></td>
    </tr>
<%
    if (p.getItem("work_phone")!=null) {
%>
    <tr>
      <td>Work Phone</td>
      <td>&#160;&#160;&#160;</td>
      <td><rsc:item name="work_phone" row="<%=p%>"/></td>
    </tr>
<%
    }
%>
    <tr>
      <td>Coder Type</td>
      <td>&#160;&#160;&#160;</td>
      <td><rsc:item name="coder_type_desc" row="<%=p%>"/></td>
    </tr>
<% if (p.getItem("school_name")!=null) { %>
    <tr>
      <td>School</td>
      <td>&#160;&#160;&#160;</td>
      <td><rsc:item name="school_name" row="<%=p%>"/></td>
    </tr>
<% } %>
<% if (p.getItem("company")!=null) { %>
    <tr>
      <td>Company</td>
      <td>&#160;&#160;&#160;</td>
      <td><rsc:item name="company" row="<%=p%>"/></td>
    </tr>
<% } %>
  </table>

<%
    if (!demographicList.isEmpty()) {
%>
  <br/><br/>
  <table cellpadding="0" cellspacing="0">
    <tr><td colspan="2"><b>Demographic Information</b></td></tr>

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
  <table cellpadding="0" cellspacing="0">
    <tr><td><b>Notifications</b></td></tr>

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
  <table cellpadding="5" cellspacing="0">
    <tr><td colspan="3"><b>Handle History</b></td></tr>
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
        if (!addressList.isEmpty()) {
%>
  <br/><br/>
  <table cellpadding="5" cellspacing="0">
    <tr><td colspan="3"><b>Address History</b></td></tr>

    <tr>
      <td><b>old address</b></td>
      <td><b>new address</b></td>
      <td><b>date of change</b></td>
      </tr>
       <rsc:iterator list="<%=addressList%>" id="resultRow">
    <tr>
      <td><rsc:item name="old_value" row="<%=resultRow%>"/></td>
      <td><rsc:item name="new_value" row="<%=resultRow%>"/></td>
      <td><rsc:item name="timestamp" row="<%=resultRow%>" format="MM/dd/yyyy hh:mm a"/></td>
      </tr>
    </rsc:iterator>
  </table>
<%
        }
        if (!violationList.isEmpty()) { %>
  <br/><br/>
  <table cellpadding="5" cellspacing="0">
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
  <table cellpadding="5" cellspacing="0">
    <tr><td colspan="3"><b>Status History</b></td></tr>
    <tr>
      <td><b>old value</b></td>
      <td><b>new value</b></td>
      <td><b>date of change</b></td>
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

<%
        if (!jobList.isEmpty()) {
%>
  <br/><br/>
  <table cellpadding="5" cellspacing="0">
    <tr><td colspan="3"><b>Job Hits</b></td></tr>
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

  <hr size="5"/>
<%
  }
  }
  if (p==null && processed!=null && processed.booleanValue()) {
%>
    <b>Unknown user, try again...</b>
<%
  }
%>

  </body>
</html>


