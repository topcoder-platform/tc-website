package com.topcoder.dde.servlet;

import java.io.*;
import java.rmi.*;
import java.util.*;

import javax.naming.*;
import javax.rmi.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.topcoder.dde.catalog.*;
import com.topcoder.dde.user.*;
import com.topcoder.security.*;


public class DDEComponentDownload extends DownloadServlet {
    
    
    private static CatalogHome catalogHome = null;
    private static ComponentManagerHome componentManagerHome = null;
    
    
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
        
            catalogHome = (CatalogHome)PortableRemoteObject.narrow(
                            context.lookup(CatalogHome.EJB_REF_NAME), CatalogHome.class);
            componentManagerHome = (ComponentManagerHome)PortableRemoteObject.narrow(
                            context.lookup(ComponentManagerHome.EJB_REF_NAME), ComponentManagerHome.class);
        } catch (Exception e) {
        } finally {
            if (context != null) try { context.close(); } catch (NamingException ne) {;}
        }
    }
    
    
    protected boolean isAuthorized(HttpServletRequest request) {
        try {
            TCSubject tcSubject = (TCSubject)request.getSession().getAttribute("TCSUBJECT");
            long compId = Long.parseLong((String)request.getParameter("comp"));
            ComponentManager compMgr = componentManagerHome.create(compId);
            return (compMgr.canDownload(tcSubject));
        } catch (Exception e) {
        }
        return false;
    }


    protected File getDownloadFile(HttpServletRequest request) {
        File f = null;
        try {
            User tcUser = (User)request.getSession().getAttribute("TCUSER");
            long compId = Long.parseLong(request.getParameter("comp"));
            long licenseId = 1L;
            long downloadId = Long.parseLong(request.getParameter("id"));
            
            ComponentManager compMgr = componentManagerHome.create(compId);
            Download doc = compMgr.getDownload(downloadId);
            compMgr.trackDownload(tcUser.getId(), downloadId, licenseId);
            
            f = new File(getRootDirectory() + doc.getURL());
        } catch (Exception e) {}
        if (f != null && f.isFile() && f.exists()) {
            return f;
        } else {
            return null;
        }
    }
    
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Component Download servlet for DDE";
    }
}