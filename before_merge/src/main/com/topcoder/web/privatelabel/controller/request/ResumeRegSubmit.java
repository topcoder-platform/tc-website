package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.ResumeRegInfo;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.resume.ResumeServices;

import java.util.Map;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Oct 31, 2005
 */
public abstract class ResumeRegSubmit extends FullRegSubmit {

    protected long store(SimpleRegInfo regInfo) throws Exception {
        long userId = super.store(regInfo);
        ResumeRegInfo info = (ResumeRegInfo) regInfo;
        if (info.hasResume()) {
            int fileType = -1;

            if (info.getResume().length == 0)
                addError(Constants.FILE, getBundle().getProperty("error_empty_file"));
            else {
                //fileType = Integer.parseInt(file.getParameter("fileType"));
                Map types = getFileTypes(transDb);
                if (types.containsKey(info.getResumeContentType())) {
                    log.debug("FOUND TYPE");
                    fileType = ((Long) types.get(info.getResumeContentType())).intValue();
                } else {
                    log.debug("DID NOT FIND TYPE " + info.getResumeContentType());
                }
                ResumeServices resumeServices = (ResumeServices) createEJB(getInitialContext(), ResumeServices.class);
                resumeServices.putResume(userId, fileType, info.getResumeFileName(), info.getResume(), transDb);
            }
        }
        return userId;

    }

    protected abstract void handleActivation(SimpleRegInfo info, long userId) throws TCWebException;

}

