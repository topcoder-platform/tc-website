<%--                   
/**
 *  profile.jsp
 */
--%>
<%@  page 
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
          com.topcoder.common.web.data.report.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>


<html>
  <head>
    <title>TopCoder Reporting</title>
  </head>
  <body>
<%
    Map m = null;
    ResultSetContainer container = null;
    ResultSetContainer.ResultSetRow p = null;
    m = (Map)request.getAttribute(Constants.REPORT_PROFILE_DETAIL_KEY);
    if (m!=null) {
      container = (ResultSetContainer)m.get("Profile_Detail");
      p = container.getRow(0);
%>
  <table cellpadding="0" cellspacing="0" border="0">
    <TR><TD><A HREF="<%=Constants.SERVLET_ADDR%>"><< back to main menu</A><BR/><BR/></TD></TR>
    <tr>
      <td colspan="3"><font size="+2"><center><b><%=p.getItem("handle").toString()%></b></center></font></td>
    </tr>
    <tr>
      <td colspan="3"><center><b><%=p.getItem("user_id").toString()%></b></center></td>
    </tr>
    <tr>
      <td><br/></td>
    </tr>
    <tr>
      <td><br/></td>
    </tr>
    <tr>
      <td>Last Rated Event</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getItem("last_rated_event").toString().length()>0 ? p.getItem("last_rated_event").toString():"Never Competed"%></td>
    </tr>
    <tr>
      <td>Referral Type</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getItem("referral_desc").toString() + (p.getItem("referral_type").toString().length()>0 ? ", "+p.getItem("referral_type").toString():"")%></td>
    </tr>
    <tr>
      <td>Competition Notification</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getItem("notify").toString()%></td>
    </tr>
    <tr>
      <td>Status</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getItem("user_status_desc").toString()%></td>
    </tr>
    <tr><td><br/></td></tr>
    <br/><br/>
    <tr>
      <td>First Name</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getItem("first_name").toString()%></td>
    </tr>
    <tr>
      <td>Last Name</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getItem("last_name").toString()%></td>
    </tr>
    <tr>
      <td>Email Address</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getItem("email").toString()%></td>
    </tr>
    <tr><td><br/></td></tr>
    <tr>
      <td>Rating</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getItem("rating").toString()%></td>
    </tr>
    <tr>
      <td>Events</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getItem("num_ratings").toString()%></td>
    </tr>
    <tr>
      <td>Member Since</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getItem("member_since").toString()%></td>
    </tr>
    <tr><td><br/></td></tr>
    <tr>
      <td valign="top">Street Address</td>
      <td>&#160;&#160;&#160;</td>
      <td>
        <%=p.getItem("address1").toString()%>
<%
    if (p.getItem("address2").toString().length() > 0)
%>
        <br/><%=p.getItem("address2").toString()%><br/>
        <%=p.getItem("city").toString()%>, <%=p.getItem("state_code").toString()%> <%=p.getItem("zip").toString()%>
      </td>
    </tr>
    <tr><td><br/></td></tr>
    <tr>
      <td>Home Phone</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getItem("home_phone").toString()%></td>
    </tr>
<%
    if (p.getItem("work_phone").toString().length() > 0) {
%>
    <tr>
      <td>Work Phone</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getItem("work_phone").toString()%></td>
    </tr>
<%
    }
%>
    <tr>
      <td>Coder Type</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getItem("coder_type_desc").toString()%></td>
    </tr>
  </table>
<%
  }
%>
  </body>
</html>



