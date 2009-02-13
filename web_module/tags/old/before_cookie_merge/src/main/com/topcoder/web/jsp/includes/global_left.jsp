<%@  page
  language="java"
  errorPage="../errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,com.coolservlets.forum.*,
          java.text.SimpleDateFormat,
          java.util.HashMap,
          java.util.Iterator,
          com.topcoder.shared.util.ApplicationServer"
%>

<%
    String level1 = request.getParameter("level1")==null?"":request.getParameter("level1");
    String level2 = request.getParameter("level2")==null?"":request.getParameter("level2");
%>

            <img alt="" width="180" height="5" src="/i/spacer.gif" border="0"><br>
            <img alt="" width="170" height="11" src="/i/left_nav_top.gif" border="0"><br>
            <table width="180" cellspacing="0" cellpadding="0" border="0">

<!-- TCES begins -->
<% if (request.getServletPath().indexOf("jobposting")>-1) { %>

                <tr><td id="leftNavTitle" >Job Listing:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <tr><td id="leftNavOn"><a class="leftOn" href="?&amp;t=tces&amp;c=index"><img width="10" height="10" src="/i/nav_arrow_bottom.gif" alt="" border="0"/>Jobs for Members</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/?&amp;t=tces&amp;c=hiring">Hiring for Employers</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/tces/?task=MainTask">TCES Reporting</a></td></tr>

<!-- TCES ends -->

<!-- Statistics begins -->
<% } else if (request.getServletPath().indexOf("stat_jsp")>-1) {
     String task = request.getParameter("c")==null?"":request.getParameter("c");
   if (task.equals("round_overview")) { %>
 
               <tr><td id="leftNavTitle" >Competition:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=schedule&c=index"><img width="10" height="10" src="/i/nav_arrow_right.gif" alt="" border="0"/>Schedule</a></td></tr>
                <tr><td id="leftNavOn"><a class="leftOn" href="/stat?&c=round_overview"><img width="10" height="10" src="/i/nav_arrow_bottom.gif" alt="" border="0"/>Statistics</a></td></tr>
                <tr><td id="leftSubnavOn"><a class="leftOn" href="/stat?&c=round_overview">Round Overview</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=last_match">Last Match Results</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=coder_ratings">Coder Rankings</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=editorial_archive">Match Editorials</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=quick_stats">Quick Stats</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=search">Advanced Member Search</a></td></tr>  

<%  } else if (task.equals("ratings_history")) { %>
 
               <tr><td id="leftNavTitle" >Competition:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=schedule&c=index"><img width="10" height="10" src="/i/nav_arrow_right.gif" alt="" border="0"/>Schedule</a></td></tr>
                <tr><td id="leftNavOn"><a class="leftOn" href="/stat?&c=round_overview"><img width="10" height="10" src="/i/nav_arrow_bottom.gif" alt="" border="0"/>Statistics</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=round_overview">Round Overview</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=last_match">Last Match Results</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=coder_ratings">Coder Rankings</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=editorial_archive">Match Editorials</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=quick_stats">Quick Stats</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=search">Advanced Member Search</a></td></tr>  

<%  } else if (task.equals("earnings_history")) { %>
 
               <tr><td id="leftNavTitle" >Competition:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=schedule&c=index"><img width="10" height="10" src="/i/nav_arrow_right.gif" alt="" border="0"/>Schedule</a></td></tr>
                <tr><td id="leftNavOn"><a class="leftOn" href="/stat?&c=round_overview"><img width="10" height="10" src="/i/nav_arrow_bottom.gif" alt="" border="0"/>Statistics</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=round_overview">Round Overview</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=last_match">Last Match Results</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=coder_ratings">Coder Rankings</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=editorial_archive">Match Editorials</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=quick_stats">Quick Stats</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=search">Advanced Member Search</a></td></tr>  
    
<%  } else if (task.equals("coder_room_stats")) { %>
 
               <tr><td id="leftNavTitle" >Competition:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=schedule&c=index"><img width="10" height="10" src="/i/nav_arrow_right.gif" alt="" border="0"/>Schedule</a></td></tr>
                <tr><td id="leftNavOn"><a class="leftOn" href="/stat?&c=round_overview"><img width="10" height="10" src="/i/nav_arrow_bottom.gif" alt="" border="0"/>Statistics</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=round_overview">Round Overview</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=last_match">Last Match Results</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=coder_ratings">Coder Rankings</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=editorial_archive">Match Editorials</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=quick_stats">Quick Stats</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=search">Advanced Member Search</a></td></tr>  

<%  } else if (task.startsWith("round_stats")) { %>
 
               <tr><td id="leftNavTitle" >Competition:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=schedule&c=index"><img width="10" height="10" src="/i/nav_arrow_right.gif" alt="" border="0"/>Schedule</a></td></tr>
                <tr><td id="leftNavOn"><a class="leftOn" href="/stat?&c=round_overview"><img width="10" height="10" src="/i/nav_arrow_bottom.gif" alt="" border="0"/>Statistics</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=round_overview">Round Overview</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=last_match">Last Match Results</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=coder_ratings">Coder Rankings</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=editorial_archive">Match Editorials</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=quick_stats">Quick Stats</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=search">Advanced Member Search</a></td></tr>  

<%  } else if (task.equals("room_stats")) { %>
 
               <tr><td id="leftNavTitle" >Competition:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=schedule&c=index"><img width="10" height="10" src="/i/nav_arrow_right.gif" alt="" border="0"/>Schedule</a></td></tr>
                <tr><td id="leftNavOn"><a class="leftOn" href="/stat?&c=round_overview"><img width="10" height="10" src="/i/nav_arrow_bottom.gif" alt="" border="0"/>Statistics</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=round_overview">Round Overview</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=last_match">Last Match Results</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=coder_ratings">Coder Rankings</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=editorial_archive">Match Editorials</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=quick_stats">Quick Stats</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=search">Advanced Member Search</a></td></tr>  

<%  } else if (task.equals("last_match") || task.equals("last_match_sorted")) { %>
 
               <tr><td id="leftNavTitle" >Competition:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=schedule&c=index"><img width="10" height="10" src="/i/nav_arrow_right.gif" alt="" border="0"/>Schedule</a></td></tr>
                <tr><td id="leftNavOn"><a class="leftOn" href="/stat?&c=round_overview"><img width="10" height="10" src="/i/nav_arrow_bottom.gif" alt="" border="0"/>Statistics</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=round_overview">Round Overview</a></td></tr>  
                <tr><td id="leftSubnavOn"><a class="leftOn" href="/stat?&c=last_match">Last Match Results</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=coder_ratings">Coder Rankings</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=editorial_archive">Match Editorials</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=quick_stats">Quick Stats</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=search">Advanced Member Search</a></td></tr>  

<%  } else if (task.equals("coder_ratings")) { %>
 
               <tr><td id="leftNavTitle" >Competition:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=schedule&c=index"><img width="10" height="10" src="/i/nav_arrow_right.gif" alt="" border="0"/>Schedule</a></td></tr>
                <tr><td id="leftNavOn"><a class="leftOn" href="/stat?&c=round_overview"><img width="10" height="10" src="/i/nav_arrow_bottom.gif" alt="" border="0"/>Statistics</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=round_overview">Round Overview</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=last_match">Last Match Results</a></td></tr>  
                <tr><td id="leftSubnavOn"><a class="leftOn" href="/stat?&c=coder_ratings">Coder Rankings</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=editorial_archive">Match Editorials</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=quick_stats">Quick Stats</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=search">Advanced Member Search</a></td></tr>  

<%  } else if (task.equals("search")) { %>
 
               <tr><td id="leftNavTitle" >Competition:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=schedule&c=index"><img width="10" height="10" src="/i/nav_arrow_right.gif" alt="" border="0"/>Schedule</a></td></tr>
                <tr><td id="leftNavOn"><a class="leftOn" href="/stat?&c=round_overview"><img width="10" height="10" src="/i/nav_arrow_bottom.gif" alt="" border="0"/>Statistics</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=round_overview">Round Overview</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=last_match">Last Match Results</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=coder_ratings">Coder Rankings</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=editorial_archive">Match Editorials</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=quick_stats">Quick Stats</a></td></tr>  
                <tr><td id="leftSubnavOn"><a class="leftOn" href="/?t=search">Advanced Member Search</a></td></tr>  

<%  } else if (task.equals("member_profile")) { %>
 
               <tr><td id="leftNavTitle" >Competition:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=schedule&c=index"><img width="10" height="10" src="/i/nav_arrow_right.gif" alt="" border="0"/>Schedule</a></td></tr>
                <tr><td id="leftNavOn"><a class="leftOn" href="/stat?&c=round_overview"><img width="10" height="10" src="/i/nav_arrow_bottom.gif" alt="" border="0"/>Statistics</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=round_overview">Round Overview</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=last_match">Last Match Results</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=coder_ratings">Coder Rankings</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=editorial_archive">Match Editorials</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=quick_stats">Quick Stats</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=search">Advanced Member Search</a></td></tr>  

<%  } else if (task.equals("coder_room_stats")) { %>
 
               <tr><td id="leftNavTitle" >Competition:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=schedule&c=index"><img width="10" height="10" src="/i/nav_arrow_right.gif" alt="" border="0"/>Schedule</a></td></tr>
                <tr><td id="leftNavOn"><a class="leftOn" href="/stat?&c=round_overview"><img width="10" height="10" src="/i/nav_arrow_bottom.gif" alt="" border="0"/>Statistics</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=round_overview">Round Overview</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=last_match">Last Match Results</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=coder_ratings">Coder Rankings</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=editorial_archive">Match Editorials</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=quick_stats">Quick Stats</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=search">Advanced Member Search</a></td></tr>  

<%  } else if (task.equals("problem_solution") || task.equals("problem_statement") ) { %>
 
               <tr><td id="leftNavTitle" >Competition:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=schedule&c=index"><img width="10" height="10" src="/i/nav_arrow_right.gif" alt="" border="0"/>Schedule</a></td></tr>
                <tr><td id="leftNavOn"><a class="leftOn" href="/stat?&c=round_overview"><img width="10" height="10" src="/i/nav_arrow_bottom.gif" alt="" border="0"/>Statistics</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=round_overview">Round Overview</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=last_match">Last Match Results</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=coder_ratings">Coder Rankings</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=editorial_archive">Match Editorials</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=quick_stats">Quick Stats</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=search">Advanced Member Search</a></td></tr>  

<%  } else if (task.equals("all_time_wins") || task.equals("all_time_wins_by_div") || task.equals("winning_debuts") || task.equals("impressive_debuts") || task.equals("highest_totals") || task.equals("biggest_rating_gains") || task.equals("most_consecutive_wins") || task.equals("highest_accuracy") || task.equals("best_challengers")) { %>
 
               <tr><td id="leftNavTitle" >Competition:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=schedule&c=index"><img width="10" height="10" src="/i/nav_arrow_right.gif" alt="" border="0"/>Schedule</a></td></tr>
                <tr><td id="leftNavOn"><a class="leftOn" href="/stat?&c=round_overview"><img width="10" height="10" src="/i/nav_arrow_bottom.gif" alt="" border="0"/>Statistics</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=round_overview">Round Overview</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=last_match">Last Match Results</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=coder_ratings">Coder Rankings</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=editorial_archive">Match Editorials</a></td></tr>  
                <tr><td id="leftSubnavOn"><a class="leftOn" href="/?t=statistics&c=quick_stats">Quick Stats</a></td></tr>  
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=search">Advanced Member Search</a></td></tr>  

<%  } else if (task.equals("school_avg_rating") || task.equals("state_avg_rating") || task.equals("country_avg_rating")) { %>
                <tr><td id="leftNavTitle" >Competition:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=schedule&c=index"><img width="10" height="10" src="/i/nav_arrow_right.gif" alt="" border="0"/>Schedule</a></td></tr>
                <tr><td id="leftNavOn"><a class="leftOn" href="/stat?&c=round_overview"><img width="10" height="10" src="/i/nav_arrow_bottom.gif" alt="" border="0"/>Statistics</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=round_overview">Round Overview</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=last_match">Last Match Results</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/stat?&c=coder_ratings">Coder Rankings</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=editorial_archive">Match Editorials</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=statistics&c=quick_stats">Quick Stats</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/?t=search">Advanced Member Search</a></td></tr>

<%  } %>

                <tr><td id="leftNav"><a class="left" href="/?&t=features&c=index"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Features</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=tournaments&c=tourny_index"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Events</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/rtables/index.jsp"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Round Tables</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=support&c=index"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Support/FAQs</a></td></tr>

<%} else if (request.getServletPath().indexOf("rtables")>-1) {

    String temp = request.getParameter("forum");
    temp = temp==null?"-1":temp;
    int paramFid = Integer.parseInt(temp); %>
 
               <tr><td id="leftNavTitle" >Competition:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=schedule&c=index"><img width="10" height="10" src="/i/nav_arrow_right.gif" alt="" border="0"/>Schedule</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/stat?&c=round_overview"><img width="10" height="10" src="/i/nav_arrow_right.gif" alt="" border="0"/>Statistics</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=features&c=index"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Features</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=tournaments&c=tourny_index"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Events</a></td></tr>
                <tr><td id="<%=paramFid>0?"leftNavOn":"leftNavSelect"%>"><a class="leftOn" href="/rtables/index.jsp"><img alt="" width="10" height="10" src="/i/nav_arrow_bottom.gif" border="0"/>Round Tables</a></td></tr>
<%
  // do a login if all parameters are good
  Authorization aToken = (Authorization) session.getAttribute("jiveAuthorization");
  if (aToken==null) {
      Authorization authToken = null;
      com.topcoder.ejb.AuthenticationServices.User user = null;
      String rtUser = "";
      String rtPassword = "";
      String Redirect_URL = "http://" + request.getServerName();
      Navigation n = null;
      try {
        n = (Navigation) session.getAttribute("navigation");
        if (n==null) n = new Navigation();
        user = n.getUser();
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
  ForumFactory ff = ForumFactory.getInstance(aToken);
  Iterator forums = ff.forums();
  while( forums.hasNext() ) {
    Forum f = (Forum)forums.next();
    int fID = f.getID();
    String fName = f.getName();
    int messageCount = f.getMessageCount();
%>
    
                <tr><td id="<%=paramFid>0&&paramFid==fID?"leftSubnavOn":"leftSubNav"%>"><a href="/rtables/viewForum.jsp?forum=<%= fID %>&mc=<%=messageCount%>" class="leftOn"><%=(fName!=null)?fName:"&nbsp;"%></a></td></tr>

<% } %>

                <tr><td id="leftNav"><a class="left" href="/?&t=support&c=index"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Support/FAQs</a></td></tr>

<!-- PACTS begins -->
<%} else if (request.getServletPath().indexOf("pacts")>-1) { %>

                <tr><td id="leftNavTitle">P.A.C.T.s:</td>
                <tr><td id="leftSubnav"><a class="leftOn" href="/PactsMemberServlet?t=payments&amp;c=payment_history">Payments</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/PactsMemberServlet?t=affidavit&amp;c=affidavit_history">Affidavits</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/PactsMemberServlet?t=contracts&amp;c=contract_history">Contracts</a></td></tr>
                <tr><td id="leftSubnav"><a class="leftOn" href="/PactsMemberServlet?t=tax_forms&amp;c=tax_forms_history">Tax Forms</a></td></tr>

<% } else if (level1.equals("tournaments")) { %>
               <tr><td id="leftNavTitle" >Competition:</td></tr>
                <tr><td id="leftNavApplet"><a href="Javascript:arena()" class="left"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Launch Arena Applet</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=schedule&c=index"><img width="10" height="10" src="/i/nav_arrow_right.gif" alt="" border="0"/>Schedule</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/stat?&c=round_overview"><img width="10" height="10" src="/i/nav_arrow_right.gif" alt="" border="0"/>Statistics</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=features&c=index"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Features</a></td></tr>
                <tr><td id="leftNavOn"><a class="leftOn" href="/?&t=tournaments&c=tourny_index"><img alt="" width="10" height="10" src="/i/nav_arrow_bottom.gif" border="0"/>Events</a></td></tr>
                <tr><td id="<%=level2.equals("tournaments")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/?&t=tournaments&c=tourny_index">Tournaments</a></td></tr>
                <tr><td id="<%=level2.equals("charity")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/tc/?&module=Static&d1=crpf&d2=index">Charity</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/rtables/index.jsp"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Round Tables</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=support&c=index"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Support/FAQs</a></td></tr>

<% } %>

<!-- TopCoder Info begins -->

    <% if (level1.equals("review_board")) { %>

                <tr><td id="leftNavTitle">TopCoder Info:</td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=about_tc&c=index"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>About TopCoder</a></td></tr>
                <tr><td id="leftNavOn"><a class="leftOn" href="/tc/?module=Static&d1=review_board&d2=competition"><img alt="" width="10" height="10" src="/i/nav_arrow_bottom.gif" border="0"/>Review Boards</a></td></tr>
                <tr><td id="<%=level2.equals("competition")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/tc/?module=Static&d1=review_board&d2=competition">Competition</a></td></tr>
                <tr><td id="<%=level2.equals("development")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/tc/?d1=review_board&d2=development">Development</a></td></tr>
                <tr><td id="<%=level2.equals("design")?"leftSubnavOn":"leftSubnav"%>"><a class="leftOn" href="/tc/?d1=review_board&d2=design">Design</a></td></tr>
    <% } else { %>

                <tr><td id="leftNavTitle">TopCoder Info:</td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=about_tc&c=index"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>About TopCoder</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/tc/?d1=review_board&d2=competition"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Review Boards</a></td></tr>

    <% } %>

                <tr><td id="leftNav"><a class="left" href="/?&t=news_events&c=index"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Press Room</a></td></tr>
                <tr><td id="leftNav"><a class="left" href="/?&t=contacts&c=index"><img alt="" width="10" height="10" src="/i/nav_arrow_right.gif" border="0"/>Contacts</a></td></tr>
                <tr><td bgcolor="#990000"><jsp:include page="../includes/modules/simpleSearch.jsp"/></td></tr>  
<!-- TopCoder Info ends -->

            </table>
            
            <img alt="" width="180" height="23" src="/i/left_nav_btm.gif" border="0"/><br /><br />
            <div align="center"><img src="/i/logo_ghosted_bracket.gif" width="160" height="77" alt="[ TopCoder ]" vspace="10" border="0"/></div><br /><br />
