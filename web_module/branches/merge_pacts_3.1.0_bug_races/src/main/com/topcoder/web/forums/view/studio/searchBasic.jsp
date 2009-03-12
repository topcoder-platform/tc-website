<%@ page import="com.jivesoftware.forum.Query,
                 com.jivesoftware.forum.action.util.Paginator,
                 com.topcoder.web.common.BaseProcessor,
                 java.util.HashMap,
                 java.util.Iterator"
%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="dates" name="dates" type="java.util.HashMap" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%  HashMap errors = (HashMap)request.getAttribute(BaseProcessor.ERRORS_KEY);
    Paginator paginator = (Paginator)request.getAttribute("paginator");
    Query query = (Query)request.getAttribute("query");
    String searchScope = (String)request.getAttribute("searchScope");
    String dateRange = (String)request.getAttribute("dateRange");
    String status = (String)request.getAttribute("status");
    Iterator results = (Iterator)request.getAttribute("results"); %>

<script type="text/javascript">
function noenter(e)
{
  var k = (window.event)? event.keyCode: e.which;
  return !(k == 13);
}
</script>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>TopCoder Studio</title>

	<jsp:include page="style.jsp">
   	 <jsp:param name="key" value="tc_studio_forums"/>
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
	
    <script type="text/javascript">
        function openWin(url, name, w, h) {
            win = window.open(url, name, "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width=" + w + ",height=" + h);
            win.location.href = url;
            win.focus();
        }
    </script>
</head>

<body>
	<div id="page-wrap">
    	<div align="center">
			<jsp:include page="top.jsp">
            <jsp:param name="section" value="forums" />
        </jsp:include>
        <br />
        <!-- container -->
        <div id="container">
            <!-- content -->
           <div id="wrapper">
            	<div id="content">
                	<div class="contentTop">
                	<h1>Forums</h1>
                	<div class="contentMiddle forums">

					<table cellpadding="0" cellspacing="0" class="rtbcTable">
					<tr>
						<td class="categoriesBox" style="padding-right: 20px;">
						  <jsp:include page="categoriesHeader.jsp" />
						</td>
						<td nowrap="nowrap" valign="top" width="100%">
						   <jsp:include page="searchHeader.jsp" >
								<jsp:param name="queryTerms" value="<%=query.getQueryString()%>"/>
						   </jsp:include>
						</td>
						<td align="right" nowrap="nowrap" valign="top">   
						   <a href="?module=History" class="rtbcLink">My Post History</a> | <a href="?module=Watches" class="rtbcLink">My Watches</a> | <a href="?module=Settings" class="rtbcLink">User Settings</a><br />
						</td>
					</tr>
					</table>
					<b><a href="?module=Main" class="rtbcLink">Forums</a> > Search</b><br /><br />
					
					<% if ("search".equals(status)) { %>
						<jsp:include page="searchResults.jsp"/>
					<% } %>


                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>


        <jsp:include page="foot.jsp"/>

</body>
</html>