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
<%@ taglib uri="/WEB-INF/rsc-taglib.tld" prefix="rsc" %>


<%
  ResultSetContainer profiles = null;
  ResultSetContainer demographicList = null;
  ResultSetContainer notifyList = null;
  ResultSetContainer handleList = null;
  ResultSetContainer addressList = null;
  ResultSetContainer.ResultSetRow p = null;
  ArrayList detailList = null;
  String className = null;
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
    <form name="profileForm" method="get" action="<%=Constants.SERVLET_ADDR%>">
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

      int rating = ((Integer)p.getItem("rating").getResultData()).intValue();

      if (rating >= 2200) 
        className = "coderTextRed";
      else if (rating >= 1500 && rating < 2200)
        className = "coderTextYellow";
      else if (rating >= 1200 && rating < 1500)
        className = "coderTextBlue";
      else if (rating >= 900 && rating < 1200)
        className = "coderTextGreen";
      else if (rating >= 1 && rating < 900)
        className = "coderTextGray";
      else if (rating == 0) 
        className = "coderTextWhite";
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
      <td colspan="3"><center>&lt;A HREF="/stat?c=member_profile&amp;amp;cr=<rsc:item name="user_id" row="<%=p%>"/>" CLASS="<%=className%>"&gt;<rsc:item name="handle" row="<%=p%>"/>&lt;/A&gt;</center></td>
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


