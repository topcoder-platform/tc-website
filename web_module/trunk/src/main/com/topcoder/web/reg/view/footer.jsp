<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.common.BaseServlet, com.topcoder.web.common.SessionInfo" %>

<%
    SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    String level1 = request.getParameter("level1")==null?"competition":request.getParameter("level1");
     String handle = null;
    if (sessionInfo != null)
    {
        handle = sessionInfo.getHandle();
    }

%>
<div id="footer">
	<div class="mask">
		<div class="portals">
			<h3>Portals</h3>
			<div class="nav">
				<a class="analytics" href="#">Analytics</a>
				<a class="mobile" href="#">Mobile</a>
				<a class="blog" href="#">Blog</a>
				<a class="news" href="#">News</a>
			</div><!-- .nav -->
			<div class="nav">
				<a class="events" href="#">Events</a>
				<a class="series" href="#">Webinars</a>
				<a class="nns" href="#">NNS</a>
				<a class="video" href="#">Video</a>
			</div><!-- .nav -->
		</div>
		<div class="customers">
			<h3>Our Customers</h3>
			<p>Find out who else has worked with TopCoder.</p>
			<div class="bx-wrapper" style="width:386px; position:relative;"><div class="bx-window" style="position:relative; overflow:hidden; width:386px;"><ul class="carousel" style="width: 999999px; position: relative; left: -791.9482799004495px;"><li style="width: 386px; float: left; list-style: none;"><img src="/i/customer-placeholder.png" alt=""></li>
				<li class="pager" style="width: 386px; float: left; list-style: none;"><img src="/i/customer-placeholder.png" alt=""></li>
				<li class="pager" style="width: 386px; float: left; list-style: none;"><img src="/i/customer-placeholder.png" alt=""></li>
				<li class="pager" style="width: 386px; float: left; list-style: none;"><img src="/i/customer-placeholder.png" alt=""></li>
				<li class="pager" style="width: 386px; float: left; list-style: none;"><img src="/i/customer-placeholder.png" alt=""></li>
			<li style="width: 386px; float: left; list-style: none;"><img src="/i/customer-placeholder.png" alt=""></li></ul></div></div>
		</div>
		<div class="clear"></div>
		<div class="bottom">
			<div class="nav">
				<span>Copyright TopCoder, Inc. 2001-2012</span>
				<span class="line"></span>
				<a href="#">Home</a>
				<span class="line"></span>
				<a href="#">About</a>
				<span class="line"></span>
				<a href="#">Press Room</a>
				<span class="line"></span>
				<a href="#">Contact Us</a>
				<span class="line"></span>
				<a href="#">Careers</a>
				<span class="line"></span>
				<a href="#">Privacy</a>
				<span class="line"></span>
				<a href="#">Terms</a>
				<span class="line"></span>
				<a href="#">Competitions</a>
				<span class="line"></span>
				<a href="#">Cockpit</a>
			</div><!-- .nav -->
			<div class="socials">
				<div id="followUsWidget">
					<h2 class="widgettitle">Follow Us!</h2>
					<div class="socialmedia-buttons smw_left">
						<a href="http://www.facebook.com/topcoderinc" rel="nofollow" target="_blank"><img width="16" height="16" src="/i/facebook.png" alt="Follow Us on Facebook" title="Follow Us on Facebook" class="fade"></a>
						<a href="https://plus.google.com/u/0/b/104268008777050019973/104268008777050019973/posts" rel="nofollow" target="_blank"><img width="16" height="16" src="/i/googleplus.png" alt="Follow Us on Google+" title="Follow Us on Google+" class="fade"></a>
						<a href="http://www.twitter.com/topcoder" rel="nofollow" target="_blank"><img width="16" height="16" src="/i/twitter.png" alt="Follow Us on Twitter" title="Follow Us on Twitter" class="fade"></a>
						<a href="http://www.youtube.com/topcoderinc" rel="nofollow" target="_blank"><img width="16" height="16" src="/i/youtube.png" alt="Follow Us on YouTube" title="Follow Us on YouTube" class="fade"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	

<%-- Analytics --%>

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

<!-- Google Code for Studio Registration Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 989882186;
var google_conversion_language = "en";
var google_conversion_format = "2";
var google_conversion_color = "ffffff";
var google_conversion_label = "Hc9YCPb9pQQQys6B2AM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/989882186/?value=0&amp;label=Hc9YCPb9pQQQys6B2AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>