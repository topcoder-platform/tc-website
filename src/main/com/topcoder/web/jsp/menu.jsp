<%@  page
contentType="text/html"
%>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR>
<TD CLASS="registerNav" WIDTH="114" HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif"><% if ( nav.getLoggedIn() ) { %><A HREF="<%="https://"+request.getServerName()+"/reg/index.jsp"%>" CLASS="registerNav" TARGET="_parent"><IMG SRC="/i/menu_profile_on.gif" ALT="Update Profile" WIDTH="114" HEIGHT="21" BORDER="0"/></A><% } else { %><A CLASS="registerNav" HREF="<%="https://"+request.getServerName()+"/reg/index.jsp"%>" TARGET="_parent"><IMG SRC="/i/menu_reg_off.gif" ALT="Register" WIDTH="114" HEIGHT="21" BORDER="0"/></A><%}%></TD>
<TD WIDTH="69" HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><A HREF="/index?t=schedule&amp;c=index" onMouseOver="changeImages('image2', 'image2on')" onMouseOut="changeImages('image2', 'image2off')" TARGET="_parent"><IMG NAME="image2" SRC="/i/menu_sched_off.gif" ALT="Schedule" WIDTH="69" HEIGHT="21" BORDER="0"></A></TD>
<!-- <TD WIDTH="49" HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><A HREF="/index?t=about_tc&amp;c=membr_teams" onMouseOver="changeImages('image3', 'image3on')" onMouseOut="changeImages('image3', 'image3off')" TARGET="_parent"><IMG NAME="image3" SRC="/i/menu_teams_off.gif" ALT="Teams" WIDTH="49" HEIGHT="21" BORDER="0"></A></TD> -->
<TD WIDTH="69" HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><A HREF="/stat?&c=round_overview" onMouseOver="changeImages('image4', 'image4on')" onMouseOut="changeImages('image4', 'image4off')" TARGET="_parent"><IMG NAME="image4" SRC="/i/menu_stats_off.gif" ALT="Statistics" WIDTH="69" HEIGHT="21" BORDER="0"></A></TD>
<TD WIDTH="90" HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><A HREF="/rtables/index.jsp" onMouseOver="changeImages('image5', 'image5on')" onMouseOut="changeImages('image5', 'image5off')"><IMG NAME="image5" SRC="/i/menu_rounds_<%if(request.getServletPath().startsWith("/rtables")){%>on<%}else{%>off<%}%>.gif" ALT="Round Tables" WIDTH="90" HEIGHT="21" BORDER="0"/></A></TD>
<TD WIDTH="88" HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><A HREF="/?&t=development&amp;c=index" onMouseOver="changeImages('image6', 'image6on')" onMouseOut="changeImages('image6', 'image6off')" TARGET="_parent"><IMG NAME="image6" SRC="/i/menu_dev_off.gif" ALT="Development" WIDTH="88" HEIGHT="21" BORDER="0"></A></TD>            
<!-- <TD WIDTH="40" HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><A HREF="/?&t=tces&amp;c=index" onMouseOver="changeImages('image7', 'image7on')" onMouseOut="changeImages('image7', 'image7off')" TARGET="_parent"><IMG NAME="image7" SRC="/i/menu_jobs_off.gif" ALT="Jobs" WIDTH="40" HEIGHT="21" BORDER="0"></A></TD> -->
<TD WIDTH="82" HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><A HREF="/?&t=news_events&amp;c=index" onMouseOver="changeImages('image8', 'image8on')" onMouseOut="changeImages('image8', 'image8off')" TARGET="_parent"><IMG NAME="image8" SRC="/i/menu_press_off.gif" ALT="News &amp; Events" WIDTH="82" HEIGHT="21" BORDER="0"></A></TD>            
<TD WIDTH="90" HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><A HREF="/?&t=support&amp;c=index" onMouseOver="changeImages('image9', 'image9on')" onMouseOut="changeImages('image9', 'image9off')" TARGET="_parent"><IMG NAME="image9" SRC="/i/menu_support_off.gif" ALT="Support/FAQs" WIDTH="90" HEIGHT="21" BORDER="0"></A></TD>            
<TD WIDTH="100%" HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
</TR>
</TABLE>
<!-- <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
  <TR>
    <TD WIDTH="100%" BACKGROUND="/i/steel_gray_bg.gif" VALIGN="top" ALIGN="right"><IMG SRC="/i/clear.gif" WIDTH="510" HEIGHT="1" BORDER="0"/></TD>
    <TD WIDTH="8" BACKGROUND="/i/steel_gray_bg.gif" VALIGN="top" ALIGN="right"><IMG SRC="/i/top_gray_right.gif" WIDTH="8" HEIGHT="8" BORDER="0"/></TD>
    <TD WIDTH="210" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="210" HEIGHT="1" BORDER="0"/></TD>
  </TR> -->
</TABLE>
