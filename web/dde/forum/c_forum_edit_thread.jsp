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
    String page_name = "c_forum_edit_thread.jsp";
    String action = request.getParameter("a");
%>

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
    long topicId = 0;
    long threadId = 0;
    String msg = "";
    String subject = "";
    String strError = "";
    String pathAttachments = "";
    String rootDir = "";
    Iterator fileAttachments = null;

    if (request.getMethod().equals("POST")) {
        try {
            debug.addMsg("post thread", "file upload processing with directory '" + pathAttachments + "' ...");

            FileUpload fu = new FileUpload(request, false);
            //strMessage += "File was uploaded.";
            
            debug.addMsg("post thread", "file upload processed");
            try {
                forumId = Long.parseLong(fu.getParameter("f"));
            } catch (NumberFormatException nfe) {
                response.sendRedirect("/forum/c_active_collab.jsp");
                return;
            }

            try {
                topicId = Long.parseLong(fu.getParameter("t"));
            } catch (NumberFormatException nfe) {
            }

            try {
                threadId = Long.parseLong(fu.getParameter("r"));
            } catch (NumberFormatException nfe) {
            }

            // Get attachments for post and normal request parameters
            fileAttachments = fu.getAllUploadedFiles();
            action = fu.getParameter("a");
            msg = fu.getParameter("taMessage");
            subject = fu.getParameter("txtSubject");
            
            DDEForumHome ddeforumhome = (DDEForumHome) PortableRemoteObject.narrow(
                    CONTEXT.lookup(DDEForumHome.EJB_REF_NAME), DDEForumHome.class);
            DDEForum ddeforum = ddeforumhome.create();
            ForumComponent forumComponent = ddeforum.getLinkedComponent(forumId);
            
            rootDir = fu.getCurrentDefaultDir();
            if (!rootDir.endsWith("/")) {
                rootDir += "/"; 
            }
            pathAttachments = "" + forumComponent.getComponentId() + "/";
            pathAttachments += forumComponent.getVersionId() + "/";
            pathAttachments += threadId + "/";
            
        } catch (FileSizeLimitExceededException fe) {
            //strError += "File size exceeds limit: " + fe.getMessage();
            debug.addMsg("post thread", "File size exceeds limit: " + fe.getMessage());
        } catch (DisallowedDirectoryException dde) {
            //strError += "Directory access is denied: " + dde.getMessage();
            debug.addMsg("post thread", "Directory access is denied: " + dde.getMessage());
        } catch (ConfigManagerException e) {
            //strError += "ConfigManager exception occurred: " + e.getMessage();
            debug.addMsg("post thread", "ConfigManager exception occurred: " + e.getMessage());
        } catch (InvalidContentTypeException icte) {
            debug.addMsg("post thread", "invalid content type");
            try {
                forumId = Long.parseLong(request.getParameter("f"));
            } catch (NumberFormatException nfe) {
                response.sendRedirect("/forum/c_active_collab.jsp");
                return;
            }

            try {
                topicId = Long.parseLong(request.getParameter("t"));
            } catch (NumberFormatException nfe) {
            }

            try {
                threadId = Long.parseLong(request.getParameter("r"));
            } catch (NumberFormatException nfe) {
            }
            msg = request.getParameter("taMessage");
            subject = request.getParameter("txtSubject");
        }
    } else {
        debug.addMsg("post thread", "normal content");
        try {
            forumId = Long.parseLong(request.getParameter("f"));
        } catch (NumberFormatException nfe) {
            response.sendRedirect("/forum/c_active_collab.jsp");
            return;
        }

        try {
            topicId = Long.parseLong(request.getParameter("t"));
        } catch (NumberFormatException nfe) {
        }

        try {
            threadId = Long.parseLong(request.getParameter("r"));
        } catch (NumberFormatException nfe) {
        }
        msg = request.getParameter("taMessage");
        subject = request.getParameter("txtSubject");
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
    debug.addMsg("post thread", "forumId="+forumId);
    debug.addMsg("post thread", "topicId="+topicId);
    debug.addMsg("post thread", "threadId="+threadId);
    
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

    com.topcoder.forum.Thread thread = null;
    Post post = null;
    if (threadId > 0) {
        thread = forumBean.getThread(threadId);
        if (thread != null) {
            if (thread.getInitialPostId() > 0) {
                post = forumBean.getPost(thread.getInitialPostId());
            }
        }
    }
    
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
    if (subject == null) {
        if (thread != null) {
            subject = thread.getSubject();
        } else {
            subject = "";
        }
    }
    
    debug.addMsg("post thread", "subject="+subject);
    debug.addMsg("post thread", "msg="+msg);
    debug.addMsg("post thread", "thread="+thread);
    debug.addMsg("post thread", "post="+post);
    
    // process action
    if (action == null) {
        action = "new";
    } else if (action.equalsIgnoreCase("create thread")) {
        if (msg.trim().length() > 0 && msg.length() <= MAX_MSG_LENGTH) {
            Topic topic = null;
            if (topicId > 0) {
                topic = forumBean.getTopic(topicId);
            }
            if (topic == null) {
                response.sendRedirect("/forum/c_forum.jsp?f="+forumId);
                return;
            }
            thread = new com.topcoder.forum.Thread();
            thread.setSubject(subject);
            post = new Post();
            post.setText(msg);
            post.setUserId(tcUser.getId());
            
            boolean error = false;
            
            if (fileAttachments.hasNext()) {
                //Create the directories if they do not already exist.
                new File(rootDir + pathAttachments).mkdirs();
    
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
                        post.addAttachment(attach);
                    } else {
                        error = true;
                        strError = "File " + f.getName() + " already exists.  ";
                        break;
                    }
                }
            }
            if (!error) {
                forumBean.createThread(topic, thread, post);

		NotificationHome notificationHome = (NotificationHome)
			    PortableRemoteObject.narrow(
			    CONTEXT.lookup(NotificationHome.EJB_REF_NAME),
			    NotificationHome.class);

		Notification notification = notificationHome.create();

		Properties prop = new Properties();
		prop.setProperty(notification.IS_NEW_THREAD, "1");
		prop.setProperty(notification.COMPONENT_NAME,forumComponent.getName());
		prop.setProperty(notification.THREAD_NAME, thread.getSubject());
		prop.setProperty(notification.WRITER_NAME, tcUser.getRegInfo().getUsername());
		prop.setProperty(notification.LINK, "/forum/c_forum.jsp?f=" + forumId);
		notification.notifyEvent("com.topcoder.dde.forum.ForumPostEvent " + forumId, prop);

                response.sendRedirect("/forum/c_forum.jsp?f="+forumId);
                return;
            }
        } else if (msg.length() >= MAX_MSG_LENGTH) {
            strError = "Message connot exceed " + MAX_MSG_LENGTH + " characters";
        } else {
            strError = "Message cannot be empty.";
        }
    } else if (action.equalsIgnoreCase("save")) {
        if (msg.trim().length() > 0 && msg.length() <= MAX_MSG_LENGTH) {
            thread.setSubject(subject);
            post.setText(msg);
            
            boolean error = false;
            
            //Create the directories if they do not already exist.
            new File(rootDir + pathAttachments).mkdirs();

            if (fileAttachments.hasNext()) {
                //Delete any previous attachments
                Iterator itr = post.attachmentIterator();
                while (itr.hasNext()) {
                    File f = new File(((Attachment)itr.next()).getUrl());
                    f.delete();
                }
                post.clearAttachments();
                
                //Create the directories if they do not already exist.
                new File(pathAttachments).mkdirs();
    
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
                    }
                }
            }
            if (!error) {
                forumBean.updateThread(thread);
                forumBean.updatePost(post);
                response.sendRedirect("/forum/c_forum.jsp?f="+forumId);
                return;
            }
        } else if (msg.length() >= MAX_MSG_LENGTH) {
            strError = "Message connot exceed " + MAX_MSG_LENGTH + " characters";
        } else {
            strError = "Message cannot be empty.";
        }
    }
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/2000/REC-xhtml1-20000126/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><%=(thread!=null)?"Edit Thread":"Create New Thread"%> for the <%=forumComponent.getName()%> version <%=forumComponent.getVersionText()%> Forum at TopCoder Software</title>

<link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />
<script language="JavaScript" src="/scripts/javascript.js"></script>
</head>

<body class="body" marginheight="0" marginwidth="0" onLoad="frmThread.txtSubject.focus()">

<!-- Header begins -->
<%@ include file="/includes/top.jsp" %>
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

            <table width="100%" cellpadding="0" cellspacing="1" border="0" class="forumBkgd">
                <tr>
                    <form name="frmThread" action="<%=page_name%>" enctype="multipart/form-data" method="post">
                    <input type="hidden" name="f" value="<%=forumId%>">
                    <input type="hidden" name="t" value="<%=topicId%>">
                    <input type="hidden" name="r" value="<%=threadId%>">

<!-- Title-->
                 <tr valign="top">
                    <td class="forumTitleCenter" width="100%">
                        <table cellpadding="0" cellspacing="0" border="0" align="center">
                            <tr valign="top">
                                <td class="forumText"><font color="white"><strong><%=(thread!=null)?"Edit Thread":"Create New Thread"%></strong></font></td>
                            </tr>
                        </table></td>
                </tr>

<!-- Subject -->
                 <tr valign="top">
                    <td class="forumTextCenterEven" width="100%">
                        <div align="center">
                        <table cellpadding="0" cellspacing="0" border="0">
<!-- Thread error text begins -->
                            <tr valign="top"><td class="errorText"><%=strError%></td></tr>
<!-- Thread error text ends -->
                            <tr valign="top">
                                <td class="forumText">
                                    <p><strong>Subject</strong></p>
                                    <p><input class="registerForm" type="text" name="txtSubject" value ="<%=subject%>" size="60" maxlength="100"></p>
                                    &nbsp;</td>
                            </tr>

<!-- Message -->
                            <tr valign="top">
                                <td class="forumText">
                                    <p><strong>Message</strong></p>
                                    <p><textarea class="adminControlForm" name="taMessage" rows="24" cols="90"><%=msg%></textarea></p>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        </div>
                        </td>
                </tr>

<%  if (canModerate) { %>
                <tr>
                    <td class="forumTextCenterEven" width="100%">
                        <div align="center">
                        <table cellpadding="0" cellspacing="2" border="0" class="noclass">
                            <tr><td class="forumTextEven"><strong>Attach up to 3 downloadable files to this Reply</strong></td></tr>
                            <tr><td class="forumText"><input type="file" name="file1" size="30" /></td></tr>
                            <tr><td class="forumText"><input type="file" name="file2" size="30" /></td></tr>
                            <tr><td class="forumText"><input type="file" name="file3" size="30" /></td></tr>
                        </table>
                        </div>
                    </td>
                </tr>
<%  } %>

<%  if (thread != null) { %>
                <tr><td class="adminControl" width="100%"><input class="adminControlButton" type="submit" name="a" value="Save"></input></td></tr>
<%  } else { %>
                <tr><td class="adminControl" width="100%"><input class="adminControlButton" type="submit" name="a" value="Create Thread"></input></td></tr>
<%  } %>
            </table>

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

</form>
</body>
</html>