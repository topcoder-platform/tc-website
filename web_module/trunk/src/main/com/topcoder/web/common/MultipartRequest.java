/*
 * Copyright (C) 2001-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common;

import com.topcoder.servlet.request.ConfigurationException;
import com.topcoder.servlet.request.DisallowedDirectoryException;
import com.topcoder.servlet.request.FileUpload;
import com.topcoder.servlet.request.FileUploadResult;
import com.topcoder.servlet.request.LocalFileUpload;
import com.topcoder.servlet.request.PersistenceException;
import com.topcoder.servlet.request.RequestParser;
import com.topcoder.servlet.request.RequestParsingException;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * <p>A wrapper around requests of <code>multipart/form-data</code> type. Uses <code>TC File Upload</code> component for
 * parsing the requests.</p>
 *
 * <p>
 * Version 1.1 (Upload Progress Bar Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added {@link #MultipartRequest(HttpServletRequest, RequestParser)} constructor.</li>
 *   </ol>
 * </p>
 * 
 * @author rfairfax, isv
 * @version 1.1
 */
public class MultipartRequest extends SimpleRequest {

    private FileUploadResult file = null;
    private String dir = "";
    private static Logger log = Logger.getLogger(MultipartRequest.class);

    /**
     * <p>Constructs new <code>MultipartRequest</code> instance for parsing the specified request.</p>
     * 
     * @param request an <code>HttpServletRequest</code> representing incoming request from the client. 
     * @throws IOException if an I/O error occurs while parsing the request.
     */
    public MultipartRequest(HttpServletRequest request) throws IOException {
        super(request);
        if (log.isDebugEnabled()) {
            log.debug("create file upload object");
        }

        try {
            FileUpload fu = new LocalFileUpload("com.topcoder.servlet.request.FileUpload");
            file = fu.uploadFiles(request);
            dir = ((LocalFileUpload) fu).getDir();
        } catch (ConfigurationException e) {
            throw new RuntimeException(e);
        } catch (DisallowedDirectoryException e) {
            throw new RuntimeException(e);
        } catch (RequestParsingException e) {
            throw new RuntimeException(e);
        } catch (PersistenceException e) {
            throw new RuntimeException(e);
        }

        if (log.isDebugEnabled()) {
            log.debug("created file upload object");
        }
    }

    /**
     * <p>Constructs new <code>MultipartRequest</code> instance to use the specified <code>RequestParser</code> for
     * parsing the specified request.</p>
     * 
     * @param request an <code>HttpServletRequest</code> representing incoming request from the client. 
     * @param uploadRequestParser a <code></code> 
     * @throws IOException if an I/O error occurs while parsing the request.
     * @since 1.1
     */
    public MultipartRequest(HttpServletRequest request, RequestParser uploadRequestParser) throws IOException {
        super(request);
        if (log.isDebugEnabled()) {
            log.debug("create file upload object");
        }

        try {
            FileUpload fu = new LocalFileUpload("com.topcoder.servlet.request.FileUpload");
            file = fu.uploadFiles(request, uploadRequestParser);
            dir = ((LocalFileUpload) fu).getDir();
        } catch (ConfigurationException e) {
            throw new RuntimeException(e);
        } catch (DisallowedDirectoryException e) {
            throw new RuntimeException(e);
        } catch (RequestParsingException e) {
            throw new RuntimeException(e);
        } catch (PersistenceException e) {
            throw new RuntimeException(e);
        }

        if (log.isDebugEnabled()) {
            log.debug("created file upload object");
        }
    }

    public String getParameter(String name) {
        try {
            if (file.getParameter(name) != null) {
                if (getRequest().getCharacterEncoding() != null) {
                    return new String(file.getParameter(name).getBytes(), getRequest().getCharacterEncoding());
                } else {
                    return file.getParameter(name);
                }
            } else {
                return null;
            }

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return file.getParameter(name);
        }
    }

    public Enumeration getParameterNames() {
        return new ParameterEnums(file.getParameterNames());
    }

    public Map getParameterMap() {
        Enumeration e = getParameterNames();
        Map ret = new HashMap();
        while (e.hasMoreElements()) {
            String s = (String) e.nextElement();
            ret.put(s, getParameter(s));
        }
        return ret;
    }

    public String[] getParameterValues(String name) {
        String[] sarr = file.getParameterValues(name);
        for (int i = 0; i < sarr.length; i++) {
            try {
                sarr[i] = new String(sarr[i].getBytes(), getRequest().getCharacterEncoding());
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return sarr;
    }

    public String[] getFormFileNames() {
        String[] sarr = file.getFormFileNames();
        for (int i = 0; i < sarr.length; i++) {
            try {
                sarr[i] = new String(sarr[i].getBytes(), getRequest().getCharacterEncoding());
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return sarr;
    }

    public UploadedFile getUploadedFile(String formFileName) {
        return file.getUploadedFile(formFileName);
    }

    public UploadedFile[] getUploadedFiles(String formFileName) {
        return file.getUploadedFiles(formFileName);
    }

    public UploadedFile[] getAllUploadedFiles() {
        return file.getAllUploadedFiles();
    }

    public String getDir() {
        return dir;
    }

    private final class ParameterEnums implements Enumeration {
        private Iterator it;

        public ParameterEnums(String[] params) {
            this.it = Arrays.asList(params).iterator();
        }

        public boolean hasMoreElements() {
            return it.hasNext();
        }

        public Object nextElement() {
            return it.next();
        }
    }


}