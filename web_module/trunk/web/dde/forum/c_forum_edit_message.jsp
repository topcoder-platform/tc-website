<%@ page import="javax.naming.*" %>
<%@ page import="javax.ejb.CreateException" %>
<%@ page import="java.io.*" %>
<%@ page import="java.rmi.*" %>
<%@ page import="javax.rmi.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.reflect.*" %>

<%@ include file="/includes/util.jsp" %>
<%@ include file="/includes/session.jsp" %>

<%
    // STANDARD PAGE VARIABLES
    String page_name = "c_forum_edit_message.jsp";
    String action = request.getParameter("a");
    String namespace = "com.topcoder.servlet.request.FileUpload";
%>

<% // PAGE SPECIFIC DECLARATIONS%>
<%@ page import="com.topcoder.forum.*" %>
<%@ page import="com.topcoder.dde.catalog.*" %>
<%@ page import="com.topcoder.dde.forum.*" %>
<%@ page import="java.text.*" %>
<%@ page import = "com.topcoder.util.config.*" %>
<%@ page import = "com.topcoder.servlet.request.*" %>
<%@ page import="com.topcoder.dde.notification.Notification" %>
<%@ page import="com.topcoder.dde.notification.NotificationHome" %>

<% //@ include file="/includes/forumUtils.jsp" %>

<%@ page import="java.text.SimpleDateFormat" %>
<%!
    private static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm a");

    String textToHtml(String txt) {
        StringBuffer out = new StringBuffer();
        boolean leading = true;
        for (int i=0; i<txt.length(); i++) {
            char ch = txt.charAt(i);
            switch(ch) {
                case ' ':
                    if (leading) {
                        out.append("&nbsp;");
                    } else {
                        out.append(ch);
                        leading = false;
                    }
                    break;
                case '<':
                    out.append("&lt;");
                    leading = false;
                    break;
                case '>':
                    out.append("&gt;");
                    leading = false;
                    break;
                case '&':
                    out.append("&amp;");
                    leading = false;
                    break;
                case '\n':
                    out.append("<br />");
                    leading = true;
                    break;
                case '\r':
                    break;
                default:
                    out.append(ch);
                    leading = false;
                    break;
            }
        }
        return out.toString();
    }
%>

<%!
    public static final int MAX_MSG_LENGTH = 1024*16;

    MessageFormat replyFormat = new MessageFormat("\n\n     =====================================\n     On {0} {1} wrote:\n     {2}");

%>

<%
    if (tcUser == null) {
        session.setAttribute("nav_redirect_msg", "You must login to post a message");
        response.sendRedirect("/login.jsp");
        return;
    }

    /////////////////////////////////////////////
    //Get parameter data;
    /////////////////////////////////////////////

    long forumId = 0;
    long threadId = 0;
    long postId = 0;
    long replyId = 0;
    String msg = "";
    Iterator fileAttachments = null;
    String pathAttachments = "";
    String rootDir = "";

    if (request.getMethod().equals("POST")) {
        try {
            debug.addMsg("post message", "file upload processing with directory '" + pathAttachments + "' ...");

            FileUpload fu = new FileUpload(request, false);
            //strMessage += "File was uploaded.";

            debug.addMsg("post message", "file upload processed");
            try {
                    forumId = Long.parseLong(fu.getParameter("f"));
            } catch (NumberFormatException nfe) {
            }

            try {
                threadId = Long.parseLong(fu.getParameter("r"));
            } catch (NumberFormatException nfe) {
                response.sendRedirect("/forum/c_forum.jsp?f="+forumId);
                return;
            }

            try {
                postId = Long.parseLong(fu.getParameter("p"));
            } catch (NumberFormatException nfe) {
            }

            try {
                replyId = Long.parseLong(fu.getParameter("rp"));
            } catch (NumberFormatException nfe) {
            }

            // Get attachments for post and normal request parameters
            fileAttachments = fu.getAllUploadedFiles();
            action = fu.getParameter("a");
            msg = fu.getParameter("taMessage");

            DDEForumHome ddeforumhome = (DDEForumHome) PortableRemoteObject.narrow(
                    CONTEXT.lookup(DDEForumHome.EJB_REF_NAME), DDEForumHome.class);
            DDEForum ddeforum = ddeforumhome.create();
            ForumComponent forumComponent = ddeforum.getLinkedComponent(forumId);

            rootDir = fu.getCurrentDefaultDir();
            if (!rootDir.endsWith("/")) {
                rootDir += "/";
            }
            pathAttachments += forumComponent.getComponentId() + "/";
            pathAttachments += forumComponent.getVersionId() + "/";
            pathAttachments += threadId + "/";

        } catch (FileSizeLimitExceededException fe) {
            //strError += "File size exceeds limit: " + fe.getMessage();
            debug.addMsg("post message", "File size exceeds limit: " + fe.getMessage());
        } catch (DisallowedDirectoryException dde) {
            //strError += "Directory access is denied: " + dde.getMessage();
            debug.addMsg("post message", "Directory access is denied: " + dde.getMessage());
        } catch (ConfigManagerException e) {
            //strError += "ConfigManager exception occurred: " + e.getMessage();
            debug.addMsg("post message", "ConfigManager exception occurred: " + e.getMessage());
        } catch (InvalidContentTypeException icte) {
            debug.addMsg("post message", "invalid content type");
            try {
                forumId = Long.parseLong(request.getParameter("f"));
            } catch (NumberFormatException nfe) {
            }

            try {
                threadId = Long.parseLong(request.getParameter("r"));
            } catch (NumberFormatException nfe) {
                response.sendRedirect("/forum/c_forum.jsp?f="+forumId);
                return;
            }

            try {
                postId = Long.parseLong(request.getParameter("p"));
            } catch (NumberFormatException nfe) {
            }

            try {
                replyId = Long.parseLong(request.getParameter("rp"));
            } catch (NumberFormatException nfe) {
            }
            msg = request.getParameter("taMessage");
        }
    } else {
        debug.addMsg("post message", "normal content");
        try {
            forumId = Long.parseLong(request.getParameter("f"));
        } catch (NumberFormatException nfe) {
        }

        try {
            threadId = Long.parseLong(request.getParameter("r"));
        } catch (NumberFormatException nfe) {
            response.sendRedirect("/forum/c_forum.jsp?f="+forumId);
            return;
        }

        try {
            postId = Long.parseLong(request.getParameter("p"));
        } catch (NumberFormatException nfe) {
        }

        try {
            replyId = Long.parseLong(request.getParameter("rp"));
        } catch (NumberFormatException nfe) {
        }
        msg = request.getParameter("taMessage");
    }

    DDEForumHome ddeforumhome = (DDEForumHome) PortableRemoteObject.narrow(
            CONTEXT.lookup(DDEForumHome.EJB_REF_NAME), DDEForumHome.class);
    DDEForum ddeforum = ddeforumhome.create();

    ForumRemoteHome forumHome = (ForumRemoteHome) PortableRemoteObject.narrow(
            CONTEXT.lookup(ForumRemoteHome.EJB_REF_NAME), ForumRemoteHome.class);
    ForumRemote forumBean = forumHome.create();


    /////////////////////////////////////////////
    //Check for permissions
    /////////////////////////////////////////////
    boolean canPost = false;
    boolean canModerate = false;
    boolean loggedOn = (tcUser != null);
    int forumType = 0;
    long specForumId = 0;
    long collabForumId = 0;
    long prevThreadId = 0;
    long nextThreadId = 0;

    if (loggedOn) {
        canPost = ddeforum.canPost(forumId,tcSubject);
        canModerate = ddeforum.canModerate(forumId,tcSubject);
    }


    /////////////////////////////////////////////
    //Get linked component information
    /////////////////////////////////////////////
    ForumComponent forumComponent = ddeforum.getLinkedComponent(forumId);
    collabForumId = forumComponent.getCollabForumId();
    specForumId = forumComponent.getSpecForumId();
    if (forumId == collabForumId) {
        forumType = com.topcoder.dde.catalog.Forum.COLLABORATION;
    } else {
        forumType = com.topcoder.dde.catalog.Forum.SPECIFICATION;
    }

    if (forumType == com.topcoder.dde.catalog.Forum.SPECIFICATION) {
        if (!loggedOn) {
            //Redirect to logon page
            session.putValue("nav_redirect_msg", "You must login to view the specification forum");
            response.sendRedirect("/login.jsp");
            return;
        } else if (!canPost) {
            //Redirect to permission page
            response.sendRedirect("/forum/s_spec_permission.jsp");
            return;
        }
    } else if (forumType == com.topcoder.dde.catalog.Forum.COLLABORATION) {
        //Handle any collaboration specific logic here.
    } else {
        //Handle Error here
    }

    /////////////////////////////////////////////
    //Process actions
    /////////////////////////////////////////////

    com.topcoder.forum.Thread thread = forumBean.getThread(threadId);

    Post post = null;
    if (postId != 0) {
        post = forumBean.getPost(postId);
    }

    Post reply = null;
    if (replyId != 0) {
        reply = forumBean.getPost(replyId);
    }

    String strError = "";
    if (msg == null) {
        if (post != null) {
            msg = post.getText();
        } else {
            msg = "";
        }
    }
    if (msg.length() > MAX_MSG_LENGTH) {
        msg = msg.substring(0, MAX_MSG_LENGTH-1);
    }

    // process action
    if (action == null) {
        action = "new";
    } else if (action.equalsIgnoreCase("post reply")) {
        if (msg.length() > 0 && msg.length() <= MAX_MSG_LENGTH) {
            Post newPost = new Post();

            newPost.setText(msg);
            newPost.setUserId(tcUser.getId());

            //Create the directories if they do not already exist.
            new File(rootDir + pathAttachments).mkdirs();

            boolean error = false;

            // handle attachments
            while (fileAttachments.hasNext()) {
                UploadedFile uf = (UploadedFile)fileAttachments.next();
                InputStream is = uf.getInputStream();
                String url = pathAttachments + uf.getRemoteFileName();
                File f = new File(rootDir + url);
                if (!f.exists()) {
                    FileOutputStream fos = new FileOutputStream(f);
                    int b = is.read();
                    while (b != -1) {
                        fos.write(b);
                        b = is.read();
                    }
                    fos.close();
                    is.close();

                    Attachment attach = new Attachment();
                    attach.setName(uf.getRemoteFileName());
                    attach.setUrl(url);
                    newPost.addAttachment(attach);

                } else {
                    error = true;
                    strError = "File " + f.getName() + " already exists.  ";
                    break;
                }
            }
            if (!error) {
                if (reply.getId() == thread.getInitialPostId()) {
                    forumBean.createPost(thread, newPost);
                } else {
                    forumBean.createPost(reply, newPost);
                }

		NotificationHome notificationHome = (NotificationHome)
			    PortableRemoteObject.narrow(
			    CONTEXT.lookup(NotificationHome.EJB_REF_NAME),
			    NotificationHome.class);

		Notification notification = notificationHome.create();

		Properties prop = new Properties();
		prop.setProperty(notification.IS_NEW_THREAD, "0" );
		prop.setProperty(notification.COMPONENT_NAME,forumComponent.getName());
		prop.setProperty(notification.THREAD_NAME, thread.getSubject());
		prop.setProperty(notification.WRITER_NAME, tcUser.getRegInfo().getUsername());
		prop.setProperty(notification.LINK, "/forum/c_forum_message.jsp?f=" + forumId + "&r=" + threadId);
		notification.notifyEvent("com.topcoder.dde.forum.ForumPostEvent " + forumId, prop);

                response.sendRedirect("/forum/c_forum_message.jsp?f="+forumId+"&r="+threadId);
                return;
            }
        } else if (msg.length() >= MAX_MSG_LENGTH) {
            strError = "Message connot exceed " + MAX_MSG_LENGTH + " characters";
        } else {
            strError = "Message cannot be empty.";
        }
    } else if (action.equalsIgnoreCase("save")) {
        post.setText(msg);
        // handle attachments

        boolean error = false;

        if (fileAttachments.hasNext()) {
            //Delete any previous attachments
            Iterator itr = post.attachmentIterator();
            while (itr.hasNext()) {
                File f = new File(rootDir + ((Attachment)itr.next()).getUrl());
                f.delete();
            }
            post.clearAttachments();

            //Create the directories if they do not already exist.
            new File(rootDir + pathAttachments).mkdirs();

            while (fileAttachments.hasNext()) {
                UploadedFile uf = (UploadedFile)fileAttachments.next();
                InputStream is = uf.getInputStream();
                String url = pathAttachments + uf.getRemoteFileName();
                File f = new File(rootDir + url);
                if (!f.exists()) {
                    FileOutputStream fos = new FileOutputStream(f);
                    int b = is.read();
                    while (b != -1) {
                        fos.write(b);
                        b = is.read();
                    }
                    fos.close();
                    is.close();

                    Attachment attach = new Attachment();
                    attach.setName(uf.getRemoteFileName());
                    attach.setUrl(url);
                    post.addAttachment(attach);
                } else {
                    error = true;
                    strError = "File " + f.getName() + " already exists.  ";
                    break;
                }
            }
        }
        if (!error) {
            forumBean.updatePost(post);
            response.sendRedirect("/forum/c_forum_message.jsp?f="+forumId+"&r="+threadId);
            return;
        }
    }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/2000/REC-xhtml1-20000126/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Edit Message for the <%=forumComponent.getName()%> version <%=forumComponent.getVersionText()%> Forum at TopCoder Software</title>

<link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />
<script language="JavaScript" src="/scripts/javascript.js"></script>
<script>
function textLimit(field, maxlen) {
  if (field.value.length > maxlen) {
    //alert('your input has been truncated!');
    field.value = field.value.substring(0, maxlen);
  }
}
</script>
</head>

<body class="body" marginheight="0" marginwidth="0" onLoad="frmMessage.taMessage.focus()">

<!-- Header begins -->
<jsp:include page="/includes/top.jsp"/>
<jsp:include page="/includes/menu.jsp" >
    <jsp:param name="isSoftwarePage" value="true"/>
</jsp:include>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="middle">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="180" class="leftColumn">
            <jsp:include page="/includes/left.jsp" >
                <jsp:param name="level1" value="forum"/>
                <jsp:param name="level2" value="customer"/>
            </jsp:include>
        </td>
<!-- Left Column ends -->

<!-- Gutter begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0"></td>
<!-- Gutter ends -->

<!-- Middle Column begins -->
        <td width="99%">
            <%@ include file="/includes/forumTitle.jsp" %>

          <form name="frmMessage" action="<%=page_name%>" enctype="multipart/form-data" method="post">
           <input type="hidden" name="f" value="<%=forumId%>">
           <input type="hidden" name="r" value="<%=threadId%>">
           <input type="hidden" name="p" value="<%=postId%>">
           <input type="hidden" name="rp" value="<%=replyId%>">
            <table width="100%" cellpadding="0" cellspacing="1" border="0" class="forumBkgd" align="center">
                <tr valign="top">

<!-- Reply -->
                    <td class="forumTextCenterEven" width="100%">
                        <div align="center">
                        <table cellpadding="0" cellspacing="0" border="0">
<!-- Message error text begins -->
                            <tr valign="top"><td class="errorText"><%=strError%></td></tr>
<!-- Message error text ends -->
                            <tr valign="top">
                                <td class="forumText">
                                    <p><strong>Message</strong></p>
                                    <p><textarea class="adminControlForm" name="taMessage" rows="24" cols="90" onKeyUp="textLimit(this.form.taMessage,<%=MAX_MSG_LENGTH%>)"><%=msg%></textarea></p>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        </div>
                        </td>
                </tr>

<!-- Original -->
<%  if (reply != null) { %>
                <tr valign="top">
                    <td class="forumSubjectCenter" width="100%">
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr valign="top">
                                <td class="forumText">
                                    <p><strong>Original</strong></p>
                                    <p><strong>In response to message posted on <%=dateFormat.format(reply.getCreateTime())%> EST by <%=reply.getUsername()%></strong></p>
                                    <p><%=textToHtml(reply.getText())%></p>
                                    &nbsp;</td>
                            </tr>
                        </table></td>
                </tr>
<%  } %>

<!-- Attachments -->
<%  if (canModerate) { %>
                <tr>
                    <td class="forumTextCenterEven" width="100%">
                        <div align="center">
                        <table cellpadding="0" cellspacing="2" border="0">
                            <tr><td class="forumTextEven"><strong>Attach up to 3 downloadable files to this Reply</strong></td></tr>
                            <tr><td class="forumText"><input type="file" name="file1" size="30" /></td></tr>
                            <tr><td class="forumText"><input type="file" name="file2" size="30" /></td></tr>
                            <tr><td class="forumText"><input type="file" name="file3" size="30" /></td></tr>
                        </table>
                        </div>
                        </td>
                </tr>
<%  } %>

<%  if (post!=null) { %>
                <tr><td class="adminControl" width="100%">
                    <img src="/images/clear.gif" alt="" width="5" height="5" border="0"><br>
                    <input class="adminControlButton" type="submit" name="a" value="Save"></input><br>
                    <img src="/images/clear.gif" alt="" width="5" height="5" border="0">
                </td></tr>

<%  } else { %>
                <tr><td class="adminControl" width="100%">
                    <img src="/images/clear.gif" alt="" width="5" height="5" border="0"><br>
                    <input class="adminControlButton" type="submit" name="a" value="Post Reply"></input><br>
                    <img src="/images/clear.gif" alt="" width="5" height="5" border="0">
                </td></tr>

<%  } %>
            </table>
</form>


            <table width="100%" cellpadding="0" cellspacing="0" border="0" class="middle">
                <tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
            </table>
        </td>
<!-- Middle Column ends -->

<!-- Gutter 3 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 3 ends -->
    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="/includes/foot.jsp" flush="true" />
<!-- Footer ends -->

</body>
</html>
