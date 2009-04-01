package com.topcoder.dde.servlet;

import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.CatalogHome;
import com.topcoder.dde.catalog.Document;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Hashtable;

public class DDESVGDownload extends DownloadServlet {

    protected boolean isAuthorized(HttpServletRequest request) {
        return true;
    }


    protected File getDownloadFile(HttpServletRequest request) {
        File f = null;
        try {
            
            long docId = Long.parseLong((String) request.getParameter("id"));
            f = new File(getRootDirectory() + "svg/dependency_" + docId + ".svg");
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
        return "SVG Download servlet for DDE";
    }
}