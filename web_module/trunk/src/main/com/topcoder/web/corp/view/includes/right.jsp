<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         autoFlush="false" %>
<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
%>
                    <td width="230" align ="left" id="corpRight">
                        <img src="/i/spacer.gif" alt="" width="230" height="10" border="0"><br>

<!-- Candidate Testing begins-->
<% if (level1.equals("testing")) { %>
<!--                        <a href="<%=request.getContextPath()+"/Tx/?"+TransactionServlet.KEY_OPERATION+"="+TransactionServlet.OP_TERMS+"&back-to="+request.getAttribute(Constants.KEY_LINK_PREFIX)+"&prod-id=1"%>"><img src="/i/buy_now.gif" alt="Buy Now" width="230" height="50" border="0"></a><br>--%>
                        <img src="/i/spacer.gif" alt="" width="230" height="10" border="0"><br>
                        <a href="/testing/"><img src="/i/promo_launch_test_mgmt.gif" alt="Launch Testing Management Tool" width="230" height="129" border="0"></a><br>
<% } %>
<!-- Candidate Testing ends -->

                        <img src="/i/spacer.gif" alt="" width="230" height="10" border="0"><br>
                    </td>
