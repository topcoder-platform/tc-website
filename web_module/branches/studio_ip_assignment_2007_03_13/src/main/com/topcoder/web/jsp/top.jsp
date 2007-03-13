<%@  page
  language="java"
  import="java.text.DecimalFormat,
          com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.SessionInfo"%>
<%@ page import="com.topcoder.web.common.BaseServlet"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%
    SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    String level1 = request.getParameter("level1")==null?"competition":request.getParameter("level1");

%>
<script type="text/javascript">
var objTopPopUp = null;
// called when you topPopup at the bottom right of an object
function topPopUp(topPopper,topPopupID) {
    var pos = findPos(topPopper);
    var x = pos[0] + topPopper.offsetWidth + 2;
    var y = pos[1] + topPopper.offsetHeight + 2;
    topPopShow(x,y,topPopupID);
}
// called when you know the exact spot you want to topPop up at
function topPopShow(posX,posY,topPopupID) {
    objTopPopUp = document.getElementById(topPopupID);
    objTopPopUp.style.left = posX + 'px';
    objTopPopUp.style.top = posY + 'px';
    objTopPopUp.style.display = 'block';
}
function topPopHide() {
    objTopPopUp.style.display = 'none';
    objTopPopUp = null;
}
function findPos(obj) {
    var curLeft = curTop = 0;
    if (obj.offsetParent) {
        curLeft = obj.offsetLeft;
        curTop = obj.offsetTop;
        while (obj = obj.offsetParent) {
            curLeft += obj.offsetLeft;
            curTop += obj.offsetTop;
        }
    }
    return [curLeft,curTop];
}
</script>

<%----------LAUNCH BAR-------------%>
<div id="launch0" class="popUp"><div><strong>Competitions Home</strong></div></div>
<div id="launch1" class="popUp"><div><strong>Launch Algorithm Competitions Arena</strong></div></div>
<div id="launch2" class="popUp"><div><strong>Launch High School Competitions Arena</strong></div></div>
<div id="launch3" class="popUp"><div><strong>Component Design Active Contests</strong></div></div>
<div id="launch4" class="popUp"><div><strong>Component Development Active Contests</strong></div></div>
<div id="launch5" class="popUp"><div><strong>Marathon Match Active Contests</strong></div></div>

<map name="competeBar">
<area shape="rect" alt="" coords="0,0,66,30" href="http://<%=ApplicationServer.SERVER_NAME%>/tc" onmouseover="topPopShow(73,65,'launch0')" onmouseout="topPopHide()" />
<area shape="rect" alt="" coords="68,0,106,30" href="javascript:arena();" onmouseover="topPopShow(108,65,'launch1')" onmouseout="topPopHide()" />
<area shape="rect" alt="" coords="107,0,153,30" href="javascript:arena();" onmouseover="topPopShow(155,65,'launch2')" onmouseout="topPopHide()" />
<area shape="rect" alt="" coords="154,0,179,30" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewActiveContests&ph=112" onmouseover="topPopShow(181,65,'launch3')" onmouseout="topPopHide()" />
<area shape="rect" alt="" coords="180,0,205,30" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewActiveContests&ph=113" onmouseover="topPopShow(207,65,'launch4')" onmouseout="topPopHide()" />
<area shape="rect" alt="" coords="206,0,250,30" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=ViewActiveContests" onmouseover="topPopShow(252,65,'launch5')" onmouseout="topPopHide()" />
</map>
<%---------------------------------%>

<div style="position: absolute; left:0; top:31px; background: transparent;">
   <img src="/i/interface/competeBar.gif" alt="" usemap="#competeBar"/>
</div>

<% if ( !sessionInfo.isAnonymous() ) { %>
<div style="position: absolute; right:0px; top:31px;"><A href="http://<%=ApplicationServer.SERVER_NAME%>/reg/?nrg=false"><img src="/i/interface/update_my_profile.gif" alt="Update My Profile" style="display:block;"/></A></div>
<% } else { %>
<div style="position: absolute; right:0px; top:31px;"><A href="http://<%=ApplicationServer.SERVER_NAME%>/reg/"><img src="/i/interface/register_now.gif" alt="Register Now" style="display:block;"/></A></div>
<%}%>

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
       Hello,&#160;<tc-webtag:handle coderId='<%=sessionInfo.getUserId()%>' darkBG="true" />
      <% if (level1.equals("long")) { %>
               &#160;&#160;|&#160;&#160;<a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Logout">Logout</a>
      <% } else { %>
               &#160;&#160;|&#160;&#160;<a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Logout">Logout</a>
      <% } %>
   <% } else {
       if (level1.equals("long")) {%>
               <a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Login">Login</a>
      <% } else { %>
               <a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?&module=Login">Login</a>
      <% } %>
   <%}%>
   </div>
</div>
