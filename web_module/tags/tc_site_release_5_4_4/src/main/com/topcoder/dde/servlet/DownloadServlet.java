package com.topcoder.dde.servlet;

import com.topcoder.util.config.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.Hashtable;

abstract public class DownloadServlet extends HttpServlet {

    private static final int BLOCK_SIZE = 65536;

    private static Hashtable htMimeTypes = new Hashtable();

    /** Initializes the servlet.
     */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        htMimeTypes.put(".doc", "application/msword");
        htMimeTypes.put(".xls", "application/msexcel");
        htMimeTypes.put(".txt", "text/plain");
        htMimeTypes.put(".xml", "text/xml");
        htMimeTypes.put(".gif", "image/gif");
        htMimeTypes.put(".jpg", "image/jpeg");
        htMimeTypes.put(".jpeg", "image/jpeg");
        htMimeTypes.put(".pdf", "application/pdf");
        htMimeTypes.put(".zip", "application/x-zip-compressed");
    }

    /** Destroys the servlet.
     */
    public void destroy() {

    }


    protected String getRootDirectory() {
        final String namespace = "com.topcoder.servlet.request.FileUpload";
        String rootDir = "";
        try {
            ConfigManager cm = ConfigManager.getInstance();
            if (cm.existsNamespace(namespace)) {
                cm.refresh(namespace);
            } else {
                cm.add(namespace, ConfigManager.CONFIG_XML_FORMAT);
            }
            rootDir = (String) cm.getProperty(namespace, "default_directory");
            if (!rootDir.endsWith("/")) {
                rootDir += "/";
            }
        } catch (ConfigManagerException cme) {
            System.err.println(cme.toString());
        }
        ;
        return rootDir;
    }


    abstract protected boolean isAuthorized(HttpServletRequest request);

    abstract protected File getDownloadFile(HttpServletRequest request);


    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, java.io.IOException {
        // Check permissions
        if (!isAuthorized(request)) {
            // redirect to unauthorized page
            response.sendRedirect("/pages/s_subscriptions.jsp");
            return;
        }

        File downloadFile = getDownloadFile(request);
        if (downloadFile == null) {
            // redirect to error page
            response.sendRedirect("/pages/error_filenotfound.jsp");
            return;
        }

        String filename = downloadFile.getName();
        String mimeType = "";
        int idxExtension = filename.lastIndexOf(".");
        if (idxExtension != -1) {
            String extension = filename.substring(idxExtension, filename.length()).toLowerCase();
            mimeType = "" + htMimeTypes.get(extension);
        }

        // -- Set up IO streams
        java.io.InputStream is = new BufferedInputStream(new FileInputStream(downloadFile));
        ServletOutputStream out = response.getOutputStream();

        // set headers
        response.setHeader("Content-Disposition", "inline;filename=\"" + filename + "\"");
        response.setContentType(mimeType);
        response.setContentLength((int) downloadFile.length());

        int numBytes = 0;
        byte[] inBytes = new byte[BLOCK_SIZE];
        numBytes = is.read(inBytes);
        while (numBytes > 0) {
            out.write(inBytes, 0, numBytes);
            numBytes = is.read(inBytes);
        }
        is.close();

        response.setStatus(HttpServletResponse.SC_OK);
    }

    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, java.io.IOException {
        processRequest(request, response);
    }

    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, java.io.IOException {
        processRequest(request, response);
    }
}
