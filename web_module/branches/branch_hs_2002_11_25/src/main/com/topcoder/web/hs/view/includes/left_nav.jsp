<!--Left Navigation Include Begins-->

<jsp:useBean id="SessionInfo" class="com.topcoder.web.hs.model.SessionInfoBean" scope="request" />
<jsp:useBean id="NavZone" class="com.topcoder.web.hs.model.NavZoneBean" scope="request" />


<TABLE WIDTH="170" CELLSPACING="0" CELLPADDING="0" BORDER="0" BGCOLOR="#000000">
    <TR>
        <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD CLASS="titlesidenav">&nbsp;<B>What's inside</B></TD>
    </TR>
    <TR>
        <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD CLASS="sidenav">&nbsp;<A HREF="?module=Static&d1=home&d2=how_hs_compete" CLASS="sidenav<%=NavZone.getFolder(1).equals("how_hs_compete")?"open":""%>"><IMG SRC="/i/hs/nav_arrow_right.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>How Schools Compete</A></TD>
    </TR>
    <TR>
        <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD CLASS="sidenav">&nbsp;<A HREF="?module=Static&d1=schedule&d2=schedule" CLASS="sidenav<%=NavZone.getFolder(0).equals("schedule")?"open":""%>"><IMG SRC="/i/hs/nav_arrow_right.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>Schedule</A></TD>
    </TR>
    <TR>
    <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
    <TR>


<% if(!NavZone.getFolder(0).equals("stats")) { %>

         <TD CLASS="sidenav">&nbsp;<A HREF="?module=Statistics&c=round_overview" CLASS="sidenav"><IMG SRC="/i/hs/nav_arrow_right.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>Statistics</A></TD>

<% } else { %>

         <TD CLASS="sidenav">&nbsp;<A HREF="?module=Statistics&c=round_overview" CLASS="sidenav"><IMG SRC="/i/hs/nav_arrow_bottom.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>Statistics</A></TD>
     </TR>
     <TR>
         <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
     </TR>
     <TR>
         <TD CLASS="sidenav">
                <IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="?module=Statistics&c=coder_ratings" CLASS="sidenav<%=NavZone.getFolder(1).equals("coder_ratings")?"open":""%>">Coder Rankings</A> <BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="?module=Statistics&c=school_round_rank" CLASS="sidenav<%=NavZone.getFolder(1).equals("school_round_rank")?"open":""%>">High School Rankings</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="?module=Statistics&c=ratings_history&cr=<jsp:getProperty name="SessionInfo" property="UserId" />" CLASS="sidenav<%=NavZone.getFolder(1).equals("ratings_history")?"open":""%>">Rating History</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="?module=Static&d1=stats&d2=m_edi" CLASS="sidenav<%=NavZone.getFolder(1).equals("m_edi")?"open":""%>">Match Editorials</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="?module=Statistics&c=school_round_stats&hs=<jsp:getProperty name="SessionInfo" property="SchoolId" />" CLASS="sidenav<%=NavZone.getFolder(1).equals("school_round_stats")?"open":""%>">High School Round Stats</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="?module=Statistics&c=round_overview" CLASS="sidenav<%=NavZone.getFolder(1).equals("round_overview")?"open":""%>">Round Overview</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="?module=Statistics&c=round_stats" CLASS="sidenav<%=NavZone.getFolder(1).equals("round_stats")?"open":""%>">Round Stats</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="?module=Statistics&c=room_stats" CLASS="sidenav<%=NavZone.getFolder(1).equals("room_stats")?"open":""%>">Room Stats</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="?module=Statistics&c=member_profile&cr=<jsp:getProperty name="SessionInfo" property="UserId" />" CLASS="sidenav<%=NavZone.getFolder(1).equals("member_profile")?"open":""%>">Member Profile</A><BR/>

<% } %>


    </TR>
    <TR>
        <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD CLASS="sidenav">&nbsp;<A HREF="?module=Static&d1=tournaments&d2=tournaments" CLASS="sidenav<%=NavZone.getFolder(0).equals("tournaments")?"open":""%>"><IMG SRC="/i/hs/nav_arrow_right.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>Tournaments</A></TD>
    </TR>
    <TR>
        <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
    <TR>


<% if(!NavZone.getFolder(0).equals("faq")) { %>

         <TD CLASS="sidenav">&nbsp;<A HREF="?module=Static&d1=faq&d2=faq" CLASS="sidenav"><IMG SRC="/i/hs/nav_arrow_right.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>Support/FAQs</A></TD>

<% } else { %>

         <TD CLASS="sidenav">&nbsp;<A HREF="?module=Static&d1=faq&d2=faq" CLASS="sidenav"><IMG SRC="/i/hs/nav_arrow_bottom.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>Support/FAQs</A></TD>
     </TR>
     <TR>
         <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
     </TR>
     <TR>
         <TD CLASS="sidenav">
         <IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="?module=Static&d1=faq&d2=faq" CLASS="sidenav<%=NavZone.getFolder(1).equals("faq")?"open":""%>">General FAQ </A> <BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="?module=Static&d1=faq&d2=compet_faq" CLASS="sidenav<%=NavZone.getFolder(1).equals("compet_faq")?"open":""%>">Competition FAQ </A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="?module=Static&d1=faq&d2=compet_proc" CLASS="sidenav<%=NavZone.getFolder(1).equals("compet_proc")?"open":""%>">Competition Process</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="?module=Static&d1=faq&d2=ratings_ovrev" CLASS="sidenav<%=NavZone.getFolder(1).equals("ratings_ovrev")?"open":""%>">Ratings Overview</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="?module=Static&d1=faq&d2=editor_info" CLASS="sidenav<%=NavZone.getFolder(1).equals("editor_info")?"open":""%>">Editor Information</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="?module=Static&d1=faq&d2=soft_req" CLASS="sidenav<%=NavZone.getFolder(1).equals("soft_req")?"open":""%>">Software Requirements</A> <BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="?module=Static&d1=faq&d2=rules_quali" CLASS="sidenav<%=NavZone.getFolder(1).equals("rules_quali")?"open":""%>">Rules & Qualification </A>
         </TD>

<% } %>


    </TR>
    <TR>
        <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD CLASS="sidenav">&nbsp;<A HREF="?module=Static&d1=resources&d2=resources" CLASS="sidenav<%=NavZone.getFolder(0).equals("resources")?"open":""%>"><IMG SRC="/i/hs/nav_arrow_right.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>Resources</A></TD>
    </TR>
    <TR>
        <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD CLASS="titlesidenav">&nbsp;<B>[TCHS] Corporate</B></TD>
    </TR>
    <TR>
        <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
    <TR>


<% if(!NavZone.getFolder(0).equals("about")) { %>

         <TD CLASS="sidenav">&nbsp;<A HREF="?module=Static&d1=about&d2=about" CLASS="sidenav"><IMG SRC="/i/hs/nav_arrow_right.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>About Us</A></TD>

<% } else { %>

         <TD CLASS="sidenav">&nbsp;<A HREF="?module=Static&d1=about&d2=about" CLASS="sidenav"><IMG SRC="/i/hs/nav_arrow_bottom.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>About Us</A></TD>
     </TR>
         <TR>
         <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
     </TR>
     <TR>
         <TD CLASS="sidenav">
         <IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="?module=Static&d1=about&d2=about_member" CLASS="sidenav<%=NavZone.getFolder(1).equals("about_member")?"open":""%>">For Members</A> <BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="?module=Static&d1=about&d2=about_sponsor" CLASS="sidenav<%=NavZone.getFolder(1).equals("about_sponsor")?"open":""%>">For Sponsors</A>

<% } %>

    </TR>
    <TR>
        <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD CLASS="sidenav">&nbsp;<A HREF="?module=Static&d1=press&d2=press_main" CLASS="sidenav<%=NavZone.getFolder(0).equals("press")?"open":""%>"><IMG SRC="/i/hs/nav_arrow_right.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>Press Room</A></TD>
    </TR>
    <TR>
        <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD CLASS="sidenav">&nbsp;<A HREF="?module=Static&d1=contacts&d2=contacts" CLASS="sidenav<%=NavZone.getFolder(0).equals("contacts")?"open":""%>"><IMG SRC="/i/hs/nav_arrow_right.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>Contacts</A></TD>
    </TR>
    <TR>
        <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
</TABLE>
<!--Left Navigation Include Ends-->
