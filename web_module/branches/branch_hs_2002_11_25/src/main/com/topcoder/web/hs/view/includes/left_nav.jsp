<!--Left Navigation Include Begins-->

<%!  // note that this is a jsp *declaration*, not a scriptlet

/**** THIS CODE DOES NOT CURRENTLY HANDLE RENDERING THREE LEVELS OF MENUS ****/

// highlight the selected menu item by using this property for its table cell
String selbg = "BACKGROUND=\"/i/graybv_lite_bg.gif\"";
// highlight other items in the open submenu by using this property for its table cell
String sibbg = "BACKGROUND=\"/i/steel_gray_bg.gif\"";  // sib for sibling
// default property for unhighlighted items
String defbg = "";

// indent root items which are not or cannot open into submenus with this
String itemind = "<IMG SRC=\"/i/hs/nav_arrow_right.gif\" WIDTH=\"9\" HEIGHT=\"9\" ALT=\"\" BORDER=\"0\">";
// indent titles of open submenus with this
String openind = "<IMG SRC=\"/i/hs/nav_arrow_bottom.gif\" WIDTH=\"9\" HEIGHT=\"9\" ALT=\"\" BORDER=\"0\">";
// indent submenu items with this
String subind = "<IMG SRC=\"/i/hs/11x9.gif\" WIDTH=\"11\" HEIGHT=\"9\" ALT=\"\" BORDER=\"0\">";

// spacer between items on the root menu
String trsep_root = "<TR><TD HEIGHT=\"1\" BGCOLOR=\"#C5C5C9\" VALIGN=\"top\"><IMG SRC=\"/i/hs/frame_1pix_bg_lg_top_left.gif\" WIDTH=\"1\" HEIGHT=\"1\" ALT=\"\" BORDER=\"0\"></TD></TR>";
// spacer between items on open submenus
String trsep_sub = "";//@@@"<TR><TD HEIGHT=\"1\" VALIGN=\"top\"><IMG SRC=\"/i/hs/frame_1pix_bg_lg_top_left.gif\" WIDTH=\"1\" HEIGHT=\"1\" ALT=\"\" BORDER=\"0\"></TD></TR>";

// set below in the service method, as they vary depending on the request
String root, sub;

// formats a table row for a section header on the root menu
String rootheader(String text) {
    return "<TR><TD CLASS=\"titlesidenav\">&nbsp;<B>" + text + "</B></TD></TR>";
}

// formats a table row for an item on the root menu
String rootitem(String link, String name, String key, boolean canopen) {
    String bg = root.equals(key) ? (canopen?sibbg:selbg) : defbg;
    String img = canopen && root.equals(key) ? openind : itemind;
    return "<TR><TD CLASS=\"sidenav\" " + bg + ">&nbsp;<A CLASS=\"sidenav\" HREF=\"" + link + "\">" + img + name + "</A></TD></TR>";
}

// formats a table row for an item on a submenu
String subitem(String link, String name, String key) {
    String bg = sub.equals(key) ? selbg : sibbg;
    String img = subind;
    return "<TR><TD CLASS=\"sidenav\" " + bg + ">&nbsp;<A CLASS=\"sidenav\" HREF=\"" + link + "\">" + img + name + "</A></TD></TR>";
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

<TABLE WIDTH="170" CELLSPACING="0" CELLPADDING="0" BORDER="0" BGCOLOR="#000000">

    <%=trsep_root%>
    <%=rootheader("What's inside")%>
    <%=trsep_root%>
    <%=rootitem("?module=Static&d1=home&d2=how_hs_compete", "How Schools Compete", "how_hs_compete", false)%>
    <%=trsep_root%>
    <%=rootitem("?module=Static&d1=schedule&d2=schedule", "Schedule", "schedule", false)%>
    <%=trsep_root%>

    <%=rootitem("?module=Statistics&c=round_overview", "Statistics", "stats", true)%>
    <% if(subopen("stats")) { %>
        <%=trsep_root%>
        <%=subitem("?module=Statistics&c=coder_ratings", "Coder Rankings", "coder_ratings")%>
        <%=subitem("?module=Statistics&c=school_round_rank", "High School Rankings", "school_round_rank")%>
        <%=subitem("?module=Statistics&c=ratings_history&cr="+SessionInfo.getUserId(), "Rating History", "ratings_history")%>
        <%=subitem("?module=Static&d1=stats&d2=m_edi", "Match Editorials", "m_edi")%>
        <%=subitem("?module=Statistics&c=school_round_stats&hs="+SessionInfo.getSchoolId(), "High School Round Stats", "school_round_stats")%>
        <%=subitem("?module=Statistics&c=round_overview", "Round Overview", "round_overview")%>
        <%=subitem("?module=Statistics&c=round_stats", "Round Stats", "round_stats")%>
        <%=subitem("?module=Statistics&c=room_stats", "Room Stats", "room_stats")%>
        <%=subitem("?module=Statistics&c=member_profile&cr="+SessionInfo.getUserId(), "Member Profile", "member_profile")%>
    <% } %>

    <%=trsep_root%>
    <%=rootitem("?module=Static&d1=tournaments&d2=tournaments", "Tournaments", "tournaments", false)%>
    <%=trsep_root%>

    <%=rootitem("?module=Static&d1=faq&d2=faq", "Support/FAQs", "faq", true)%>
    <% if(subopen("faq")) { %>
        <%=trsep_root%>
        <%=subitem("?module=Static&d1=faq&d2=faq", "General FAQ ", "faq")%>
        <%=subitem("?module=Static&d1=faq&d2=compet_faq", "Competition FAQ ", "compet_faq")%>
        <%=subitem("?module=Static&d1=faq&d2=compet_proc", "Competition Process", "compet_proc")%>
        <%=subitem("?module=Static&d1=faq&d2=ratings_ovrev", "Ratings Overview", "ratings_ovrev")%>
        <%=subitem("?module=Static&d1=faq&d2=editor_info", "Editor Information", "editor_info")%>
        <%=subitem("?module=Static&d1=faq&d2=soft_req", "Software Requirements", "soft_req")%>
        <%=subitem("?module=Static&d1=faq&d2=rules_quali", "Rules & Qualification ", "rules_quali")%>
    <% } %>

    <%=trsep_root%>
    <%=rootitem("?module=Static&d1=resources&d2=resources", "Resources", "resources", false)%>
    <%=trsep_root%>
    <%=rootheader("[TCHS] Corporate")%>
    <%=trsep_root%>

    <%=rootitem("?module=Static&d1=about&d2=about", "About Us", "about", true)%>
    <% if(subopen("about")) { %>
        <%=trsep_root%>
        <%=subitem("?module=Static&d1=about&d2=about_member", "For Members", "about_member")%>
        <%=subitem("?module=Static&d1=about&d2=about_sponsor", "For Sponsors", "about_sponsor")%>
    <% } %>

    <%=trsep_root%>
    <%=rootitem("?module=Static&d1=press&d2=press_main", "Press Room", "press", false)%>
    <%=trsep_root%>
    <%=rootitem("?module=Static&d1=contacts&d2=contacts", "Contacts", "contacts", false)%>
    <%=trsep_root%>

</TABLE>
<!--Left Navigation Include Ends-->
