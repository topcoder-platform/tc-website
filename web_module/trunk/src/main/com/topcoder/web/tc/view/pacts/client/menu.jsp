<%@  page
contentType="text/html"
%>

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR>
<TD CLASS="registerNav" WIDTH="50" HEIGHT="21" BACKGROUND="/i/steel_gray_bg.gif" VALIGN="middle"><IMG SRC="/i/clear.gif" WIDTH="20" HEIGHT="1" BORDER="0"/></TD>
<TD CLASS="registerNav" WIDTH="120" HEIGHT="21" BACKGROUND="/i/steel_gray_bg.gif" VALIGN="middle" ALIGN="center">
<IMG SRC="/i/clear.gif" WIDTH="120" HEIGHT="1" BORDER="0"/><BR CLEAR="all"/>
<% if ( nav.getLoggedIn() ) { %><A HREF="<%="https://"+request.getServerName()+"/Registration"%>" CLASS="registerNav">Update your Profile</A>&#160;&#160;&#160;&#160;
<% } else { %><A CLASS="registerNav" HREF="<%="https://"+request.getServerName()+"/Registration"%>">REGISTRATION</A>&#160;&#160;&#160;&#160;</xsl:otherwise><%}%>
</TD>
<TD WIDTH="5" HEIGHT="21" BACKGROUND="/i/steel_gray_bg.gif" ALIGN="right"><IMG SRC="/i/top_bar_left.gif" WIDTH="21" HEIGHT="21" BORDER="0"/></TD>
<TD CLASS="globalNav" HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000" VALIGN="middle">
<!-- <IMG SRC="/i/clear.gif" WIDTH="500" HEIGHT="1" BORDER="0"/><BR/> -->
<IMG SRC="/i/clear.gif" WIDTH="30" HEIGHT="1" BORDER="0"/></TD>
<TD HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><A HREF="/tc?module=Static&d1=about&d2=index" onMouseOver="changeImages('image1', 'image1on')" onMouseOut="changeImages('image1', 'image1off')"><IMG NAME="image1" SRC="/i/nav_about_off.gif" ALT="about TopCoder" WIDTH="104" HEIGHT="21" BORDER="0"/></A></TD>
<TD HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="21" BORDER="0"/></TD>
<TD HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><A HREF="/index?t=news_events&amp;c=index" onMouseOver="changeImages('image2', 'image2on')" onMouseOut="changeImages('image2', 'image2off')"><IMG NAME="image2" SRC="/i/nav_news_off.gif" ALT="News &amp; Events" WIDTH="82" HEIGHT="21" BORDER="0"/></A></TD>
<TD HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="21" BORDER="0"/></TD>
<TD HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><A HREF="/rtables/index.jsp" onMouseOver="changeImages('image3', 'image3on')" onMouseOut="changeImages('image3', 'image3off')"><IMG NAME="image3" SRC="/i/nav_roundtables_<%if(request.getServletPath().startsWith("/rtables")){%>on<%}else{%>off<%}%>.gif" ALT="Round Tables" WIDTH="86" HEIGHT="21" BORDER="0"/></A></TD>
<TD HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="21" BORDER="0"/></TD>
<TD HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><A HREF="/stat?&c=round_overview" onMouseOver="changeImages('image4', 'image4on')" onMouseOut="changeImages('image4', 'image4off')"><IMG NAME="image4" SRC="/i/nav_stats_off.gif" ALT="Statistics" WIDTH="65" HEIGHT="21" BORDER="0"/></A></TD>
<TD HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="21" BORDER="0"/></TD>
<TD HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><A HREF="/index?t=schedule&amp;c=index" onMouseOver="changeImages('image5', 'image5on')" onMouseOut="changeImages('image5', 'image5off')"><IMG NAME="image5" SRC="/i/nav_schedule_off.gif" ALT="Schedule" WIDTH="65" HEIGHT="21" BORDER="0"/></A></TD>
<TD HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="21" BORDER="0"/></TD>
<TD HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000"><A HREF="/index?t=support&amp;c=index" onMouseOver="changeImages('image6', 'image6on')" onMouseOut="changeImages('image6', 'image6off')"><IMG NAME="image6" SRC="/i/nav_support_off.gif" ALT="Support" WIDTH="99" HEIGHT="21" BORDER="0"/></A></TD>
<TD WIDTH="100%" HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#990000"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
<!-- <TD WIDTH="5" HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000" ALIGN="right"><IMG SRC="/i/top_bar_right.gif" WIDTH="5" HEIGHT="21" BORDER="0"/></TD>
<TD WIDTH="70" HEIGHT="21" BGCOLOR="#990000"><IMG SRC="/i/clear.gif" WIDTH="70" HEIGHT="1" BORDER="0"/></TD> -->
</TR>
</TABLE>

    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
      <TR>
        <TD WIDTH="100%" BACKGROUND="/i/steel_gray_bg.gif" VALIGN="top" ALIGN="right"><IMG SRC="/i/clear.gif" WIDTH="510" HEIGHT="1" BORDER="0"/></TD>
        <TD WIDTH="8" BACKGROUND="/i/steel_gray_bg.gif" VALIGN="top" ALIGN="right"><IMG SRC="/i/top_gray_right.gif" WIDTH="8" HEIGHT="8" BORDER="0"/></TD>
        <TD WIDTH="210" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="210" HEIGHT="1" BORDER="0"/></TD>
      </TR>
    </TABLE>

