<%@ page import="com.topcoder.web.openaim.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="openaim.tld" prefix="openaim" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Open AIM Developer Challenge :: Powered by TopCoder</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_openaim"/>
    </jsp:include>

    

    <script type="text/javascript">
        function preloadTabs() {
            var img = new Image();
            img.src = '/i/events/openaim/tabs/registerOn.png';
            img.src = '/i/events/openaim/tabs/submitOn.png';
            img.src = '/i/events/openaim/tabs/apisOn.png';
            img.src = '/i/events/openaim/tabs/discussOn.png';
        }
    </script>

</head>

<body>

<jsp:include page="tcTop.jsp"/>

<div align="center">
    <div id="aimFrame">
        <div id="aimFrameN">
            <div id="aimFrameS">

                <jsp:include page="openaimTop.jsp"/>

                <div class="content" align="right">
                    <div class="contentTexture">
                        <jsp:include page="topNav.jsp"/>
                        <div class="siteBoxFull">

<%--
                <div class="linkBox"><openaim:forumLink forumID="${contest.forumId}"/></div>

                <div class="breadcrumb">
                    <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a>
                    &gt; ${contest.name}
                </div>
--%>

                <h1>Contest Registration</h1>

                <div align="center">
                    Please read through the following terms, check off <strong>"I agree"</strong>, and click Submit when you're done.
                    <br /><br />

                    <form name="terms" method="POST" action="${sessionInfo.servletPath}">
                        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Register"/>
                        <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>


                        <iframe width="590" height="300" marginWidth="5" src="${sessionInfo.servletPath}?module=Terms&amp;<%=Constants.TERMS_OF_USE_ID%>=<%=Constants.CONTEST_TERMS_OF_USE_ID%>"></iframe>

                        <br /><br />
                        <!-- could also use <input>'s button <button> gives you more display freedom and is documented on w3c -->
                        <!-- resulting page from click has value at the end of the URL, which is pointless.  Feel free to use any html/js element/method but i want the nice looking button -->
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>">${err}
                    <br/></tc-webtag:errorIterator></span>
                        <input type="checkbox" name="<%=Constants.TERMS_AGREE%>"/>I agree
                        <br /><br />
                        <input type="image" src="/i/events/openaim/interface/btnSubmit.png" />
                        <br /><br />


                    </form>
                </div>


                        </div>
                        <div style="clear: both;">&nbsp;</div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<jsp:include page="tcFoot.jsp"/>

</body>
</html>