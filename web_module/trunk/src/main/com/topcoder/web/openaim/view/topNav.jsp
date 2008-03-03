<%
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>

<div class="navBox">
    <a class="navTab" href="/openaim/forums"><img src="/i/events/openaim/tabs/discuss.png" alt="discuss" onmouseover="this.src='/i/events/openaim/tabs/discussOn.png';"  onmouseout="this.src='/i/events/openaim/tabs/discuss.png';" /></a>
    <a class="navTab" href="http://dev.aol.com/api/openaim"><img src="/i/events/openaim/tabs/apis.png" alt="apis" onmouseover="this.src='/i/events/openaim/tabs/apisOn.png';"  onmouseout="this.src='/i/events/openaim/tabs/apis.png';" /></a>
    <a class="navTab" href="/openaim/?module=ViewContestDetails&ct=1000"><img src="/i/events/openaim/tabs/submit.png" alt="submit" onmouseover="this.src='/i/events/openaim/tabs/submitOn.png';"  onmouseout="this.src='/i/events/openaim/tabs/submit.png';" /></a>
    <a class="navTab" href="/openaim/?module=ViewContestDetails&ct=1000"><img src="/i/events/openaim/tabs/register.png" alt="Register" onmouseover="this.src='/i/events/openaim/tabs/registerOn.png';"  onmouseout="this.src='/i/events/openaim/tabs/register.png';" /></a>
    <a class="navTab" href="/openaim/?module=Static&d1=learnMore"><img src="/i/events/openaim/tabs/learn.png" alt="learn" onmouseover="this.src='/i/events/openaim/tabs/learnOn.png';"  onmouseout="this.src='/i/events/openaim/tabs/learn.png';" /></a>
</div>

<%--
<div id="menubar">
    <div id="nav">
        <ul>
            <li<% if (node.equals("home")) {%> class="active"<% } %>><a href="${sessionInfo.servletPath}" title="Home" onfocus="this.blur();">Home</a></li>
            <li<% if (node.equals("contests")) {%> class="active"<% } %>><a href="${sessionInfo.servletPath}?module=ViewActiveContests" title="Contests" onfocus="this.blur();">Contests</a></li>
            <li<% if (node.equals("forums")) {%> class="active"<% } %>><a href="/openaim/forums" title="Forums" onfocus="this.blur();">Forums</a></li>
            <li<% if (node.equals("support")) {%> class="active"<% } %>><a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=getStarted" title="Support" onfocus="this.blur();">Help</a></li>
            <li<% if (node.equals("contactUs")) {%> class="active_nobar"<% } else { %> class="nobar"<% } %>><a href="${sessionInfo.servletPath}?module=Static&amp;d1=contactUs" title="Contact Us" onfocus="this.blur();">Contact Us</a></li>
        </ul>
    </div>
</div>
--%>