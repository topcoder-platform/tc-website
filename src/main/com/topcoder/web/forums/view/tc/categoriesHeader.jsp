<%@ page import="com.jivesoftware.forum.ForumCategory,
                 com.jivesoftware.forum.ForumFactory,
                 com.jivesoftware.forum.ForumPermissions,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.forums.ForumConstants,
                 java.util.Iterator" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%     ForumFactory forumFactory = (ForumFactory)request.getAttribute("forumFactory"); %>
<%     String unreadCategories = request.getAttribute("unreadCategories") == null ? "" : (String)request.getAttribute("unreadCategories");%>

<%    Iterator itCategories = forumFactory.getRootForumCategory().getCategories(); 
    while (itCategories.hasNext()) {
        ForumCategory category = (ForumCategory)itCategories.next();
        String leftNavName = StringUtils.checkNull(category.getProperty(ForumConstants.PROPERTY_LEFT_NAV_NAME)); 
        if (!leftNavName.equals("") && category.isAuthorized(ForumPermissions.READ_FORUM)) { %>
            <A class="<%=(unreadCategories.indexOf(leftNavName)<0)?"rtLinkOld":"rtLinkBold"%>" href="?module=Category&categoryID=<%=category.getID()%>"><%=category.getName()%></A><br>
        <%    } %>
<%    } %>