package com.topcoder.web.privatelabel.controller.request.resume;

import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.privatelabel.Constants;

import java.util.Iterator;

public class UploadResume extends Base {


    protected void businessProcessing() throws TCWebException {
        UploadedFile uf = null;
        byte[] fileBytes = null;
        int fileType = -1;
        String fileName = null;
        long userId = -1;
        try {
            if (file == null)
                throw new TCWebException("FileUpload object was null.");

            Long userIdObj = (Long) getRequest().getSession(true).getAttribute(Constants.USER_ID);
            if (userIdObj == null) {
                throw new NavigationException("Sorry, missing required information.  Session may have expired.");
            } else {
                userId = userIdObj.longValue();
            }

            Iterator it = file.getAllUploadedFiles();
            //only need to worry about a single resume
            if (it.hasNext()) {
                uf = (UploadedFile) it.next();
                log.debug(uf.getContentType());
                if (uf == null) {
                    addError(Constants.FILE, "Sorry, the file you attempted to upload was empty.");
                } else {
                    fileBytes = new byte[(int) uf.getSize()];
                    uf.getInputStream().read(fileBytes);
                    if (fileBytes == null || fileBytes.length == 0)
                        addError(Constants.FILE, "Sorry, the file you attempted to upload was empty.");
                    else {
                        fileType = Integer.parseInt(file.getParameter("fileType"));
                        fileName = uf.getRemoteFileName();
                        ResumeServices resumeServices = (ResumeServices) createEJB(getInitialContext(), ResumeServices.class);
                        resumeServices.putResume(userId, fileType, fileName, fileBytes, getDb());
                    }
                }
            } else {
                addError(Constants.FILE, "Sorry, the file you attempted to upload was empty.");
            }
            if (hasErrors()) {
                setNextPage(Constants.RESUME_PAGE);
                try {
                    ResumeServices resumeServices = (ResumeServices) createEJB(getInitialContext(), ResumeServices.class);
                    getRequest().setAttribute("fileTypes", resumeServices.getFileTypes(getDb()));
                } catch (Exception e) {
                    throw new TCWebException(e);
                }
            } else {
                setNextPage(Constants.RESUME_THANK_YOU_PAGE);
            }
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


}
