<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.WebConstants" %>
<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
    String level2 = request.getParameter("level2")==null?"":request.getParameter("level2");
	
	long tcsForumsID = WebConstants.TCS_FORUMS_ROOT_CATEGORY_ID; 
%>

  <div id="nav-sidebar">
    <ul id="side-navigation">
    	<li class="top-li"><a href="#" class="expand-group">Applications</a>
			<ul <% if (level1.equals("applications")) { %> style="display:block;" <% } %> class="submenu">
            	<li><a href="/applications/index.jsp">Overview</a></li>
                <li><a href="/applications/methodology.jsp">Methodology</a></li>
            </ul> 
        </li>
        <li><a href="#"class="expand-group">Components</a>
       	<ul <% if (level1.equals("components")) { %> style="display:block;" <% } %> class="submenu">
            	<li><a href="/catalog/index.jsp">Find Components</a></li>
                <li><a href="/components/index.jsp">What Are Components</a></li>
                <li><a href="/components/methodology.jsp">Methodology</a></li>
                <li><a href="/components/subscriptions.jsp">Subscriptions</a></li>
                <li><a href="/components/request.jsp">Suggest a Component</a></li>
            </ul>

        </li>
        <li><a href="/customers/index.jsp">Customers</a></li>
        <li><a href="/about/explanationMovie.jsp">About</a></li>
        <li><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=<%=tcsForumsID%>">Forums</a></li>
    </ul>
</div>

            
            <div align="center"><img src="/images/logo_ghosted_bracket.gif" width="160" height="77" border="0" alt="[ TopCoder ]" vspace="10" /><br><br></center>
