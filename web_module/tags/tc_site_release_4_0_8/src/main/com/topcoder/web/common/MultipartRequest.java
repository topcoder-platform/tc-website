package com.topcoder.web.common;

import com.topcoder.servlet.request.FileUpload;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;

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
        try {
            if (file.getParameter(name)!=null) {
                if (request.getCharacterEncoding()!=null) {
                    return new String(file.getParameter(name).getBytes(), request.getCharacterEncoding());
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
            String s = (String)e.nextElement();
            ret.put(s, getParameter(s));
        }
        return ret;
    }

    public String[] getParameterValues(String name) {
        ArrayList al = new ArrayList();
        Iterator it = file.getParameters(name);
        while (it.hasNext()) {
            al.add(it.next());
        }

        String[] ret = new String[al.size()];
        for (int i = 0; i < ret.length; i++) {
            try {
                ret[i] = new String(((String) al.get(i)).getBytes(), request.getCharacterEncoding());
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                ret[i] =(String) al.get(i);
            }
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
            try {
                ret[i] = new String(((String) al.get(i)).getBytes(), request.getCharacterEncoding());
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                ret[i] =(String) al.get(i);
            }
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
