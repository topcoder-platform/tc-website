<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio : Contest Registration</title>
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
        <!-- container -->
            <div id="container">
            	  <div id="wrapper">
            	  	
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                <div class="linkBox"><studio:forumLink forumID="${contest.forumId}"/></div>

                <div class="breadcrumb">
                    <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a>
                    &gt; ${contest.name}
                </div>
				<br />
                <h1>Contest Registration</h1>

                <div align="center" style="padding-top:20px;">
                    Please read through the following terms and then click <strong>"I Agree"</strong> when you're done.
                </div>
                 <br />
				<div align="center">
                    <form name="terms" method="POST" action="${sessionInfo.servletPath}">
                        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Register"/>
                        <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>


                        <iframe width="590" height="300" marginWidth="5" src="${sessionInfo.servletPath}?module=Terms&amp;<%=Constants.TERMS_OF_USE_ID%>=<%=Constants.CONTEST_TERMS_OF_USE_ID%>"></iframe>

                        <br /><br />
                        <!-- could also use <input>'s button <button> gives you more display freedom and is documented on w3c -->
                        <!-- resulting page from click has value at the end of the URL, which is pointless.  Feel free to use any html/js element/method but i want the nice looking button -->
                </div>
                
                <div align="center">
                <div class="bigRed" style="text-align: left; width:590px"><tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>">${err}
                    <br /></tc-webtag:errorIterator></div>
                        <c:if test="${not empty has_global_ad and not has_global_ad}">
                            
                            <div class="bigRed" style="text-align: left; width:590px">
                                 You have not yet signed the Assignment Document that is required in order to submit for this contest. Please go <a href="/?module=Static&amp;d1=support&amp;d2=assignmentDocFaq">here</a> to read more about Assignment Documents and what you need to do. 
                                 You will not be able to submit for this contest without first sending in the signed Assignment Document.<br /><br />
                           </div>
                        </c:if>
                       
                       <INPUT TYPE="checkbox" NAME="<%=Constants.TERMS_AGREE%>"/> I agree
                        <br /><br />
                        <input type="image" src="/i/v2/interface/btnSubmit.png" />
                        <br /><br />
					
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
