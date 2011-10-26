<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>TopCoder High School 2008</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tchs08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>

    <%-- LIGHTBOX --%>
    <script language="JavaScript" type="text/javascript" src="/js/tcscript.js"></script>
    <script language="JavaScript" type="text/javascript" src="/js/jquery-1.2.3.pack.js"></script>
    <script language="JavaScript" type="text/javascript" src="/js/jquery_lightbox_v1.0.1-final/js/jquery.lightbox.packed.js"></script>

    <link rel="stylesheet" type="text/css" href="/js/jquery-lightbox-0.4/css/jquery.lightbox-0.4.css" media="screen" />

</head>
<body>

<div id="wrapper">

    <jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value=""/>
    <jsp:param name="tabLev2" value=""/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>
    
    
    
        <div id="title">
            <h2>Photos</h2>
        </div><%-- #title --%>
        
        <div id="content">

<div class="gallery6060">
<script type="text/javascript">
for(i=1; i<72; i++){
    doWrite('<a href="/i/tournament/tchs08/photos/'+i+'.jpg" rel="lightbox-myGroup" title="&nbsp;"><img src="/i/tournament/tchs08/photos/thumbs/'+i+'.jpg" alt="" /></a>');
}
</script>
</div>



        </div><%-- #content --%>
        
        <jsp:include page="footer.jsp" />


</div><%-- #wrapper --%>

</body>
</html>