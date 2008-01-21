<%@ page import="java.util.Date"%>
<%@ page contentType="text/xml;charset=utf-8" %>
<?xml version="1.0" encoding="utf-8"?>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />



<rss version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/">

<channel>
    <title>${title} RSS Feed</title>
    <link><%=sessionInfo.getAbsoluteServletPath()%></link>
    <description>Most recent forum messages</description>
    <language>en-us</language>
    <pubDate><fmt:formatDate value="<%=new Date()%>" pattern="E, d MMM yyyy HH:mm:ss"/></pubDate>

<rsc:iterator list="${affidavits}" id="resultRow">
 <item>
           <title>${resultRow.map['title']}</title>
           <link>${resultRow.map['title']}</link>
           <description><![CDATA[${resultRow.map['title']}]]></description>
           <% if (resultRow.isValidColumn("pub_date")) {%>
                <rsc:item name="pub_date" row="<%=resultRow%>" format="E, d MMM yyyy HH:mm:ss"/>
           <% } else { %>
                <fmt:formatDate value="<%=new Date()%>" pattern="E, d MMM yyyy HH:mm:ss"/>
           <% } %>

       </item>
    </rsc:iterator>

</channel>
</rss>