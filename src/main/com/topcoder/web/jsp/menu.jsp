<%@  page
 language="java"
 errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation"
%>
<%
   Navigation nav = (Navigation) session.getAttribute ( "navigation" );
   if ( nav == null ) nav = new Navigation();
%>
<%
   boolean isReg = "true".equals(request.getParameter("isReg"));
%>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr><td height="4" class="headStripe"><img src="/images/clear.gif" alt="" height="4" border="0" /></td></tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CC0000">
    <tr valign="middle">
        <td class="topNav" width="49%">&#160;</td>
        <td class="topNav" nowrap><A href="Javascript:arena()" class="topLink">Competition Applet</A></td> 

            <% if (isReg) { %>
                <td class="topNavOn" nowrap>
            <% } else { %>
                <td class="topNav" nowrap>
            <%  } %>
           
            <A class="topLink" href="<%="https://"+request.getServerName()+"/reg/index.jsp"%>" target="_parent">
            
            <% if ( nav.getLoggedIn() ) { %>
                Update Profile
            <% } else { %>
                Register
            <%  } %>
             
            </A>
        </td>
        
        <td class="topNav" nowrap><A href="/?t=tces&amp;c=index" class="topLink" target="_blank">Employment Services</A></td>
        <td class="topNav" nowrap><A href="http://corporate.topcoder.com" class="topLink" target="_blank">Corporate Services</A></td>
        <td class="topNav" nowrap><A href="http://software.topcoder.com" class="topLink" target="_blank">Software</A></td>
        <td class="topNav" width="49%">&#160;</td>
    </tr>
</table>

<table width="100%" cellpadding="0" cellspacing="0" border="0">
    <tr><td width="100%" height="2" class="nonBreadcrumb"><img src="/images/clear.gif" alt="" width="10" height="2" border="0" /></td></tr>
</table>
