<%@ page import="com.topcoder.shared.util.ApplicationServer"%><!--Left Navigation Include Begins-->

<%!  // note that this is a jsp *declaration*, not a scriptlet

/**** THIS CODE DOES NOT CURRENTLY HANDLE RENDERING THREE LEVELS OF MENUS ****/

// highlight the selected menu item by using this property for its table cell
String selbg = "background=\"/i/hs/s_calendar_bg.gif\"";
// highlight other items in the open submenu by using this property for its table cell
String sibbg = "bgcolor=\"#4D5B99\"";  // sib for sibling
// default property for unhighlighted items
String defbg = "";

// indent root items which are not or cannot open into submenus with this
String itemind = "<img src=\"/i/hs/nav_arrow_right.gif\" width=\"10\" height=\"10\" alt=\"\" border=\"0\">";
// indent titles of open submenus with this
String openind = "<img src=\"/i/hs/nav_arrow_bottom.gif\" width=\"10\" height=\"10\" alt=\"\" border=\"0\">";
// indent submenu items with this
String subind = "<img src=\"/i/hs/11x9.gif\" width=\"10\" height=\"10\" alt=\"\" border=\"0\">";

// set below in the service method, as they vary depending on the request
String root, sub;

// formats a table row for a section header on the root menu
String rootheader(String text) {
    return "<tr><th class=\"titlesidenav\">&nbsp;" + text + "</th></tr>";
}

// formats a table row for an item on the root menu
String rootitem(String link, String name, String key, boolean canopen) {
    String bg = root.equals(key) ? (canopen?sibbg:selbg) : defbg;
    String img = canopen && root.equals(key) ? openind : itemind;
    return "<tr><td class=\"sidenav\" " + bg + ">&nbsp;<a class=\"leftnav\" href=\"" + link + "\">" + img + name + "</a></td></tr>";
}

// formats a table row for an item on the root menu... special case where the item can open, but can also become selected
String bothitem(String link, String name, String key, String subkey) {
    String bg = root.equals(key) ? (!sub.equals(subkey)?sibbg:selbg) : defbg;
    String img = root.equals(key) ? openind : itemind;
    return "<tr><td class=\"sidenav\" " + bg + ">&nbsp;<a class=\"leftnav\" href=\"" + link + "\">" + img + name + "</a></td></tr>";
}

// formats a table row for an item on a submenu
String subitem(String link, String name, String key) {
    String bg = sub.equals(key) ? selbg : sibbg;
    String img = subind;
    return "<tr><td class=\"sidenav\" " + bg + ">&nbsp;<a class=\"leftnav\" href=\"" + link + "\">" + img + name + "</a></td></tr>";
}

// decides whether a submenu should be rendered
boolean subopen(String key) {
    return root.equals(key);
}

%>

<jsp:useBean id="SessionInfo" class="com.topcoder.web.hs.model.SessionInfoBean" scope="request" />
<jsp:useBean id="NavZone" class="com.topcoder.web.hs.model.NavZoneBean" scope="request" />

<%  // now a scriptlet
root = NavZone.getLevel0();
sub = NavZone.getLevel1();
%>

<table width="170" cellspacing="0" cellpadding="0" border="0" bgcolor="#26386B">

    <%=rootheader("High School")%>
    
<!-- Competition Arena -->
    <%=rootitem("?module=Static&d1=arena&d2=arena_main", "Competition Arena", "arena_main", false)%>

<!-- How to Compete -->
    <%=rootitem("?module=Static&d1=home&d2=how_hs_compete", "How To Compete", "how_hs_compete", false)%>
    
<!-- Schedule -->
    <%=rootitem("?module=Static&d1=schedule&d2=schedule", "Schedule", "schedule", false)%>

<!-- Member Search -->
    <%=rootitem("?module=Search&c=advanced_search", "Member Search", "advanced_search", false)%>

<!-- Statistics -->
    <%=rootitem("?module=Statistics&c=round_overview", "Statistics", "stats", true)%>
    <% if(subopen("stats")) { %>
        <%=subitem("?module=Statistics&c=coder_ratings", "Coder Rankings", "coder_ratings")%>
        <%=subitem("?module=Statistics&c=school_round_rank", "High School Rankings", "school_round_rank")%>
        <%=subitem("?module=Statistics&c=school_round_stats&hs="+SessionInfo.getSchoolId(), "High School Round Stats", "school_round_stats")%>
<%--        <%=subitem("?module=Static&d1=articles&d2=m_edi", "Match Editorials", "m_edi")%> --%>
        <%=subitem("?module=Statistics&c=member_profile&cr="+SessionInfo.getUserId(), "Profile", "member_profile")%>
        <%=subitem("?module=Statistics&c=ratings_history&cr="+SessionInfo.getUserId(), "Rating History", "ratings_history")%>
        <%=subitem("?module=Statistics&c=coder_room_stats&cr="+SessionInfo.getUserId(), "Room Stats", "room_stats")%>
        <%=subitem("?module=Statistics&c=round_overview", "Round Overview", "round_overview")%>
        <%=subitem("?module=Statistics&c=round_stats", "Round Stats", "round_stats")%>
    <% } %>

<!-- Support -->
    <%=rootitem("?module=Static&d1=faq&d2=faq", "Support", "faq", true)%>
    <% if(subopen("faq")) { %>
        <%=subitem("?module=Static&d1=faq&d2=faq", "General FAQ ", "faq")%>
        <%=subitem("?module=Static&d1=faq&d2=compet_faq", "Competition FAQ ", "compet_faq")%>
        <%=subitem("?module=Static&d1=faq&d2=editor_info", "Editor Information", "editor_info")%>
        <%=subitem("?module=Static&d1=faq&d2=compet_proc", "How Competitions Work", "compet_proc")%>
        <%=subitem("?module=Static&d1=faq&d2=ratings_ovrev", "How Ratings Work", "ratings_ovrev")%>
        <%=subitem("?module=Static&d1=faq&d2=resources", "Resources", "resources")%>
        <%=subitem("?module=Static&d1=faq&d2=rules_quali", "Rules", "rules_quali")%>
        <%=subitem("?module=Static&d1=faq&d2=soft_req", "Software Requirements", "soft_req")%>
    <% } %>
    
<!-- Tournaments -->
    <%=rootitem("?module=Static&d1=tournaments&d2=tournaments", "Tournaments", "tournaments", false)%>

<!-- TopCoder Info begins -->
    <%=rootheader("TopCoder Info")%>

<!-- About TCHS -->
    <%=bothitem("?module=Static&d1=about&d2=about", "About TCHS", "about", "about")%>
    <% if(subopen("about")) { %>
        <%=subitem("?module=Static&d1=about&d2=about_member", "Members", "about_member")%>
        <%=subitem("?module=Static&d1=about&d2=about_sponsor", "Sponsors", "about_sponsor")%>
        <%=subitem("?module=Static&d1=about&d2=privacy", "Privacy Policy", "privacy")%>
        <%=subitem("?module=Static&d1=about&d2=terms", "Terms", "terms")%>
    <% } %>

<!-- Contact Us -->
    <%=rootitem("http://"+ApplicationServer.SERVER_NAME+"/?&t=contacts&c=index", "Contact Us", "contacts", false)%>

<!-- News / Features -->
    <%=rootitem("http://www.topcoder.com/?t=news_events&c=index", "News / Features", "press", false)%>
    
<!-- TopCoder Info ends -->

</table>
<!--Left Navigation Include Ends-->
