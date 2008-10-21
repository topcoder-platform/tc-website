<?xml version="1.0" encoding="utf-8"?>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/xml;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<rss version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/">

    <channel>
        <title>${fn:trim(title)}</title>
        <link>
            <c:out value="${fn:trim(sessionInfo.absoluteServletPath)}" escapeXml="true"/>
        </link>
        <language>en-us</language>
        <pubDate>
            <fmt:formatDate value="<%=new Date()%>" pattern="E, d MMM yyyy HH:mm:ss"/>
        </pubDate>
        <rsc:iterator list="${results[param.c]}" id="resultRow">
            <item>
                <title>
                    <c:out value="${fn:trim(resultRow.map['title'])}" escapeXml="true"/>
                </title>
                <link>
                    <c:out value="${fn:trim(resultRow.map['link'])}" escapeXml="true"/>
                </link>
                <description>
                    <c:out value="${fn:trim(resultRow.map['description'])}" escapeXml="true"/>
                </description>
            </item>
        </rsc:iterator>

    </channel>
</rss>