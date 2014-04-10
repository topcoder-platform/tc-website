<%--
  - Author: isv
  - Version: 1.1
  - Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page includes JS scripts.
  -
  - Version 1.1 (Member Payments Automation assembly) changes: 
  -   added reference to jQuery script
--%>
<%@  page contentType="text/html" %>

<%
    Boolean isNewStyle = request.getAttribute("isNewStyle") == null ? false : (Boolean) request.getAttribute("isNewStyle");
%>
<% if (!isNewStyle) { %>
<script language="JavaScript" type="text/javascript" src="/js/jquery-1.4.1.min.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/tcscript.js?updated=1"></script>
<script language="JavaScript" type="text/javascript" src="/js/loginAction.js"></script>
<% } %>
<% if (isNewStyle) { %>
<script type="text/javascript" src="/js/reskin/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/js/reskin/jquery-migrate-1.2.1.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="/js/reskin/html5shiv.js"></script>
<![endif]-->
<script type="text/javascript" src="/js/reskin/jquery.jfeed.pack.js"></script>
<script type="text/javascript" src="/js/reskin/newTCScript.js"></script>
<% } %>





