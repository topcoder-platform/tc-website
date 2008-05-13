<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
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

    <%-- THICKBOX GALLERY --%>
    <script type="text/javascript" src="/js/jquery-1.2.3.pack.js"></script>
    <script type="text/javascript" src="/js/thickbox-3.1/thickbox-compressed-3.1.js"></script>
    <link rel="stylesheet" href="/js/thickbox-3.1/thickbox-3.1.css" type="text/css" media="screen" />
    <%----------------------------%>

    <style type="text/css">
    a.spaced {
     margin: 1px;
    }
    </style>

    <jsp:include page="../../script.jsp" />

</head>
<body id="page_sub">

<div id="wrapper">

    <jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value="onsiteevents"/>
    <jsp:param name="tabLev3" value="photos"/>
    </jsp:include>


        
        
        <h2>Photos</h2>

<a name="studio"></a> 
<p><strong>Studio Finals</strong></p>
<script type="text/javascript">
//<![CDATA[
for(var i=1; i<69; i++){
    doWrite(' <a href="/i/tournament/tco08/photos/studio/'+i+'.jpg" title="Studio Finals" rel="studio" class="thickbox spaced"><img src="/i/tournament/tco08/photos/studio/thumbs/'+i+'.jpg" alt="+"/></a>');
}
//]]>
</script>

<br /><br />

<%--
<a name="marathon"></a> 
<p><strong>Marathon Match Finals</strong></p>
<script type="text/javascript">
//<![CDATA[
for(var i=1; i<59; i++){
    doWrite(' <a href="/i/tournament/tco08/photos/marathon/'+i+'.jpg" title="Marathon Match Finals" rel="marathon" class="thickbox spaced"><img src="/i/tournament/tco08/photos/marathon/thumbs/'+i+'.jpg" alt="+"/></a>');
}
//]]>
</script>
<br /><br />
--%>

<a name="design"></a> 
<p><strong>Component Design Finals</strong></p>
<script type="text/javascript">
//<![CDATA[
for(var i=1; i<28; i++){
    doWrite(' <a href="/i/tournament/tco08/photos/design/'+i+'.jpg" title="Component Design Finals" rel="design" class="thickbox spaced"><img src="/i/tournament/tco08/photos/design/thumbs/'+i+'.jpg" alt="+"/></a>');
}
//]]>
</script>
<br /><br />

<a name="misc"></a> 
<p><strong>Miscellaneous</strong></p>
<script type="text/javascript">
//<![CDATA[
for(var i=1; i<13; i++){
    doWrite(' <a href="/i/tournament/tco08/photos/misc/'+i+'.jpg" title="Miscellaneous" rel="misc" class="thickbox spaced"><img src="/i/tournament/tco08/photos/misc/thumbs/'+i+'.jpg" alt="+"/></a>');
}
//]]>
</script>
<br /><br />
        
    </div><%-- #content --%>

<jsp:include page="footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
