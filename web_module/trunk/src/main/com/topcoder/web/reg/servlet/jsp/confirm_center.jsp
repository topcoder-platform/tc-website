<jsp:include page="nocache.jsp" />
<%@ page session="true" %>
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
            
            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr valign="middle">
                    <td></td>
                    <td class="errorText"><jsp:getProperty name="Registration" property="RegisterError" /></td>
                </tr>

                <tr>
                    <td colspan="2" class="statTextBig" background="/i/steel_bluebv_bg.gif">Contact Information</td>
                    <td class="statTextBig" background="/i/steel_bluebv_bg.gif" width="1"><a href="<%=response.encodeURL(Registration.PAGE_1)%>" class="statText">Edit</a></td>
                </tr>
                
                <tr><td colspan="3" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td></tr>    
    
                <tr valign="top">
                    <td class="statText" align="right"><strong>Name:</strong></td>
                    <td class="statText"><jsp:getProperty name="Registration" property="FirstName" /> <jsp:getProperty name="Registration" property="LastName" /></td>
                    <td></td>
                </tr>

                <tr valign="top">
                    <td class="statText" align="right"><strong>Address:</strong></td>
                    <td class="statText">
                        <jsp:getProperty name="Registration" property="Address1" /><br>
                        <jsp:getProperty name="Registration" property="Address2" /><br>
                        <jsp:getProperty name="Registration" property="City" />, <jsp:getProperty name="Registration" property="State" />&nbsp;&nbsp;<jsp:getProperty name="Registration" property="Zip" />, <tc:getProperty id="country" name="Registration" property="Country" /> <tc:countrySelect name="country" selectedValue="<%=country%>" selectedOnly="true" /><br>
                    </td>
                    <td></td>
                </tr>

                <tr valign="top">
                    <td class="statText" align="right"><strong>Phone:</strong></td>
                    <td class="statText"><jsp:getProperty name="Registration" property="Phone" /></td>
                    <td></td>
                </tr>
  
                <tr><td colspan="3" class="statText" valign="middle">&nbsp;</td></tr>  

                <tr valign="top">
                    <td class="statText" align="right"><strong>Email: </strong></td>
                    <td class="statText"><jsp:getProperty name="Registration" property="Email" /></td>
                    <td></td>
                </tr>
  
                <tr valign="top">
                    <td class="statText" align="right"><strong>Handle:</strong></td>
                    <td class="statText"><jsp:getProperty name="Registration" property="Handle" /></td>
                    <td></td>
                </tr>
  
                <tr valign="top">
                    <td class="statText" align="right"><strong>Password:</strong></td>
                    <td class="statText"><jsp:getProperty name="Registration" property="MaskedPassword" /></td>
                    <td></td>
                </tr>
  
                <tr valign="top">
                    <td class="statText" align="right"><strong>Email Notification:</strong></td>
                    <td class="statText">
                        <tc:notification selectedOnly="true" selectedValues="<%=Registration.getNotifications()%>" class="statText">
                            <%=notifyControl%><br>
                        </tc:notification><br>
                    </td>
                    <td></td>
                </tr>
  
                <tr valign="top">
                    <td class="statText" align="right"><strong>Quote:</strong></td>
                    <td class="statText"><jsp:getProperty name="Registration" property="Quote" /></td>
                    <td></td>
                </tr>
  
                <tr><td colspan="3" class="statText" valign="middle">&nbsp;</td></tr>  

                <tr valign="top">
                    <tc:getProperty id="language" name="Registration" property="Language" />
                    <td class="statText" align="right"><strong>Default Language:</strong></td>
                    <td class="statText"><tc:languageSelect name="language" selectedValue="<%=language%>" selectedOnly="true" /></td>
                    <td></td>
                </tr>
  
                <tr><td colspan="3" class="statText" valign="middle">&nbsp;</td></tr>  

                <tr>
                    <td colspan="2" class="statTextBig" background="/i/steel_bluebv_bg.gif">Demographics</td>
                    <td class="statTextBig" background="/i/steel_bluebv_bg.gif" width="1"><a href="<%=response.encodeURL(Registration.PAGE_2)%>" class="statText">Edit</a></td>
                </tr>
                
                <tr><td colspan="3" class="statTextBig" valign="middle"><img src="/i/clear.gif" width="1" height="2" border="0"></td></tr>    
    
<% if (Registration.isRegister()) {%>

                <tr valign="top">
                    <td class="statText" align="right"><strong>Learned About TopCoder:</strong></td>
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
                    <td></td>
                </tr>
    
                <tr><td colspan="3" class="statText" valign="middle">&nbsp;</td></tr>
                
<% } %>

<%if (coderType.equalsIgnoreCase(Registration.CODER_TYPE_STUDENT)) { %>

                <tr>
                    <td class="statText" align="right"><strong>School:</strong></td>
                    <td class="statText">
                        <tc:getProperty id="school" name="Registration" property="School" />
                        <tc:schoolSelect name="school" selectedValue="<%=school%>" selectedOnly="true" /><br>
                    </td>
                    <td></td>
                </tr>

<%}%>

                <tc:demographic coderType="<%=coderType%>" selectedValues="<%=Registration.getDemographics()%>" selectedOnly="true">
                    <tr>
                        <td class="statText" align="right"><strong><%=demographicQuestion%>:</strong></td>
                        <td class="statText"><%=demographicAnswer%></td>
                        <td></td>
                    </tr>
                </tc:demographic>

                <tr><td colspan="3" class="statText" valign="middle">&nbsp;</td></tr> 
                 
                <tr valign="middle">
                    <td align="center" class="statText" colspan="3">
                        &nbsp;&nbsp;<input type="button" name="backButton" value="back" onclick="location='<%=response.encodeURL("demo.jsp")%>';">&nbsp;&nbsp;
                    
<% if (Registration.isRegister()) { %>

                        <input type="submit" name="registerButton" value="register">&nbsp;&nbsp;

<% } else { %>

                        <input type="submit" name="updateButton" value="update">&nbsp;&nbsp;
                    </td>

<% } %>
                </tr>
            </table>
            </form>
