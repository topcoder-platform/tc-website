<%@ page import="javax.naming.*" %>
<%@ page import="javax.ejb.CreateException" %>
<%@ page import="java.io.*" %>
<%@ page import="java.rmi.*" %>
<%@ page import="javax.rmi.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.reflect.*" %>

<%@ include file="/includes/util.jsp" %>
<%@ include file="/includes/session.jsp" %>
<%@ include file="/includes/formclasses.jsp" %>

<%
    // STANDARD PAGE VARIABLES
    String page_name = "s_subscriptions.jsp";
    String action = request.getParameter("a");    
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>TopCoder Software</title>
    <link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />
    <script language="JavaScript" type="text/javascript" src="/scripts/javascript.js"></script>
</head>

<body class="body">

<!-- Header begins -->
<%@ include file="/includes/top.jsp" %>
<jsp:include page="/includes/menu.jsp" >
    <jsp:param name="isSoftwarePage" value="true"/>
</jsp:include>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="middle">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="165" class="leftColumn">
        <jsp:include page="/includes/left.jsp" >
            <jsp:param name="level1" value="components"/>
            <jsp:param name="level2" value="subscriptions"/>
        </jsp:include>
        </td>
<!-- Left Column ends -->

<!-- Gutter 1 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 1 ends -->

<!-- Middle Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
                <tr><td class="normal"><img src="/images/headComponents.gif" alt="Components" width="545" height="32" border="0" /></td></tr>
                <tr><td class="subhead">Purchasing</td></tr>
                <tr><td class="normal">
                        <h3>Take advantage of introductory pricing on the Topcoder Software Component Catalog</h3>
                        
                        <p>Now you have a choice: commercial or non-commercial license, Java&#153; or .NET&#153; platform. The prices shown below 
                        are preliminary and will change as our catalog grows. <strong>Buy now and lock in the price for the next 12 months.</strong> 
                        Personal and Developer Subscriptions are for internal use only. If you intend to distribute TopCoder Software Components as part 
                        of a commercial application&#151;including opensource or as part of a services offering&#151;please call us toll free at 
                        <strong>866.867.2633</strong> for a quote.</p>
                        
                        <p>For your convenience, <strong><font color="#CC0000">TopCoder will automatically renew your subscription each month.</font></strong></p>

                        <p>After receiving a confirmation email, you can immediately download Components from the TopCoder Software Catalog. Make sure 
                        to fully read our <a href="s_terms.jsp">Terms and Conditions</a> before ordering. You may cancel your subscription at any time 
                        by calling us toll free at 866.867.2633.</p>

                        <div align="center">
                        
<!-- Personal Subscription -->
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr><td class="catalogIndexHeader" width="100%">Developer Subscription</td></tr>
                        </table>

                        <table border="0" cellpadding="0" cellspacing="10">
                            <tr valign="top">
                                <td><A href="http://www.topcoder.com/corp/Tx/?&op=terms&pid=13"><img src="/images/java_personal_sub.gif" alt="Java Personal Subscription -- $12.95 per month" width="286" height="181" border="0" /></A></td>
                                <td><A href="http://www.topcoder.com/corp/Tx/?&op=terms&pid=14"><img src="/images/dotnet_personal_sub.gif" alt=".NET Personal Subscription -- $12.95 per month" width="286" height="181" border="0" /></A></td>
                            </tr>
                        </table><br />
                        
                        <img src="/images/clear.gif" alt="" width="10" height="15" border="0" /><br />

<!-- Enterprise Subscriptions -->
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr><td class="catalogIndexHeader" width="100%">Enterprise Subscriptions</td></tr>
                        </table>

                        <table border="0" cellpadding="0" cellspacing="10">
                            <tr valign="top">
                                <td><img src="/images/java_enterprise_sub.gif" alt="Java Enterprise Subscription -- Call for pricing" width="286" height="184" border="0" /></td>
                                <td><img src="/images/dotnet_enterprise_sub.gif" alt=".NET Enterprise Subscription -- Call for pricing" width="286" height="184" border="0" /></td>
                            </tr>
                        </table><br />
                        
                        </div>
                        
                        <p>Visit our <a href="/catalog/c_showroom.jsp">Component Catalog</a> for a complete selection of components.</p>

                        <p>Speak your mind in our <a href="/forum/c_active_collab.jsp">Collaboration Forums.</a></p></td>
                </tr>
                <tr><td><img src="/images/clear.gif" alt="" width="10" height="40" border="0" /></td></tr>
            </table>
        </td>
<!-- Middle Column ends -->

<!-- Gutter 2 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 2 ends -->

<!-- Right Column begins

 Right Column ends -->
    </tr>
</table>
    
<!-- Footer begins -->
<jsp:include page="/includes/foot.jsp" flush="true" />
<!-- Footer ends -->

</body>
</html>
