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
        <p>TopCoder Studio is the creative arm of TopCoder, the world's largest competitive software development
            community with developers representing over 200 countries.<br/>
            Copyright TopCoder, Inc. 2001-<script type="text/javascript">d=new Date();document.write(d.getFullYear());</script></p>

        <p>
            <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=Static&amp;d1=contactUs">Contact Us</a> |
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/studio/what-is-studio/">About TopCoder Studio</a> |
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/what-is-topcoder/">About TopCoder</a> |
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/">Register</a><br/>
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=pressroom&d2=index">Press Room</a> |
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=privacy">Privacy Policy</a>
            |
            <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=terms">Terms &
                Conditions</a>
            <img src="/i/v4/tclogo.png" alt="TopCoder, Inc." class="footerLogo" width="132" height="22"
                 style="float:right;padding-right:30px;"/>
        </p>
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
