package com.topcoder.web.tc.controller.legacy.resume.bean;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.tc.controller.legacy.resume.common.Constants;

import javax.servlet.http.HttpSession;

public class ViewUploadTask extends ResumeTask {
    private static Logger log = Logger.getLogger(UploadTask.class);

    protected void businessProcessing() throws TCWebException {
        try {
            if (!userIdentified()) {
                log.debug("User not logged in, can't download a file.");
                throw new TCWebException("User not logged in, can't download a file.");
            }
            if (getRequest().getParameter("compid") != null) {
                companyId = Long.parseLong(getRequest().getParameter("compid"));
                db = getCompanyDb(companyId);
            }
            getRequest().setAttribute("hasCompany", String.valueOf(companyId>0));
            ResumeServices resumeServices = (ResumeServices) BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
            getRequest().setAttribute("hasResume", String.valueOf(resumeServices.hasResume(getUser().getId(), db)));
            setNextPage(Constants.UPLOAD_PAGE);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
