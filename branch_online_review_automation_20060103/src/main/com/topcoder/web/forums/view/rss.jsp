<% response.setContentType("text/xml; charset=" + JiveGlobals.getCharacterEncoding()); %><?xml version="1.0" encoding="<%= JiveGlobals.getCharacterEncoding() %>"?>

<%@ page import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.forums.ForumConstants,
                 com.jivesoftware.base.JiveGlobals,
                 com.jivesoftware.base.action.rss.RSSActionSupport,
                 com.jivesoftware.util.StringUtils,
                 java.util.*,
                 java.text.SimpleDateFormat"
         contentType="text/xml"
%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%  SimpleDateFormat formatter = new SimpleDateFormat(RSSActionSupport.DATE_FORMAT); %>

<rss version="2.0" xmlns:jf="http://www.jivesoftware.com/xmlns/jiveforums/rss">

<channel>
    <title><%= com.jivesoftware.forum.util.SkinUtils.getCommunityName() %> RSS Feed</title>
    <link><jsp:getProperty name="sessionInfo" property="absoluteServletPath"/></link>
    <description>Most recent forum messages</description>
    <language><%= JiveGlobals.getLocale().getLanguage() %></language>
    <pubDate><%= formatter.format(new Date()) %></pubDate>

    <tc-webtag:iterator id="message" type="com.jivesoftware.forum.ForumMessage" iterator='<%=(Iterator)request.getAttribute("messages")%>'>
       <item>
           <title><%= StringUtils.escapeForXML(message.getSubject()) %></title>
           <link><jsp:getProperty name="sessionInfo" property="absoluteServletPath"/>?module=Message&amp;<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="message" property="ID"/></link>
           <description><![CDATA[<%= message.getBody() %>]]></description>
           <jf:creationDate><%= formatter.format(message.getCreationDate()) %></jf:creationDate>
           <jf:modificationDate><%= formatter.format(message.getModificationDate()) %></jf:modificationDate>
           <jf:author><%= message.getUser().getUsername() %></jf:author>
           <jf:replyCount><%= (message.getForumThread().getTreeWalker().getChildCount(message)) %></jf:replyCount>
       </item>
    </tc-webtag:iterator>

</channel>
</rss>