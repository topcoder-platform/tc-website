package com.topcoder.dde.servlet;

import java.io.*;
import java.rmi.*;
import java.util.*;

import javax.naming.*;
import javax.rmi.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.topcoder.dde.catalog.*;

public class DDEDocumentDownload extends DownloadServlet {
    
    
    private static CatalogHome catalogHome = null;
    
    
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
        } catch (Exception e) {
        } finally {
            if (context != null) try { context.close(); } catch (NamingException ne) {;}
        }
    }
    
    
    protected boolean isAuthorized(HttpServletRequest request) {
        return true;
    }


    protected File getDownloadFile(HttpServletRequest request) {
        File f = null;
        try {
            long docId = Long.parseLong((String)request.getParameter("id"));
            Catalog catalog = catalogHome.create();
            Document doc = catalog.getDocument(docId);
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
        return "Document Download servlet for DDE";
    }
}