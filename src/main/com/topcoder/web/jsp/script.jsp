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

<%-- KissMetrics Analytics --%>
<script type="text/javascript">var _kmq = _kmq || [];
  var _kmk = _kmk || 'aa23cd43c455ef33b6a0df3de81a79af9ea30f75';
  function _kms(u){
    setTimeout(function(){
      var d = document, f = d.getElementsByTagName('script')[0],
      s = d.createElement('script');
      s.type = 'text/javascript'; s.async = true; s.src = u;
      f.parentNode.insertBefore(s, f);
    }, 1);
  }
  _kms('//i.kissmetrics.com/i.js');
  _kms('//scripts.kissmetrics.com/' + _kmk + '.2.js');
</script>

<% } %>






