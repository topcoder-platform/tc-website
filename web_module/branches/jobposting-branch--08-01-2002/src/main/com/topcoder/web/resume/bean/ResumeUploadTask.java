package com.topcoder.web.resume.bean;

import com.topcoder.ejb.AuthenticationServices.User;
import com.topcoder.ejb.ResumeServices.ResumeServicesHome;
import com.topcoder.ejb.ResumeServices.ResumeServices;
import com.topcoder.servlet.request.FileUpload;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.ApplicationServer;

import javax.servlet.http.HttpServletRequest;
import javax.naming.Context;
import java.util.Iterator;

public class ResumeUploadTask extends ResumeTask{
    private byte file[] = null;
    private String contentType = null;
    private String fileName = null;
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
                    contentType = uf.getContentType();
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
            System.out.println("before put");
            resumeServices.putResume(user.getUserId(),contentType, fileName, file);
            System.out.println("after put");
        }catch(Exception e){
            throw new ResumeTaskException(e);
        }
    }
    public String getNextPage(){
        return "/";
    }
}
