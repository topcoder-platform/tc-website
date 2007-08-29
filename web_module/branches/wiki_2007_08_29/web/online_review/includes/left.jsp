<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="com.topcoder.web.common.WebConstants" %>

<%	long tcsForumsID = WebConstants.TCS_FORUMS_ROOT_CATEGORY_ID; %>

<script type="text/javascript">
<!--
function arena() {
  w=window.open("http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=applet&d2=launch","Launch","top=2,left=2,width=300,height=225,resizable=yes,status=1");
  return;
}
-->
</script>


<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
    String level2 = request.getParameter("level2")==null?"":request.getParameter("level2");
    String level3 = request.getParameter("level3")==null?"":request.getParameter("level3");
%>

            <img src="/images/clear.gif" width="180" height="6" border="0" alt=""><br>
            <img src="/images/left_nav_top.gif" width="170" height="11" border="0" alt=""><br>

            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle">Development:</td></tr>

<!-- Launch Arena Applet -->
                <tr><td id="leftNavApplet"><img alt="" width="10" height="10" src="/images/nav_arrow_right.gif" border="0"/><A href="Javascript:arena()" class="left">Launch Arena Applet</A></td></tr>

    <% if ((level1.equals("development"))) { %>
<!-- TC Round Tables begins -->
                <tr>
                    <td id="<%=level2.equals("tcRoundtables")?"leftNavOn":"leftNav"%>">
                        <img src="/images/nav_arrow_<%=level2.equals("tcRoundtables")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=205768" class="<%=level2.equals("tcRoundtables")?"leftOn":"left"%>">TC Developer Forums</a>
                    </td>
                </tr>

<!-- TCS Forums begins -->
                <tr>
                    <td id="<%=level2.equals("tcsForums")?"leftNavOn":"leftNav"%>">
                        <img src="/images/nav_arrow_<%=level2.equals("tcsForums")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=<%=tcsForumsID%>"> class="<%=level2.equals("tcsForums")?"leftOn":"left"%>">TCS Developer Forums</a>
                    </td>
                </tr>

<!-- Components begins -->
                <tr><td id="<%=level2.equals("components")?"leftNavOn":"leftNav"%>"><img src="/images/nav_arrow_<%=level2.equals("components")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0">Components</td></tr>

        <% if ((level2.equals("components"))) { %>
                <tr><td id="<%=level3.equals("des_projects")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/tc?module=ViewActiveContests&ph=112" class="leftOn">Active Design Contests</a></td></tr>
                <tr><td id="<%=level3.equals("dev_projects")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/tc?module=ViewActiveContests&ph=113" class="leftOn">Active Development Contests</a></td></tr>
<%--
                <tr><td id="<%=level3.equals("components")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/?&t=development&c=components" class="leftOn">Recent Project Winners</a></td></tr>
--%>
                <tr><td id="<%=level3.equals("des_reviews")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/tc?module=ViewReviewProjects&ph=112" class="leftOn">Design Review Opportunities</a></td></tr>
                <tr><td id="<%=level3.equals("dev_reviews")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/tc?module=ViewReviewProjects&ph=113" class="leftOn">Development Review Opportunities</a></td></tr>
                <tr><td id="<%=level3.equals("des_contests")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://www.topcoder.com/tc?module=CompList&ph=112">Design Contests</a></td></tr>
                <tr><td id="<%=level3.equals("dev_contests")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="http://www.topcoder.com/tc?module=CompList&ph=113">Development Contests</a></td></tr>
                <tr><td id="<%=level3.equals("project_review")?"leftSubnavOn":"leftSubnav"%>"><a href="/review" class="leftOn">Project Submit & Review</a></td></tr>
                <tr><td id="<%=level3.equals("des_archive")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/tc?module=ContestStatus&ph=112" class="leftOn">Design Contest Status</a></td></tr>
                <tr><td id="<%=level3.equals("dev_archive")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/tc?module=ContestStatus&ph=113" class="leftOn">Development Contest Status</a></td></tr>
<%--
                <tr><td id="<%=level3.equals("comp_meth")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/?&t=development&c=comp_meth" class="leftOn">Development Methodology</a></td></tr>
--%>
        <% } %>

<!-- Applications begins -->
<!--
                <tr><td id="<%=level2.equals("applications")?"leftNavOn":"leftNav"%>"><img src="/images/nav_arrow_<%=level2.equals("applications")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="http://www.topcoder.com/?t=development&c=app_projects" class="<%=level2.equals("applications")?"leftOn":"left"%>">Applications</a></td></tr>

        <% if ((level2.equals("applications"))) { %>
                <tr><td id="<%=level3.equals("app_projects")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/?&t=development&c=app_projects" class="leftOn">Projects</a></td></tr>
                <tr><td id="<%=level3.equals("app_meth")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/?&t=development&c=app_meth" class="leftOn">Development Methodology</a></td></tr>
                <tr><td id="<%=level3.equals("app_sample_docs")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/tc?module=Static&d1=dev&d2=support&d3=appDocumentation" class="leftOn">Documentation</a></td></tr>
        <% } %>
-->

<!-- Support/FAQ begins -->
                <tr><td id="<%=level2.equals("support")?"leftNavOn":"leftNav"%>"><img src="/images/nav_arrow_<%=level2.equals("support")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="http://www.topcoder.com/tc?module=Static&d1=dev&d2=support&d3=desGettingStarted" class="<%=level2.equals("support")?"leftOn":"left"%>">Design Support / FAQs / Docs</a></td></tr>
                <tr><td id="<%=level2.equals("support")?"leftNavOn":"leftNav"%>"><img src="/images/nav_arrow_<%=level2.equals("support")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="http://www.topcoder.com/tc?module=Static&d1=dev&d2=support&d3=devGettingStarted" class="<%=level2.equals("support")?"leftOn":"left"%>">Development Support / FAQs / Docs</a></td></tr>


            </table>

    <% } %>

            <img src="/images/left_nav_btm.gif" width="180" height="23" border="0" alt=""><br>
            <img src="/images/clear.gif" width="180" height="15" border="0" alt=""><br>

            <div align="center"><img src="/images/logo_ghosted_bracket.gif" width="160" height="77" border="0" alt="[ TopCoder ]" vspace="10" /><br><br></center>
