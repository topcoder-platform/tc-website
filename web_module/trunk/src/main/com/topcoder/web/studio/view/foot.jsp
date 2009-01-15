<%
    String section = request.getParameter("section") == null ? "" : request.getParameter("section");
%>
<<<<<<< .mine
 			</div>
 		</div>
	</div><%-- #page-wrap ends --%>
	
  	<div id="links">
        <div class="wrapper2">
            <div class="col">
                <h4>Customer Service</h4>
                <ul>
                    <li><a href="http://software.topcoder.com/contact.jsp">Contact Support</a></li>
                    <li><a href="http://www.topcoder.com/tc?module=Static&amp;d1=about&amp;d2=privacy">Privacy Policy</a></li>
                    <li><a href="http://topcoderblogs.com/direct/?page_id=24">Terms &amp; Conditions</a></li>
                </ul>
            </div>
            
            <div class="col">
                <h4>About TopCoder</h4>
                <ul>
                    <li><a href="http://software.topcoder.com/contact.jsp">Contact Us</a></li>
                    <li><a href="http://www.topcoder.com/tc?module=Static&amp;d1=pressroom&amp;d2=mediaRequestForm">Public Relations</a></li>
                    <li><a href="http://software.topcoder.com/TCD/rss.jsp">RSS Feeds</a></li>
                    <li><a href="http://www.topcoder.com/tc?module=Static&amp;d1=pressroom&amp;d2=index">Press Room</a></li>
                    <li><a href="http://www.topcoder.com/tc?module=Static&amp;d1=about&amp;d2=jobs">Working at TopCoder</a></li>
                    <li><a href="http://www.topcoder.com/tc?module=Static&amp;d1=about&amp;d2=terms">Legal Information</a></li>
                </ul>
=======
>>>>>>> .r74200

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

<<<<<<< .mine
        </div><%-- .wrapper ends --%>
    </div><%-- #links block ends --%>
  
  
    <%-- FOOTER BLOCK --%>
    <div id="footer">
        <div class="wrapper2">
            <p id="footer_1800"><strong>1-866-TOPCODER or Service@TopCoder.com</strong></p> <%--chjanged from id--%>
            <p>TopCoder is the world's largest competitive software development community with developers representing over 200 countries.</p>
            <p>Copyright &copy;2001-2008, TopCoder, Inc. All rights reserved.</p>
        </div><%-- .wrapper ends --%>
    </div><%-- #footer ends --%>

=======
>>>>>>> .r74200
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-6340959-3");
pageTracker._trackPageview();
} catch(err) {}</script>
