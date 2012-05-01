<%@ page import="com.jivesoftware.forum.Forum,
                com.jivesoftware.forum.ForumCategory,
                com.topcoder.web.common.BaseProcessor,
                com.topcoder.web.forums.ForumConstants,
                com.topcoder.web.forums.controller.ForumsUtil,
                java.util.HashMap"
%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="announcement" name="announcement" type="com.jivesoftware.forum.Announcement" toScope="request"/>
<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="postMode" name="postMode" type="java.lang.String" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%  ForumCategory forumCategory = (ForumCategory)request.getAttribute("category");
    Forum forum = (Forum)request.getAttribute("forum");
    HashMap errors = (HashMap)request.getAttribute(BaseProcessor.ERRORS_KEY); 
    
    String level2val = "";
    if (forumCategory != null) {
        level2val = forumCategory.getProperty(ForumConstants.PROPERTY_LEFT_NAV_NAME);
    }   %>

<script type="text/javascript">
function noenter(e)
{
  var k = (window.event)? event.keyCode: e.which;
  return !(k == 13);
}

function toggle(targetId)
{
    target = document.getElementById(targetId);
    if (target.style.display == "none") {
        target.style.display="";
    } else {
        target.style.display="none";
    }
}

// IE only
function AllowTabCharacter() {
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
</script>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>TopCoder Studio</title>

	<jsp:include page="style.jsp">
		<jsp:param name="key" value="tc_studio_forums"/>
	</jsp:include>
	
	<script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
	<script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
			$(document).ready(function(){
				//Run the script to preload images from CSS
				$.preloadCssImages(); 
			});
	</script>
	<script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
	<script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
	<script type="text/javascript" language="javascript">

	$(document).ready(function(){
	
	
		$("#nav ul li").hoverIntent(function(){
			$(this).children("ul").slideDown("fast");
		}, function() {
			$(this).children("ul").slideUp("fast");
		});
		
		$("#nav ul ul li").hover(function() {
			$(this).parents("#nav ul li").children('a').addClass("active-item");
		}, function() {
			$(this).parents("#nav ul li").children('a').removeClass("active-item");
		});
	
	
	});
	</script>
</head>

<body>
	<div id="page-wrap">
    	<div align="center">
			<jsp:include page="top.jsp">
            <jsp:param name="section" value="forums" />
        </jsp:include>
        <br />
        <!-- container -->
        <div id="container">
            <!-- content -->
           <div id="wrapper">
            	<div id="content">
                	<div class="contentTop">
                	<h1>Forums</h1>
                	<div class="contentMiddle forums">

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr>
   <td class="categoriesBox" style="padding-right: 20px;">
      <jsp:include page="categoriesHeader.jsp" />
   </td>
   <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
      <jsp:include page="searchHeader.jsp" />
    </td>
    <td align="right" nowrap="nowrap" valign="top">
        <a href="?module=History" class="rtbcLink">My Post History</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Watches" class="rtbcLink">My Watches</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Settings" class="rtbcLink">User Settings</a><br />
    </td>
</tr>
<tr>
   <td colspan="3" style="padding:15px 0 3px 0;"><b>
	   <%   ForumCategory crumbCategory = forumCategory;
	        if (crumbCategory == null) {
	            crumbCategory = forumFactory.getRootForumCategory();
	        }   %>
	   <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(crumbCategory)%>'>
	        <a href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></a> > 
	   </tc-webtag:iterator>
	   <%   if (forum != null) { %>
	        <a href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&mc=<%=forum.getMessageCount()%>" class="rtbcLink"><%=forum.getName()%></a>
	   <%   } %>
	   > <%=announcement.getSubject()%></b>
   </td>
   <!--<td align="right" class="rtbc"><a href="javascript:toggle('Options')" class="rtbcLink">Options</a></td>-->
</tr>
</table>

<br /><div id="Options"><span class="small">Allowed tags: <%=ForumsUtil.getAllowedTagsDisplay()%>. Allowed attributes: <%=ForumsUtil.getAllowedAttributesDisplay()%>. <!--Usernames within [handle][/handle] blocks are converted into color-coded links.--></span></div><br />
<table cellpadding="0" cellspacing="0" class="rtTable">
   <tr>
        <td class="rtHeader" colspan="2">
            <div valign="top" style="float: right; padding-left: 5px; white-space: nowrap;">
               <a style="text-decoration: none;" name=<%=announcement.getID()%>><tc-webtag:format object="${announcement.startDate}" format="MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/></a>
            </div>
            <%=announcement.getSubject()%>
        </td>
    </tr>
   <tr>
   <td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
   <%  if (ForumsUtil.displayMemberPhoto(user, user)) { %>
      <img src="<%=user.getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto" /><br />
   <%  } %>
   <span class="bodyText"><studio:handle coderId="<%=user.getID()%>"/></span><br /><a href="?module=History&<%=ForumConstants.USER_ID%>=<%=user.getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(user), "post")%></a></div></td>
   <td class="rtTextCell100"><%=announcement.getBody()%></td>
   </tr>
</table>

<h3>Edit Announcement</h3>
<table cellpadding="0" cellspacing="0" class="rtTable">
<form name="form1" method="post" action="<%=sessionInfo.getServletPath()%>">
	<tc-webtag:hiddenInput name="module"/>
	<tc-webtag:hiddenInput name="<%=ForumConstants.CATEGORY_ID%>"/>
	<tc-webtag:hiddenInput name="<%=ForumConstants.FORUM_ID%>"/>
	<tc-webtag:hiddenInput name="<%=ForumConstants.ANNOUNCEMENT_ID%>"/>
	<tc-webtag:hiddenInput name="<%=ForumConstants.POST_MODE%>"/>

	<tr>
		<td class="rtHeader" colspan="2"><%=announcement.getSubject()%></td>
	</tr>
	<tr>
		<td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
			<%  if (ForumsUtil.displayMemberPhoto(user, user)) { %>
			   <img src="<%=user.getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto" /><br />
			<%  } %>
			<span class="bodyText"><studio:handle coderId="<%=user.getID()%>"/></span><br /><a href="?module=History&<%=ForumConstants.USER_ID%>=<%=user.getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(user), "post")%></a></div>
		</td>
		<td class="rtTextCell100">
			<% if (errors.get(ForumConstants.ANNOUNCEMENT_SUBJECT) != null) { %><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.ANNOUNCEMENT_SUBJECT%>"><%=err%></tc-webtag:errorIterator><br /></span><% } %>
			<b>Subject:</b><br /><tc-webtag:textInput size="60" name="<%=ForumConstants.ANNOUNCEMENT_SUBJECT%>" escapeHtml="false" onKeyPress="return noenter(event)"/><br /><br />
			<% if (errors.get(ForumConstants.ANNOUNCEMENT_BODY) != null) { %><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.ANNOUNCEMENT_BODY%>"><%=err%></tc-webtag:errorIterator><br /></span><% } %>
			<b>Body:</b><font color="red"><span align="left" id="Warning" style="display: none"><br />Warning: one or more &lt;pre&gt; tags is not closed.</span></font>
			<br /><tc-webtag:textArea id="tcPreviewArea" rows="15" cols="60" name="<%=ForumConstants.ANNOUNCEMENT_BODY%>" onKeyDown="AllowTabCharacter()"/>
		</td>
	</tr>
	<tr>
		<td class="rtFooter">
			<input type="image" src="/i/v2/interface/btnPost.png" class="rtButton" alt="Post" onclick="form1.module.value='PostAnnouncement'"/>
			<input type="image" src="/i/v2/interface/btnPreview.png" class="rtButton" alt="Preview" onclick="form1.module.value='PreviewAnnouncement'"/>
			<%	String cancelLink = "?module=Main"; 
				if (forum != null) {
					cancelLink = "?module=ThreadList&"+ForumConstants.FORUM_ID+"="+forum.getID();
				} else if (forumCategory != null) {
					cancelLink = "?module=Category&"+ForumConstants.CATEGORY_ID+"="+forumCategory.getID();
				} %>
			<a href="<%=cancelLink%>"><img src="/i/v2/interface/btnCancel.png" alt="Cancel"/></a>
		</td>
	</tr>
</form>
</table>


                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>


        <jsp:include page="foot.jsp"/>


</body>
</html>