<%@ page
  language="java"
  errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation"
%>
<%
   Navigation nav = (Navigation) session.getAttribute ( "navigation" );
   if ( nav == null ) nav = new Navigation();
%>
       <TABLE WIDTH="100%" BGCOLOR="#660000" BORDER="0" CELLSPACING="0" CELLPADDING="0" VALIGN="top"> 
            <TR> 
              <TD VALIGN="top"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig">&#160;&#160;Member FEATURES:</TD>
              <TD VALIGN="top"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#660000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>             
            <TR>
              <TD VALIGN="top" BGCOLOR="#660000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="top" BGCOLOR="#660000" COLSPAN="2">
    <form name="selectform">
      <select name="myfeatures" size="1" class="dropdown" onchange="goTo(this)">
        <OPTION value="SELECTED"> Select a Feature: </OPTION>
        <OPTION value="alltimewin">&#160;Profile</OPTION>
        <OPTION value="winningdebuts">&#160;Ratings History</OPTION>
        <OPTION value="impressivedebuts">&#160;Earnings History</OPTION>
        <OPTION value="hightesttotal">&#160;Room Statistics</OPTION>
        <OPTION value="ratingpointgain">&#160;Round Statistics</OPTION>	
        <OPTION value="consecwins">&#160;Advanced Member Search</OPTION>
        <OPTION value="submissionaccuracy">&#160;Affidavits</OPTION>
        <OPTION value="challengesuccess">&#160;My Referrals</OPTION>
        <OPTION value="challengesuccess">&#160;Development</OPTION>
        <OPTION value="challengesuccess">&#160;TCES (jobs)</OPTION>
      </select>
    </form>
                </TD>
            </TR>
          </TABLE>

<!-- <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" VALIGN="top">
  <TR>
    <TD BGCOLOR="#CC9900" HEIGHT="18" VALIGN="middle"><IMG SRC="/i/label_my_stats2.gif" ALT="My Stats" WIDTH="170" HEIGHT="17" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top">
      <TABLE WIDTH="170" CELLSPACING="0" CELLPADDING="0" BORDER="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif">
        <TR><TD COLSPAN="3" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>

        <TR><TD VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="subNav" ALIGN="right"><IMG SRC="/i/mystats_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0" HSPACE="3"/></TD><TD VALIGN="top" HEIGHT="15" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><A HREF="/stat?c=member_profile&amp;cr=<%=nav.getUserId()%>" CLASS="subNav">Profile</A></TD><TD WIDTH="1" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>         

        <TR><TD VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="subNav" ALIGN="right"><IMG SRC="/i/mystats_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0" HSPACE="3"/></TD><TD VALIGN="top" HEIGHT="15" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><A HREF="/stat?c=ratings_history&amp;cr=<%=nav.getUserId()%>" CLASS="subNav">Ratings History</A></TD><TD WIDTH="1" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
<%
String roundId = request.getParameter("rd");
%>
        <TR><TD VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="subNav" ALIGN="right"><IMG SRC="/i/mystats_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0" HSPACE="3"/></TD><TD VALIGN="top" HEIGHT="15" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><A HREF="/stat?c=earnings_history&amp;cr=<%=nav.getUserId()%>" CLASS="subNav">Earnings History</A></TD><TD WIDTH="1" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>

        <TR><TD VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="subNav" ALIGN="right"><IMG SRC="/i/mystats_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0" HSPACE="3"/></TD><TD VALIGN="top" HEIGHT="15" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><A HREF="/stat?c=coder_room_stats&amp;cr=<%=nav.getUserId()%>" CLASS="subNav">Room Statistics</A></TD><TD WIDTH="1" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>

        <TR><TD VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="subNav" ALIGN="right"><IMG SRC="/i/mystats_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0" HSPACE="3"/></TD><TD VALIGN="top" HEIGHT="15" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><A HREF="/stat?c=round_stats<%=roundId==null?"":"&rd="+roundId%>" CLASS="subNav">Round Statistics</A></TD><TD WIDTH="1" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>

        <TR><TD VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="subNav" ALIGN="right"><IMG SRC="/i/mystats_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0" HSPACE="3"/></TD><TD VALIGN="top" HEIGHT="15" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><A HREF="/index?t=search" CLASS="subNav">Member Search</A></TD><TD WIDTH="1" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>

        <TR><TD VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="subNav" ALIGN="right"><IMG SRC="/i/mystats_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0" HSPACE="3"/></TD><TD VALIGN="top" HEIGHT="15" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><A HREF="/PactsMemberServlet" CLASS="subNav">Affidavits</A></TD><TD WIDTH="1" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>

        <TR><TD VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="subNav" ALIGN="right"><IMG SRC="/i/mystats_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0" HSPACE="3"/></TD><TD VALIGN="top" HEIGHT="15" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><A HREF="/index?t=search&amp;c=refer" CLASS="subNav">My Referrals</A></TD><TD WIDTH="1" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>

        <TR><TD VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="subNav" ALIGN="right"><IMG SRC="/i/mystats_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0" HSPACE="3"/></TD><TD VALIGN="top" HEIGHT="15" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><A HREF="/index?t=development&amp;c=index" CLASS="subNav">Development</A></TD><TD WIDTH="1" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>

        <TR><TD VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="subNav" ALIGN="right"><IMG SRC="/i/mystats_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0" HSPACE="3"/></TD><TD VALIGN="top" HEIGHT="15" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><A HREF="/?&t=tces&amp;c=index" CLASS="subNav">Job Postings</A></TD><TD WIDTH="1" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>

        <TR><TD COLSPAN="3" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0" VSPACE="2"/></TD></TR>
         
        <TR><TD COLSPAN="3" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0" VSPACE="2"/></TD></TR>
      </TABLE>
    </TD>
  </TR>
</TABLE>

<IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/> -->      
