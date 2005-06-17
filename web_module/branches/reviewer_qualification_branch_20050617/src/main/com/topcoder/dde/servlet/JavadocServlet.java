package com.topcoder.dde.servlet;

import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.ConfigManagerException;

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

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: May 12, 2003
 * Time: 10:38:50 PM
 * To change this template use Options | File Templates.
 */
public class JavadocServlet extends HttpServlet {

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
        htMimeTypes.put(".css", "text/css");
        htMimeTypes.put(".htm", "text/html");
        htMimeTypes.put(".html", "text/html");
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


    public static String getRootDirectory() {
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

    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, java.io.IOException {

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

    private File getDownloadFile(HttpServletRequest request) {

        String r = request.getRequestURI();
        String path = r.substring(r.indexOf("/javadoc/") + 9);
        int idx = path.indexOf('/', path.indexOf('/') + 1);
        String file = path.substring(idx + 1);
        path = path.substring(0, idx + 1);
        String root = getRootDirectory();
        if (!root.endsWith("/")) root += '/';
        return new File(root + path + "javadoc/" + file);
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