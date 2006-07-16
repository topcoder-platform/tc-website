<%@ page language="java"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page import="com.topcoder.web.common.model.NavTree"%>
<%@ page import="com.topcoder.web.common.model.NavNode"%>
<%--<%@ taglib uri="nav.tld" prefix="nav" %>--%>

<%
   /* m_name indicates the name of an expandable menu */

   NavTree nav = new NavTree();
   nav.addRoot(new NavNode("http://"+ApplicationServer.SERVER_NAME+"/", "Home", "home"));
   request.setAttribute("tree", nav);

%>

<script language="javascript" type="text/javascript">
<!--
function toggleMenu(menuTitle,menuID){
   var menu = document.getElementById(menuID);
   if(menu.style.display == 'block') menu.className = 'CLOSED';
   else if(menu.className == 'OPEN' && menu.style.display != 'none') menu.className = 'CLOSED';
   else {
      menu.className = 'OPEN';
   }
   if(menuTitle.blur)menuTitle.blur();
   if(menuTitle.className == 'exp') menuTitle.className = 'exp_ed';
   else menuTitle.className = 'exp';
   return;
}
function flipMenu(myMenuName){
   var menuName = document.getElementById(myMenuName);
   menuName.className = 'exp_ed';
}

// -->
</script>

<!--node is <%=request.getParameter("node")%> -->
<div id="leftNav">
   <div class="logo"><img src="/i/creative/tcfx_logo_temp.gif" alt="TopCoder FX" /></div>
<%--
   <nav:navBuilder navTree="tree" openClass="OPEN" selectedLeafClass="highlight" selectedParentClass="exp_ed" unSelectedParentClass="exp" selectedNode="<%=request.getParameter("node")%>"/>
--%>
</div>






<%-- STATIC HTML FOR REFERENCE
<div id="leftNav">

   <div class="logo"><img src="/i/creative/tcfx_logo_temp.gif" alt="TopCoder FX" /></div>
   
   <ul>
   <li class="highlight"><A href="../home/home.html">Home</A></li>
   <li><A href="">Contests</A></li>
   <li><A href="">Terms & Conditions</A></li>
   <li><A href="">Forums</A></li>
   <li><A href="">Support</A></li>
   </ul>

</div>
--%>
