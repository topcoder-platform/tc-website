<%@  page
  language="java"
  import="java.text.DecimalFormat,
          java.util.HashMap,
          com.topcoder.web.common.model.CoderSessionInfo,
          com.topcoder.web.common.BaseServlet,
          com.topcoder.shared.util.ApplicationServer,
          com.topcoder.common.web.data.Navigation" %>
<%
    Navigation nav = (Navigation)request.getSession(true).getAttribute("navigation");
    if (nav==null) nav = new Navigation(request, response);
    request.getSession(true).setAttribute("navigation", nav);
    CoderSessionInfo sessionInfo = nav.getSessionInfo();
   String styleClass = "coderTextWhite";
   int rating = 0;
   if (!sessionInfo.isAnonymous()) {
       rating = sessionInfo.getRating();
       if ( rating > 2199 ) {
         styleClass = "coderTextRed";
       } else if ( rating > 1499 && rating < 2200 ) {
         styleClass = "coderTextYellow";
       } else if ( rating > 1199 && rating < 1500 ) {
         styleClass = "coderTextBlue";
       } else if ( rating > 899 && rating < 1200 ) {
         styleClass = "coderTextGreen";
       } else if (rating > 0 && rating < 900) {
         styleClass = "coderTextGray";
       } else if (rating < 0) {
         styleClass = "coderTextOrange";
       }
     }

    String level1 = request.getParameter("level1")==null?"competition":request.getParameter("level1");

%>

<a name="top"/>
<table width="100%" border=0 cellpadding=0 cellspacing=0>
    <tr>
        <td class=homeTopBar>
		<span class="time">Current Member Count</span>&#160;:&#160;<%=new DecimalFormat("#,##0").format(sessionInfo.getMemberCount())%> -
		<span class="time"><jsp:include page="date_time.jsp" /></span>
		<a href="Javascript:tcTime()" class="time">&#160;<strong>[Get Time]</strong></a>
		</td>

        <td class=homeTopBar width="100%" align=right valign="bottom">
<% if ( !sessionInfo.isAnonymous() ) { %>
            <strong>Hello, </strong><span class="smallText">&#160;
            <a href="/tc?module=MemberProfile&cr=<%=sessionInfo.getUserId()%>" class="<%=styleClass%>"><%=sessionInfo.getHandle()%></a></span>
            &#160;&#160;|&#160;&#160;<a href="/tc?&amp;module=Logout" class=loginLinks>Logout</a>
            &#160;&#160;|&#160;&#160;<a href="/Registration" class=loginLinks>Update Profile</a>
<% } else { %>
            <a href="/tc?&module=Login" class=loginLinks>Login</a>
            &#160;&#160;|&#160;&#160;<a href="/Registration" class=loginLinks>Register</a>
<%}%>
            &#160;&#160;|&#160;&#160;<a href="/" class=loginLinks>Home</a>
        </td>
    </tr>
</table>

<!-- Logo Bar Include Begins -->
<table width="100%" border=0 cellpadding=0 cellspacing=0>
    <tr>
<% if (level1.equals("development")) {%>
        <td class=homeLogo><a href="/"><img src="/i/logo.gif" border="0"/></a></td>
<% } else { %>
		<td class=homeLogo><a href="/"><img src="/i/logo_r.gif" border="0"/></a></td>
<% } %>
    </tr>
</table>

<jsp:include page="menu.jsp">
    <jsp:param name="level1" value="<%=level1%>"/>
</jsp:include>