<!--Left Navigation Include Begins-->

<%!  // note that this is a jsp *declaration*, not a scriptlet

/**** THIS CODE DOES NOT CURRENTLY HANDLE RENDERING THREE LEVELS OF MENUS ****/

// highlight the selected menu item by using this property for its table cell
String selbg = "background=\"/i/s_calendar_bg.gif\"";
// highlight other items in the open submenu by using this property for its table cell
String sibbg = "bgcolor=\"#4D5B99\"";  // sib for sibling
// default property for unhighlighted items
String defbg = "";

// indent root items which are not or cannot open into submenus with this
String itemind = "<img src=\"/i/nav_arrow_right.gif\" width=\"10\" height=\"10\" alt=\"\" border=\"0\">";
// indent titles of open submenus with this
String openind = "<img src=\"/i/nav_arrow_bottom.gif\" width=\"10\" height=\"10\" alt=\"\" border=\"0\">";
// indent submenu items with this
String subind = "<img src=\"/i/11x9.gif\" width=\"10\" height=\"10\" alt=\"\" border=\"0\">";

// spacer between items on the root menu
String rootsep = "<tr><td height=\"1\"><img src=\"/i/frame_left_nav.gif\" width=\"166\" height=\"1\" alt=\"----------\" border=\"0\"></td></tr>";
// spacer between items on open submenus
String subsep = "";
//String subsep = "<tr><td height=\"1\"><img src=\"/i/frame_1pix_bg_lg_top_left.gif\" width=\"1\" height=\"1\" alt=\"\" border=\"0\"></td></tr>";

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

    <%=rootheader("What's Inside")%>
    
    <%=rootitem("?module=Static&d1=home&d2=how_hs_compete", "How Schools Compete", "how_hs_compete", false)%>
    
    <%=rootitem("?module=Static&d1=schedule&d2=schedule", "Schedule", "schedule", false)%>
<%--
    <%=rootitem("?module=Statistics&c=round_overview", "Statistics", "stats", true)%>
    <% if(subopen("stats")) { %>
        <%=subitem("?module=Statistics&c=coder_ratings", "Coder Rankings", "coder_ratings")%>
        <%=subitem("?module=Statistics&c=school_round_rank", "High School Rankings", "school_round_rank")%>
        <%=subitem("?module=Statistics&c=ratings_history&cr="+SessionInfo.getUserId(), "Rating History", "ratings_history")%>
        <%=subitem("?module=Static&d1=articles&d2=m_edi", "Match Editorials", "m_edi")%>
        <%=subitem("?module=Statistics&c=school_round_stats&hs="+SessionInfo.getSchoolId(), "High School Round Stats", "school_round_stats")%>
        <%=subitem("?module=Statistics&c=round_overview", "Round Overview", "round_overview")%>
        <%=subitem("?module=Statistics&c=round_stats", "Round Stats", "round_stats")%>
        <%=subitem("?module=Statistics&c=coder_room_stats&cr="+SessionInfo.getUserId(), "Room Stats", "room_stats")%>
        <%=subitem("?module=Statistics&c=member_profile&cr="+SessionInfo.getUserId(), "Member Profile", "member_profile")%>
        <%=subitem("?module=Search", "Member Search", "advanced_search")%>
    <% } %>
--%>
    <%=rootitem("?module=Static&d1=tournaments&d2=tournaments", "Tournaments", "tournaments", false)%>

    <%=rootitem("?module=Static&d1=faq&d2=faq", "Support/FAQs", "faq", true)%>
    <% if(subopen("faq")) { %>
        <%=subitem("?module=Static&d1=faq&d2=faq", "General FAQ ", "faq")%>
        <%=subitem("?module=Static&d1=faq&d2=compet_faq", "Competition FAQ ", "compet_faq")%>
        <%=subitem("?module=Static&d1=faq&d2=compet_proc", "Competition Process", "compet_proc")%>
        <%=subitem("?module=Static&d1=faq&d2=ratings_ovrev", "Ratings Overview", "ratings_ovrev")%>
        <%=subitem("?module=Static&d1=faq&d2=editor_info", "Editor Information", "editor_info")%>
        <%=subitem("?module=Static&d1=faq&d2=soft_req", "Software Requirements", "soft_req")%>
        <%=subitem("?module=Static&d1=faq&d2=rules_quali", "Rules & Qualification ", "rules_quali")%>
    <% } %>

    <%=rootitem("?module=Static&d1=resources&d2=resources", "Resources", "resources", false)%>
    
    <%=rootheader("Corporate Info")%>

    <%=bothitem("?module=Static&d1=about&d2=about", "About TCHS", "about", "about")%>
    <% if(subopen("about")) { %>
        <%=subitem("?module=Static&d1=about&d2=about_member", "For Members", "about_member")%>
        <%=subitem("?module=Static&d1=about&d2=about_sponsor", "For Sponsors", "about_sponsor")%>
    <% } %>

    <%=rootitem("?module=Static&d1=press&d2=press_main", "Press Room", "press", false)%>
    
    <%=rootitem("?module=Static&d1=contacts&d2=contacts", "Contacts", "contacts", false)%>

</table>
<!--Left Navigation Include Ends-->
