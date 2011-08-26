<%--
  - Author: TCSDEVELOPER, pvmagacho
  - Version: 1.2
  - Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page presents active bug races
  -
  - Version 1.1 (Studio Release Assembly - Spec Review Sign up page v1.0) changes: Added "Review Opportunities" tab.
  - Version 1.2 (Re-platforming Studio Release 4 Assembly) changes: Clean up old studio model files
--%>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio : Active Bug Race Competitions</title>
    
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
        <%-- container --%>
        <div id="container">    
            <div id="wrapper">
            <%-- content --%>
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                    <h1>Active Bug Race Competitions</h1>

                    <div align="right"><strong>Need help? Learn how to
                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=Static&amp;d1=support&amp;d2=getStarted">get started</a></strong>.<br />
                    </div>

                    <div class="tableTabOff" style="margin-left: 20px;"><a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a></div>
                    <div class="tableTabOff"><a href="${sessionInfo.servletPath}?module=ViewPastContests">Past Contests</a></div>
                    <div class="tableTabOn"><a href="${sessionInfo.servletPath}?module=ViewActiveBugRaces">Active Bug Race Competitions</a></div>
                    <div class="tableTabOff"><a href="${sessionInfo.servletPath}?module=ViewReviewOpportunities">Review Opportunities</a></div>

                    <a href="https://www.topcoder.com/bugs/sr/jira.issueviews:searchrequest-rss/temp/SearchRequest.xml?&customfield_10073=Studio+Bug&type=-2&pid=10021&status=1&status=3&status=4&sorter/field=issuekey&sorter/order=DESC&tempMax=1000" rel="alternate" type="application/rss+xml"><img align="right" src="/i/v2/interface/btnRSS.png" alt="RSS" style="vertical-align:midium; margin-right: 5px; margin-top:5px "/></a>
                    <br  clear="all"/>

                    <div class="statHolder">
                        <div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
                        <div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
                        <div class="container">
                            <table class="stat" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                                <tr id="bugRaceHeader">
                                    <td class="headerR" colspan="2" width="20%">Bug Race Competition #</td>
                                    <td class="header" width="2%">&nbsp;</td>
                                    <td class="header" colspan="2">Bug Race Competitions Title</td>
                                </tr>
                        </tbody>
                        </table>
                    </div>
                    <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
                    <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
                </div>

                <br clear="all"/>
            </div>
            <div class="contentBottom"></div>
        </div>
    </div>
</div>

<jsp:include page="foot.jsp"/>

    <script type="text/javascript" src="/js/AJAXProcessor.js">
    </script>    

    <script type="text/javascript" src="/js/bugRaceAjaxScript.js">
    </script>

            
</body>
</html>
