<%--                   
/**
 *  profile.jsp
 */
--%>
<%@  page 
  language="java"
  import="java.util.*,
          com.topcoder.common.web.data.report.*"

%>


<html>
  <head>
    <title>TopCoder Reporting</title>
  </head>
  <body>
<%
    Map m = null;
    ResultSetContainer profile = null;
    m = (Map)request.getAttribute(Constants.REPORT_PROFILE_KEY);
    if (m!=null) {
%>
  <table cellpadding="0" cellspacing="0" border="0">
    <tr>
      <td colspan="3"><font size="+2"><center><b><%=p.getHandle()%></b></center></font></td>
    </tr>
    <tr>
      <td colspan="3"><center><b><%=p.getUserId()%></b></center></td>
    </tr>
    <tr>
      <td><br/></td>
    </tr>
    <tr>
      <td colspan="3"><center>&lt;A HREF="/stat?c=member_profile&amp;amp;cr=<%=p.getUserId()%>" CLASS="<%=className%>"&gt;<%=p.getHandle()%>&lt;/A&gt;</center></td>
    </tr>
    <tr>
      <td><br/></td>
    </tr>
    <tr>
      <td>Last Rated Event</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getLastRatedEvent().length()>0 ? p.getLastRatedEvent() : "Never Competed"%></td>
    </tr>
    <tr>
      <td>Referral Type</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getReferralType() + (p.getReferralInfo().length()>0 ? ", "+p.getReferralInfo() : "")%></td>
    </tr>
    <tr>
      <td>Competition Notification</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getNotify()%></td>
    </tr>
    <tr>
      <td>Status</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getStatus()%></td>
    </tr>
    <tr><td><br/></td></tr>
    <br/><br/>
    <tr>
      <td>First Name</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getFirstName()%></td>
    </tr>
    <tr>
      <td>Last Name</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getLastName()%></td>
    </tr>
    <tr>
      <td>Email Address</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getEmail()%></td>
    </tr>
    <tr><td><br/></td></tr>
    <tr>
      <td>Rating</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getRating()%></td>
    </tr>
    <tr>
      <td>Events</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getNumRatings()%></td>
    </tr>
    <tr>
      <td>Member Since</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getMemberSince()%></td>
    </tr>
    <tr><td><br/></td></tr>
    <tr>
      <td valign="top">Street Address</td>
      <td>&#160;&#160;&#160;</td>
      <td>
        <%=p.getAddress1()%>
<%
    if (p.getAddress2().length() > 0)
%>
        <br/><%=p.getAddress2()%><br/>
        <%=p.getCity()%>, <%=p.getState()%> <%=p.getZip()%>
      </td>
    </tr>
    <tr><td><br/></td></tr>
    <tr>
      <td>Home Phone</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getHomePhone()%></td>
    </tr>
<%
    if (p.getWorkPhone().length() > 0) {
%>
    <tr>
      <td>Work Phone</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getWorkPhone()%></td>
    </tr>
<%
    }
%>
    <tr>
      <td>Coder Type</td>
      <td>&#160;&#160;&#160;</td>
      <td><%=p.getCoderType()%></td>
    </tr>
  </table>
<%
  }
%>
  </body>
</html>



