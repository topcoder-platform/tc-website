<%@ page contentType="text/html" %>

<%
    String key = request.getParameter("key");
%>
<% if (key.equals("tc_old")) { %>
<link type="text/css" rel="stylesheet" href="/css/style.css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css" />
<link type="text/css" rel="stylesheet" href="/css/TCOstyle.css" />
<% } else if (key.equals("tc_home")) { %>
<link type="text/css" rel="stylesheet" href="/css/style.css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css" />
<link type="text/css" rel="stylesheet" href="/css/tcStyles20080219.css" />
<link type="text/css" rel="stylesheet" href="/css/rightNav.css" />
<% } else if (key.equals("tc_calendar")) { %>
<link type="text/css" rel="stylesheet" href="/css/coders.css" />
<link type="text/css" rel="stylesheet" href="/css/tcCalendar.css" />
<link type="text/css" rel="stylesheet" href="/css/tcStyles20080219.css" />
<% } else if (key.equals("crpf")) { %>
<link type="text/css" rel="stylesheet" href="/css/crpfStyle.css" />
<link type="text/css" rel="stylesheet" href="/css/style.css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css" />
<link type="text/css" rel="stylesheet" href="/css/stats.css" />
<link type="text/css" rel="stylesheet" href="/css/tcStyles20080219.css" />
<% } else if (key.equals("tc_forums")) { %>
<link type="text/css" rel="stylesheet" href="/css/style.css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css" />
<link type="text/css" rel="stylesheet" href="/css/roundTables.css" />
<link type="text/css" rel="stylesheet" href="/css/stats.css" />
<link type="text/css" rel="stylesheet" href="/css/tcStyles20080219.css" />
<% } else if (key.equals("tc_main")) { %>
<link type="text/css" rel="stylesheet" href="/css/style.css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css" />
<link type="text/css" rel="stylesheet" href="/css/tcStyles20080219.css" />
<% } else if (key.equals("tc_reg")) { %>
<link type="text/css" rel="stylesheet" href="/css/tcStyles20080219.css" />
<link type="text/css" rel="stylesheet" href="/css/tcReg.css" />
<% } else if (key.equals("tc_stats")) { %>
<link type="text/css" rel="stylesheet" href="/css/style.css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css" />
<link type="text/css" rel="stylesheet" href="/css/stats.css" />
<link type="text/css" rel="stylesheet" href="/css/tcStyles20080219.css" />
<% } else if (key.equals("tc_studio")) { %>
<link type="text/css" rel="stylesheet" href="/css/v2/main.css" />
<% } else if (key.equals("tc_studio_forums")) { %>
<link type="text/css" rel="stylesheet" href="/css/v2/main.css" />
<link type="text/css" rel="stylesheet" href="/css/forums.css" />
<% } else if (key.equals("csf")) { %>
<link type="text/css" rel="stylesheet" href="/css/main.css" />
<% } else if (key.equals("csfforums")) { %>
<link type="text/css" rel="stylesheet" href="/css/main.css" />
<link type="text/css" rel="stylesheet" href="/css/forums.css" />
<% } else if (key.equals("tc_pressroom")) { %>
<link type="text/css" rel="stylesheet" href="/css/tcStyles20080219.css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css" />
<link type="text/css" rel="stylesheet" href="/css/pressroomRemix.css" />
<% } else if (key.equals("tc_ep")) { %>
<link type="text/css" rel="stylesheet" href="/css/ep/main.css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css" />
<% } else if (key.equals("tc_openaim")) { %>
<link type="text/css" rel="stylesheet" href="http://studio.topcoder.com/css/v2/main.css" />
<% } %>
