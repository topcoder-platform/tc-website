package com.topcoder.web.privatelabel.controller.request.resume;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.privatelabel.Constants;

public class ViewUpload extends Base {

    protected void businessProcessing() throws TCWebException {
        try {
            ResumeServices resumeServices = (ResumeServices)createEJB(getInitialContext(), ResumeServices.class);
            getRequest().setAttribute("fileTypes", resumeServices.getFileTypes(getDb()));
        } catch (Exception e) {
            throw new TCWebException(e);
        }
        setNextPage(Constants.RESUME_PAGE);
        setIsNextPageInContext(true);
    }

}
