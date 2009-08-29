<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="studio.tld" prefix="studio" %>

<c:set var="MODULE_KEY" value="<%=Constants.MODULE_KEY%>"/>
<c:set var="SPEC_REVIEW_ID" value="<%=Constants.SPEC_REVIEW_ID%>"/>
<c:set var="TERMS" value="<%=Constants.TERMS%>"/>
<c:set var="TERMS_AGREE" value="<%=Constants.TERMS_AGREE%>"/>
<c:set var="reviewOpportunities" value="${requestScope.reviewOpportunities}"/>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio : Review Terms</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>

    <script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" type="text/javascript"></script>
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

					<h1>Specification Review Terms</h1>

					<br clear="all"/>

					<div class="statHolder">
						<div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
						<div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
						<div class="container" style="text-align:center;">
                            <form action="${sessionInfo.servletPath}" method="POST" name="frmTerms">
                                <input type="hidden" name="${MODULE_KEY}" value="SpecReviewRegistration"/>
                                <input type="hidden" name="${SPEC_REVIEW_ID}" value="${param[SPEC_REVIEW_ID]}"/>

                                <table border="0" cellspacing="0" cellpadding="5" align="center" width="100%">
                                    <tr>
                                        <td>
                                            <iframe width="100%" height="300" marginWidth="5"
                                                    src="${sessionInfo.servletPath}?module=Terms&amp;<%=Constants.TERMS_OF_USE_ID%>=${terms.id}"></iframe>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="errorText">
                                            <tc-webtag:errorIterator id="err" name="${TERMS_AGREE}"><br/>${err}
                                            </tc-webtag:errorIterator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <br/>
                                            I Agree to the Terms and Conditions stated above&#160;
                                            <tc-webtag:chkBox name="${TERMS_AGREE}"/>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="center">
                                            <br/>
                                            <input type="submit" onClick="" name="submit" value=" Register"/>
                                        </td>
                                    </tr>
                                </table>
                            </form>
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

</body>
</html>
