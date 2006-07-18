<%@ page language="java" %>
<%@ page import="com.topcoder.web.common.model.NavNode" %>
<%@ page import="com.topcoder.web.common.model.NavTree" %>
<%@ page import="com.topcoder.web.creative.Constants" %>
<%@ taglib uri="nav.tld" prefix="nav" %>

<%
    /* m_name indicates the name of an expandable menu */

    NavTree nav = new NavTree();
    nav.addRoot(new NavNode("/", "Home", "home"));
    nav.addRoot(new NavNode("/?" + Constants.MODULE_KEY + "=Static&amp;d1=activeContests", "Contests", "contests"));
    nav.addRoot(new NavNode("/", "Terms &amp; Conditions", "terms"));
    nav.addRoot(new NavNode("/", "Forums", "forums"));
    nav.addRoot(new NavNode("/", "Support", "support"));
    request.setAttribute("tree", nav);

%>

<script language="javascript" type="text/javascript">
    <!--
    function toggleMenu(menuTitle, menuID) {
        var menu = document.getElementById(menuID);
        if (menu.style.display == 'block') menu.className = 'CLOSED';
        else if (menu.className == 'OPEN' && menu.style.display != 'none') menu.className = 'CLOSED';
        else {
            menu.className = 'OPEN';
        }
        if (menuTitle.blur)menuTitle.blur();
        if (menuTitle.className == 'exp') menuTitle.className = 'exp_ed';
        else menuTitle.className = 'exp';
        return;
    }
    function flipMenu(myMenuName) {
        var menuName = document.getElementById(myMenuName);
        menuName.className = 'exp_ed';
    }

    // -->
</script>

<!--node is <%=request.getParameter("node")%> -->
<div id="leftNav">
    <div class="logo"><img src="/i/clear.gif" width="150" height="60" alt="TopCoder Studio"/></div>
    <nav:navBuilder navTree="tree" openClass="OPEN" selectedLeafClass="highlight" selectedParentClass="exp_ed" unSelectedParentClass="exp" selectedNode="<%=request.getParameter("node")%>"/>
</div>

