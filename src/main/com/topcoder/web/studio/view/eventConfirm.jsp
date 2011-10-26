<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");%>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
   
    <script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
            $(document).ready(function(){
                //Run the script to preload images from CSS
                $.preloadCssImages(); 
            });
    </script>
    <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/v2/popup.js"></script>
    <script type="text/javascript" language="javascript">

    $(document).ready(function(){
    
    
        $("#nav ul li").hoverIntent(function(){
            $(this).children("ul").slideDown("fast");
        }, function() {
            $(this).children("ul").slideUp("fast");
        });
        
        $("#nav ul ul li").hover(function() {
            $(this).parents("#nav ul li").children('a').addClass("active-item");
        }, function() {
            $(this).parents("#nav ul li").children('a').removeClass("active-item");
        });
    
    
    });
    </script>
</head>

<body>
    <div id="page-wrap">
        <div align="center">
            <jsp:include page="top.jsp">
                <jsp:param name="section" value="contest" />
            </jsp:include>
        <br />
      
        <!-- container -->
        <div id="container">
                    <div id="wrapper">

            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                <h1>Contest Registration</h1>
                <br />
                <div align="center">
                    <h2>Are you sure you want to register for this contest?</h2>
                <div>
                <div align="center" style="text-align:left; width:500px; font-size:12px; line-height: 18px;">
                    <br /><br />
                    Please be aware that you are <b>NOT REGISTERED for the TCO12 tournament</b> that this contest is part of. Registering for this contest will not register you for the TCO12 tournament. If you don't register for the tournament prior to registering for this contest, you will not receive points for this contest even if you sign up for TCO12 at a later date.
                    <br /><br />

                    <form name="terms" method="POST" action="${sessionInfo.servletPath}">
                        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Register"/>
                        <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
                        <tc-webtag:hiddenInput name="<%=Constants.REG_CONFIRM%>"/>
                        <tc-webtag:hiddenInput name="<%=Constants.TERMS_AGREE%>" value="on"/>
                </div>
                <div align="center" style="font-size:14px;">
                        <br /><br />
                        <a href="http://community.topcoder.com/tco12" target="_blank">Take me to register for the TCO12</a><br />
                        <br />
                        <a href="#" onclick="document.terms.submit()">I don't want to register for TCO12. Just register for this contest.</a>

                    </form>
                </div>

                <br clear="all"/>
             </div>                
             <div class="contentBottom"></div>
          </div>
        </div>
        </div>

        <jsp:include page="foot.jsp"/>


</body>
</html>
