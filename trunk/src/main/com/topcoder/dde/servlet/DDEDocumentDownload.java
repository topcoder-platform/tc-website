package com.topcoder.dde.servlet;

import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.CatalogHome;
import com.topcoder.dde.catalog.Document;
import com.topcoder.security.TCSubject;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Hashtable;
import java.util.Map;

public class DDEDocumentDownload extends DownloadServlet {


    private static CatalogHome catalogHome = null;


    /** Initializes the servlet.
     */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        Context context = null;
        try {
            context = new InitialContext();

            catalogHome = (CatalogHome) PortableRemoteObject.narrow(
                    context.lookup(CatalogHome.EJB_REF_NAME), CatalogHome.class);
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
            String docId = request.getParameter("id");

            Request r = new Request();
            r.setContentHandle("document_download");
            r.setProperty("docid", docId);

            DataAccessInt dai = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
            Map result = dai.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get("document_download");
            return rsc.getRowCount() > 0 && rsc.getLongItem(0, "can_download") == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    protected File getDownloadFile(HttpServletRequest request) {
        File f = null;
        try {
            long docId = Long.parseLong((String) request.getParameter("id"));
            Catalog catalog = catalogHome.create();
            Document doc = catalog.getDocument(docId);
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
        return "Document Download servlet for DDE";
    }
}