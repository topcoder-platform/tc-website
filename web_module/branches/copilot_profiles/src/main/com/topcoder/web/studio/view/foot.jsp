<%--
  - Author: TCSDEVELOPER, isv
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders studio site top section.
  -
  - Version 1.12 (Studio Enhancements Release Assembly 1) Change notes:
  - * Changed URLs and re-arranged footer area. TC logo is now displayed.
--%>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%
    String section = request.getParameter("section") == null ? "" : request.getParameter("section");
%>
 			</div>
 		</div>
	</div><%-- #page-wrap ends --%>
	
    <%-- FOOTER BLOCK --%>
    <div id="footer">
        <div class="wrapper2">
            <p>TopCoder Studio is the creative arm of TopCoder, the world's largest competitive software development
              community with developers representing over 200 countries.<br/>
               Copyright &copy;2001-2010, TopCoder, Inc. All rights reserved</p>

            <p>
                <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=Static&amp;d1=contactUs">Contact Us</a> |
                <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/studio/what-is-studio/">About TopCoder Studio</a> |
                <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/what-is-topcoder/">About TopCoder</a> |
                <a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/">Register</a><br/>
                <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=pressroom&d2=index">Press Room</a> |
                <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=privacy">Privacy Policy</a> |
                <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=terms">Terms & Conditions</a>
                <img src="/i/v4/tclogo.png" alt="TopCoder, Inc." class="footerLogo" width="132" height="22"
                     style="float:right;padding-right:30px;"/>
            </p>
        </div><%-- .wrapper ends --%>
    </div><%-- #footer ends --%>

<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-6340959-3");
pageTracker._trackPageview();
} catch(err) {}</script>
