package com.topcoder.web.tc.controller.request.contest;

import java.io.File;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.Base;
import com.topcoder.util.config.*;

/**
 * <p>A controller to handle the requests for downloading project documents.</p>
 *
 * @author VolodymyrK
 */
public class DownloadDocument extends Base {

    private static final int BLOCK_SIZE = 65536;

    /**
     * Root directory for all document files.
     */
    private static String rootDir = null;

    protected void developmentProcessing() throws TCWebException {
        String docId = getRequest().getParameter(Constants.DOCUMENT_ID);
        if (docId == null || !StringUtils.isNumber(docId)) {
            throw new TCWebException("Invalid document ID specified " + docId);
        }

        if (getSessionInfo().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        try {
            if (canDownloadDocument(docId)) {
                File file = getDownloadFile(docId);
                downloadFile(file);
            } else {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * <p>
     * Returns the File object for the specified document ID.
     * </p>
     *
     * @param docId Document ID.
     * @return File object for the document.
     * @throws Exception if the specified document can not be found or if any other error occurs.
     */
    private File getDownloadFile(String docId) throws Exception {
        Request r = new Request();
        r.setContentHandle("document_download");
        r.setProperty(Constants.DOCUMENT_ID, docId);

        DataAccessInt dai = getDataAccess(true);
        Map result = dai.getData(r);
        ResultSetContainer rsc = (ResultSetContainer) result.get("document_download");
        if (rsc.getRowCount() != 1) {
            throw new TCWebException("Not exactly one document url found. Instead, found " + rsc.getRowCount());
        }
        String fileURL = rsc.getStringItem(0, "url");

        File file = new File(getRootDirectory() + fileURL);
        if (file != null && file.isFile() && file.exists()) {
            return file;
        } else {
            throw new TCWebException("Unable to locate the document file.");
        }
    }

    /**
     * <p>
     * Returns the root directory for all document files.
     * </p>
     *
     * @return Root directory path.
     * @throws ConfigManagerException if any config error occurs.
     */

    private String getRootDirectory() throws ConfigManagerException {
        if (rootDir == null) {
            final String namespace = "com.topcoder.servlet.request.FileUpload";

            ConfigManager cm = ConfigManager.getInstance();
            if (!cm.existsNamespace(namespace)) {
                cm.add(namespace, ConfigManager.CONFIG_XML_FORMAT);
            }
            rootDir = (String) cm.getProperty(namespace, "default_dir");
            if (!rootDir.endsWith("/")) {
                rootDir += "/";
            }
        }
        return rootDir;
    }

    /**
     * <p>
     * Returns the MIME type based on the file extension.
     * </p>
     *
     * param filename Filename.
     * @return Content type.
     */
    private String getContentType(String filename) {
        String ext = "";
        int idxExtension = filename.lastIndexOf(".");
        if (idxExtension != -1) {
            ext = filename.substring(idxExtension, filename.length()).toLowerCase();
        }
        if (ext.equals("doc")) return "application/msword";
        if (ext.equals("xls")) return "application/msexcel";
        if (ext.equals("txt")) return "text/plain";
        if (ext.equals("xml")) return "text/xml";
        if (ext.equals("gif")) return "image/gif";
        if (ext.equals("jpg")) return "image/jpeg";
        if (ext.equals("jpeg")) return "image/jpeg";
        if (ext.equals("pdf")) return "application/pdf";
        if (ext.equals("zip")) return "application/x-zip-compressed";
        if (ext.equals("jar")) return "application/x-java-archive";
        return "application";
    }

    /**
     * Downloads the specified file.
     *
     * @param file The actual file stored in the server.
     * @throws Exception
     */
    private void downloadFile(File file) throws Exception {
        getResponse().addHeader("content-disposition", "inline; filename=\"" + file.getName() + "\"");
        getResponse().setContentType(getContentType(file.getName()));
        getResponse().setContentLength((int) file.length());

        BufferedInputStream is = null;
        try {
            is = new BufferedInputStream(new FileInputStream(file));
            ServletOutputStream sos = getResponse().getOutputStream();

            int numBytes = 0;
            byte[] inBytes = new byte[BLOCK_SIZE];
            numBytes = is.read(inBytes);
            while (numBytes > 0) {
                sos.write(inBytes, 0, numBytes);
                numBytes = is.read(inBytes);
            }

            getResponse().setStatus(HttpServletResponse.SC_OK);
            getResponse().flushBuffer();
        } finally {
            if (is != null) {
                is.close();
            }
        }
    }

}
