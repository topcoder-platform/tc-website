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

<%
  ArrayList profiles = null;
  Profile p = null;
  ArrayList educationList = null;
  ArrayList demographicList = null;
  ArrayList jobList = null;
  String className = null;
  Boolean processed = (Boolean)request.getAttribute(Constants.PROCESSED_KEY); 
  if (processed!=null && processed.booleanValue()) {
    profiles = (ArrayList)request.getAttribute(Constants.REPORT_PROFILE_KEY);
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
      p = (Profile)profiles.get(k);
      educationList = p.getEducationList();
      demographicList = p.getDemographicList();
      jobList = p.getJobList();
      
      int rating = Integer.parseInt(p.getRating()); 

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
    if (demographicList!=null) {
%>
  <br/><br/>
  <table cellpadding="0" cellspacing="0"> 
    <tr><td colspan="2"><b>Demographic Information</b></td></tr>
  
<%
      for(int i=0; i<demographicList.size(); i++) {
%>
    <tr>
<%
        ResultItem[] items = (ResultItem[])demographicList.get(i);
        for(int j=0; j<items.length; j++) {
%>
      <td><%=items[j].toString()%></td>
      <td>&#160;&#160;&#160;</td>
<%
        }
%>
    </tr>
<%
      }
    }
%>

  </table>
 


<%
    if (educationList!=null) {
%>
  <br/><br/>
  <table cellpadding="0" cellspacing="0"> 
    <tr><td colspan="5"><b>Education History</b></td></tr>
  
<%
      for(int i=0; i<educationList.size(); i++) {
%>
    <tr>
<%
        ResultItem[] items = (ResultItem[])educationList.get(i);
%>
      <td>
        <%=items[4].toString()%>/<%=items[3].toString()%> <%=items[1].toString()%> from <%=items[0].toString()%> in <%=items[2].toString()%><br/>
      </td> 
    </tr>
<%
      }
    }
%>
  </table>

   
<%
    if (jobList!=null) {
%>
  <br/><br/>
  <table cellpadding="0" cellspacing="0"> 
    <tr><td colspan="5"><b>Professional Work History</b></td></tr>
  
<%
      for(int i=0; i<jobList.size(); i++) {
%>
    <tr>
<%
        ResultItem[] items = (ResultItem[])jobList.get(i);
%>
      <td>
<%
      String endText = "";
      if (items[5].toString().compareTo("0") == 0)
        endText = "Present";
      else
        endText = items[4].toString()+"/"+items[5].toString();
%>

      <%=items[2].toString()%>/<%=items[3].toString()%> - <%=endText%>&#160;&#160;&#160;<%=items[0].toString()%> - <%=items[1].toString()%>

      </td> 
    </tr>
<%
      }
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


