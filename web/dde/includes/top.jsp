<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.dde.user.User" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
       <%@ include file="/includes/util.jsp" %>
       <%@ include file="/includes/session.jsp" %>
<%--Header begins--%>
<%
    boolean isHomePage = "true".equals(request.getParameter("isHomePage"));
%>
<%
    String TCDlevel = request.getParameter("TCDlevel") == null ? "" : request.getParameter("TCDlevel");
    
%>			
<div id="header">
		<div class="wrapper">
			
<%-- MASTHEAD AND LOGO --%>
			<h1><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/index.jsp" title="TopCoder Direct"><span>TopCoder Direct</span></a> <sup><small>BETA</small></sup></h1>
			<h2 id="ready_engage"><span>Ready.. ENGAGE</span></h2>
			
<%-- MAIN NAVIGATION --%>
			<div id="nav">
				<h3 class="hide">Main Navigation</h3>
				<ul>
					<li <% if (TCDlevel.equals("home")) {%> class="left on" <% } %>><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/index.jsp">TopCoder Direct Home</a></li>
					<li <% if (TCDlevel.equals("about")) {%> class="left on" <% } %>><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/about.jsp">About TopCoder Direct</a></li>
					<li <% if (TCDlevel.equals("platform")) {%> class="left on" <% } %>><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/platform-tools.jsp">Platform Tools</a></li>
					<li <% if (TCDlevel.equals("software")) {%> class="left on" <% } %>><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/indexTCS.jsp">Software</a></li>
					<li <% if (TCDlevel.equals("training")) {%> class="left on" <% } %>><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/training.jsp">Training &amp; Mentoring</a></li>
					<li <% if (TCDlevel.equals("support")) {%> class="left on" <% } %>><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/support.jsp">Support &amp; Maintenance</a></li>
				</ul>
			</div><%-- #navigation ends --%>
			
			<%-- SUB NAVIGATION --%>
			<div id="nav_support">
				<h3 class="hide">SUB Navigation</h3>
				<ul>
                	<li class="left"><a href="http://www.topcoder.com/">TopCoder.com</a></li>
                	<li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/tc?module=Static&amp;d1=about&amp;d2=index">About TopCoder</a></li>
					<li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/tc?module=Static&amp;d1=pressroom&amp;d2=index">News</a></li>
					<li><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/tc?module=Static&amp;d1=about&amp;d2=contactus">Contact Us</a></li>
					
                           <% if (session.getAttribute("TCUSER") == null) { %>
                           <li class="right">
                 <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/login.jsp">Login</a>
                 			</li>
     						<% } else { %>
                            <li>
               <a href="#">Hello <tc-webtag:handle coderId='<%=((User) session.getAttribute("TCUSER")).getId()%>'/></a>
               				</li>
                            <li class="right">
                            	<a href="<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/login.jsp?a=logout">Log Out</a>
                            </li>
      						<% } %>
                    </li>
				</ul>
			</div><%-- #navigation ends --%>
			
		</div><%-- .wrapper ends --%>
	</div><%-- #header ends --%>