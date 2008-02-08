<%
    String section = request.getParameter("section") == null ? "" : request.getParameter("section");
%>

<% if (section.equals("home")) {%>
<div id="home_footer">
<% } else { %>
<div id="footer">
<% } %>
    <div>
        <a href="${sessionInfo.servletPath}">Home</a>
        | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=contactUs">Contact Us</a>
        | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=about&amp;d2=privacy">Privacy</a>
        | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=about&amp;d2=terms">Terms</a>
    </div>
</div>

<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
var pageTracker = _gat._getTracker("UA-3257193-3");
pageTracker._initData();
pageTracker._trackPageview();
</script>
