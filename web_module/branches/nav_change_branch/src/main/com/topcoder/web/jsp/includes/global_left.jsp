<%@  page
  language="java"
  errorPage="../errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation"
%>

<% 
   Navigation nav = (Navigation) session.getAttribute ( "navigation" );
   if ( nav == null ) nav = new Navigation();
   if (nav.getLoggedIn()) {
 %>
<jsp:include page="../my_features.jsp"/>
<% } %>     
<TABLE WIDTH="170" CELLSPACING="0" CELLPADDING="0" BORDER="0" BGCOLOR="#000000"> 
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">What's INSIDE:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;<A CLASS="statText" HREF="/?&t=schedule&c=index">Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>   
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;<A CLASS="statTextBig" HREF="/stat?&c=round_overview"><FONT COLOR="#FFFFFF">&gt; Statistics</FONT></A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>            
<% if (request.getServletPath().indexOf("stat_jsp")>-1) {
     String task = request.getParameter("c")==null?"":request.getParameter("c");
     if (task.equals("round_stats")) { 
%>

  <TR>
    <TD>
       Round Stats
    </TD>
  </TR>
  
  
<%  } else if (task.equals("round_overview")) { %>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BACKGROUND="/i/orangebv_bg.gif">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=round_overview"> - Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=last_match"> - Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>      
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=coder_ratings"> - Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=editorial_archive"> - Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>             
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=search"> - Advance Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  

<%  } else if (task.equals("last_match")) { %>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=round_overview"> - Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BACKGROUND="/i/orangebv_bg.gif">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=last_match"> - Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>      
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=coder_ratings"> - Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=editorial_archive"> - Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>             
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=search"> - Advance Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  

<%  } else if (task.equals("coder_ratings")) { %>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=round_overview"> - Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=last_match"> - Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>      
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BACKGROUND="/i/orangebv_bg.gif">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=coder_ratings"> - Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=editorial_archive"> - Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>             
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=search"> - Advance Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  

<%  } else if (task.equals("search")) { %>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=round_overview"> - Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> 
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=last_match"> - Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>      
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">&#160;&#160;&#160;<A CLASS="statText" HREF="/stat?&c=coder_ratings"> - Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=statistics&c=editorial_archive"> - Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>             
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BACKGROUND="/i/orangebv_bg.gif">&#160;&#160;&#160;<A CLASS="statText" HREF="/?t=search"> - Advance Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>  
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  

<!-- <%  } else if (task.equals("round_overview")) { %>
  <TR>
    <TD>
       Round Overview
    </TD>
  </TR> -->
<%  } else if (task.equals("problem_statement")) { %>
  <TR>
    <TD>
       Round Overview
    </TD>
  </TR>
<%  } %>
<%} else if (request.getServletPath().indexOf("rtables")>-1) { %>

<%} %>   

    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;<A CLASS="statText" HREF="/?&t=tournaments&c=index">Tournaments</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>    
    
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;<A CLASS="statText" HREF="/rtables/index">Round Tables</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>    

    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;<A CLASS="statText" HREF="/?&t=support&c=index">Rules/FAQs</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD><TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">[TC] Corporate</TD><TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD><TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">&#160;<A CLASS="statText" HREF="/?&t=about_tc&c=index">About Us</A></TD><TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD><TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">&#160;<A CLASS="statText" HREF="/?&t=news_events&c=index">Press Room</A></TD><TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD><TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">&#160;<A CLASS="statText" HREF="/?&t=contacts&c=index">Contacts</A></TD><TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>






<!--
all_time_wins
all_time_wins_by_div
winning_debuts
impressive_debuts
highest_totals
biggest_rating_gains
most_consecutive_wins
highest_accuracy
best_challengers
round_stats
round_stats_sorted
last_match
last_match_sorted
room_stats
problem_statement
problem_solution
earnings_history
ratings_history
coder_room_stats
coder_ratings
member_profile
round_overview
school_avg_rating
-->






</TABLE>
