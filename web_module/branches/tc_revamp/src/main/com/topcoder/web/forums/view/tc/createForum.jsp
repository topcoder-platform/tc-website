<%@ page import="com.jivesoftware.forum.Forum,
                com.topcoder.web.common.BaseProcessor,
                com.topcoder.web.forums.ForumConstants,
                com.topcoder.web.forums.controller.ForumsUtil,
                java.util.HashMap"
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forumCategory" name="forumCategory" type="com.jivesoftware.forum.ForumCategory" toScope="request"/>
<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="postMode" name="postMode" type="java.lang.String" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%  Forum forum = (Forum)request.getAttribute("forum");
    HashMap errors = (HashMap)request.getAttribute(BaseProcessor.ERRORS_KEY); %>

<script type="text/javascript">
function noenter(e)
{
    var k = (window.event)? event.keyCode: e.which;
    return !(k == 13);
}

function AllowTabCharacter() {
    // IE only
    if (navigator.appName.indexOf('Microsoft') != -1) {
        if (event != null) {
            if (event.srcElement) {
                if (event.srcElement.value) {
                    if (event.keyCode == 9) {  // tab character
                        if (document.selection != null) {
                            document.selection.createRange().text = '\t';
                            event.returnValue = false;
                        } else {
                            event.srcElement.value += '\t';
                            return false;
                        }
                    }
                }
            }
        }
    }
}
</script>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<title>TopCoder Forums</title>
    <jsp:include page="script.jsp" />
        <jsp:include page="/style.jsp">
          <jsp:param name="key" value="tc_forums"/>
        </jsp:include>

</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="forums"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
      <td width="180">
          <jsp:include page="includes/global_left.jsp">
             <jsp:param name="node" value="forums"/>
          </jsp:include>
      </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<%  String postHeading = "";
    String postDesc = "";

   if (postMode.equals("New")) {
      postHeading = "New Forum";
      postDesc = "Create a new forum";
   } else if (postMode.equals("Edit")) {
      String editName = forum.getName();
      if (!editName.startsWith("Edit: ")) {
           editName = "Edit: " + editName;
        }
      postHeading = editName;
      postDesc = "Edit forum";
   } %>

        <td width="100%" class="rtBody">

        <jsp:include page="page_title.jsp" >
            <jsp:param name="image" value="forums"/>
            <jsp:param name="title" value="<%=postDesc%>"/>
        </jsp:include>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
    <tr>
       <td class="categoriesBox" style="padding-right: 20px;">
          <jsp:include page="categoriesHeader.jsp" />
       </td>
       <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
           <jsp:include page="searchHeader.jsp" />
       </td>
    </tr>
    
    <tr>
        <td colspan="2" style="padding-bottom:3px;"><b>
           <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forumCategory)%>'>
                <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></A> <img src="/i/interface/exp_w.gif" align="absmiddle"/>
           </tc-webtag:iterator>
             <%=postHeading%>
           </b>
       </td>
    </tr>
</table>

<br>
<table cellpadding="0" cellspacing="0" class="rtTable" width=100%>
<form name="form1" method="post" action="<%=sessionInfo.getServletPath()%>">
<tc-webtag:hiddenInput name="module"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.STATUS%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.CATEGORY_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.FORUM_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.POST_MODE%>"/>
    <tr>
        <td class="rtHeader">
            <%=postHeading%>
        </td>
    </tr>
    
    <tr>
        <td class="rtTextCell100">
        <%  if (errors.get(ForumConstants.FORUM_NAME) != null) { %><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.FORUM_NAME%>"><%=err%><br/></tc-webtag:errorIterator></span><% } %>
        <b>Name:</b><br/><tc-webtag:textInput size="60" name="<%=ForumConstants.FORUM_NAME%>" escapeHtml="false" onKeyPress="return noenter(event)"/><br/><br/>
        <%  if (errors.get(ForumConstants.FORUM_DESCRIPTION) != null) { %><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.FORUM_DESCRIPTION%>"><%=err%><br/></tc-webtag:errorIterator></span><% } %>
        <b>Description:</b></font><br/><tc-webtag:textArea id="tcPostArea" rows="15" cols="72" name="<%=ForumConstants.FORUM_DESCRIPTION%>" onKeyDown="AllowTabCharacter()"/>
        </td>
    </tr>
    
    <tr>
        <td class="rtFooter">
            <input type="image" src="/i/roundTables/post.gif" class="rtButton" alt="Post" onclick="form1.module.value='CreateForum';form1.<%=ForumConstants.STATUS%>.value='<%=ForumConstants.STATUS_CREATE%>'"/>
        </td>
    </tr>
</form>
</table>

<div style="clear:both;">&nbsp;</div>

        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>