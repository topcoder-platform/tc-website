<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.web.studio.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.common.BaseProcessor" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio :: Studio Cup</title>
    
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="studio_digitalrun"/>
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
            <jsp:include page="../top.jsp">
                <jsp:param name="section" value="cup" />
            </jsp:include>
        <br />
        <!-- container -->
        <div id="container">
            <div id="wrapper">
    
    
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

<jsp:include page="2008v2/nav.jsp" >
    <jsp:param name="tabLev1" value="design"/>
    <jsp:param name="tabLev2" value="leaderboard"/>
</jsp:include>

<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result"); %>
<br/><br/>
<table class="drStat" cellpadding="0" cellspacing="0" width="100%">
<thead>
    <tr>
        <th class="title" colspan="6">
            <a href="<%=sessionInfo.getServletPath()%>?module=ViewLeaderBoard&amp;tid=${tid}">${trackInfo.trackDesc}</a> Leaderboard Details - <tc-webtag:handle coderId='${cr}' context='${context}'/>
        </th>
    </tr>
    <tr>
        <th>Description</th>
        <th class="c">Awarded</th>
        <th class="c">Posted</th>
        <th class="c">Amount</th>
        <th class="c">Placement</th>        
        <th class="c">Reference</th>
    </tr>
</thead>    
<tbody>
    <rsc:iterator list="<%=rsc%>" id="resultRow">
        <tr class='${status.index % 2 == 1? "odd" : "even" }'>
            <td>${resultRow.map["dr_points_desc"]}</td>
            <td class="c"><rsc:item name="award_date" row="<%=resultRow%>" format="MM.dd.yy"/></td>
            <td class="c"><rsc:item name="application_date" row="<%=resultRow%>" format="MM.dd.yy"/></td>
            <td class="c">${resultRow.map["amount"]}</td>
            <td class="c">${resultRow.map["placed"]}</td>            
            <td class="c">
                <c:choose>
                    <c:when test="${resultRow.map['dr_points_reference_type_id'] == 3}">
                        <c:choose>
                            <c:when test="${not pf}">
                                <a href="/?module=ViewContestResults&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['reference_id']}">
                                    Contest Results
                            </c:when>
                            <c:otherwise>
                                <a href="/?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['reference_id']}">
                                    Contest Details
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        &nbsp;
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </rsc:iterator>
</tbody></table>


                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>


</body>
</html>
