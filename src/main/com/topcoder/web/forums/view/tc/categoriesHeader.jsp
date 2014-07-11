<%--
<%@ page import="com.jivesoftware.forum.ForumCategory,
                 com.jivesoftware.forum.ForumFactory,
                 com.jivesoftware.forum.ForumPermissions,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.forums.ForumConstants,
                 java.util.Iterator" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%     ForumFactory forumFactory = (ForumFactory)request.getAttribute("forumFactory"); %>

<%    Iterator itCategories = forumFactory.getRootForumCategory().getCategories(); 
    while (itCategories.hasNext()) {
        ForumCategory category = (ForumCategory)itCategories.next();
        String leftNavName = StringUtils.checkNull(category.getProperty(ForumConstants.PROPERTY_LEFT_NAV_NAME)); 
        if (!leftNavName.equals("") && category.isAuthorized(ForumPermissions.READ_FORUM)) { %>
            <A class="rtLinkOld" href="?module=Category&categoryID=<%=category.getID()%>"><%=category.getName()%></A><br>
        <%    } %>
<%    } %>
--%>

<%--
Iterating over the dynamic list above became very slow with the large number of forum categories we have now (seems to only reproduce for non-admin users).
So it has been replaced by this static list until the performance problem is solved.
--%>

<form name="jumpForum">
    <select name="menu" onChange="top.location.href=this.options[this.selectedIndex].value;" value="GO">
        <option selected="selected">Select a Forum &nbsp;&nbsp;&nbsp;</option>
        <option value="?module=Category&categoryID=13">Round Tables</option>
        <option value="?module=Category&categoryID=8">News Discussions</option>
        <option value="?module=Category&categoryID=14">Algorithm Matches</option>
        <option value="?module=Category&categoryID=17">Marathon Matches</option>
        <option value="?module=Category&categoryID=9169">NASA Tournament Lab</option>
        <option value="?module=Category&categoryID=4532">TopCoder Cookbook</option>
        <option value="?module=Category&categoryID=21">High School Matches</option>
        <option value="?module=Category&categoryID=6">Sponsor Discussions</option>
        <optgroup label="Challenges Forum">
            <option value="?module=Category&categoryID=22">Development Forums</option>
            <option value="?module=Category&categoryID=23250">Design Forums</option>
        </optgroup>
    </select>
</form>