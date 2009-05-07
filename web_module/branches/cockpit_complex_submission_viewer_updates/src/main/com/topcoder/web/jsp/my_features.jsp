<%@ page
  language="java"
  errorPage="/errorPage.jsp"
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

