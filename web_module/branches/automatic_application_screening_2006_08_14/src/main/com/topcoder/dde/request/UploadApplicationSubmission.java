package com.topcoder.dde.request;

import com.topcoder.apps.screening.PermissionHelper;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.BaseProcessor;

public class UploadApplicationSubmission extends BaseProcessor {
    private static Logger log = Logger.getLogger(UploadApplicationSubmission.class);

    protected void businessProcessing() throws TCWebException {
        try {
            log.info("Upload Application request");
            if (getUser().isAnonymous()) {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            } else {

                TCSubject subject = new TCSubject(getUser().getId());
                subject.addPrincipal(new UserPrincipal(getUser().getUserName(), getUser().getId()));
                /*UserManagerLocal userManager = EJBHelper.getUserManager();
                SecurityEnabledUser user = userManager.getUser(subject);*/

                if (!PermissionHelper.isAdmin(subject) && !PermissionHelper.hasSpecificationSubmitPermission(subject)) {
                    throw new TCWebException("You are not authorized to view this page");
                }
                log.info("forwarding to upload page");
                setNextPage("/applications/submission_upload.jsp");
                setIsNextPageInContext(true);
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
