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
        if(user==null){
            forward(request,response,"http://" + request.getServerName() +
                    "/?t=authentication&c=login&errorMsg=" +
                    "You must log in to view this portion of the site.&errorURL=http://" +
                    request.getServerName() + "/Resume?task=ResumeUploadPage");
            return;
        }
        ServletContext context = sc.getContext("/");
        RequestDispatcher requestDispatcher = context.getRequestDispatcher(response.encodeURL(SUCCESS));
        requestDispatcher.forward(request, response);
    }
    void forward(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException {
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        try {
            if (url != null) {
                response.sendRedirect(response.encodeURL(url));
            } else {
                response.sendRedirect(response.encodeURL(Controller.CONTROLLER_ERROR_URL));
            }
        } catch (IOException e) {
            throw new ServletException(e);
        }
    }
}
