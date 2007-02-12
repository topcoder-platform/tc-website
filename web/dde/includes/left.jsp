<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.WebConstants" %>
<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
    String level2 = request.getParameter("level2")==null?"":request.getParameter("level2");
	
	long tcsForumsID = WebConstants.TCS_FORUMS_ROOT_CATEGORY_ID; 
%>

            <img src="/images/clear.gif" width="180" height="6" border="0" alt=""><br>
            <img src="/images/left_nav_top.gif" width="180" height="11" border="0" alt=""><br>

            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle">Software:</td></tr>
                <tr>
                    <td id="leftNavTitle">
                        <%@ include file="/includes/componentSearch.jsp" %>
                    </td>
                </tr>

<!-- Applications begins -->
                <tr><td id="<%=level1.equals("applications")?"leftNavOn":"leftNav"%>"><a href="/applications/index.jsp" class="<%=level1.equals("applications")?"leftOn":"left"%>"><img src="/images/nav_arrow_<%=level1.equals("applications")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0">Applications</a></td></tr>

            <% if (level1.equals("applications")) { %>
                <tr><td id="<%=level2.equals("overview")?"leftSubnavOn":"leftSubnav"%>"><a href="/applications/index.jsp" class="leftOn">Overview</a></td></tr>
                <tr><td id="<%=level2.equals("methodology")?"leftSubnavOn":"leftSubnav"%>"><a href="/applications/methodology.jsp" class="leftOn">Methodology</a></td></tr>
			<% } %>
<!-- Applications ends -->

<!-- Components begins-->
                <tr><td id="<%=level1.equals("components")?"leftNavOn":"leftNav"%>"><a href="/catalog/index.jsp" class="<%=level1.equals("components")?"leftOn":"left"%>"><img src="/images/nav_arrow_<%=level1.equals("components")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0">Components</a></td></tr>

            <% if (level1.equals("components")) { %>
                <tr><td id="<%=level2.equals("find")?"leftSubnavOn":"leftSubnav"%>"><a href="/catalog/index.jsp" class="leftOn">Find Components</a></td></tr>
                <tr><td id="<%=level2.equals("overview")?"leftSubnavOn":"leftSubnav"%>"><a href="/components/index.jsp" class="leftOn">What Are Components?</a></td></tr>
                <tr><td id="<%=level2.equals("methodology")?"leftSubnavOn":"leftSubnav"%>"><a href="/components/methodology.jsp" class="leftOn">Methodology</a></td></tr>
                <tr><td id="<%=level2.equals("subscriptions")?"leftSubnavOn":"leftSubnav"%>"><a href="/components/subscriptions.jsp" class="leftOn">Subscriptions</a></td></tr>
                <tr><td id="<%=level2.equals("suggest")?"leftSubnavOn":"leftSubnav"%>"><a href="/components/request.jsp" class="leftOn">Suggest a Component</a></td></tr>
            <% } %>
<!-- Components ends -->

<!-- Customers begins-->
                <tr><td id="<%=level1.equals("customers")?"leftNavSelect":"leftNav"%>"><a href="/customers/index.jsp" class="<%=level1.equals("customers")?"leftOn":"left"%>"><img src="/images/<%=level1.equals("customers")?"clear":"nav_arrow_right"%>.gif" width="10" height="10" alt="" border="0">Customers</a></td></tr>
<!-- Customers ends -->

<!-- About begins-->
                <tr><td id="<%=level1.equals("about")?"leftNavSelect":"leftNav"%>"><a href="/about/explanationMovie.jsp" class="<%=level1.equals("about")?"leftOn":"left"%>"><img src="/images/<%=level1.equals("about")?"clear":"nav_arrow_right"%>.gif" width="10" height="10" alt="" border="0">About</a></td></tr>
<!-- About ends -->


<!-- Forum begins-->
                <tr><td id="<%=level1.equals("forum")?"leftNavOn":"leftNav"%>"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=<%=tcsForumsID%>" target="_parent" class="<%=level1.equals("forum")?"leftOn":"left"%>"><img src="/images/nav_arrow_<%=level1.equals("forum")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0">Forums</a></td></tr>
            
            <% if (level1.equals("forum")) { %>
                <tr><td id="<%=level2.equals("all")?"leftSubnavOn":"leftSubnav"%>"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=<%=tcsForumsID%>" target="_parent" class="leftOn">Component Forums</a></td></tr>
            <% } %>
<!-- Forum ends -->
            
            </table>

            <img src="/images/left_nav_btm.gif" width="180" height="23" border="0" alt=""><br>
            <img src="/images/clear.gif" width="180" height="15" border="0" alt=""><br>
            
            <div align="center"><img src="/images/logo_ghosted_bracket.gif" width="160" height="77" border="0" alt="[ TopCoder ]" vspace="10" /><br><br></center>
