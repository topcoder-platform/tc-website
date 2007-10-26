<%
    String section = request.getParameter("section") == null ? "" : request.getParameter("section");
%>

<% if (section.equals("home")) {%>
<div id="home_footer">
<% } else { %>
<div id="footer">
<% } %>
    <div>
        <a href="/">Home</a>
        | <a href="/?module=Static&amp;d1=contactUs">Contact Us</a>
        | <a href="/?module=Static&amp;d1=about&amp;d2=privacy">Privacy</a>
        | <a href="/?module=Static&amp;d1=about&amp;d2=terms">Terms</a>
    </div>
</div>
