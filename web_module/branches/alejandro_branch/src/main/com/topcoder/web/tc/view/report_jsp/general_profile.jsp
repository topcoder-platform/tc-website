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
  ResultSetContainer.ResultSetRow p = null;
  Boolean processed = (Boolean)request.getAttribute(Constants.PROCESSED_KEY);
  if (processed!=null && processed.booleanValue()) {
    profiles = (ResultSetContainer)request.getAttribute(Constants.REPORT_PROFILE_LIST_KEY);
  }
%>

<html>
  <head>
    <title>TopCoder Reporting</title>
  </head>
  <body>
    <a href=<%=Constants.SERVLET_ADDR%>><< back to main menu<a><br/><br/>
    General Profile Lookup<br/><br/>
    (Use % for a wildcard.)
    <form name="profileForm" method="get" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
      <input type="hidden" name="module" value="GeneralProfileLookup"/>
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
  if (profiles != null  ) {
    for (int k=0; k<profiles.size(); k++) {
      p = profiles.getRow(k);

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
      <td colspan="3"><center><A HREF="mailto:<rsc:item name="email" row="<%=p%>"/>" CLASS="">Send email to <rsc:item name="handle" row="<%=p%>"/></A></center></td>
    </tr>
    <tr>
      <td><br/></td>
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
  </table>

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


