<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.shared.util.ApplicationServer"%>

<!-- Footer Include Begins -->
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr><td width="100%" class="footer">
        <a href="/" class="footerLinks">Home</a>&#160;&#160;|&#160;&#160;
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=index" class="footerLinks">About TopCoder</a>&#160;&#160;|&#160;&#160;
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=pressroom&d2=index" class="footerLinks">Press Room</a>&#160;&#160;|&#160;&#160;
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=contactus" class="footerLinks">Contact Us</a>&#160;&#160;|&#160;&#160;
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=privacy" class="footerLinks">Privacy</a>&#160;&#160;|&#160;&#160;
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=terms" class="footerLinks">Terms</a></td></tr>

<!-- Member sites -->
    <tr><td width="100%" class="footer"><a href="/tc" class="footerLinks">Competitions</a>&#160;&#160;|&#160;&#160;
    <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/" class="footerLinks">Corporate Services</a>
<!-- Main Navigation bar ends -->

    <tr><td height="4" class="footerStripe"><img src="/i/corp/clear.gif" width="10" height="4" border="0"/></td></tr>

    <tr><td width="100%" class="copyright">Copyright TopCoder, Inc. 2001-<script type="text/javascript">d=new Date();document.write(d.getFullYear());</script></td></tr>
</table>
<!-- Footer Include Ends -->

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
