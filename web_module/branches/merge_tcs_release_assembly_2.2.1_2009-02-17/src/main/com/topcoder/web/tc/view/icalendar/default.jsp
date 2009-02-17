<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%--
--%><%@ page contentType="text/xml;charset=utf-8" %><%--
--%><%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %><%--
--%><%@ taglib uri="rsc-taglib.tld" prefix="rsc" %><%--
--%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%--
--%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%--
--%>BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//TopCoder//Calendar Feed//EN
CALSCALE:GREGORIAN
BEGIN:VTIMEZONE
TZID:US/Eastern
LAST-MODIFIED:20081008T000000Z
BEGIN:STANDARD
DTSTART:20071104T020000
RRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=11
TZOFFSETFROM:-0400
TZOFFSETTO:-0500
TZNAME:EST
END:STANDARD
BEGIN:DAYLIGHT
DTSTART:20070311T020000
RRULE:FREQ=YEARLY;BYDAY=2SU;BYMONTH=3
TZOFFSETFROM:-0500
TZOFFSETTO:-0400
TZNAME:EDT
END:DAYLIGHT
END:VTIMEZONE
<rsc:iterator list="${results[param.c]}" id="resultRow"><%--
--%>BEGIN:VEVENT
UID:<c:out value="${fn:trim(resultRow.map['uid'])}" escapeXml="false"/>
DTSTART;TZID=US/Eastern:<c:out value="${fn:trim(resultRow.map['start_time'])}" escapeXml="false"/>
DTEND;TZID=US/Eastern:<c:out value="${fn:trim(resultRow.map['end_time'])}" escapeXml="false"/>
SUMMARY:<c:out value="${fn:trim(resultRow.map['summary'])}" escapeXml="false"/>
DESCRIPTION:<c:out value="${fn:trim(resultRow.map['description'])}" escapeXml="false"/>
URL:<c:out value="${fn:trim(resultRow.map['url'])}" escapeXml="false"/>
TRANSP:TRANSPARENT
END:VEVENT
</rsc:iterator><%--
--%>END:VCALENDAR
