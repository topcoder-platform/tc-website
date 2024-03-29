<%--
 * Copyright (C) 2004 - 2015 TopCoder Inc., All Rights Reserved.
 *
 * Author: TCSASSEMBLER
 * Version: 1.1
 *
 * This JSP links the stylesheets and js files.
 *
 * Chaneges in (TC Community Site - Header Footer UX Update) 1.1
 * Update to use new styles for footer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.common.BaseServlet, com.topcoder.web.common.SessionInfo" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<c:set value="<%=Boolean.parseBoolean(request.getParameter("isReskin"))%>" var="isReskin"/>

<%
    SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    String level1 = request.getParameter("level1")==null?"competition":request.getParameter("level1");
    String handle = null;
    if (sessionInfo != null)
    {
        handle = sessionInfo.getHandle();
    }

    String domainName = ApplicationServer.SERVER_NAME.replace("www.", "");
    String year = new SimpleDateFormat("yyyy").format(new Date());
%>

<c:choose>
    <c:when test="${isReskin}">
        <footer class="footer-wrapper">
            <nav class="footer-inner">
                <div class="utils">
                    <span>&copy; <%=year%> Topcoder</span>
                    <a href="https://www.topcoder.com/policy">Policies</a>
                </div>
                <div class="social">
                    <a href="https://www.facebook.com/topcoder" target="_blank">
                        <img src="/i/reskin-2/social-fb-icon.svg">
                    </a>
                    <a href="https://www.youtube.com/channel/UCFv29ANLT2FQmtvS9DRixNA" target="_blank">
                        <img src="/i/reskin-2/social-yt-icon.svg">
                    </a>
                    <a href="https://www.linkedin.com/company/topcoder" target="_blank">
                        <img src="/i/reskin-2/social-linkedin-icon.svg">
                    </a>
                    <a href="https://twitter.com/topcoder" target="_blank">
                        <img src="/i/reskin-2/social-tw-icon.svg">
                    </a>
                    <a href="https://www.instagram.com/topcoder" target="_blank">
                        <img src="/i/reskin-2/social-insta-icon.svg">
                    </a>
                </div>
            </nav>
        </footer>
    </c:when>
    <c:when test="${not empty isNewStyle && isNewStyle}">
        <%--<footer id="footer">--%>
            <%--<div class="container">--%>
                <%--<div class="footerContentSection twitter">--%>
                    <%--<div class="title">Twitter</div>--%>
                    <%--<div class="footerContent">--%>


                        <%--<c:forEach items="${tweets}" var="tweet">--%>
                            <%--<div class="footerTwEntry">--%>
                                <%--<a href="http://www.twitter.com/topcoder" >@<c:out value="${tweet.user.name}"/></a> <c:out value="${tweet.text}"/>--%>
                            <%--</div>--%>
                        <%--</c:forEach>--%>

                        <%--<a class="btn btnFooter" href="http://www.twitter.com/topcoder"><span class="twFollowIcon"></span><span class="twFollowBtnText">Follow</span></a>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="footerContentSection recentBlogPosts">--%>
                    <%--<div class="title">Recent Blog Posts Updated</div>--%>
                         <%--<div class="footerContent">--%>
                              <%--<span id="blogTemplate" style="display: none">--%>
                                 <%--<div class="footerBlogEntry">--%>
                                     <%--<a href="javascript:;"></a>--%>

                                 <%--</div>--%>
                              <%--</span>--%>
                             <%--<a class="btn btnFooter" href="http://www.topcoder.com/blog">View More</a>--%>
                         <%--</div>--%>


                <%--</div>--%>
                <%--<div class="footerContentSection aboutTopCoder">--%>
                    <%--<div class="title">About topcoder</div>--%>
                    <%--<div class="footerContent">--%>
                        <%--The topcoder community gathers the world's experts in design, development and data science to work on interesting and challenging problems for fun and reward. We want to help topcoder members improve their skills, demonstrate and gain reward for their expertise, and provide the industry with objective insight on new and emerging technologies.--%>
                    <%--</div>--%>
                    <%--<a class="btn btnFooter" href="http://www.topcoder.com/mission">About Us</a>--%>
                <%--</div>--%>
                <%--<div class="clear"></div>--%>
            <%--</div>--%>
            <%--<div class="container">--%>
                <%--<div class="connected">--%>
                    <%--<section class="social">--%>
                        <%--<h4>Get Connected</h4>--%>
                        <%--<ul>--%>
                            <%--<li><a class="fb" href="http://www.facebook.com/topcoder">FB</a></li>--%>
                            <%--<li><a class="tw" href="http://www.twitter.com/topcoder">TW</a></li>--%>
                            <%--<li><a class="gp" href="https://plus.google.com/u/0/b/104268008777050019973/104268008777050019973/posts">GP</a></li>--%>
                            <%--<li><a class="in" href="https://www.linkedin.com/company/topcoder">IN</a></li>--%>
                        <%--</ul>--%>
                        <%--<div class="clear"></div>--%>
                    <%--</section>--%>
                    <%--<section class="updates">--%>
                        <%--<div class="row">--%>
                            <%--<form id="emailForm" onsubmit="return newsletter_check(this)" name="FeedBlitz_9feab01d431311e39e69002590771423" style="display:block" method="POST" action="http://www.feedblitz.com/f/f.fbz?AddNewUserDirect">--%>
                                <%--<input type="email" class="email" name="EMAIL" placeholder="Your email address" maxlength="64" />--%>
                                <%--<input name="FEEDID" type="hidden" value="926643" />--%>
                                <%--<input name="PUBLISHER" type="hidden" value="34610190" />--%>
                                <%--<!-- <a onclick="FeedBlitz_9feab01d431311e39e69002590771423s(this.form);" class="btn">Submit</a> -->--%>
                                <%--<input onclick="FeedBlitz_9feab01d431311e39e69002590771423s(this.form);" type="button" class="btn btnSubmitFooter" value="Submit"/>--%>
                                <%--<input type="hidden" name="na" value="s"/>--%>
                                <%--<input type="hidden" name="nr" value="widget"/>--%>
                            <%--</form>--%>
                            <%--<script type="text/javascript">function FeedBlitz_9feab01d431311e39e69002590771423i(){var x=document.getElementsByName('FeedBlitz_9feab01d431311e39e69002590771423');for(i=0;i<x.length;i++){x[i].EMAIL.style.display='block'; x[i].action='http://www.feedblitz.com/f/f.fbz?AddNewUserDirect';}} function FeedBlitz_9feab01d431311e39e69002590771423s(v){v.submit();}FeedBlitz_9feab01d431311e39e69002590771423i();</script>--%>

                        <%--</div>--%>
                    <%--</section>--%>
                <%--</div>--%>
                <%--<div class="copyright">--%>
                    <%--<section>--%>
                        <%--<br />--%>
                        <%--&#169; 2014 topcoder. All Rights reserved.--%>
                        <%--<br />--%>
                        <%--<a href="http://www.topcoder.com/community/how-it-works/privacy-policy/" class="privacyStmtLink">Privacy Policy</a> | <a href="http://www.topcoder.com/community/how-it-works/terms/" class="legalDisclaimerLink">Terms</a>--%>
                    <%--</section>--%>
                <%--</div>--%>
                <%--<div class="clear"></div>--%>
            <%--</div>--%>
        <%--</footer>--%>

        <footer class="bottom-footer"><!-- Footer links-->
            <nav class="menu-item">
                <div class="menu-item-header show-small">OTHERS</div>
                <ul class="submenu">
                    <li class="submenu-item"><a class="menu-link" href="https://<%=ApplicationServer.SERVER_NAME%>/sitemap">SITEMAP</a></li>
                    <li class="submenu-item"><a class="menu-link" href="https://<%=ApplicationServer.SERVER_NAME%>/about/">ABOUT US</a></li>
                    <li class="submenu-item"><a class="menu-link" href="https://help.<%=domainName%>/hc/en-us/articles/219069687-Contact-Support">CONTACT US</a></li>
                    <li class="submenu-item"><a class="menu-link" href="https://help.<%=domainName%>/">HELP CENTER</a></li>
                    <li class="submenu-item"><a class="menu-link" href="https://<%=ApplicationServer.SERVER_NAME%>/community/how-it-works/privacy-policy/">PRIVACY POLICY</a></li>
                    <li class="submenu-item"><a class="menu-link" href="https://<%=ApplicationServer.SERVER_NAME%>/community/how-it-works/terms/">TERMS</a></li>
                </ul>
            </nav>
            <!-- Social links-->
            <div class="social-links"><p>topcoder is also on</p><a class="fb-link" href="https://www.facebook.com/topcoder"></a><a
                    class="twitter-link" href="http://www.twitter.com/topcoder"></a><a class="linkedin-link" href="https://www.linkedin.com/company/topcoder"></a><a
                    class="google-link" href="https://plus.google.com/+topcoder/posts"></a></div>
              <p class="copyright-notice">&copy; <script type="text/javascript">d=new Date();document.write(d.getFullYear());</script> Topcoder. All Rights Reserved</p></footer>
    </c:when>
    <c:otherwise>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
                <td width="100%" class="footer">
                    <a href="http://<%=ApplicationServer.SERVER_NAME%>/" class="footerLinks">Home</a>&#160;&#160;|&#160;&#160;
                    <a href="http://<%=ApplicationServer.SERVER_NAME%>/aboutus/" class="footerLinks">About TopCoder</a>&#160;&#160;|&#160;&#160;
                    <a href="http://<%=ApplicationServer.SERVER_NAME%>/aboutus/news/" class="footerLinks">Press Room</a>&#160;&#160;|&#160;&#160;
                    <a href="http://<%=ApplicationServer.SERVER_NAME%>/help/template-help/" class="footerLinks">Contact Us</a>&#160;&#160;|&#160;&#160;
                    <a href="http://<%=ApplicationServer.SERVER_NAME%>/aboutus/careers/" class="footerLinks">Careers</a>&#160;&#160;|&#160;&#160;
                    <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=about&amp;d2=privacy" class="footerLinks">Privacy</a>&#160;&#160;|&#160;&#160;
                    <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=about&amp;d2=terms" class="footerLinks">Terms</a>
                    <br />
                    <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc" class="footerLinks">Competitions</a>&#160;&#160;|&#160;&#160;
                    <a href="https://<%=ApplicationServer.SERVER_NAME%>/direct/" class="footerLinks">Cockpit</a>        </td>
            </tr>
            <tr>
                <td width="100%" class="copyright">Copyright TopCoder, Inc. 2001-<script type="text/javascript">d=new Date();document.write(d.getFullYear());</script></td></tr>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>



<%-- Analytics --%>

<script>
  !function(){var analytics=window.analytics=window.analytics||[];if(!analytics.initialize)if(analytics.invoked)window.console&&console.error&&console.error("Segment snippet included twice.");else{analytics.invoked=!0;analytics.methods=["trackSubmit","trackClick","trackLink","trackForm","pageview","identify","reset","group","track","ready","alias","debug","page","once","off","on","addSourceMiddleware","addIntegrationMiddleware","setAnonymousId","addDestinationMiddleware"];analytics.factory=function(e){return function(){var t=Array.prototype.slice.call(arguments);t.unshift(e);analytics.push(t);return analytics}};for(var e=0;e<analytics.methods.length;e++){var key=analytics.methods[e];analytics[key]=analytics.factory(key)}analytics.load=function(key,e){var t=document.createElement("script");t.type="text/javascript";t.async=!0;t.src="https://cdn.segment.com/analytics.js/v1/" + key + "/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(t,n);analytics._loadOptions=e};analytics.SNIPPET_VERSION="4.13.1";
  analytics.load("p4hJvXxilb4KtBW6BMYN4o9FoNtCrp4E");
  analytics.page();
  }}();
</script>

<script>
analytics.identify('', {
  username: '<%= handle %>',
  id: '<%=sessionInfo.getUserId()%>'
});
</script>

<c:if test="${!isReskin}">
<!-- Start of topcoder Zendesk Widget script -->
<script>/*<![CDATA[*/window.zEmbed||function(e,t){var n,o,d,i,s,a=[],r=document.createElement("iframe");window.zEmbed=function(){a.push(arguments)},window.zE=window.zE||window.zEmbed,r.src="javascript:false",r.title="",r.role="presentation",(r.frameElement||r).style.cssText="display: none",d=document.getElementsByTagName("script"),d=d[d.length-1],d.parentNode.insertBefore(r,d),i=r.contentWindow,s=i.document;try{o=s}catch(c){n=document.domain,r.src='javascript:var d=document.open();d.domain="'+n+'";void(0);',o=s}o.open()._l=function(){var o=this.createElement("script");n&&(this.domain=n),o.id="js-iframe-async",o.src=e,this.t=+new Date,this.zendeskHost=t,this.zEQueue=a,this.body.appendChild(o)},o.write('<body onload="document._l();">'),o.close()}("https://assets.zendesk.com/embeddable_framework/main.js","topcoder.zendesk.com");
/*]]>*/</script>
<!-- End of topcoder Zendesk Widget script -->
</c:if>
