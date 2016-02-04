<%--
  - Author: TCSDEVELOPER, isv
  - Version: 1.2
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders studio site top section.
  -
  - Version 1.12 (Studio Enhancements Release Assembly 1) Change notes:
  - * Changed URLs and re-arranged footer area. TC logo is now displayed.
  - Version 1.2 (Studio Contest Detail Pages Assembly version 1.0) changes:
  -     - Removed unsed section variable and 3 closing DIV elements without opening elements.  
--%>
<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.common.BaseServlet, com.topcoder.web.common.SessionInfo" %>

<%
    SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    String handle = null;
    if (sessionInfo != null)
    {
        handle = sessionInfo.getHandle();
    }

%>
             </div>
         </div>
    </div><%-- #page-wrap ends --%>
<%-- FOOTER BLOCK --%>
<div id="footer">
    <div class="wrapper2">
        <div class="socials">
            <span>Follow Us!</span>
            <a href="https://www.facebook.com/pages/TopCoder-Studio-Design-Competitions/32709273825" rel="nofollow" target="_blank">
                <img width="16" height="16" title="Follow Us on Facebook" alt="Follow Us on Facebook" src="/i/facebook.png">
            </a>
            <a href="http://www.flickr.com/photos/53993064@N03" rel="nofollow" target="_blank">
                <img width="16" height="16" src="/i/flickr.png" alt="Follow Us on Flickr" title="Follow Us on Flickr">
            </a>
            <a href="https://twitter.com/TCStudio" rel="nofollow" target="_blank">
                <img width="16" height="16" src="/i/twitter.png" alt="Follow Us on Twitter" title="Follow Us on Twitter">
            </a>
            <a href="http://www.youtube.com/topcoderinc" rel="nofollow" target="_blank">
                <img width="16" height="16" src="/i/youtube.png" alt="Follow Us on YouTube" title="Follow Us on YouTube">
            </a>
        </div>
        <div class="nav">
            <span class="copyright">Copyright TopCoder, Inc. 2001-2016</span>
            <span class="line"></span><a href="https://www.topcoder.com/contact-us">Contact Us</a> 
            <span class="line"></span><a href="https://www.topcoder.com/about">About Us</a>
            <span class="line"></span><a href="http://www.topcoder.com/tc?module=Static&d1=pressroom&d2=index">News</a>
            <span class="line"></span><a href="https://www.topcoder.com/community/how-it-works/privacy-policy/">Privacy Policy</a>
            <span class="line"></span><a href="https://www.topcoder.com/community/how-it-works/terms/">Terms</a>
        </div>

    </div>
    <%-- .wrapper ends --%>
</div>
<%-- #footer ends --%>

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-6340959-1']);
  _gaq.push(['_setDomainName', '.topcoder.com']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

<script type="text/javascript">
		(function () { var done = false; var script = document.createElement("script"); script.async = true; script.type = "text/javascript"; script.src = "https://purechat.com/VisitorWidget/WidgetScript"; document.getElementsByTagName('HEAD').item(0).appendChild(script); script.onreadystatechange = script.onload = function (e) { if (!done && (!this.readyState || this.readyState == "loaded" || this.readyState == "complete")) { var w = new PCWidget({ c: '32782020-1040-4f6a-a980-bb27ddb5204a', f: true }); done = true; } }; })();
</script>
