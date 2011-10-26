<%--
  - Author: TCSASSEMBLIER, kanakarajank
  - Version: 2.0
  - Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: The generic HTML head element, setting meta tag, page title and referencing
  - CSS stylesheet, Javascript files for all pages in TC web pages. 
 --%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page isELIgnored="false"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${param.title}</title>
<!-- external stylesheet -->
<link rel="stylesheet" href="../css/reset.css" media="all" />
<link rel="stylesheet" href="../css/coders.css" media="all" />
<s:set name="jqueryUI">
	${param.jqueryUI}
</s:set>
<s:if test='#jqueryUI=="true"'>
	<link href="../css/jquery-ui-1.8.11.custom.css" type="text/css"
		rel="stylesheet" media="screen" />
</s:if>
<link rel="stylesheet" href="../css/screen.css" media="all" />
<!-- External Javascript -->
<script src="../js/jquery-1.5.1.min.js" type="text/javascript"></script>
<s:if test='#jqueryUI=="true"'>
	<script src="../js/jquery-ui-1.8.11.custom.min.js" type="text/javascript"></script>
</s:if>
<script src="../js/jquery.ezCookie_0.8.0.min.js" type="text/javascript"></script>
<script src="../js/scripts.js" type="text/javascript"></script>
<!--[if lte IE 6]>
<link href="../css/screen-ie6.css" type="text/css" rel="stylesheet" media="screen" />
<script src="../js/DD_belatedPNG_0.0.8a-min.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 7]>
<link href="../css/screen-ie7.css" type="text/css" rel="stylesheet" media="screen" />
<![endif]-->
<!--[if IE 8]>
<link href="../css/screen-ie8.css" type="text/css" rel="stylesheet" media="screen" />
<![endif]-->
