<% response.setContentType("text/xml; charset=" + JiveGlobals.getCharacterEncoding()); %><?xml version="1.0" encoding="<%= JiveGlobals.getCharacterEncoding() %>"?>

<%@ page import="com.jivesoftware.base.JiveGlobals,
                 com.jivesoftware.base.action.rss.RSSActionSupport,
                 com.jivesoftware.forum.ForumCategory,
                 com.jivesoftware.util.StringUtils,
                 com.topcoder.web.forums.ForumConstants,
                 java.text.SimpleDateFormat,
                 java.util.Date,
                 java.util.Iterator"
         contentType="text/xml"
%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%  SimpleDateFormat formatter = new SimpleDateFormat(RSSActionSupport.DATE_FORMAT); 
    ForumCategory category = (ForumCategory)request.getAttribute("category"); %>

<rss version="2.0" 
    xmlns:jf="http://www.jivesoftware.com/xmlns/jiveforums/rss"
    xmlns:dc="http://purl.org/dc/elements/1.1/">

<channel>
    <title><%= com.jivesoftware.forum.util.SkinUtils.getCommunityName() %> RSS Feed</title>
    <link><%=sessionInfo.getAbsoluteServletPath()%></link>
    <description>Most recent forum messages</description>
    <language><%= JiveGlobals.getLocale().getLanguage() %></language>
    <pubDate><%= formatter.format(new Date()) %></pubDate>

    <tc-webtag:iterator id="message" type="com.jivesoftware.forum.ForumMessage" iterator='<%=(Iterator)request.getAttribute("messages")%>'>
       <%   if (category == null || category.getID() != 1 || !"true".equals(message.getForum().getForumCategory().getProperty(ForumConstants.PROPERTY_HIDE_MAIN_RSS))) { %>
       <item>
           <title><%= StringUtils.escapeForXML(message.getSubject()) %></title>
           <link><%=sessionInfo.getAbsoluteServletPath()%>?module=Message&amp;<%=ForumConstants.MESSAGE_ID%>=<%=message.getID()%></link>
           <description><![CDATA[<%= message.getBody() %>]]></description>
           <dc:creator><%= message.getUser().getUsername() %></dc:creator>
           <category><![CDATA[<%= message.getForum().getName() %>]]></category>
           <pubDate><%= formatter.format(message.getCreationDate()) %></pubDate>
           <jf:creationDate><%= formatter.format(message.getCreationDate()) %></jf:creationDate>
           <jf:modificationDate><%= formatter.format(message.getModificationDate()) %></jf:modificationDate>
           <jf:author><%= message.getUser().getUsername() %></jf:author>
           <jf:replyCount><%= (message.getForumThread().getTreeWalker().getChildCount(message)) %></jf:replyCount>
       </item>
       <%   } %>
    </tc-webtag:iterator>

</channel>
</rss>