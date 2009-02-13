<%@ page import="java.util.Map,
                 java.util.Iterator,
                 com.topcoder.web.tc.model.JobHitData"%>
<%@ page errorPage="/errorPage.jsp" %>
<%@ taglib uri="tc-taglib.tld" prefix="tc" %>
<jsp:useBean id="JobHitData" scope="request" class="com.topcoder.web.tc.model.JobHitData" />
<tc:getProperty id="coderType" name="JobHitData" property="CoderTypeId" />
<img src="/i/clear.gif" width="240" height="1" vspace="5" border="0"><br>
  <div align="center">
  <table width="100%" border="0" cellspacing="0" cellpadding="1" align="center">
  <TR valign="middle">
    <TD CLASS="statText" ALIGN="left" VALIGN="middle" COLSPAN="2">
      Thank you for expressing interest in TopCoder employment services.  You have successfully indicated your interest in
      this position(s).  Much of your TopCoder profile information will now become available to be viewed by the employer.
      Below, you will find a summarization of your TopCoder profile information that will be available to the employer.
      Please verify the accuracy of all of the information.  In addition to the information below, your past and/or future
      competition statistics, your current and/or future member photo, and your current and/or future resume will also
      be available for viewing by the employer.<BR/>
      <BR/>
      <B>If you would like to make changes to the information below, click <A HREF="/Registration" class="statTextBig">here</A> to update your profile.</B><BR/>
      <BR/>
    </TD>
  </TR>
  <TR valign="middle">
    <TD CLASS="statTextBig" ALIGN="left" VALIGN="middle" COLSPAN="2">
      <% if (JobHitData.hasResume()) { %>
        Click <A HREF="JavaScript:void window.open('/Resume?t=ViewUploadTask','Resume_Upload','top=2,left=2,width=300,height=300,status=0');" CLASS="statTextBig">here</A> to upload a new resume.</A>
        <br/>
        Click <A HREF="/Resume?t=DownloadTask" CLASS="statTextBig">here</A> to download your resume.
      <% } else { %>
        You do NOT currently have a resume on file at TopCoder.  Since most employers will look for this information, we strongly encourage you to upload a resume.  If you would like to upload a resume now, click <A HREF="JavaScript:void window.open('/Resume?t=ViewUploadTask','Resume_Upload','top=2,left=2,width=300,height=300,status=0');" CLASS="statTextBig">here</a>.
      <% } %>
    </TD>
  </TR>
  <TR><TD><IMG SRC="/i/spacer.gif" WIDTH="1" HEIGHT="10"/></TD></TR>


  <tr valign="middle">
    <td class="statTextBig" align="left" valign="middle" background="/i/steel_bluebv_bg.gif" height="16" colspan="2">&nbsp;Contact Information</td>
  </tr>
  <tr valign="middle">
    <td colspan="2" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td>
  </tr>
    <tr valign="middle">
    <td class="statText" width="30" align="right" valign="middle"><img src="/i/clear.gif" width="30" height="1"></td>
    <td class="statText" align="left" valign="top">
    Name: <jsp:getProperty name="JobHitData" property="firstName" />
        <jsp:getProperty name="JobHitData" property="lastName" /><br>
      Address:<br>
        <jsp:getProperty name="JobHitData" property="address1" /><br>
        <jsp:getProperty name="JobHitData" property="address2" /><br>
    <jsp:getProperty name="JobHitData" property="city" />,
        <jsp:getProperty name="JobHitData" property="state" />,
        <jsp:getProperty name="JobHitData" property="zip" />,
        <tc:getProperty id="country" name="JobHitData" property="Country" />
        <tc:countrySelect name="country" selectedValue="<%=country%>" selectedOnly="true" /><br>
        Phone: <jsp:getProperty name="JobHitData" property="phone" /><br>
    </td>
  </tr>
  <tr valign="middle">
    <td colspan="2" class="statText" valign="middle">&nbsp;</td>
  </tr>
  <tr valign="middle">
    <td class="statText" align="right" valign="middle">&nbsp;</td>
    <td class="statText"  align="left" valign="top">
      Email: <jsp:getProperty name="JobHitData" property="email" /><br>
      Handle: <jsp:getProperty name="JobHitData" property="handle" /><br>
      Member Since Date: <jsp:getProperty name="JobHitData" property="memberSince" /><br>
      Most Recent Rated Event: <jsp:getProperty name="JobHitData" property="mostRecentEvent" /><br>
<%if (coderType.equalsIgnoreCase(JobHitData.CODER_TYPE_STUDENT)) { %>
      <br/>
      GPA: <jsp:getProperty name="JobHitData" property="gpa" /><br>
      GPA Scale: <jsp:getProperty name="JobHitData" property="gpaScale" /><br>
<% } %>
    </td>
  </tr>
  <tr valign="middle">
    <td colspan="2" class="statText" valign="middle">&nbsp;</td>
  </tr>
  <tr valign="middle">
    <td class="statText" align="right" valign="middle">&nbsp;</td>
    <td class="statText"  align="left" valign="top">
    </td>
  </tr>
  <tr valign="middle">
    <td colspan="2" class="statText" valign="middle">&nbsp;</td>
  </tr>
  <tr valign="middle">
    <td class="statTextBig" align="left" valign="middle" background="/i/steel_bluebv_bg.gif" height="16" colspan="2">&nbsp;Demographics</td>
  </tr>
  <tr valign="middle">
    <td colspan="2" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td>
  </tr>
  <tr valign="middle">
    <td class="statText" align="right" valign="middle">&nbsp;</td>
    <td class="statText"  align="left" valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="1" align="center">
<%if (coderType.equalsIgnoreCase(JobHitData.CODER_TYPE_STUDENT)) { %>
    <tr>
        <td class="statText">School:</td>
        <td class="statText">
            <jsp:getProperty name="JobHitData" property="school" />
      </td>
    </tr>
<%}%>

        <% Map demographics = JobHitData.getDemographics();
            Iterator it = demographics.entrySet().iterator();
            Map.Entry me = null;
            while (it.hasNext()) {
              me = (Map.Entry) it.next();
         %>
          <tr><td class="statText"><%=me.getKey().toString()%>:</td><td class="statText"><%=me.getValue().toString()%></td></tr>
        <% } %>
      </table>
    </td>
  </tr>
  <tr valign="middle">
    <td colspan="2" class="statText" valign="middle">&nbsp;</td>
  </tr>
    <tr valign="middle">
    </tr>
  </table>
