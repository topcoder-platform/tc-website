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
<jsp:include page="/includes/top.jsp"/>
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
                <tr><td class="subhead">Subscriptions</td></tr>
                <tr><td class="normal">
                        <br>
                        <h3>TopCoder is now offering the Developer Subscription to the Topcoder Software Component Catalog</h3>
                        
                        <p>The Developer Subscription allows for unlimited non-commercial use, or commercial use in a development capacity of TopCoder's Java™ or .NET™ platform component catalogs.  Developer Subscriptions are for internal use only.  When you decide to utilize any of TopCoder's components in a commercial production capacity or you'd like to distribute software that uses TopCoder components, please call us toll free at <strong>866.867.2633</strong> for an Enterprise License quote.</p>

                        <div align="center">

<!-- Personal Subscription -->
                        <table width="700" border="0" cellpadding="0" cellspacing="10">
                            <tr>
                              <td class="catalogIndexHeader" width="50%">Developer Subscription</td>
                              <td class="catalogIndexHeader" width="50%">Enterprise Subscriptions</td>
                           </tr>
                            <tr valign="top">
                                <td align="left">
                                 <br>
                                 <div align="center">
                                 <A href="/tcs?module=ViewComponentTerms"><img src="/images/developer_sub.gif" alt="Developer Subscription FREE" border="0" /></A>
                                 </div>
                                 <br>
                                 <ul>
                                 <li>Unlimited access to download components from either catalog</li>
                                 <li>Unlimited access to the Component Catalog customer forums for either catalog</li>
                                 <li>Use the components in your personal applications, educational applications, or in the development cycle of commercial applications.</li>
                                 <li>See the <A href="/components/license_agreement.jsp" target="_blank">Developer Subscription License Agreement</A> for details</li>
                                 </ul>

                                 </td>
                                <td align="left">
                                 <br>
                                 <div align="center">
                                 <img src="/images/java_ent_sub.gif" alt="Java Enterprise Subscription -- Call for pricing" border="0" />
                                 </div>
                                 <br>
                                 <div align="center">
                                <img src="/images/dotnet_ent_sub.gif" alt=".NET Enterprise Subscription -- Call for pricing" border="0" />
                                 </div>
                                 <br>
                                 <ul>
                                 <li>For corporate or commercial deployment and usage of the Component Catalog components</li>
                                 <li>For any wide-spread distribution of software that utilizes the Component Catalog components</li>
                                 </ul>
                                 </td>
                            </tr>
                        </table><br />

                        <hr noshade="noshade" size="1" />      

                        </div>

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
