package com.topcoder.web.common;

import com.topcoder.servlet.request.FileUpload;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;

/**
 * @author rfairfax
 */
public class MultipartRequest extends SimpleRequest {

    private FileUpload file = null;
    private static Logger log = Logger.getLogger(MultipartRequest.class);

    public MultipartRequest(HttpServletRequest request) throws IOException {
        super(request);
        log.debug("create file upload object");

        file = new FileUpload(request, false);

        log.debug("created file upload object");
    }

    public String getParameter(String name) {
        return file.getParameter(name);
    }

    public Enumeration getParameterNames() {
        return new ParameterEnums(file.getParameterNames());
    }

    public String[] getParameterValues(String name) {
        ArrayList al = new ArrayList();
        Iterator it = file.getParameters(name);
        while (it.hasNext()) {
            al.add(it.next());
        }

        String[] ret = new String[al.size()];
        for (int i = 0; i < ret.length; i++) {
            ret[i] = (String) al.get(i);
        }

        return ret;
    }

    public String[] getFormFileNames() {
        ArrayList al = new ArrayList();
        Iterator it = file.getFormFileNames();
        while (it.hasNext()) {
            al.add(it.next());
        }

        String[] ret = new String[al.size()];
        for (int i = 0; i < ret.length; i++) {
            ret[i] = (String) al.get(i);
        }

        return ret;
    }

    public UploadedFile getUploadedFile(String formFileName) {
        return file.getUploadedFile(formFileName);
    }

    public UploadedFile[] getUploadedFiles(String formFileName) {
        ArrayList al = new ArrayList();
        Iterator it = file.getUploadedFiles(formFileName);
        while (it.hasNext()) {
            al.add(it.next());
        }

        UploadedFile[] ret = new UploadedFile[al.size()];
        for (int i = 0; i < ret.length; i++) {
            ret[i] = (UploadedFile) al.get(i);
        }

        return ret;
    }

    public UploadedFile[] getAllUploadedFiles() {
        ArrayList al = new ArrayList();
        Iterator it = file.getAllUploadedFiles();
        while (it.hasNext()) {
            al.add(it.next());
        }

        UploadedFile[] ret = new UploadedFile[al.size()];
        for (int i = 0; i < ret.length; i++) {
            ret[i] = (UploadedFile) al.get(i);
        }

        return ret;
    }

    private final class ParameterEnums implements Enumeration {
        private Iterator it;

        public ParameterEnums(Iterator it) {
            this.it = it;
        }

        public boolean hasMoreElements() {
            return it.hasNext();
        }

        public Object nextElement() {
            return it.next();
        }
    }


}
