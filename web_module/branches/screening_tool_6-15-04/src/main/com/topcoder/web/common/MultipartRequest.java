package com.topcoder.web.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.ArrayList;
import com.topcoder.servlet.request.FileUpload;
import com.topcoder.servlet.request.UploadedFile;
import java.io.IOException;

/**
 * @author rfairfax
 */
public class MultipartRequest implements TCRequest {
    
    private HttpServletRequest request = null;
    private FileUpload file = null;
    public MultipartRequest(HttpServletRequest request) throws IOException {
        //create new fileupload object
        this.request = request;
        
        file = new FileUpload(request, false);
    }
    
    public String getParameter(String name) {
        return file.getParameter(name);
    }
    
    public String getServletPath() {
        return request.getServletPath();
    }
    
    public String getContextPath() {
        return request.getContextPath();
    }
    
    public void setAttribute(String name, Object o) {
        request.setAttribute(name, o);
    }
    
    public Object getAttribute(String name) {
        return request.getAttribute(name);
    }
    
    public String getMethod() {
        return request.getMethod();
    }
    
    public Enumeration getParameterNames() {
        return new ParameterEnums( file.getParameterNames() );
    }
    
    public String getQueryString() {
        return request.getQueryString();
    }
    
    public String[] getParameterValues(String name) {
        ArrayList al = new ArrayList();
        Iterator it = file.getParameters(name);
        while(it.hasNext())
        {
            al.add(it.next());
        }
        
        String[] ret = new String[al.size()];
        for(int i = 0; i < ret.length; i++)
        {
            ret[i] = (String)al.get(i);
        }
        
        return ret;
    }
    
    public HttpSession getSession() {
        return request.getSession();
    }
    
    public HttpSession getSession(boolean create) {
        return request.getSession(create);
    }
    
    public String getServerName() {
        return request.getServerName();
    }
    
    public Cookie[] getCookies() {
        return request.getCookies();
    }
    
    public String getProtocol() {
        return request.getProtocol();
    }
    
    public String[] getFormFileNames()
    {
        ArrayList al = new ArrayList();
        Iterator it = file.getFormFileNames();
        while(it.hasNext())
        {
            al.add(it.next());
        }
        
        String[] ret = new String[al.size()];
        for(int i = 0; i < ret.length; i++)
        {
            ret[i] = (String)al.get(i);
        }
        
        return ret;
    }
    
    public UploadedFile getUploadedFile(String formFileName)
    {
        return file.getUploadedFile(formFileName);
    }
    
    public UploadedFile[] getUploadedFiles(String formFileName)
    {
        ArrayList al = new ArrayList();
        Iterator it = file.getUploadedFiles(formFileName);
        while(it.hasNext())
        {
            al.add(it.next());
        }
        
        UploadedFile[] ret = new UploadedFile[al.size()];
        for(int i = 0; i < ret.length; i++)
        {
            ret[i] = (UploadedFile)al.get(i);
        }
        
        return ret;
    }
    
    public UploadedFile[] getAllUploadedFiles()
    {
        ArrayList al = new ArrayList();
        Iterator it = file.getAllUploadedFiles();
        while(it.hasNext())
        {
            al.add(it.next());
        }
        
        UploadedFile[] ret = new UploadedFile[al.size()];
        for(int i = 0; i < ret.length; i++)
        {
            ret[i] = (UploadedFile)al.get(i);
        }
        
        return ret;
    }
    
    private final class ParameterEnums implements Enumeration {
        private Iterator it;
        
        public ParameterEnums(Iterator it) {
            this.it = it;
        }
        
        public boolean hasMoreElements()
        {
            return it.hasNext();
        }
        
        public Object nextElement()
        {
            return it.next();
        }
    }
}
