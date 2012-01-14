package com.topcoder.dde.servlet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.Hashtable;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: May 12, 2003
 * Time: 10:37:12 PM
 * To change this template use Options | File Templates.
 */
abstract class DBDownloadServlet extends HttpServlet {

    private static final int BLOCK_SIZE = 65536;

    private static Hashtable htMimeTypes = new Hashtable();

    /** Initializes the servlet.
     */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        htMimeTypes.put(".jar", "application/x-java-archive");
    }

    /** Destroys the servlet.
     */
    public void destroy() {

    }

    abstract protected boolean isAuthorized(HttpServletRequest request);

    abstract protected InputStream getDownloadFile(HttpServletRequest request);

    abstract protected String getFileName(HttpServletRequest request);

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

        InputStream is = getDownloadFile(request);
        if (is == null) {
            // redirect to error page
            response.sendRedirect("/pages/error_filenotfound.jsp");
            return;
        }

        String filename = getFileName(request);
        String mimeType = "";
        int idxExtension = filename.lastIndexOf(".");
        if (idxExtension != -1) {
            String extension = filename.substring(idxExtension, filename.length()).toLowerCase();
            mimeType = "" + htMimeTypes.get(extension);
        }

        // -- Set up IO streams
        ServletOutputStream out = response.getOutputStream();

        // set headers
        response.setHeader("Content-Disposition", "inline;filename=\"" + filename + "\"");
        response.setContentType(mimeType);
        response.setContentLength(is.available());

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
