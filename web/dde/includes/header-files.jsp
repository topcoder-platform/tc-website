<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.WebConstants" %>
<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
    String level2 = request.getParameter("level2")==null?"":request.getParameter("level2");
	
	long tcsForumsID = WebConstants.TCS_FORUMS_ROOT_CATEGORY_ID; 
%>
<link rel="stylesheet" type="text/css" media="screen" href="/includes/screen.css" />
<!--[if IE]><link rel="stylesheet" type="text/css" href="/includes/screen-ie.css" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="/includes/screen-ie7.css" /><![endif]-->
<!--[if IE 6]><link rel="stylesheet" type="text/css" href="/includes/screen-ie6.css" /><![endif]-->
<script src="/scripts/jquery-1.2.6.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".expand-group").click(function(){
		var active = $(this).next("ul");
		var activeState = $(active).css("display");
		
		if (activeState == "none") {
			$(active).slideDown();
			$(".submenu").not(active).slideUp();
			return false;
		} 
		else 
		{
			$(this).next("ul").slideUp();
			return false;
		}
		});
		
	var randomImage = Math.floor(Math.random()*4);
	
	$("#bannerAd img").attr({
		src: "/images/rotated-image-" + randomImage +".png"
	});
});


</script>