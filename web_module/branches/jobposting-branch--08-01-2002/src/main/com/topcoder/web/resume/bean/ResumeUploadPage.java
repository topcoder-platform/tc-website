package com.topcoder.web.resume.bean;

import com.topcoder.servlet.request.FileUpload;
import com.topcoder.web.resume.servlet.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import java.io.IOException;
//should probably genericize this class
public class ResumeUploadPage extends ResumeTask{
    private static final String SUCCESS = "/resume/resume_upload.jsp";
    ServletContext sc;
    public ResumeUploadPage(FileUpload fu,ServletContext sc) throws ResumeTaskException{
        this.sc = sc;
    }
    public void process() throws ResumeTaskException{
    }
    public void getNextPage(HttpServletRequest request, HttpServletResponse response)
                                                        throws ServletException,IOException{
        ServletContext context = sc.getContext("/");
        RequestDispatcher requestDispatcher = context.getRequestDispatcher(response.encodeURL(SUCCESS));
        requestDispatcher.forward(request, response);
    }
}
