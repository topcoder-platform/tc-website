<%@  page
  language="java"
  import="com.topcoder.common.web.data.CoderRegistration,
          com.topcoder.ejb.DataCache.*,
          com.topcoder.common.web.util.*,
          java.text.DecimalFormat,
          com.topcoder.common.web.data.Navigation,
          java.util.HashMap,
          com.topcoder.web.tc.model.CoderSessionInfo" %>
<%
   Navigation nav = (Navigation)request.getSession(true).getAttribute("navigation");
   if (nav==null) nav = new Navigation(request, response);
   request.getSession(true).setAttribute("navigation", nav);
   CoderSessionInfo sessionInfo = nav.getSessionInfo();
   String styleClass = "coderTextWhite";
   DataCache dcHome = com.topcoder.common.web.util.Cache.get();
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
%>

<a name="top"/>
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="search">
    <tr valign="middle">
        <td><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
        <td nowrap="0" class="registerToday"><span class="time">Current Member Count</span>&#160;:&#160; <%=new DecimalFormat("#,##0").format(dcHome.getMemberCount())%> - <span class="time"><jsp:include page="date_time.jsp" /></span><a href="Javascript:tcTime()" class="statText">[Get Time]</a></span></td>
        <td width="99%" align="right" class="login" nowrap="0">

<% if ( !sessionInfo.isAnonymous() ) { %>
            <strong>Hello, </strong>
            <a href="/stat?c=member_profile&amp;cr=<%=sessionInfo.getUserId()%>" class="<%=styleClass%>" target="_parent"><%=sessionInfo.getHandle()%></a>
            &#160;&#160;|&#160;&#160;<a href="/tc?&amp;module=Logout" class="loginLinks" target="_parent">Logout</a>
            &#160;&#160;|&#160;&#160;<a href="/Registration" class="loginLinks" target="_parent">Update Profile</a>
<% } else { %>
            <a href="/tc?&module=Login" class="loginLinks" target="_parent">Login</a>
            &#160;&#160;|&#160;&#160;<a href="/Registration" class="loginLinks" target="_parent">Register</a>
<%}%>

            &#160;&#160;|&#160;&#160;<a href="/" class="loginLinks" target="_parent">Home</a>
        </td>
        <td><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr><td width="100%"><img src="/i/clear.gif" width="1" height="1" border="0"/></td></tr>
</table>

<!-- Logo Bar Include Begins -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr valign="middle">
        <td width="15"><a name="top"></a><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
        <td width="206"><a href="/" target="_parent"><img src="/i/logo.gif" width="206" height="49" border="0" vspace="5"/></a></td>
        <td width="99%" nowrap>

<% if ( !sessionInfo.isAnonymous() ) { %>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#333333">
                <tr valign="middle"><form name="selectform">
                <% if (rating > 1199) { %>
                    <td width="99%" align="left"><img src="/i/top_div1_badge.jpg" width="370" height="75" border="0"/></td>
                <% } else if (rating < 1) { %>
                    <td width="99%" align="left"><img src="/i/top_unrated_badge.jpg" width="370" height="75" border="0"/></td>
                <% } else { %>
                    <td width="99%" align="left"><img src="/i/top_div2_badge.jpg" width="390" height="75" border="0"/></td>
                <% } %>
                    <td align="right">
                        <select name="quickstat" size="1" class="dropdown" onchange="window.location=this.options[this.selectedIndex].value">
                            <option value="SELECTED"> Select a Feature: </option>
                            <option value="/stat?c=member_profile&amp;cr=<%=sessionInfo.getUserId()%>">Profile</option>
                            <option value="/stat?c=ratings_history&amp;cr=<%=sessionInfo.getUserId()%>">Rating History</option>
                            <option value="/stat?c=earnings_history&amp;cr=<%=sessionInfo.getUserId()%>">Earnings History</option>
                            <option value="/stat?c=coder_room_stats&amp;cr=<%=sessionInfo.getUserId()%>">Room Statistics</option>
                            <option value="/stat?c=round_stats">Round Statistics</option>
                            <option value="/index?t=search">Advanced Member Search</option>
                            <option value="/PactsMemberServlet">Affidavits</option>
                            <option value="/index?t=search&amp;c=refer">My Referrals</option>
                            <option value="/index?t=development&amp;c=index">Development</option>
                            <option value="/index?t=tces&amp;c=index">TCES (jobs)</option>
                        </select>
                    </td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="75" border="0"/></td></form>
                </tr>
            </table>

<% } else { %>

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr><td><img src="/i/clear.gif" width="1" height="75" border="0"/></td></tr>
            </table>

<% }%>
        </td>
    </tr>
</table>

<jsp:include page="menu.jsp" />
