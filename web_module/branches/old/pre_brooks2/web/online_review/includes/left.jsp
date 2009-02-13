
<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
    String level2 = request.getParameter("level2")==null?"":request.getParameter("level2");
    String level3 = request.getParameter("level3")==null?"":request.getParameter("level3");
%>

            <img src="images/clear.gif" width="180" height="6" border="0" alt=""><br>
            <img src="images/left_nav_top.gif" width="170" height="11" border="0" alt=""><br>

            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle">Development:</td></tr>

<!-- Launch Arena Applet -->
                <tr><td id="leftNavApplet"><img alt="" width="10" height="10" src="images/nav_arrow_right.gif" border="0"/><A href="Javascript:arena()" class="left">Launch Arena Applet</A></td></tr>

    <% if ((level1.equals("development"))) { %>
<!-- How to Get Paid begins -->
                <tr>
                    <td id="<%=level2.equals("dev_payment")?"leftNavOn":"leftNav"%>">
                        <img src="images/nav_arrow_<%=level2.equals("dev_payment")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="http://www.topcoder.com/?&t=development&c=dev_payment" class="<%=level2.equals("dev_payment")?"leftOn":"left"%>">How to Get Paid</a>
                    </td>
                </tr>

<!-- TC Round Tables begins -->
                <tr>
                    <td id="<%=level2.equals("tcRoundtables")?"leftNavOn":"leftNav"%>">
                        <img src="images/nav_arrow_<%=level2.equals("tcRoundtables")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="http://www.topcoder.com/rtables/viewForum.jsp?forum=205768&mc=239" class="<%=level2.equals("tcRoundtables")?"leftOn":"left"%>">TC Developer Round Tables</a>
                    </td>
                </tr>

<!-- TCS Forums begins -->
                <tr>
                    <td id="<%=level2.equals("tcsForums")?"leftNavOn":"leftNav"%>">
                        <img src="images/nav_arrow_<%=level2.equals("tcsForums")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="http://software.topcoder.com/forum/c_active_collab.jsp?ft=2" class="<%=level2.equals("tcsForums")?"leftOn":"left"%>">TCS Developer Forums</a>
                    </td>
                </tr>

<!-- Components begins -->
                <tr><td id="<%=level2.equals("components")?"leftNavOn":"leftNav"%>"><img src="images/nav_arrow_<%=level2.equals("components")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="http://www.topcoder.com/?&t=development&c=comp_projects" class="leftOn">Components</a></td></tr>

        <% if ((level2.equals("components"))) { %>
                <tr><td id="<%=level3.equals("comp_projects")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/?&t=development&c=comp_projects" class="leftOn">Open Projects</a></td></tr>
                <tr><td id="<%=level3.equals("reviews")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/tc?module=ViewReviewProjects" class="leftOn">Review Opportunities</a></td></tr>
                <tr><td id="<%=level3.equals("components")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/?&t=development&c=components" class="leftOn">This Week's Project Winners</a></td></tr>
                <tr><td id="<%=level3.equals("project_review")?"leftSubnavOn":"leftSubnav"%>"><a href="/review" class="leftOn">Project Submit & Review</a></td></tr>
                <tr><td id="<%=level3.equals("comp_archive")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/?&t=development&c=comp_archive" class="leftOn">Project Status</a></td></tr>
                <tr><td id="<%=level3.equals("comp_meth")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/?&t=development&c=comp_meth" class="leftOn">Development Methodology</a></td></tr>
                <tr><td id="<%=level3.equals("tcs_sample_docs")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/?&t=development&c=tcs_sample_docs" class="leftOn">Documentation and Sample Submissions</a></td></tr>
                <tr><td id="<%=level3.equals("gettingStarted")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/?t=development&c=getting_started" class="leftOn">Getting Started</a></td></tr>
        <% } %>
                 
<!-- Applications begins -->
                <tr><td id="<%=level2.equals("applications")?"leftNavOn":"leftNav"%>"><img src="images/nav_arrow_<%=level2.equals("applications")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="http://www.topcoder.com/?&t=development&c=components" class="<%=level2.equals("applications")?"leftOn":"left"%>">Applications</a></td></tr>

        <% if ((level2.equals("applications"))) { %>
                <tr><td id="<%=level3.equals("app_projects")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/?&t=development&c=app_projects" class="leftOn">Open Projects</a></td></tr>
                <tr><td id="<%=level3.equals("app_meth")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/?&t=development&c=app_meth" class="leftOn">Development Methodology</a></td></tr>
                <tr><td id="<%=level3.equals("app_sample_docs")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/?&t=development&c=app_sample_docs" class="leftOn">Documentation</a></td></tr>
        <% } %>
                
<!-- Contests begins -->
                <tr>
                    <td id="<%=level2.equals("contests")?"leftNavOn":"leftNav"%>">
                        <img src="images/nav_arrow_<%=level2.equals("contests")?"bottom":"right"%>.gif" width="10" height="10" alt="" border="0"><a href="http://www.topcoder.com/?&t=development&c=des_bonus_contest_2" class="<%=level2.equals("contests")?"leftOn":"left"%>">Contests</a>
                    </td>
                </tr>

        <% if ((level2.equals("contests"))) { %>
                <tr><td id="<%=level3.equals("tco_comp_overview")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/?&t=events&c=tco_comp_overview" class="leftOn">TCO Component Contest</a></td></tr>
                <tr><td id="<%=level3.equals("des_bonus_contest_2")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/?&t=development&c=des_bonus_contest_2" class="leftOn">Design Bonus Contest 2</a></td></tr>
                <tr><td id="<%=level3.equals("bonuse_contest_0303")?"leftSubnavOn":"leftSubnav"%>"><a href="http://www.topcoder.com/?&t=development&c=bonus_contest_0303" class="leftOn">Design Bonus Contest 1</a></td></tr>
        <% } %>

            </table>

    <% } %>

            <img src="images/left_nav_btm.gif" width="180" height="23" border="0" alt=""><br>
            <img src="images/clear.gif" width="180" height="15" border="0" alt=""><br>
            
            <div align="center"><img src="images/logo_ghosted_bracket.gif" width="160" height="77" border="0" alt="[ TopCoder ]" vspace="10" /><br><br></center>
