<%@  page
  language="java"
  errorPage="../errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,com.coolservlets.forum.*,
          java.text.SimpleDateFormat,
          java.util.HashMap,
          java.util.Iterator"
%>

    
<TABLE WIDTH="170" CELLSPACING="0" CELLPADDING="0" BORDER="0" BGCOLOR="#000000"> 
<% if (request.getServletPath().indexOf("jobposting")>-1) { %>
  <tr>
    <td valign="top" bgcolor="#000000"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
    <td valign="middle" height="18" class="statTextBig" bgcolor="#000000"><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0"/><font color="#FFFFFF">&#160;<a href="/?&amp;t=tces&amp;c=index" class="statTextBig">[TC] Employment Services</a></font></td>
    <td valign="top" bgcolor="#000000"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
  </tr>
  <tr><td valign="top" colspan="3" bgcolor="#000000"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>
  <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td>
    <td valign="middle" height="15" class="statText" bgcolor="#333333" background="/i/clear.gif">
    &#160;&#160;&#160;<a class="statText" href="?&amp;t=tces&amp;c=index">&#160;&#160;Jobs for Members</a></td>
    <td valign="top" class="statText" bgcolor="#333333">&#160;</td>
  </tr>
  <tr><td valign="top" colspan="3" bgcolor="#000000"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>
  <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td>
    <td valign="middle" height="15" class="statText" bgcolor="#333333" background="/i/clear.gif">
    &#160;&#160;&#160;<a class="statText" HREF="/?&amp;t=tces&amp;c=hiring">&#160;&#160;Hiring for Employers</a></td>
    <td valign="top" class="statText" bgcolor="#333333">&#160;</td>
  </tr>
  <tr><td valign="top" colspan="3" bgcolor="#000000"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>
            <tr>
              <td valign="top" bgcolor="#666666"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
              <td valign="middle" height="18" class="statTextBig" bgcolor="#666666"><font color="#000000">&#160;[TCES] Reporting</font></td>
              <td valign="top" bgcolor="#666666"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
            </tr>
			<tr>
			  <td valign="top" bgcolor="#666666" class="subNav" align="right">&#160;</td>
			  <td valign="top" height="15" bgcolor="#666666" class="statText" width="100%">Employers <a href="/tces/tces?task=LoginTask" class="statText"><b>login</b></a> to access the [TCES] reporting application.<br/></td>
			  <td valign="top" bgcolor="#666666" class="statText">&#160;</td>
			</tr>
            <tr><td colspan="2" bgcolor="#666666"><img src="/i/clear.gif" width="1" height="1" border="0" vspace="2"/></td><td width="1" bgcolor="#666666"><img src="/i/clear.gif" width="1" height="1" border="0"/></td></tr>

    <TR>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">What's INSIDE:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=schedule&c=index">Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/stat?&c=round_overview">Statistics</A></TD><TD VALIGN="top" CLASS="statText" >&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=features&c=index">Features</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>

    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=development&c=index">Development</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>

    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=tournaments&c=tourny_index">Tournaments</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>

    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/rtables/index.jsp">Round Tables</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
<% } else if (request.getServletPath().indexOf("stat_jsp")>-1) {
     String task = request.getParameter("c")==null?"":request.getParameter("c");
   if (task.equals("round_overview")) { %>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">What's INSIDE:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=schedule&c=index">Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>   
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/stat?&c=round_overview"><FONT COLOR="#FFFFFF">&#160; Statistics</FONT></A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333" BACKGROUND="/i/graybv_lite_bg.gif">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=round_overview">&#160;&#160;Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=last_match">&#160;&#160;Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>      
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=coder_ratings">&#160;&#160;Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=editorial_archive">&#160;&#160;Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>             
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=quick_stats">&#160;&#160;Quick Stats</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=search">&#160;&#160;Advanced Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  

<%  } else if (task.equals("ratings_history")) { %>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">What's INSIDE:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=schedule&c=index">Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/stat?&c=round_overview"><FONT COLOR="#FFFFFF">&#160; Statistics</FONT></A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=round_overview">&#160;&#160;Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=last_match">&#160;&#160;Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>      
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=coder_ratings">&#160;&#160;Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=editorial_archive">&#160;&#160;Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>             
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=quick_stats">&#160;&#160;Quick Stats</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=search">&#160;&#160;Advanced Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  

<%  } else if (task.equals("earnings_history")) { %>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">What's INSIDE:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=schedule&c=index">Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/stat?&c=round_overview"><FONT COLOR="#FFFFFF">&#160; Statistics</FONT></A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=round_overview">&#160;&#160;Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=last_match">&#160;&#160;Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>      
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=coder_ratings">&#160;&#160;Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=editorial_archive">&#160;&#160;Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>             
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=quick_stats">&#160;&#160;Quick Stats</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=search">&#160;&#160;Advanced Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  
    
<%  } else if (task.equals("coder_room_stats")) { %>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">What's INSIDE:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=schedule&c=index">Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/stat?&c=round_overview"><FONT COLOR="#FFFFFF">&#160; Statistics</FONT></A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=round_overview">&#160;&#160;Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=last_match">&#160;&#160;Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>      
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=coder_ratings">&#160;&#160;Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=editorial_archive">&#160;&#160;Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>             
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=quick_stats">&#160;&#160;Quick Stats</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=search">&#160;&#160;Advanced Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  

<%  } else if (task.startsWith("round_stats")) { %>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">What's INSIDE:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=schedule&c=index">Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/stat?&c=round_overview"><FONT COLOR="#FFFFFF">&#160; Statistics</FONT></A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=round_overview">&#160;&#160;Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=last_match">&#160;&#160;Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>      
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=coder_ratings">&#160;&#160;Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=editorial_archive">&#160;&#160;Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>             
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=quick_stats">&#160;&#160;Quick Stats</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=search">&#160;&#160;Advanced Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  

<%  } else if (task.equals("room_stats")) { %>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">What's INSIDE:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=schedule&c=index">Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/stat?&c=round_overview"><FONT COLOR="#FFFFFF">&#160; Statistics</FONT></A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=round_overview">&#160;&#160;Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=last_match">&#160;&#160;Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>      
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=coder_ratings">&#160;&#160;Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=editorial_archive">&#160;&#160;Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>             
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=quick_stats">&#160;&#160;Quick Stats</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=search">&#160;&#160;Advanced Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  

<%  } else if (task.equals("last_match") || task.equals("last_match_sorted")) { %>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">What's INSIDE:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=schedule&c=index">Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/stat?&c=round_overview"><FONT COLOR="#FFFFFF">&#160; Statistics</FONT></A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=round_overview">&#160;&#160;Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333" BACKGROUND="/i/graybv_lite_bg.gif">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=last_match">&#160;&#160;Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>      
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=coder_ratings">&#160;&#160;Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=editorial_archive">&#160;&#160;Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>             
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=quick_stats">&#160;&#160;Quick Stats</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=search">&#160;&#160;Advanced Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  

<%  } else if (task.equals("coder_ratings")) { %>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">What's INSIDE:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=schedule&c=index">Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/stat?&c=round_overview"><FONT COLOR="#FFFFFF">&#160; Statistics</FONT></A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=round_overview">&#160;&#160;Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=last_match">&#160;&#160;Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>      
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333" BACKGROUND="/i/graybv_lite_bg.gif">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=coder_ratings">&#160;&#160;Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=editorial_archive">&#160;&#160;Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>             
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=quick_stats">&#160;&#160;Quick Stats</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=search">&#160;&#160;Advanced Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  

<%  } else if (task.equals("search")) { %>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">What's INSIDE:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=schedule&c=index">Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/stat?&c=round_overview"><FONT COLOR="#FFFFFF">&#160; Statistics</FONT></A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=round_overview">&#160;&#160;Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=last_match">&#160;&#160;Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>      
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=coder_ratings">&#160;&#160;Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=editorial_archive">&#160;&#160;Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>             
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=quick_stats">&#160;&#160;Quick Stats</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333" BACKGROUND="/i/graybv_lite_bg.gif">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=search">&#160;&#160;Advanced Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  

<%  } else if (task.equals("member_profile")) { %>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">What's INSIDE:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=schedule&c=index">Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/stat?&c=round_overview"><FONT COLOR="#FFFFFF">&#160; Statistics</FONT></A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=round_overview">&#160;&#160;Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=last_match">&#160;&#160;Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>      
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=coder_ratings">&#160;&#160;Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=editorial_archive">&#160;&#160;Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>             
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=quick_stats">&#160;&#160;Quick Stats</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=search">&#160;&#160;Advanced Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  

<%  } else if (task.equals("coder_room_stats")) { %>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">What's INSIDE:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=schedule&c=index">Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/stat?&c=round_overview"><FONT COLOR="#FFFFFF">&#160; Statistics</FONT></A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=round_overview">&#160;&#160;Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=last_match">&#160;&#160;Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>      
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=coder_ratings">&#160;&#160;Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=editorial_archive">&#160;&#160;Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>             
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=quick_stats">&#160;&#160;Quick Stats</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=search">&#160;&#160;Advanced Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  

<%  } else if (task.equals("problem_solution")) { %>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">What's INSIDE:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=schedule&c=index">Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/stat?&c=round_overview"><FONT COLOR="#FFFFFF">&#160; Statistics</FONT></A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=round_overview">&#160;&#160;Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=last_match">&#160;&#160;Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>      
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=coder_ratings">&#160;&#160;Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=editorial_archive">&#160;&#160;Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>             
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=quick_stats">&#160;&#160;Quick Stats</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>    
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=search">&#160;&#160;Advanced Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  

<%  } else if (task.equals("all_time_wins") || task.equals("all_time_wins_by_div") || task.equals("winning_debuts") || task.equals("impressive_debuts") || task.equals("highest_totals") || task.equals("biggest_rating_gains") || task.equals("most_consecutive_wins") || task.equals("highest_accuracy") || task.equals("best_challengers")) { %>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">What's INSIDE:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=schedule&c=index">Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/stat?&c=round_overview"><FONT COLOR="#FFFFFF">&#160; Statistics</FONT></A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=round_overview">&#160;&#160;Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=last_match">&#160;&#160;Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>      
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=coder_ratings">&#160;&#160;Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=editorial_archive">&#160;&#160;Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>             
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333" BACKGROUND="/i/graybv_lite_bg.gif">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=quick_stats">&#160;&#160;Quick Stats</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>    
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=search">&#160;&#160;Advanced Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 

<%  } else if (task.equals("school_avg_rating") || task.equals("state_avg_rating") || task.equals("country_avg_rating")) { %>
    <TR>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">What's INSIDE:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=schedule&c=index">Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/stat?&c=round_overview"><FONT COLOR="#FFFFFF">&#160; Statistics</FONT></A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=round_overview">&#160;&#160;Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=last_match">&#160;&#160;Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=coder_ratings">&#160;&#160;Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=editorial_archive">&#160;&#160;Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333" BACKGROUND="/i/graybv_lite_bg.gif">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=quick_stats">&#160;&#160;Quick Stats</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=search">&#160;&#160;Advanced Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>

<%  } %>

    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=features&c=index">Features</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>

    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=development&c=index">Development</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>

    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=tournaments&c=tourny_index">Tournaments</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>

    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/rtables/index.jsp">Round Tables</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>


<%} else if (request.getServletPath().indexOf("rtables")>-1) { %>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">What's INSIDE:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=schedule&c=index">Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#000000">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#000000"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/stat?&c=round_overview">Statistics</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#000000">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>        
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=features&c=index">Features</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>        
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=development&c=index">Development</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>    

    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=tournaments&c=tourny_index">Tournaments</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/rtables/index.jsp"><FONT COLOR="#FFFFFF"> Round Tables</FONT></A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
<%
  // do a login if all parameters are good
  Authorization aToken = (Authorization) session.getAttribute("jiveAuthorization");
  if (aToken==null) {
      Authorization authToken = null;
      com.topcoder.ejb.AuthenticationServices.User user = null;
      String rtUser = "";
      String rtPassword = "";
      String Redirect_URL = "http://" + request.getServerName();
      String responseURL = response.encodeURL("");
      SimpleDateFormat dateFormatter = new SimpleDateFormat("EEE, MMM d yyyy 'at' hh:mm a z");
      Navigation n = null;
      try {
        n = (Navigation) session.getAttribute("navigation");
        if (n==null) n = new Navigation();
        user = n.getUser();
        HashMap userTypeDetails = user.getUserTypeDetails();
        HashMap sessionObjects = n.getSessionObjects();
        if ( n.getLoggedIn() ) {
          rtUser =user.getHandle();
          rtPassword =user.getPassword();
        }
      }
      catch( Exception e ) {
        response.sendRedirect(Redirect_URL);
        return;
      }
      // do a login if all parameters are good
      AuthorizationFactory authFactory = AuthorizationFactory.getInstance();
      if(rtUser.equals("")){
        authToken = authFactory.getAnonymousAuthorization();
        session.setAttribute("jiveAuthorization",authToken);
      }else{
        authToken = authFactory.getAuthorization(rtUser,rtPassword);
        session.setAttribute("jiveAuthorization",authToken);
      }
      aToken = (Authorization) session.getAttribute("jiveAuthorization");
  }
  int userId = 0;
  try {
    userId = aToken.getUserID();
  } catch (Exception e){
    e.printStackTrace();
    return;
  }
  ForumFactory ff = ForumFactory.getInstance(aToken);
  ProfileManager mgr = ff.getProfileManager();
  String nm = null;
  String userName = null;
  com.coolservlets.forum.User nu = null;
  try {
    nu = mgr.getUser( userId );
    nm = nu.getName();
    userName = nu.getUsername();
  }
  catch( Exception e ) {
    e.printStackTrace();
    return;
  }
  Iterator forums = ff.forums();
  while( forums.hasNext() ) {
    Forum f = (Forum)forums.next();
    int fID = f.getID();
    String fName = f.getName();
    int messageCount = f.getMessageCount();
%>
    
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A HREF="/rtables/viewForum.jsp?forum=<%= fID %>&mc=<%=messageCount%>" class="statText"><%=(fName!=null)?fName:"&nbsp;"%></A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 
<%
  }
%>
    <!-- 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/rtables/viewForum.jsp?forum=7126">&#160;&#160;Evolving Strategy </A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>     
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/rtables/viewForum.jsp?forum=7167">&#160;&#160;Contest Discussion</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>      
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/rtables/viewForum.jsp?forum=7166">&#160;&#160;Bugs and Annoyances</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/rtables/viewForum.jsp?forum=148126">&#160;&#160;Plugin Development</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>             
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/rtables/viewForum.jsp?forum=39781">&#160;&#160;Contest Participation</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;<A CLASS="statText" HREF="/rtables/viewForum.jsp?forum=140967">&#160;&#160;Teams Discussion</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> -->


<%} else if (request.getServletPath().indexOf("pacts")>-1) { %>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;P.A.C.T.s:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;&#160;&#160;<A CLASS="statText" HREF="/PactsMemberServlet?t=payments&amp;c=payment_history">Payments</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;&#160;&#160;<A CLASS="statText" HREF="/PactsMemberServlet?t=affidavit&amp;c=affidavit_history">Affidavits</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;&#160;&#160;<A CLASS="statText" HREF="/PactsMemberServlet?t=contracts&amp;c=contract_history">Contracts</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>        
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;&#160;&#160;<A CLASS="statText" HREF="/PactsMemberServlet?t=tax_forms&amp;c=tax_forms_history">Tax Forms</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>     
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">What's INSIDE:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=schedule&c=index">Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/stat?&c=round_overview">Statistics</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=features&c=index">Features</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>    
    
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=development&c=index">Development</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>    

    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=tournaments&c=tourny_index">Tournaments</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#000000">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#000000"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/stat?&c=round_overview">Statistics</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#000000">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/rtables/index.jsp">Round Tables</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>


<%} %>     
    

    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=support&c=index">Support/FAQs</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD><TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">[TC] Corporate</TD><TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD><TD VALIGN="middle" HEIGHT="15" CLASS="statTextBig" BGCOLOR="#000000"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=about_tc&c=index">About Us</A></TD><TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD><TD VALIGN="middle" HEIGHT="15" CLASS="statTextBig" BGCOLOR="#000000"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=news_events&c=index">Press Room</A></TD><TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD><TD VALIGN="middle" HEIGHT="15" CLASS="statTextBig" BGCOLOR="#000000"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig" HREF="/?&t=contacts&c=index">Contacts</A></TD><TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR> 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333" COLSPAN="3"><jsp:include page="../includes/modules/simpleSearch.jsp"/></TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>


</TABLE>
            <IMG ALT="" WIDTH="170" HEIGHT="69" SRC="/i/left_nav_btm.gif" BORDER="0"/><BR/><BR/><IMG SRC="/i/logo_ghosted_bracket.gif" WIDTH="160" HEIGHT="77" ALT="[ TopCoder ]" VSPACE="10" BORDER="0"/>
