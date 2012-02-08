<%--
  - Author: isv
  - Version: 1.3
  - Copyright (C) 2004 - 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page helps include custom CSS according to the caller
  -
  - Parameter key: this parameter is used to decide which styles to include. 
  -
  - Version 1.1 (Studio Release Assembly 1) Change notes:
  - * New styles selected for studio home page.
  - Version 1.2 (Studio Contest Detail Pages Assembly version 1.0) changes:
  -     - Added import CSS for tc_studio_details pages  
  - Version 1.3 (Studio Member Profiles Assembly version 1.0) changes:
  -     - Updated import CSS for tc_studio_profile pages  
--%>
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
<link type="text/css" rel="stylesheet" href="/css/rightNav20080519.css" />
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
<link type="text/css" rel="stylesheet" href="/css/jobsRemix.css" />
<% } else if (key.equals("tc_reg")) { %>
<link type="text/css" rel="stylesheet" href="/css/tcStyles20080219.css" />
<link type="text/css" rel="stylesheet" href="/css/tcReg.css" />
<% } else if (key.equals("tc_stats")) { %>
<link type="text/css" rel="stylesheet" href="/css/style.css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css" />
<link type="text/css" rel="stylesheet" href="/css/stats.css" />
<link type="text/css" rel="stylesheet" href="/css/tcStyles20080219.css" />

<% } else if (key.equals("tc_studio_home")) { %>
<link type="text/css" rel="stylesheet" href="/css/v5/home.css" />
<link type="text/css" rel="stylesheet" href="/css/v5/studio-navigation.css" />
<!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="/css/v5/studio-ie7.css" />
<![endif]-->
<!--[if IE 6]>
    <link rel="stylesheet" type="text/css" href="/css/v5/studio-ie6.css" />
<![endif]-->
<% } else if (key.equals("tc_studio")) { %>
<link type="text/css" rel="stylesheet" href="/css/v4/main.css" />
<link type="text/css" rel="stylesheet" href="/css/v4/studio-navigation.css" />
<link type="text/css" rel="stylesheet" href="/css/v4/newstyles.css" />
<!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="/css/v4/studio-ie7.css" />
<![endif]-->
<!--[if IE 6]>
    <link rel="stylesheet" type="text/css" href="/css/v4/studio-ie6.css" />
<![endif]-->
<% } else if (key.equals("tc_studio_contest_details")) { %>
<link type="text/css" rel="stylesheet" href="/css/v4/home.css" />
<link type="text/css" rel="stylesheet" href="/css/v4/studio-navigation.css" />
<link type="text/css" rel="stylesheet" href="/css/v4/newstyles.css" />
<link type="text/css" rel="stylesheet" href="/css/screen.css"/>
<!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="/css/v4/studio-ie7.css" />
    <link rel="stylesheet" type="text/css" href="/css/newStyle-ie7.css"/>
<![endif]-->
<!--[if IE 6]>
    <link rel="stylesheet" type="text/css" href="/css/v4/studio-ie6.css" />
<![endif]-->
<% } else if (key.equals("tc_studio_profile")) { %>
<link type="text/css" rel="stylesheet" href="/css/v4/main.css" />
<link type="text/css" rel="stylesheet" href="/css/v4/studio-navigation.css" />
<link type="text/css" rel="stylesheet" href="/js/jcarousel/jquery.jcarousel.css" />
<link type="text/css" rel="stylesheet" href="/css/v4/newstyles.css" />
<!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="/css/v4/studio-ie7.css" />
<![endif]-->
<!--[if IE 6]>
    <link rel="stylesheet" type="text/css" href="/css/v4/studio-ie6.css" />
<![endif]-->
<!-- external stylesheet -->
<link rel="stylesheet" href="/css/memberProfile.css"/>
<link rel="stylesheet" href="/css/jqtransform.css"/>


<% } else if (key.equals("tc_studio_forums")) { %>
<link type="text/css" rel="stylesheet" href="/css/v4/main.css" />
<link type="text/css" rel="stylesheet" href="/css/forums.css" />
<link type="text/css" rel="stylesheet" href="/css/v4/studio-navigation.css" />
<link type="text/css" rel="stylesheet" href="/css/v4/newstyles.css" />
<!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="/css/v4/studio-ie7.css" />
<![endif]-->
<!--[if IE 6]>
    <link rel="stylesheet" type="text/css" href="/css/v4/studio-ie6.css" />
<![endif]-->
<% } else if (key.equals("studio_digitalrun")) { %>
<link type="text/css" rel="stylesheet" href="/css/v4/main.css" />
<link type="text/css" rel="stylesheet" href="/css/digitalrun/main.css" />
<link type="text/css" rel="stylesheet" href="/css/v4/studio-navigation.css" />
<link type="text/css" rel="stylesheet" href="/css/v4/newstyles.css" />
<!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="/css/v4/studio-ie7.css" />
<![endif]-->
<!--[if IE 6]>
    <link rel="stylesheet" type="text/css" href="/css/v4/studio-ie6.css" />
<![endif]-->
<% } else if (key.equals("studio_portfolio")) { %>
<link type="text/css" rel="stylesheet" href="/css/v4/main.css" />
<link type="text/css" rel="stylesheet" href="/css/portfolio/portfolio_style.css" />
<link type="text/css" rel="stylesheet" href="/css/v4/studio-navigation.css" />
<link type="text/css" rel="stylesheet" href="/css/v4/newstyles.css" />
<link type="text/css" rel="stylesheet" href="/css/portfolio/thickbox.css" />
<!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="/css/v4/studio-ie7.css" />
<![endif]-->
<!--[if IE 6]>
    <link rel="stylesheet" type="text/css" href="/css/v4/studio-ie6.css" />
<![endif]-->
<% } else if (key.equals("csf")) { %>
<link type="text/css" rel="stylesheet" href="/css/main.css" />
<% } else if (key.equals("csfforums")) { %>
<link type="text/css" rel="stylesheet" href="/css/main.css" />
<link type="text/css" rel="stylesheet" href="/css/forums.css" />
<% } else if (key.equals("tc_pressroom")) { %>
<link type="text/css" rel="stylesheet" href="/css/tcStyles20080219.css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css" />
<link type="text/css" rel="stylesheet" href="/css/pressroomRemix.css" />
<% } else if (key.equals("digitalrun")) { %>
<link type="text/css" rel="stylesheet" href="/css/digitalrun/main.css" />
<link type="text/css" rel="stylesheet" href="/css/tcStyles20080219.css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css" />
<% } else if (key.equals("tc_ep")) { %>
<link type="text/css" rel="stylesheet" href="/css/ep/main.css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css" />
<% } else if (key.equals("tc_openaim")) { %>
<link type="text/css" rel="stylesheet" href="/css/openaim/main20080416.css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css" />
<% } else if (key.equals("tc_openaim_forums")) { %>
<link type="text/css" rel="stylesheet" href="/css/openaim/forums.css" />
<link type="text/css" rel="stylesheet" href="/css/openaim/main20080416.css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css" />
<% } else if (key.equals("tc_truveo")) { %>
<link type="text/css" rel="stylesheet" href="/css/truveo/main.css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css" />
<% } else if (key.equals("tc_truveo_forums")) { %>
<link type="text/css" rel="stylesheet" href="/css/truveo/forums.css" />
<link type="text/css" rel="stylesheet" href="/css/truveo/main.css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css" />
<% } else if (key.equals("tc_winformula")) { %>
<link type="text/css" rel="stylesheet" href="/css/winformula/screen.css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css" />
<% } else if (key.equals("tc_winformula_forums")) { %>
<link type="text/css" rel="stylesheet" href="/css/winformula/forums.css" />
<link type="text/css" rel="stylesheet" href="/css/winformula/screen.css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css" />
<% } %>
