<?xml version="1.0" encoding="utf-8"?>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date"%>
<%@ page contentType="text/xml;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<rss version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/">

<channel>
    <title>${title} RSS Feed</title>
    <link><c:out value="${sessionInfo.absoluteServletPath}" escapeXml="true"/></link>
<%--
    <description>Most recent forum messages</description>
--%>
    <language>en-us</language>
    <pubDate><fmt:formatDate value="<%=new Date()%>" pattern="E, d MMM yyyy HH:mm:ss"/></pubDate>

<rsc:iterator list="${results[param.c]}" id="resultRow">
 <item>
           <title><c:out value="${resultRow.map['title']}" escapeXml="true"/></title>
           <link><c:out value="${resultRow.map['link']}" escapeXml="true"/></link>
           <description><![CDATA[${resultRow.map['description']}]]></description>
           <% if (resultRow.isValidColumn("pub_date")) {%>
                <rsc:item name="pub_date" row="<%=resultRow%>" format="E, d MMM yyyy HH:mm:ss"/>
           <% } else { %>
                <fmt:formatDate value="<%=new Date()%>" pattern="E, d MMM yyyy HH:mm:ss"/>
           <% } %>

       </item>
    </rsc:iterator>

</channel>
</rss>