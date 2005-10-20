<%@ page contentType="text/html"%>

<%
    String key = request.getParameter("key");
%>
    <% if (key.equals("tc_old")) { %>
        <link type="text/css" rel="stylesheet" href="/css/style.css"/>
        <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
        <link type="text/css" rel="stylesheet" href="/css/TCOstyle.css"/>
    <% } else if (key.equals("tc_main")) { %>
        <link type="text/css" rel="stylesheet" href="/css/style.css"/>
        <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
        <link type="text/css" rel="stylesheet" href="/css/TCOstyle.css"/>
        <link type="text/css" rel="stylesheet" href="/css/tcStyles.css"/>
    <% } %>
