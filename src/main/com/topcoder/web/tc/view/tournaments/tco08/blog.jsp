<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The 2008 TopCoder&reg; Open - Get ready for the Ultimate TopCoder Event!</title>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
<style type="text/css">
iframe{
 width: 615px;
 height: 750px;
 border: 1px solid #ED1C24;
 background: transparent;
}
</style>
</head>
<body id="page_sub">

<div id="wrapper">

    <jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value="onsiteevents"/>
    <jsp:param name="tabLev3" value="blog"/>
    </jsp:include>


        
        
        <h2>The Official Blog of the 2008 TopCoder Open</h2>
        
        <p align="right"><tc-webtag:forumLink forumID="517604" message="Discuss this" /></p>
        <iframe src="http://tco08blog.aol.com/<c:out value="${param['myframe']}" default="" escapeXml="true"/>" marginheight="0" marginwidth="0"></iframe>
        
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
