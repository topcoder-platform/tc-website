<!--Left Navigation Include Begins -->

<jsp:useBean id="SessionInfo" class="com.topcoder.web.hs.model.SessionInfoBean" scope="request" />
<jsp:useBean id="NavZone" class="com.topcoder.web.hs.model.NavZoneBean" scope="request" />

<jsp:setProperty name="NavZone" property="Zone" param="d1" />
<% if("Statistics".equals(request.getParameter("module"))) NavZone.setZone("stats"); %>
  <%-- @@@ so random! --%>

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
        <TD CLASS="sidenav">&nbsp;<A HREF="/?module=Static&d1=home&d2=how_hs_compete" CLASS="sidenav"><IMG SRC="/i/hs/nav_arrow_right.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>How Schools Compete</A></TD>
    </TR>
    <TR>
        <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD CLASS="sidenav">&nbsp;<A HREF="/?module=Static&d1=schedule&d2=schedule" CLASS="sidenav"><IMG SRC="/i/hs/nav_arrow_right.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>Schedule</A></TD>
    </TR>
    <TR>
    <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
    <TR>

<% if( ! NavZone.inStats()) { %>

         <TD CLASS="sidenav">&nbsp;<A HREF="/?module=Statistics&c=round_overview" CLASS="sidenav"><IMG SRC="/i/hs/nav_arrow_right.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>Statistics</A></TD>

<% } else { %>

         <TD CLASS="sidenav">&nbsp;<A HREF="/?module=Statistics&c=round_overview" CLASS="sidenav"><IMG SRC="/i/hs/nav_arrow_bottom.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>Statistics</A></TD>
     </TR>
     <TR>
         <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
     </TR>
     <TR>
         <TD CLASS="sidenav">
         <IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Statistics&c=coder_ratings" CLASS="sidenav">Coder Rankings</A> <BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Statistics&c=school_round_rank" CLASS="sidenav">High School Rankings</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Statistics&c=ratings_history&cr=<jsp:getProperty name="SessionInfo" property="UserId" />" CLASS="sidenav">Rating History</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Static&d1=stats&d2=m_edi" CLASS="sidenav">Match Editorials</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Statistics&c=school_round_stats" CLASS="sidenav">High School Round Stats</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Statistics&c=round_overview" CLASS="sidenav">Round Overview</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Statistics&c=round_stats" CLASS="sidenav">Round Stats</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Statistics&c=room_stats" CLASS="sidenav">Room Stats</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Statistics&c=coder_room_stats" CLASS="sidenav">Problem Stats</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Statistics&c=problem_statement" CLASS="sidenav">Problem Statement</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Statistics&c=problem_solution" CLASS="sidenav">Problem Solution</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Statistics&c=member_profile&cr=<jsp:getProperty name="SessionInfo" property="UserId" />" CLASS="sidenav">Member Profile</A><BR/>

<% } %>

    </TR>
    <TR>
        <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD CLASS="sidenav">&nbsp;<A HREF="/?module=Static&d1=tournaments&d2=tournaments" CLASS="sidenav"><IMG SRC="/i/hs/nav_arrow_right.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>Tournaments</A></TD>
    </TR>
    <TR>
        <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
    <TR>

<% if( ! NavZone.inFaq()) { %>

         <TD CLASS="sidenav">&nbsp;<A HREF="/?module=Static&d1=faq&d2=faq" CLASS="sidenav"><IMG SRC="/i/hs/nav_arrow_right.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>Support/FAQs</A></TD>

<% } else { %>

         <TD CLASS="sidenav">&nbsp;<A HREF="/?module=Static&d1=faq&d2=faq" CLASS="sidenav"><IMG SRC="/i/hs/nav_arrow_bottom.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>Support/FAQs</A></TD>
     </TR>
     <TR>
         <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
     </TR>
     <TR>
         <TD CLASS="sidenav">
         <IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Static&d1=faq&d2=faq" CLASS="sidenav">General FAQ </A> <BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Static&d1=faq&d2=compet_faq" CLASS="sidenav">Competition FAQ </A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Static&d1=faq&d2=compet_proc" CLASS="sidenav">Competition Process</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Static&d1=faq&d2=ratings_ovrev" CLASS="sidenav">Ratings Overview</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Static&d1=faq&d2=editor_info" CLASS="sidenav">Editor Information</A><BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Static&d1=faq&d2=soft_req" CLASS="sidenav">Software Requirements</A> <BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Static&d1=faq&d2=rules_quali" CLASS="sidenav">Rules & Qualification </A>
         </TD>

<% } %>


    </TR>
    <TR>
        <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD CLASS="sidenav">&nbsp;<A HREF="/?module=Static&d1=resources&d2=resources" CLASS="sidenav"><IMG SRC="/i/hs/nav_arrow_right.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>Resources</A></TD>
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


<% if( ! NavZone.inAbout()) { %>

         <TD CLASS="sidenav">&nbsp;<A HREF="/?module=Static&d1=about&d2=about" CLASS="sidenav"><IMG SRC="/i/hs/nav_arrow_right.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>About Us</A></TD>

<% } else { %>

         <TD CLASS="sidenav">&nbsp;<A HREF="/?module=Static&d1=about&d2=about" CLASS="sidenav"><IMG SRC="/i/hs/nav_arrow_bottom.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>About Us</A></TD>
     </TR>
         <TR>
         <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
     </TR>
     <TR>
         <TD CLASS="sidenav">
         <IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Static&d1=about&d2=about_member" CLASS="sidenav">For Members</A> <BR/>
 		<IMG SRC="/i/hs/11x9.gif" WIDTH="11" HEIGHT="9" ALT="" BORDER="0"/><A HREF="/?module=Static&d1=about&d2=about_sponsor" CLASS="sidenav">For Sponsors</A>

<% } %>

    </TR>
    <TR>
        <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD CLASS="sidenav">&nbsp;<A HREF="/?module=Static&d1=press&d2=press_main" CLASS="sidenav"><IMG SRC="/i/hs/nav_arrow_right.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>Press Room</A></TD>
    </TR>
    <TR>
        <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD CLASS="sidenav">&nbsp;<A HREF="/?module=Static&d1=contacts&d2=contacts" CLASS="sidenav"><IMG SRC="/i/hs/nav_arrow_right.gif" WIDTH="9" HEIGHT="9" ALT="" BORDER="0"/>Contacts</A></TD>
    </TR>
    <TR>
        <TD HEIGHT="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="1" ALT="" BORDER="0"/></TD>
    </TR>
</TABLE>
<!--Left Navigation Include Ends-->
