<%@  page
  language="java"
  import="java.text.DecimalFormat,
          com.topcoder.shared.util.ApplicationServer,
          com.topcoder.common.web.data.Navigation" %>
<%@ page import="com.topcoder.web.common.SessionInfo"%>
<%@ page import="com.topcoder.web.common.BaseServlet"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%
    SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    if (sessionInfo==null) {
        Navigation nav = (Navigation)request.getSession(true).getAttribute("navigation");
        if (nav==null) nav = new Navigation(request, response);
        request.getSession(true).setAttribute("navigation", nav);
        sessionInfo = nav.getSessionInfo();
    }

    String level1 = request.getParameter("level1")==null?"competition":request.getParameter("level1");

%>
<STYLE TYPE="text/css">
div.topBar, div.topBar div
{
color: #FFFFFF;
font-size: 10px;
}
div.topBar
{
background: #FFFFFF url(/i/interface/top_bg.gif) top center repeat-x;
vertical-align: top;
padding: 5px 10px 50px 3px;
white-space: nowrap; 
}
#outer
{
width: 360px;
position: relative;
margin: 0px 300px 0px 300px;
/*border: 1px solid #00FF00;*/
}
#inner
{
position: absolute;
left: 0px;
}
</STYLE>


<div align="center">
   <div id="outer">
      <div id="inner">
      <A href="/"><img src="/i/interface/topcoder.gif" alt="TopCoder" /></A>
      </div>
   </div>
</div>

<div class="topBar">
   <div style="float: right;">
   <% if ( !sessionInfo.isAnonymous() ) { %>
       Hello,&#160;<tc-webtag:handle coderId='<%=sessionInfo.getUserId()%>' />
      <% if (level1.equals("long")) { %>
               &#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Logout">Logout</a>
      <% } else { %>
               &#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Logout">Logout</a>
      <% } %>           
               &#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.SERVER_NAME%>/Registration">Update Profile</a>
   <% } else {
       if (level1.equals("long")) {%>
               <a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Login">Login</a>
      <% } else { %>
               <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?&module=Login">Login</a>
      <% } %>
               &#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.SERVER_NAME%>/Registration">Register</a>
   <%}%>
               &#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.SERVER_NAME%>/">Home</a>
   </div>
Member Count: <%=new DecimalFormat("#,##0").format(sessionInfo.getMemberCount())%> - <jsp:include page="/date_time.jsp" />
&#160;<a href="Javascript:tcTime()">[Get Time]</a>
</div>



