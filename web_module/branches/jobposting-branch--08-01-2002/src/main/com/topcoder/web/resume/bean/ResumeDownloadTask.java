package com.topcoder.web.resume.bean;

import com.topcoder.ejb.AuthenticationServices.User;
import com.topcoder.ejb.ResumeServices.ResumeServicesHome;
import com.topcoder.ejb.ResumeServices.ResumeServices;
import com.topcoder.servlet.request.FileUpload;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.ApplicationServer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletOutputStream;
import javax.naming.Context;
import java.util.Iterator;
import java.io.IOException;

public class ResumeDownloadTask extends ResumeTask{
    private Resume resume = null;
    public ResumeDownloadTask(FileUpload fu) throws ResumeTaskException{
        //right now we don't care about anything but the coderID for a download
    }
    public void process() throws ResumeTaskException{
        Context context = null;
        try{
            context = TCContext.getInitial();
            ResumeServicesHome resumeServicesHome = (ResumeServicesHome) context.lookup(ApplicationServer.RESUME_SERVICES);
            ResumeServices resumeServices = resumeServicesHome.create();
            resume = resumeServices.getResume(user.getUserId());
        }catch(Exception e){
            throw new ResumeTaskException(e);
        }
    }
    public void getNextPage(HttpServletRequest request, HttpServletResponse response)
                                                    throws IOException{
//        response.setHeader("Cache-Control", "no-store");
//        response.setHeader("Pragma", "no-cache");
//        response.setDateHeader("Expires", 0);
        response.setHeader("content-disposition","attachment; filename="+resume.getFileName());
        response.setContentType(resume.getFileType());
//        response.setContentLength(resume.getFile().length);
        ServletOutputStream sos = response.getOutputStream();
        sos.write(resume.getFile());
//        response.setStatus(HttpServletResponse.SC_OK);
    }
}
