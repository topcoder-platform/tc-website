<%-- don't need this, there's only one category
<%@ page import="com.jivesoftware.forum.ForumCategory,
				 com.jivesoftware.forum.ForumFactory,
				 com.topcoder.web.common.StringUtils,
				 com.topcoder.web.forums.ForumConstants,
				 java.util.Iterator" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% 	ForumFactory forumFactory = (ForumFactory)request.getAttribute("forumFactory"); %>

<%	Iterator itCategories = forumFactory.getRootForumCategory().getCategories(); 
	while (itCategories.hasNext()) {
		ForumCategory category = (ForumCategory)itCategories.next();
		String leftNavName = StringUtils.checkNull(category.getProperty(ForumConstants.PROPERTY_LEFT_NAV_NAME)); 
		if (!leftNavName.equals("")) { %>
			<a class="rtLinkOld" href="?module=Category&categoryID=<%=category.getID()%>"><%=category.getName()%></a><br />
		<%	} %>
<%	} %>--%>
