package com.topcoder.dde.servlet;

import com.topcoder.dde.forum.DDEForum;
import com.topcoder.dde.forum.DDEForumHome;
import com.topcoder.dde.forum.ForumComponent;
import com.topcoder.forum.*;
import com.topcoder.security.TCSubject;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Hashtable;

public class DDEForumAttachmentDownload extends DownloadServlet {


    private static ForumRemoteHome forumHome = null;
    private static DDEForumHome ddeForumHome = null;


    /** Initializes the servlet.
     */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        Hashtable environment = new Hashtable();
        environment.put(Context.PROVIDER_URL, "localhost:1099");
        environment.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
        Context context = null;

        try {
            context = new InitialContext(environment);

            forumHome = (ForumRemoteHome) PortableRemoteObject.narrow(
                    context.lookup(ForumRemoteHome.EJB_REF_NAME), ForumRemoteHome.class);
            ddeForumHome = (DDEForumHome) PortableRemoteObject.narrow(
                    context.lookup(DDEForumHome.EJB_REF_NAME), DDEForumHome.class);
        } catch (Exception e) {
        } finally {
            if (context != null) try {
                context.close();
            } catch (NamingException ne) {
                ;
            }
        }
    }


    protected boolean isAuthorized(HttpServletRequest request) {
        try {
            TCSubject tcSubject = (TCSubject) request.getSession().getAttribute("TCSUBJECT");
            long forumId = Long.parseLong(request.getParameter("f"));
            if (forumId > 0) {
                DDEForum ddeForum = ddeForumHome.create();
                ForumComponent component = ddeForum.getLinkedComponent(forumId);
                if (component.getCollabForumId() == forumId) {
                    return true;
                } else {
                    if (tcSubject != null) {
                        return (ddeForum.canPost(forumId, tcSubject) || ddeForum.canModerate(forumId, tcSubject));
                    }
                }
            }
        } catch (Exception e) {
        }
        return false;
    }


    protected File getDownloadFile(HttpServletRequest request) {
        File f = null;
        try {
            long attachmentId = Long.parseLong((String) request.getParameter("id"));
            ForumRemote forum = forumHome.create();
            Attachment attachment = forum.getAttachment(attachmentId);
            f = new File(getRootDirectory() + attachment.getUrl());
        } catch (Exception e) {
        }
        if (f != null && f.isFile() && f.exists()) {
            return f;
        } else {
            return null;
        }
    }

    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Download servlet for Forum Attachments";
    }
}