<%@ include file="nocache.jsp" %>
<%@ page errorPage="error.jsp" %>
<%@ taglib uri="tc-taglib.tld" prefix="tc" %>
<%@ page import="com.topcoder.web.reg.servlet.*" %>
<jsp:useBean id="Registration" scope="session" class="com.topcoder.web.reg.bean.Registration" />
<jsp:useBean id="navigation" scope="session" class="com.topcoder.common.web.data.Navigation" />
<tc:getProperty id="user" name="navigation" property="user" type="com.topcoder.ejb.AuthenticationServices.User" />
<jsp:setProperty name="Registration" property="user" value="<%=user%>" />
<jsp:setProperty name="Registration" property="Step" value="<%=Registration.STEP_3%>" />
<tc:getProperty id="coderType" name="Registration" property="CoderType" />
<img src="/i/clear.gif" width="240" height="1" vspace="5" border="0"><br>
  <div align="center">
  <form action="<%=response.encodeURL(Controller.ALIAS)%>" method="post">
        <input type="hidden" name="<%=Controller.TASK%>" value="Registration">
  <table width="100%" border="0" cellspacing="0" cellpadding="1" align="center">
    <tr valign="middle">
        <td></td>
        <td class="errorText" align="left" valign="middle"><jsp:getProperty name="Registration" property="RegisterError" /></td>
    </tr>
  <tr valign="middle">
    <td class="statTextBig" align="left" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Contact Information</td>
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">
      <a href="<%=response.encodeURL(Registration.PAGE_1)%>">&lt;&lt;Edit</a>&nbsp;
    </td>
  </tr>
  <tr valign="middle">
    <td colspan="2" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td>
  </tr>    
    <tr valign="middle">
    <td class="statText" width="30" align="right" valign="middle"><img src="/i/clear.gif" width="30" height="1"></td>
    <td class="statText" align="left" valign="top">
    Name: <jsp:getProperty name="Registration" property="FirstName" />
        <jsp:getProperty name="Registration" property="LastName" /><br>
      Address:<br>  
        <jsp:getProperty name="Registration" property="Address1" /><br>
        <jsp:getProperty name="Registration" property="Address2" /><br>
    <jsp:getProperty name="Registration" property="City" />,
        <jsp:getProperty name="Registration" property="State" />,
        <jsp:getProperty name="Registration" property="Zip" />,
        <tc:getProperty id="country" name="Registration" property="Country" />
        <tc:countrySelect name="country" selectedValue="<%=country%>" selectedOnly="true" /><br>
        Phone: <jsp:getProperty name="Registration" property="Phone" /><br>
    </td>
  </tr>
  <tr valign="middle">
    <td colspan="2" class="statText" valign="middle">&nbsp;</td>
  </tr>  
<!--
  <tr valign="middle">
    <td colspan="2" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Handle &amp; Password</td>
  </tr>
  <tr valign="middle">
    <td colspan="2" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td>
  </tr>
-->
  <tr valign="middle">
    <td class="statText" align="right" valign="middle">&nbsp;</td>
    <td class="statText"  align="left" valign="top">
    Email: <jsp:getProperty name="Registration" property="Email" /><br>
        Handle: <jsp:getProperty name="Registration" property="Handle" /><br>
        Password: <jsp:getProperty name="Registration" property="MaskedPassword" /><br>
        Email Notification: 
        <tc:notification selectedOnly="true" selectedValues="<%=Registration.getNotifications()%>" class="statText">
          <%=notifyControl%>&#160;&#160;
        </tc:notification>
        <br>
        Quote: <jsp:getProperty name="Registration" property="Quote" /><br>
    </td>
  </tr>
  <tr valign="middle">
    <td colspan="2" class="statText" valign="middle">&nbsp;</td>
  </tr>  
<!--
  <tr valign="middle">
    <td colspan="2" class="statTextBig" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Editor &amp; Language</td>
  </tr>
  <tr valign="middle">
    <td colspan="2" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td>
  </tr>
-->
  <tr valign="middle">
    <td class="statText" align="right" valign="middle">&nbsp;</td>
    <td class="statText"  align="left" valign="top">
        <tc:getProperty id="editor" name="Registration" property="Editor" />
    Default Editor: <tc:editorSelect name="editor" selectedValue="<%=editor%>" selectedOnly="true" /><br>
        <tc:getProperty id="language" name="Registration" property="Language" />
    Default Language: <tc:languageSelect name="language" selectedValue="<%=language%>" selectedOnly="true" /><br>
    </td>
  </tr>
  <tr valign="middle">
    <td colspan="2" class="statText" valign="middle">&nbsp;</td>
  </tr>  
  <tr valign="middle">
    <td class="statTextBig" align="left" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">&nbsp;Demographics</td>
    <td class="statTextBig" align="right" valign="middle" background="/i/steel_bluebv_bg.gif" height="16">
      <a href="<%=response.encodeURL(Registration.PAGE_2)%>">&lt;&lt;Edit</a>&nbsp;
    </td>
  </tr>
  <tr valign="middle">
    <td colspan="2" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td>
  </tr>
  <tr valign="middle">
    <td class="statText" align="right" valign="middle">&nbsp;</td>
    <td class="statText"  align="left" valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="1" align="center">
<% if (Registration.isRegister()) {%>
    <tr>
      <td class="statText">Learned About TopCoder:</td>
      <td class="statText">
            <tc:getProperty id="referral" name="Registration" property="Referral" />
            <tc:referralSelect name="referral" selectedValue="<%=referral%>" selectedOnly="true" />
    <% if (Registration.getReferral().equals(Integer.toString(Registration.CAMPUS_JOB_FAIR_REFERRAL))) { %>
            <tc:getProperty id="referralOther" name="Registration" property="ReferralOther" />
            (<tc:schoolSelect name="referralOther" selectedValue="<%=referralOther%>" selectedOnly="true" />)
    <% } else { %>
            (<jsp:getProperty name="Registration" property="ReferralOther" />)
    <% } %>
      </td>
    </tr>
    <tr valign="middle">
      <td colspan="2" class="statText" valign="middle">&nbsp;</td>
    </tr>
<% } %>
<%if (coderType.equalsIgnoreCase(Registration.CODER_TYPE_STUDENT)) { %>
    <tr>
        <td class="statText">School:</td>
        <td class="statText">
            <tc:getProperty id="school" name="Registration" property="School" />
            <tc:schoolSelect name="school" selectedValue="<%=school%>" selectedOnly="true" /><br>
      </td>
    </tr>
<%}%>

        <tc:demographic coderType="<%=coderType%>" selectedValues="<%=Registration.getDemographics()%>" selectedOnly="true">
          <tr><td class="statText"><%=demographicQuestion%>:</td><td class="statText"><%=demographicAnswer%></td></tr>
        </tc:demographic>
      </table>
    </td>
  </tr>
  <tr valign="middle">
    <td colspan="2" class="statText" valign="middle">&nbsp;</td>
  </tr>  
    <tr valign="middle">
        <td align="right" valign="middle" class="statText"><input type="button" name="backButton" value="&lt; back ] " onclick="location='<%=response.encodeURL("demo.jsp")%>';"></td>
<% if (Registration.isRegister()) { %>
        <td align="left" valign="middle" class="statText"><input type="submit" name="registerButton" value="[ register &gt;"></td>
<% } else { %>
        <td align="left" valign="middle" class="statText"><input type="submit" name="updateButton" value="[ update &gt;"></td>
<% } %>
    </tr>
  </table>
    </form>
