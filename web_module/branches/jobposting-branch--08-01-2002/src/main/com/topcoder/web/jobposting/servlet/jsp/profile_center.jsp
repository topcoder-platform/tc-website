<%@ page errorPage="/errorPage.jsp" %>
<%@ taglib uri="tc-taglib.tld" prefix="tc" %>
<jsp:useBean id="JobHitTask" scope="request" CLASS="com.topcoder.web.jobposting.bean.JobHitTask" />
<tc:getProperty id="coderType" name="JobHitTask" property="CoderType" />
<img src="/i/clear.gif" width="240" height="1" vspace="5" border="0"><br>
  <div align="center">
  <table width="100%" border="0" cellspacing="0" cellpadding="1" align="center">
  <TR valign="middle">
    <TD CLASS="errorText" ALIGN="left" VALIGN="middle" COLSPAN="2">
      You have successfully applied!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      This more hand holding lovely text here
      blah<BR/>
      blah<BR/>
      blah<BR/>
      blah<BR/>
      blah<BR/>
      blah<BR/>
      blah<BR/>
      blah<BR/>
      blah<BR/>
      blah<BR/>
      blah<BR/>
      blah<BR/>
      blah<BR/>
      blah<BR/>
      blah<BR/>
    </TD>
  </TR>
  <TR valign="middle">
    <TD CLASS="errorText" ALIGN="left" VALIGN="middle" COLSPAN="2">
      <% if (JobHitTask.hasResume()) { %>
        <A HREF="JavaScript:void window.open('/Resume?&t=ViewUploadTask','Resume_Upload','top=2,left=2,width=300,height=300,status=0');" CLASS="statText">Click here to upload a new resume.</a>
        <br/>
        <A HREF="/Resume?&t=DownloadTask" CLASS="statText">Click here to download your resume.</a>
      <% } else { %>
        <A HREF="JavaScript:void window.open('/Resume?&t=ViewUploadTask','Resume_Upload','top=2,left=2,width=300,height=300,status=0');" CLASS="statText">Click here to upload a resume.</a>
      <% } %>
    </TD>
  </TR>
  <TR valign="middle">
    <TD CLASS="statTextBig" align="left" valign="middle" background="/i/steel_bluebv_bg.gif" height="16" colspan="2">&nbsp;Contact Information</TD>
  </TR>
  <TR valign="middle">
    <TD colspan="2" CLASS="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></TD>
  </TR>    
    <TR valign="middle">
    <TD CLASS="statText" width="30" align="right" valign="middle"><img src="/i/clear.gif" width="30" height="1"></TD>
    <TD CLASS="statText" align="left" valign="top">
    Name: <jsp:getProperty name="JobHitTask" property="FirstName" />
        <jsp:getProperty name="JobHitTask" property="LastName" /><br>
      Address:<br>  
        <jsp:getProperty name="JobHitTask" property="Address1" /><br>
        <jsp:getProperty name="JobHitTask" property="Address2" /><br>
    <jsp:getProperty name="JobHitTask" property="City" />,
        <jsp:getProperty name="JobHitTask" property="State" />,
        <jsp:getProperty name="JobHitTask" property="Zip" />,
        <tc:getProperty id="country" name="JobHitTask" property="Country" />
        <tc:countrySelect name="country" selectedValue="<%=country%>" selectedOnly="true" /><br>
        Phone: <jsp:getProperty name="JobHitTask" property="Phone" /><br>
    </TD>
  </TR>
  <TR valign="middle">
    <TD colspan="2" CLASS="statText" valign="middle">&nbsp;</TD>
  </TR>  
  <TR valign="middle">
    <TD CLASS="statText" align="right" valign="middle">&nbsp;</TD>
    <TD CLASS="statText"  align="left" valign="top">
    Email: <jsp:getProperty name="JobHitTask" property="Email" /><br>
        Handle: <jsp:getProperty name="JobHitTask" property="Handle" /><br>
        Email Notification: 
        <tc:notification selectedOnly="true" selectedValues="<%=JobHitTask.getNotifications()%>" CLASS="statText">
          <%=notifyControl%>&#160;&#160;
        </tc:notification>
        <br>
        Quote: <jsp:getProperty name="JobHitTask" property="Quote" /><br>
    </TD>
  </TR>
  <TR valign="middle">
    <TD colspan="2" CLASS="statText" valign="middle">&nbsp;</TD>
  </TR>  
  <TR valign="middle">
    <TD CLASS="statText" align="right" valign="middle">&nbsp;</TD>
    <TD CLASS="statText"  align="left" valign="top">
        <tc:getProperty id="editor" name="JobHitTask" property="Editor" />
    Default Editor: <tc:editorSelect name="editor" selectedValue="<%=editor%>" selectedOnly="true" /><br>
        <tc:getProperty id="language" name="JobHitTask" property="Language" />
    Default Language: <tc:languageSelect name="language" selectedValue="<%=language%>" selectedOnly="true" /><br>
    </TD>
  </TR>
  <TR valign="middle">
    <TD colspan="2" CLASS="statText" valign="middle">&nbsp;</TD>
  </TR>  
  <TR valign="middle">
    <TD CLASS="statTextBig" align="left" valign="middle" background="/i/steel_bluebv_bg.gif" height="16" colspan="2">&nbsp;Demographics</TD>
  </TR>
  <TR valign="middle">
    <TD colspan="2" CLASS="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></TD>
  </TR>
  <TR valign="middle">
    <TD CLASS="statText" align="right" valign="middle">&nbsp;</TD>
    <TD CLASS="statText"  align="left" valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="1" align="center">
<%if (coderType.equalsIgnoreCase(JobHitTask.CODER_TYPE_STUDENT)) { %>
    <TR>
        <TD CLASS="statText">School:</TD>
        <TD CLASS="statText">
            <tc:getProperty id="school" name="JobHitTask" property="School" />
            <tc:schoolSelect name="school" selectedValue="<%=school%>" selectedOnly="true" /><br>
      </TD>
    </TR>
<%}%>

        <tc:demographic coderType="<%=coderType%>" selectedValues="<%=JobHitTask.getDemographics()%>" selectedOnly="true">
          <TR><TD CLASS="statText"><%=demographicQuestion%>:</TD><TD CLASS="statText"><%=demographicAnswer%></TD></TR>
        </tc:demographic>
      </table>
    </TD>
  </TR>

  <TR valign="middle">
    <TD colspan="2" CLASS="statText" valign="middle">&nbsp;</TD>
  </TR>
    <TR valign="middle">
    </TR>
  </table>
