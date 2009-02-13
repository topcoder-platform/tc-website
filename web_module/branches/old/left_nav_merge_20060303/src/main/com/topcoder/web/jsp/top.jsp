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
<script language="javascript" type="text/javascript">
<!--
var objPopUp = null;
function popUpUnder(event,objectID){
   objPopTrig = document.getElementById(event);
   alert(objPopTrig);
   objPopUp = document.getElementById(objectID);
   xPos = objPopTrig.offsetLeft;
   if(xPos + objPopUp.offsetWidth > document.body.clientWidth) xPos = xPos - objPopUp.offsetWidth;
   objPopUp.style.left = xPos + 'px';
   objPopUp.style.display = 'block';
}
function popDescription(objectID){
   objPopUp = document.getElementById(objectID);
   objPopUp.style.visibility = 'visible';
//   objPopUp.style.display = 'block';
}
function hideDescription(){
   objPopUp.style.visibility = 'hidden';
//   objPopUp.style.display = 'none';
   objPopUp = null;
}

// -->
</script>
<STYLE TYPE="text/css">
div.topBar, div.topBar div, div.memberCountBox
{
color: #FFFFFF;
font-size: 11px;
}
div.memberCountBox
{
position:absolute;
top:5;
left:3;
z-index:1;
}
div.topBar
{
background: #FFFFFF url(/i/interface/top_bg.gif) top center repeat-x;
vertical-align: top;
padding: 5px 10px 80px 3px;
white-space: nowrap;
}
div.launchPopUp
{
font-size: 11px;
background-color: #FFFFCC;
visibility: hidden;
position: absolute;
padding: 3px 5px 3px 5px;
border: solid 1px black;
font-weight:bold;
z-index: 3;
}
#outerLogo
{
width: 360px;
position: relative;
z-index: 2;
}
#innerLogo
{
position: absolute;
left: 0px;
}
</STYLE>

<%----------LAUNCH BAR-------------%>
<div id="launch0" class="launchPopUp" style="left:115;top:65;">Launch Algorithm Competitions Arena</div>
<div id="launch1" class="launchPopUp" style="left:140;top:65;">Component Design Active Contests</div>
<div id="launch2" class="launchPopUp" style="left:170;top:65;">Component Development Active Contests</div>
<div id="launch3" class="launchPopUp" style="left:210;top:65;">Marathon Match Active Contests</div>
<map name="launchBar">
<area shape="rect" alt="" coords="70,0,110,30" href="javascript:arena();" onmouseover="popDescription('launch0')" onmouseout="hideDescription()" />
<area shape="rect" alt="" coords="111,0,140,30" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewActiveContests&ph=112" onmouseover="popDescription('launch1')" onmouseout="hideDescription()" />
<area shape="rect" alt="" coords="141,0,165,30" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewActiveContests&ph=113" onmouseover="popDescription('launch2')" onmouseout="hideDescription()" />
<area shape="rect" alt="" coords="166,0,228,30" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=ViewActiveContests" onmouseover="popDescription('launch3')" onmouseout="hideDescription()" />
</map>
<div style="position:absolute; left:0px; top:31px;">
<img src="/i/interface/launchBar.gif" alt="" usemap="#launchBar"/>
</div>
<%---------------------------------%>

<div align="center" style="margin: 0px 290px 0px 280px;">
   <div id="outerLogo">
      <div id="innerLogo">
      <A href="http://<%=ApplicationServer.SERVER_NAME%>/"><img src="/i/interface/topcoder.gif" alt="TopCoder" /></A>
      </div>
   </div>
</div>

<div class="memberCountBox">
Member Count: <%=new DecimalFormat("#,##0").format(sessionInfo.getMemberCount())%> - <jsp:include page="/date_time.jsp" />
&#160;<a class="gMetal" href="Javascript:tcTime()">[Get Time]</a>
</div>

<div class="topBar">
   <div style="float: right; margin-left: 650px;">
   <% if ( !sessionInfo.isAnonymous() ) { %>
       Hello,&#160;<tc-webtag:handle coderId='<%=sessionInfo.getUserId()%>' />
      <% if (level1.equals("long")) { %>
               &#160;&#160;|&#160;&#160;<a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Logout">Logout</a>
      <% } else { %>
               &#160;&#160;|&#160;&#160;<a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Logout">Logout</a>
      <% } %>
               &#160;&#160;|&#160;&#160;<a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/Registration">Update Profile</a>
   <% } else {
       if (level1.equals("long")) {%>
               <a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Login">Login</a>
      <% } else { %>
               <a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?&module=Login">Login</a>
      <% } %>
               &#160;&#160;|&#160;&#160;<a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/Registration">Register</a>
   <%}%>
               &#160;&#160;|&#160;&#160;<a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/">Home</a>
   </div>
</div>
