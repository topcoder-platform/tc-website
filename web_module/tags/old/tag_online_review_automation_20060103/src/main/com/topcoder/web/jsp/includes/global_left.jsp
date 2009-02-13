<%@ page
        language="java"
        errorPage="../errorPage.jsp"
        import="com.topcoder.common.web.data.Navigation,
                com.topcoder.shared.util.ApplicationServer,
                com.topcoder.web.common.model.CoderSessionInfo,
                com.topcoder.web.common.BaseServlet"
        %>

<script language="JavaScript"><!--
var javascriptVersion1_1 = false;
// --></script>


<script language="JavaScript1.1"><!--
javascriptVersion1_1 = true;
// --></script>


<script langauge="JavaScript"><!--

var detectableWithVB = false;
var pluginFound = false;

function goURL(daURL) {
    if(javascriptVersion1_1) {
   window.location.replace(daURL);
    } else {
   window.location = daURL;
    }
    return;
}

function redirectCheck(pluginFound, redirectURL, redirectIfFound) {
    if( redirectURL && ((pluginFound && redirectIfFound) ||
   (!pluginFound && !redirectIfFound)) ) {
   goURL(redirectURL);
   return pluginFound;
    } else {
   return pluginFound;
    }
}

function canDetectPlugins() {
    if( detectableWithVB || (navigator.plugins && navigator.plugins.length > 0) ) {
   return true;
    } else {
   return false;
    }
}

function detectJavaWebStartWithMimeTypes() {
    if (navigator.mimeTypes && navigator.mimeTypes.length) {
        if (navigator.mimeTypes['application/x-java-jnlp-file']) {
            return true;
        }
    }
    return false;
}

function detectJavaWebStart(redirectURL, redirectIfFound) {
    pluginFound = detectJavaWebStartWithMimeTypes();
    if(!pluginFound && detectableWithVB) {
   pluginFound = detectActiveXControl('JavaWebStart.isInstalled');
    }
    return redirectCheck(pluginFound, redirectURL, redirectIfFound);
}

function detectJava(redirectURL, redirectIfFound) {
    pluginFound = detectPlugin('Java','Plug-in');
    if(!pluginFound && detectableWithVB) {
   pluginFound = detectActiveXControl('JavaPlugin');
    }
    return redirectCheck(pluginFound, redirectURL, redirectIfFound);
}

function detectPlugin() {
    var daPlugins = detectPlugin.arguments;
    var pluginFound = false;
    if (navigator.plugins && navigator.plugins.length > 0) {
   var pluginsArrayLength = navigator.plugins.length;
   for (pluginsArrayCounter=0; pluginsArrayCounter < pluginsArrayLength; pluginsArrayCounter++ ) {
       var numFound = 0;
       for(namesCounter=0; namesCounter < daPlugins.length; namesCounter++) {
      if( (navigator.plugins[pluginsArrayCounter].name.indexOf(daPlugins[namesCounter]) >= 0) ||
          (navigator.plugins[pluginsArrayCounter].description.indexOf(daPlugins[namesCounter]) >= 0) ) {
         numFound++;
      }
       }
       if(numFound == daPlugins.length) {
      pluginFound = true;
      break;
       }
   }
    }
    return pluginFound;
}

if ((navigator.userAgent.indexOf('MSIE') != -1) && (navigator.userAgent.indexOf('Win') != -1)) {
    document.writeln('<script language="VBscript">');

    document.writeln('\'do a one-time test for a version of VBScript that can handle this code');
    document.writeln('detectableWithVB = False');
    document.writeln('If ScriptEngineMajorVersion >= 2 then');
    document.writeln('  detectableWithVB = True');
    document.writeln('End If');

    document.writeln('\'this next function will detect most plugins');
    document.writeln('Function detectActiveXControl(activeXControlName)');
    document.writeln('  on error resume next');
    document.writeln('  detectActiveXControl = False');
    document.writeln('  If detectableWithVB Then');
    document.writeln('     detectActiveXControl = IsObject(CreateObject(activeXControlName))');
    document.writeln('  End If');
    document.writeln('End Function');

    document.writeln('</scr' + 'ipt>');
}
// --></script>

<script type="text/javascript">
    function arena() {
        w = window.open("http://www.topcoder.com/tc?module=Static&d1=applet&d2=detect", "Launch", "top=2,left=2,width=400,height=400,resizable=yes,status=1");
        return;
    }
</script>


<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.SessionInfo" %>
<%
    String level1 = request.getParameter("level1") == null ? "" : request.getParameter("level1");
    String level2 = request.getParameter("level2") == null ? "" : request.getParameter("level2");
    String level3 = request.getParameter("level3") == null ? "" : request.getParameter("level3");
    String unreadCategories = request.getParameter("unreadCategories") == null ? "" : request.getParameter("unreadCategories");
    SessionInfo info = (SessionInfo) request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    //bleh, gott do this for registration cuz it does a redirect to a jsp
    if (info == null) info = new Navigation(request, response).getSessionInfo();
%>

<img alt="" width="180" height="5" src="/i/spacer.gif" border="0"><br>
<img alt="" width="170" height="11" src="/i/left_nav_top.gif" border="0"><br>

<% if ((level1.equals("about")) || (level1.equals("review_board")) || (level1.equals("press_room")) || (level1.equals("management"))) { %>

<%-- TopCoder Info begins *************************** --%>
<table width="180" cellspacing="0" cellpadding="0" border="0">
    <tr><td id="leftNavTitle">TopCoder Info:</td></tr>

    <%-- About TopCoder begins --%>
    <tr><td id="<%=level1.equals("about")?"leftNavOn":"leftNav"%>">
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=index" class="<%=level1.equals("about")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("about")?"bottom":"right"%>.gif" border="0"/>About
            TopCoder</a></td></tr>

    <% if (level1.equals("about")) { %>
    <tr><td id="<%=level2.equals("overview")?"leftSubnavOn":"leftSubnav"%>">
        <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=index">Overview</a>
    </td></tr>
    <tr><td id="<%=level2.equals("whyjoin")?"leftSubnavOn":"leftSubnav"%>">
        <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=whyjoin">Why Join
            TopCoder?</a></td></tr>
    <tr><td id="<%=level2.equals("jobs")?"leftSubnavOn":"leftSubnav"%>">
        <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=jobs">Working at
            TopCoder</a></td></tr>
    <tr><td id="<%=level2.equals("terms")?"leftSubnavOn":"leftSubnav"%>">
        <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=terms">Terms,
            Revisions</a></td></tr>
    <tr><td id="<%=level2.equals("privacy")?"leftSubnavOn":"leftSubnav"%>">
        <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=privacy">Privacy
            Policy</a></td></tr>
    <% } %>
    <%-- About TopCoder ends --%>

    <%-- Review Boards begins --%>
    <tr><td id="<%=level1.equals("review_board")?"leftNavOn":"leftNav"%>">
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&ph=112" class="<%=level1.equals("review_board")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("review_board")?"bottom":"right"%>.gif" border="0"/>Review
            Boards</a></td></tr>
    <% if (level1.equals("review_board")) { %>
    <tr><td id="<%=level2.equals("design")?"leftSubnavOn":"leftSubnav"%>">
        <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&ph=112">Design</a></td>
    </tr>
    <tr><td id="<%=level2.equals("development")?"leftSubnavOn":"leftSubnav"%>">
        <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ReviewBoard&ph=113">Development</a>
    </td></tr>
    <% } %>
    <%-- Review Boards ends --%>

    <%-- Press Room begins --%>
    <tr><td id="<%=level1.equals("press_room")?"leftNavSelect":"leftNav"%>">
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=pressroom&d2=index" class="<%=level1.equals("press_room")?"leftOn":"left"%>"><img alt="" src="/images/<%=level1.equals("press_room")?"clear":"nav_arrow_right"%>.gif" border="0"/>Press
            Room</a></td></tr>
    <%-- Press Room ends --%>

    <%-- Management begins --%>
    <tr><td id="<%=level1.equals("management")?"leftNavSelect":"leftNav"%>">
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=about&d2=management" class="<%=level1.equals("management")?"leftOn":"left"%>"><img alt="" src="/images/<%=level1.equals("management")?"clear":"nav_arrow_right"%>.gif" border="0"/>Management
            Team</a></td></tr>
    <%-- Management ends --%>

    <%-- Contacts begins --%>
    <tr><td id="<%=level1.equals("contacts")?"leftNavOn":"leftNav"%>">
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=contacts&c=index" class="<%=level1.equals("contacts")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("contacts")?"bottom":"right"%>.gif" border="0"/>Contact
            Us</a></td></tr>
    <%-- Contacts ends --%>

</table>
<%-- TopCoder Info ends *************************** --%>

<%-- Employment Opportunities *************************** --%>
<% } else if (level1.equals("employment")) { %>
<table width="180" cellspacing="0" cellpadding="0" border="0">
    <tr><td id="leftNavTitle">Employment Opportunities:</td></tr>
    <tr><td id="leftNavApplet">
        <a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch
            Arena Applet</a></td></tr>
    <%-- My Home --%>
    <% if (!info.isAnonymous() || level1.equals("my_home")) { %>
    <tr><td id="<%=level1.equals("my_home")?"leftNavOn":"leftNav"%>">
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=my_home&d2=index" class="<%=level1.equals("my_home")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("my_home")?"bottom":"right"%>.gif" border="0"/>$HOME</a>
    </td></tr>
    <% } %>
    <%-- Emp Opps Home --%>
    <tr><td id="<%=level2.equals("openings")?"leftNavSelect":"leftNav"%>">
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=contracting&d2=index" class="<%=level2.equals("openings")?"leftOn":"left"%>"><img alt="" src="/images/<%=level2.equals("openings")?"clear":"nav_arrow_right"%>.gif" border="0"/>Job
            Openings</a></td></tr>
    <%-- Registration --%>
    <tr><td id="<%=level2.equals("registration")?"leftNavSelect":"leftNav"%>">
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ContractingPreferences" class="<%=level2.equals("registration")?"leftOn":"left"%>"><img alt="" src="/images/<%=level2.equals("registration")?"clear":"nav_arrow_right"%>.gif" border="0"/>Registration</a>
    </td></tr>
</table>


<%-- Development *************************** --%>
<% } else if (level1.equals("development")) { %>
<table width="180" cellspacing="0" cellpadding="0" border="0">
    <tr><td id="leftNavTitle">Development:</td></tr>
    <tr><td id="leftNavApplet">
        <a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch
            Arena Applet</a></td></tr>
    <%-- My Home --%>
    <% if (!info.isAnonymous() || level1.equals("my_home")) { %>
    <tr><td id="<%=level1.equals("my_home")?"leftNavOn":"leftNav"%>">
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=my_home&d2=index" class="<%=level1.equals("my_home")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("my_home")?"bottom":"right"%>.gif" border="0"/>$HOME</a>
    </td></tr>
    <% if (level1.equals("my_home")) { %>
    <tr><td id="<%=level2.equals("profile")?"leftSubnavOn":"leftSubnav"%>">
        <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/Registration">Update My Profile</A></td></tr>
    <tr><td id="<%=level2.equals("referrals")?"leftSubnavOn":"leftSubnav"%>">
        <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReferrals">Referrals</A></td>
    </tr>
    <tr><td id="<%=level2.equals("card")?"leftSubnavOn":"leftSubnav"%>">
        <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=card&d2=description">Cards
            / Badges</A></td></tr>
    <tr><td id="<%=level2.equals("pacts")?"leftSubnavOn":"leftSubnav"%>">
        <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/PactsMemberServlet?t=affidavit&c=affidavit_history">Affidavits</A>
    </td></tr>
    <% } %>
    <% } %>
    <tr><td id="<%=level2.equals("rTables")?"leftNavOn":"leftNav"%>">
        <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=205768&sortField=9&sortOrder=0" class="<%=level2.equals("rTables")?"leftOn":"left"%>"><img width="10" height="10" src="/images/nav_arrow_<%=level2.equals("rTables")?"bottom":"right"%>.gif" alt="" border="0"/>TC
            Developer Forums</a></td></tr>
    <tr><td id="<%=level2.equals("forums")?"leftNavOn":"leftNav"%>">
        <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/forum/c_active_collab.jsp?ft=2" class="<%=level2.equals("forums")?"leftOn":"left"%>"><img width="10" height="10" src="/images/nav_arrow_<%=level2.equals("forums")?"bottom":"right"%>.gif" alt="" border="0"/>TCS
            Developer Forums</a></td></tr>
    <tr><td id="<%=level2.equals("components")?"leftNavOn":"leftNav"%>">
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/?t=development&c=comp_projects" class="<%=level2.equals("components")?"leftOn":"left"%>"><img width="10" height="10" src="/images/nav_arrow_<%=level2.equals("components")?"bottom":"right"%>.gif" alt="" border="0"/>Components</a>
    </td></tr>
    <% if (level2.equals("components")) { %>
    <tr><td id="<%=level3.equals("open")?"leftSubnavOn":"leftSubnav"%>">
        <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?t=development&c=comp_projects">Projects</A>
    </td></tr>
    <tr><td id="<%=level3.equals("reviews")?"leftSubnavOn":"leftSubnav"%>">
        <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReviewProjects">Review
            Opportunities</A></td></tr>
    <tr><td id="<%=level3.equals("winners")?"leftSubnavOn":"leftSubnav"%>">
        <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?t=development&c=components">Recent Project
            Winners</A></td></tr>
    <tr><td id="<%=level3.equals("des_contests")?"leftSubnavOn":"leftSubnav"%>">
        <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=CompList&pi=112">Design Contests</a>
    </td></tr>
    <tr><td id="<%=level3.equals("dev_contests")?"leftSubnavOn":"leftSubnav"%>">
        <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=CompList&pi=113">Development
            Contests</a></td></tr>
    <tr><td id="<%=level3.equals("submit")?"leftSubnavOn":"leftSubnav"%>">
        <A class="leftOn" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review">Project Submit & Review</A>
    </td></tr>
    <tr><td id="<%=level3.equals("status")?"leftSubnavOn":"leftSubnav"%>">
        <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?t=development&c=comp_archive">Project
            Status</A></td></tr>
    <tr><td id="<%=level3.equals("method")?"leftSubnavOn":"leftSubnav"%>">
        <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?t=development&c=comp_meth">Development
            Methodology</A></td></tr>
    <% } %>
    <tr><td id="<%=level2.equals("contests")?"leftNavOn":"leftNav"%>">
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=dev&d2=usdc_overview" class="<%=level2.equals("contests")?"leftOn":"left"%>"><img width="10" height="10" src="/images/nav_arrow_<%=level2.equals("contests")?"bottom":"right"%>.gif" alt="" border="0"/>Contests</a>
    </td></tr>
    <% if (level2.equals("contests")) { %>
    <tr><td id="<%=level3.equals("ultimate")?"leftSubnavOn":"leftSubnav"%>">
        <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=dev&d2=usdc_overview">Ultimate
            Contest</A></td></tr>
    <tr><td id="<%=level3.equals("descontest2")?"leftSubnavOn":"leftSubnav"%>">
        <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?t=development&c=des_bonus_contest_2">Design
            Bonus Contest 2</A></td></tr>
    <tr><td id="<%=level3.equals("descontest1")?"leftSubnavOn":"leftSubnav"%>">
        <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?t=development&c=bonus_contest_0303">Design
            Bonus Contest 1</A></td></tr>
    <tr><td id="<%=level3.equals("open")?"leftSubnavOn":"leftSubnav"%>">
        <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=tournaments&c=tourny_index">TCO & TCCC
            Component Contests</A></td></tr>
    <% } %>
    <tr><td id="<%=level2.equals("support")?"leftNavOn":"leftNav"%>">
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/?t=development&c=getting_started" class="<%=level2.equals("support")?"leftOn":"left"%>"><img width="10" height="10" src="/images/nav_arrow_<%=level2.equals("support")?"bottom":"right"%>.gif" alt="" border="0"/>Support
            / FAQs</a></td></tr>
    <% if (level2.equals("support")) { %>
    <tr><td id="<%=level3.equals("gettingStarted")?"leftSubnavOn":"leftSubnav"%>">
        <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?t=development&c=getting_started">Getting
            Started</A></td></tr>
    <tr><td id="<%=level3.equals("compDocumentation")?"leftSubnavOn":"leftSubnav"%>">
        <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=dev&d2=support&d3=compDocumentation">Component
            Documentation</A></td></tr>
    <tr><td id="<%=level3.equals("ratings")?"leftSubnavOn":"leftSubnav"%>">
        <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=dev&d2=support&d3=ratings">Rating
            System</A></td></tr>
    <tr><td id="<%=level3.equals("reliability")?"leftSubnavOn":"leftSubnav"%>">
        <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=dev&d2=support&d3=reliability">Reliability
            Rating</A></td></tr>
    <tr><td id="<%=level3.equals("getPaid")?"leftSubnavOn":"leftSubnav"%>">
        <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=development&c=dev_payment">How to Get
            Paid</A></td></tr>
    <% } %>
</table>

<% } else { %>

<%-- Competition begins *************************** --%>
<table width="180" cellspacing="0" cellpadding="0" border="0">
    <tr><td id="leftNavTitle">Competition:</td></tr>
    <tr><td id="leftNavApplet">

        <script language="JavaScript">
            if (canDetectPlugins()) {
                if (detectJavaWebStart()) {
                    document.write('<a href="http://www.topcoder.com/contest/arena/ContestAppletProd.jnlp" class="left">');
                }
                else {
                    document.write('<a href="javascript:arena();" class="left">');
                }
            }
            else {
                document.write('<a href="javascript:arena();" class="left">');
            }
        </script>

        <noscript>
            <a href="javascript:arena();" class="left">
        </noscript>

        <img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
<%-- My Home --%>
<% if (!info.isAnonymous() || level1.equals("my_home")) { %>
<tr><td id="<%=level1.equals("my_home")?"leftNavOn":"leftNav"%>">
    <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=my_home&d2=index" class="<%=level1.equals("my_home")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("my_home")?"bottom":"right"%>.gif" border="0"/>$HOME</a>
</td></tr>
<% if (level1.equals("my_home")) { %>
<tr><td id="<%=level2.equals("profile")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/Registration">Update My Profile</A></td></tr>
<tr><td id="<%=level2.equals("referrals")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewReferrals">Referrals</A></td></tr>
<tr><td id="<%=level2.equals("card")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=card&d2=description">Cards /
        Badges</A></td></tr>
<tr><td id="<%=level2.equals("pacts")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/PactsMemberServlet?t=affidavit&c=affidavit_history">Affidavits</A>
</td></tr>
<% } %>
<% } %>
<%-- Calendar begins --%>
<tr><td id="<%=level1.equals("calendar")?"leftNavSelect":"leftNav"%>">
    <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=calendar&d2=thisMonth" class="<%=level1.equals("calendar")?"leftOn":"left"%>"><img alt="" src="/images/<%=level1.equals("calendar")?"clear":"nav_arrow_right"%>.gif" border="0"/>Calendar</a>
</td></tr>
<%-- Statistics begins --%>
<tr><td id="<%=level1.equals("statistics")?"leftNavOn":"leftNav"%>">
    <a href="http://<%=ApplicationServer.SERVER_NAME%>/stat?&c=round_overview" class="<%=level1.equals("statistics")?"leftOn":"left"%>"><img width="10" height="10" src="/images/nav_arrow_<%=level1.equals("statistics")?"bottom":"right"%>.gif" alt="" border="0"/>Statistics</a>
</td></tr>

<% if (level1.equals("statistics")) { %>
<%
    //this can probably go if we can standardize the MVC.  rtables is the current exception
    //this hoses up registration if it's executed for all of global_left.  haven't figured out
    //why though...????
    if (info == null) {
        Navigation nav = (Navigation) session.getAttribute("navigation");
        if (nav == null) info = new Navigation(request, response).getSessionInfo();
        else info = nav.getSessionInfo();
    }
%>
<tr><td id="<%=level2.equals("round_overview")?"leftSubnavOn":"leftSubnav"%>">
    <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/stat?&c=round_overview<%=request.getParameter("rd")==null?"":"&rd="+request.getParameter("rd")%>">Round
        Overview</a></td></tr>
<tr><td id="<%=level2.equals("last_match")?"leftSubnavOn":"leftSubnav"%>">
    <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/stat?&c=last_match">Last Match Results</a></td>
</tr>
<% if (!info.isAnonymous() && info instanceof CoderSessionInfo && ((CoderSessionInfo) info).getRating() > 0) { %>
<tr><td id="<%=level2.equals("my_last_match")?"leftSubnavOn":"leftSubnav"%>">
    <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=coder_room_stats&cr=<%=info.getUserId()%>">My
        Last Match</a></td></tr>
<tr><td id="<%=level2.equals("member_profile")?"leftSubnavOn":"leftSubnav"%>">
    <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=MemberProfile&cr=<%=info.getUserId()%>">Member
        Profile</a></td></tr>
<tr><td id="<%=level2.equals("ratings_history")?"leftSubnavOn":"leftSubnav"%>">
    <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=ratings_history&cr=<%=info.getUserId()%>">Ratings
        History</a></td></tr>
<tr><td id="<%=level2.equals("earnings_history")?"leftSubnavOn":"leftSubnav"%>">
    <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/stat?c=earnings_history&cr=<%=info.getUserId()%>">Earnings
        History</a></td></tr>
<% } %>
<tr><td id="<%=level2.equals("problem_archive")?"leftSubnavOn":"leftSubnav"%>">
    <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ProblemArchive">Problem Archive</a></td>
</tr>
<tr><td id="<%=level2.equals("coder_ratings")?"leftSubnavOn":"leftSubnav"%>">
    <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?&module=AlgoRank">Coder Rankings</a></td></tr>
<tr><td id="<%=level2.equals("match_editorials")?"leftSubnavOn":"leftSubnav"%>">
    <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=match_editorials&d2=archive">Match
        Editorials</a></td></tr>
<tr><td id="<%=level2.equals("quick_stats")?"leftSubnavOn":"leftSubnav"%>">
    <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?t=statistics&c=quick_stats">Quick Stats</a></td>
</tr>
<tr><td id="<%=level2.equals("coder_of_month")?"leftSubnavOn":"leftSubnav"%>">
    <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=SimpleStats&trans=true&c=com_history&d1=statistics&d2=coderOfMonth">Coder
        of the Month</a></td></tr>
<tr><td id="<%=level2.equals("search")?"leftSubnavOn":"leftSubnav"%>">
    <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewAdvanced">Advanced Member Search</a>
</td></tr>
<tr><td id="<%=level2.equals("member_surveys")?"leftSubnavOn":"leftSubnav"%>">
    <a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?&module=SurveyList">Member Surveys</a></td>
</tr>
<% } %>
<%-- Statistics ends --%>

<%-- Educational Content begins --%>
<tr><td id="<%=level1.equals("education")?"leftNavOn":"leftNav"%>">
    <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tutorials&d2=alg_index" class="<%=level1.equals("education")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("education")?"bottom":"right"%>.gif" border="0"/>Educational
        Content</a></td></tr>

<% if (level1.equals("education")) { %>
<tr><td id="<%=level2.equals("alg_tutorials")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tutorials&d2=alg_index">Algorithm
        Tutorials</A></td></tr>
<tr><td id="<%=level2.equals("comp_tutorials")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tutorials&d2=comp_index">Component
        Tutorials</A></td></tr>
<tr><td id="<%=level2.equals("features")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=features&d2=archive">Features</A>
</td></tr>
<tr><td id="<%=level2.equals("tutor_transcripts")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=tutor_transcripts&d2=index">Tutor
        Transcripts</A></td></tr>
<% } %>

<%-- Events begins --%>
<tr><td id="<%=level1.equals("events")?"leftNavOn":"leftNav"%>">
    <a href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=tournaments&c=tourny_index" class="<%=level1.equals("events")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("events")?"bottom":"right"%>.gif" border="0"/>Events</a>
</td></tr>

<% if (level1.equals("events")) { %>
<tr><td id="<%=level2.equals("tournaments")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?&amp;t=tournaments&amp;c=tourny_index">Tournaments</A>
</td></tr>
<tr><td id="<%=level2.equals("charity")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?&amp;module=CRPFStatic&amp;d1=crpf&amp;d2=crpf_photos">Charity</A>
</td></tr>
<tr><td id="<%=level2.equals("private_label")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/pl/">Private Label</A></td></tr>
<% } %>
<%-- Events ends --%>

<%-- Marathon Match begins --%>
<tr><td id="<%=level1.equals("long_contests")?"leftNavOn":"leftNav"%>">
    <a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Static&d1=instructions" class="<%=level1.equals("long_contests")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("long_contests")?"bottom":"right"%>.gif" border="0"/>Marathon Matches</a></td></tr>
<% if (level1.equals("long_contests")) { %>
   <tr><td id="<%=level2.equals("how_to_compete")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Static&d1=instructions">How to compete</A></td></tr>

<tr><td id="<%=level2.equals("topcoder")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest">Active Contests</A></td></tr>
<tr><td id="<%=level2.equals("topcoder_practice")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest?module=ViewPractice">Practice</A></td>
</tr>
<tr><td id="<%=level2.equals("topcoder_editorials")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Static&d1=match_editorials&d2=archive">Match Editorials</A></td>
</tr>
<%--
                <tr><td id="<%=level2.equals("intel")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest">Intel Multithreading Matches</A></td></tr>
                <tr><td id="<%=level2.equals("intel_practice")?"leftSubnavOn":"leftSubnav"%>"><A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest">Intel Practice Matches</A></td></tr>
--%>
<% } %>
<%-- Marathon Match ends --%>

<%-- Forums begins --%>
<tr><td id="<%=level1.equals("forums")?"leftNavOn":"leftNav"%>">
    <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Main" class="<%=level1.equals("forums")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("forums")?"bottom":"right"%>.gif" border="0"/>Forums</a>
</td></tr>
<% if (level1.equals("forums")) { %>
<tr>
    <td id="<%if (unreadCategories.indexOf("roundtables")==-1) {%><%=level2.equals("roundtables")?"leftSubnavOldOn":"leftSubnavOld"%><%} else {%><%=level2.equals("roundtables")?"leftSubnavOn":"leftSubnav"%><%}%>">
        <A class="leftOn" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=13">Round
            Tables</A></td></tr>
<tr>
    <td id="<%if (unreadCategories.indexOf("matches")==-1) {%><%=level2.equals("matches")?"leftSubnavOldOn":"leftSubnavOld"%><%} else {%><%=level2.equals("matches")?"leftSubnavOn":"leftSubnav"%><%}%>">
        <A class="leftOn" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=14">Algorithm
            Matches</A></td></tr>
<%--
--%>
<tr>
    <td id="<%if (unreadCategories.indexOf("longcontests")==-1) {%><%=level2.equals("longcontests")?"leftSubnavOldOn":"leftSubnavOld"%><%} else {%><%=level2.equals("longcontests")?"leftSubnavOn":"leftSubnav"%><%}%>">
        <A class="leftOn" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=17">Marathon Matches
            </A></td></tr>
<tr>
    <td id="<%if (unreadCategories.indexOf("news")==-1) {%><%=level2.equals("news")?"leftSubnavOldOn":"leftSubnavOld"%><%} else {%><%=level2.equals("news")?"leftSubnavOn":"leftSubnav"%><%}%>">
        <A class="leftOn" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=8">News
            Discussions</A></td></tr>
<tr>
    <td id="<%if (unreadCategories.indexOf("sponsors")==-1) {%><%=level2.equals("sponsors")?"leftSubnavOldOn":"leftSubnavOld"%><%} else {%><%=level2.equals("sponsors")?"leftSubnavOn":"leftSubnav"%><%}%>">
        <A class="leftOn" href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=6">Sponsor
            Discussions</A></td></tr>
<% } %>

<%-- Forums ends --%>


<%-- Support/FAQs begins --%>
<tr><td id="<%=level1.equals("support")?"leftNavOn":"leftNav"%>">
    <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=help&d2=index" class="<%=level1.equals("support")?"leftOn":"left"%>"><img alt="" width="10" height="10" src="/images/nav_arrow_<%=level1.equals("support")?"bottom":"right"%>.gif" border="0"/>Support
        / FAQs</a></td></tr>
<% if (level1.equals("support")) { %>
<tr><td id="<%=level2.equals("guide")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=help&d2=index">Algorithm
        Competition Guide</A></td></tr>
<tr><td id="<%=level2.equals("general")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=support&c=index">General FAQ</A></td></tr>
<tr><td id="<%=level2.equals("competition")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=support&c=comp_faq">Competition FAQ</A></td>
</tr>
<tr><td id="<%=level2.equals("forms")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=support&c=form_faq">Forms W-9 & W-8BEN FAQ</A>
</td></tr>
<tr><td id="<%=level2.equals("ratings")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=support&c=ratings">Ratings Overview</A></td>
</tr>
<tr><td id="<%=level2.equals("charity")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=support&c=charities">Charity Donations</A>
</td></tr>
<tr><td id="<%=level2.equals("samples")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/?&t=support&c=sample_problems">Sample Problem
        Statements</A></td></tr>
<tr><td id="<%=level2.equals("algPayment")?"leftSubnavOn":"leftSubnav"%>">
    <A class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=help&d2=algPayment">How to Get
        Paid</A></td></tr>
<% } %>
<%-- Support/FAQs ends --%>

</table>
<%-- Competition ends *************************** --%>

<% } %>

<%-- PACTS begins *************************** --%>
<%--
<% if (request.getServletPath().indexOf("pacts")>-1) { %>
            <table width="180" cellspacing="0" cellpadding="0" border="0">
                <tr><td id="leftNavTitle">P.A.C.T.s:</td>
                <tr><td id="leftSubnav"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/PactsMemberServlet?t=payments&amp;c=payment_history">Payments</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/PactsMemberServlet?t=affidavit&amp;c=affidavit_history">Affidavits</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/PactsMemberServlet?t=contracts&amp;c=contract_history">Contracts</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="http://<%=ApplicationServer.SERVER_NAME%>/PactsMemberServlet?t=tax_forms&amp;c=tax_forms_history">Tax Forms</a></td></tr>
            </table>
<% } %>
--%>
<%-- PACTS ends *************************** --%>

<table width="180" cellspacing="0" cellpadding="0" border="0">
    <tr><td bgcolor="#990000">
        <jsp:include page="../includes/modules/simpleSearch.jsp"/>
    </td></tr>
</table>

<img alt="" width="180" height="23" src="/i/left_nav_btm.gif" border="0"/><br/>
<img alt="" width="5" height="5" src="/i/clear.gif" border="0"/><br/>

<% if (level1.equals("home")) { %>

<jsp:include page="/home/coder_of_month.jsp"/>
<img alt="" width="1" height="9" src="/i/clear.gif" border="0"/><br/>
<jsp:include page="../calendar.jsp"/>
<% } %>

<div align="center">
    <img src="/i/logo_ghosted_bracket.gif" width="160" height="77" alt="[ TopCoder ]" vspace="10" border="0"/></div>
<br/><br/>