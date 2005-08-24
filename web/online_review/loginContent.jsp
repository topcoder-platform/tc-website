<%@ page language="java" %>
<%@ page import="org.apache.struts.action.Action" %>
<%@ page import="org.apache.struts.action.ActionErrors" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/review.tld" prefix="review" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<script language="JavaScript">
  <!--
    formName = '<review:formName action="/login" />';
  // -->
</script>


<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="middle">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="180" class="leftColumn">

        <jsp:include page="/includes/left.jsp" >
            <jsp:param name="level1" value="development"/>
            <jsp:param name="level2" value="components"/>
            <jsp:param name="level3" value="project_review"/>
        </jsp:include>

        </td>
<!-- Left Column ends -->

<!-- Gutter 1 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 1 ends -->

<!-- Middle Column begins -->
        <td width="100%"><img src="/images/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td class="bodyText" width="100%">
                        <p><strong>Forgot your password?</strong><br/>
                        If you cannot remember your password <a href="http://www.topcoder.com/tc?&module=PasswordEmail">click here</a> and we can send it to you via email.</p>

                        <p><strong>New to TopCoder?</strong><br/>
                        <a href="https://www.topcoder.com/reg/index.jsp">Register now.</a> After you complete the registration process, we will send your account activation code via email.</p>
                    </td>
                </tr>
            </table><br/>

            <div align="center">

            <table width="350" border="0" cellpadding="3" cellspacing="0" class="loginForm">
                <tr><td class="testTableTitle">Login</td></tr>
                <tr valign="middle"><html:form action="/login" focus="username">
                    <td align="center">
                        <table border="0" cellpadding="3" cellspacing="0">
                           <tr><td colspan="3"><img src="/images/clear.gif" width="10" height="3" alt="" border="0"></td></tr>
<logic:present name="<%=Action.ERROR_KEY%>">
<!-- User Name Error Text -->
                            <tr valign="middle">
                                <td class="errorText" colspan="3" align="left"><html:errors /></td>
                            </tr>
</logic:present>
<!-- User Name -->
                            <tr valign="middle">
                                <td nowrap class="loginText" align="right"><strong><bean:message key="prompt.username"/>:</strong></td>
                                <td colspan="2" align="left"><html:text onkeypress="submitEnter(event,document.loginForm)" property="username" styleClass="registerForm" size="15" maxlength="30" /></td>
                            </tr>

<!-- Password -->
                            <tr valign="middle">
                                <td nowrap class="loginText" align="right"><strong><bean:message key="prompt.password"/>:</strong></td>
                                <td align="left"><html:password property="password" onkeypress="submitEnter(event,document.loginForm)" styleClass="registerForm" size="15" maxlength="15" redisplay="false" /></td>
                                <td nowrap class="loginText">&#160;&#160;<a href="JavaScript:document.forms[formName].submit()" class="loginText">Login&#160;&gt;</a></td>
                            </tr>

                           <tr><td colspan="3"><img src="/images/clear.gif" width="10" height="3" alt="" border="0"></td></html:form></tr>
                        </table>
                    </td>
                </tr>
            </table>

            <p><br></p>
            <p><br></p>

            </div>
        </td>
<!--Middle Column ends -->

<!-- Gutter 2 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 2 ends -->

<!-- Right Column begins -->
        <td width="170">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr><td height="15"><img src="/images/clear.gif" alt="" width="170" height="15" border="0" /></td></tr>
            </table>
        </td>
<!--Right Column ends -->

<!-- Gutter 3 begins -->
        <td width="10"><img src="/images/clear.gif" alt="" width="10" height="10" border="0" /></td>
<!-- Gutter 3 ends -->
    </tr>
</table>

