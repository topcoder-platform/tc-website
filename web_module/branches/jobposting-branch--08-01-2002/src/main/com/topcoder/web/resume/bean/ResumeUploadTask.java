package com.topcoder.web.resume.bean;

import com.topcoder.ejb.AuthenticationServices.User;
import com.topcoder.ejb.ResumeServices.ResumeServicesHome;
import com.topcoder.ejb.ResumeServices.ResumeServices;
import com.topcoder.servlet.request.FileUpload;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.resume.servlet.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.naming.Context;
import java.util.Iterator;
import java.io.IOException;

public class ResumeUploadTask extends ResumeTask{
    private byte file[] = null;
    private int fileType = -1;
    private String fileName = null;
    private static final String SUCCESS = "/resume/upload_success.jsp";
    public ResumeUploadTask(FileUpload fu) throws ResumeTaskException{
        UploadedFile uf = null;
        byte[] fileBytes = null;
        try {
            Iterator it = fu.getAllUploadedFiles();
            //only need to worry about a single resume
            if (it.hasNext()) {
                uf = (UploadedFile)it.next();
                System.out.println(uf.getContentType());
                if (uf == null) {
                    throw new ResumeTaskException("Empty file uploaded");
                } else {
                    fileBytes = new byte[(int)uf.getSize()];
                    uf.getInputStream().read(fileBytes);

                    fileType = Integer.parseInt(fu.getParameter("fileType"));
                    fileName = uf.getRemoteFileName();
                    file = fileBytes;
                }
            }
        } catch(Exception e){
            e.printStackTrace();
            throw new ResumeTaskException(e);
        }
    }
    public void process() throws ResumeTaskException{
        Context context = null;
        try{
            context = TCContext.getInitial();
            ResumeServicesHome resumeServicesHome = (ResumeServicesHome) context.lookup(ApplicationServer.RESUME_SERVICES);
            ResumeServices resumeServices = resumeServicesHome.create();
            resumeServices.putResume(user.getUserId(),fileType, fileName, file);
        }catch(Exception e){
            throw new ResumeTaskException(e);
        }
    }
    public void getNextPage(HttpServletRequest request, HttpServletResponse response)
                                                        throws ServletException{
        forward(request,response,SUCCESS);
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
