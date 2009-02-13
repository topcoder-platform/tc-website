package com.topcoder.dde.servlet;

import java.io.File;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.topcoder.dde.catalog.CatalogHome;
import com.topcoder.dde.catalog.ComponentManager;
import com.topcoder.dde.catalog.ComponentManagerHome;
import com.topcoder.dde.catalog.Download;
import com.topcoder.dde.catalog.NonPublicComponentException;
import com.topcoder.dde.catalog.ReachedQuotaException;
import com.topcoder.dde.request.ViewComponentTerms;
import com.topcoder.dde.user.User;
import com.topcoder.security.TCSubject;


public class DDEComponentDownload extends DownloadServlet {

    private static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(DDEComponentDownload.class);

    private static CatalogHome catalogHome = null;
    private static ComponentManagerHome componentManagerHome = null;


    /** Initializes the servlet.
     */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        Context context = null;
        try {
            context = new InitialContext();

            catalogHome = (CatalogHome) PortableRemoteObject.narrow(
                    context.lookup(CatalogHome.EJB_REF_NAME), CatalogHome.class);
            componentManagerHome = (ComponentManagerHome) PortableRemoteObject.narrow(
                    context.lookup(ComponentManagerHome.EJB_REF_NAME), ComponentManagerHome.class);
        } catch (Exception e) {
            throw new ServletException(e);
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
            long compId = Long.parseLong((String) request.getParameter("comp"));
            ComponentManager compMgr = componentManagerHome.create(compId);
            
            boolean retVal = false;
            try {
                retVal = compMgr.canDownload(tcSubject);
            } catch (ReachedQuotaException e) {
                request.setAttribute("failure_reason", ViewComponentTerms.QUOTA_REACHED_REASON);
                request.setAttribute("max_downloads", compMgr.getMaxPublicDownloads());
                unAuthorizedPage = "/catalog/sorry.jsp";
                sendRedirect = false;
            } catch (NonPublicComponentException e) {
                request.setAttribute("failure_reason", ViewComponentTerms.NON_PUBLIC_REASON);                
                request.setAttribute("max_downloads", compMgr.getMaxPublicDownloads());
                unAuthorizedPage = "/catalog/sorry.jsp";
                sendRedirect = false;
            }
            
            return retVal;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    protected File getDownloadFile(HttpServletRequest request) {
        File f = null;
        try {
            User tcUser = (User) request.getSession().getAttribute("TCUSER");
            long compId = Long.parseLong(request.getParameter("comp"));
            long licenseId = 1L;
            long downloadId = Long.parseLong(request.getParameter("id"));

            ComponentManager compMgr = componentManagerHome.create(compId);
            Download doc = compMgr.getDownload(downloadId);

            compMgr.trackDownload(tcUser.getId(), downloadId, licenseId);

            f = new File(getRootDirectory() + doc.getURL());
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
        return "Component Download servlet for DDE";
    }
}