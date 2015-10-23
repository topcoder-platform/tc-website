<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script language="JavaScript" type="text/javascript" src="/js/tcscript.js"></script>
    <title>Ribbit - $100,000 Killer App Challenge - Forums  :: Powered by TopCoder</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_aolicq_forums"/>
    </jsp:include>
</head>

<body>

 

<jsp:include page="topNav.jsp">
	<jsp:param name="active_page" value="forums"/>
</jsp:include>
   <div id="wrapper">
<jsp:include page="aolicqTop.jsp"/>
        <div class="secondary-body" id="forums">            <h2 class="discuss">Forums</h2>                        
               <h4 class="direction">For questions and discussions pertaining specifically to the API's and the Ribbit Voice Platform, please visit the <a href="http://developer.ribbit.com/forums/">Ribbit Developer forums.</a></h4><div class="siteBoxFull">

                    	<c:choose>
                            <c:when test="${sessionInfo.anonymous}">
                            	You must login in order to continue
                            </c:when>
                            <c:otherwise>
                                <div align="center">
                                    <script language="JavaScript">
                                        var s = '<object ' +
                                                'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ' +
                                                'codebase="http://fpdownload.macromedia.com" ' +
                                                '/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" ' +
                                                'width="725" ' +
                                                'height="800" ' +
                                                'id="ratingHistory" ' +
                                                'align="middle"> ' +
                                                '<param name="allowScriptAccess" value="sameDomain" /> ' +
                                                '<param name="movie" value="/i/events/aolicq/Voting_Widget.swf" />' +
                                                '<param name="menu" value="true" /> ' +
                                                '<param name="quality" value="high" /> ' +
                                                '<param name="bgcolor" value="#EEEEEE" /> ' +
                                                '<embed ' +
                                                'src="/i/events/aolicq/Voting_Widget.swf" ' +
                                                'menu="true" ' +
                                                'quality="high" ' +
                                                'bgcolor="#EEEEEE" ' +
                                                'width="725" ' +
                                                'height="800" ' +
                                                'name="ratingHistory" ' +
                                                'align="middle" ' +
                                                'allowScriptAccess="sameDomain" ' +
                                                'type="application/x-shockwave-flash" ' +
                                                'pluginspage="http://www.macromedia.com/go/getflashplayer" /> ' +
                                                '</object> ';
                                        doWrite(s);
                                    </script>
                                </div>                        
                            </c:otherwise>
                    	</c:choose>

        </div>

<jsp:include page="tcFoot.jsp"/>

</body>
</html>
