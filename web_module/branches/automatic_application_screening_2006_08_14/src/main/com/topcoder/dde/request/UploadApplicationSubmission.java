package com.topcoder.dde.request;

import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.naming.NamingException;

import com.topcoder.apps.review.EJBHelper;
import com.topcoder.apps.review.PermissionHelper;
import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.apps.review.projecttracker.UserManagerLocal;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.security.AdminPermission;
import com.topcoder.apps.review.security.SubmitPermission;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.policy.PolicyRemote;
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
                UserManagerLocal userManager = EJBHelper.getUserManager();
                SecurityEnabledUser user = userManager.getUser(subject);

                if (!PermissionHelper.isAdmin(user) && !PermissionHelper.hasSpecificationSubmitPermission(user)) {
                    throw new PermissionException(getUser(), new ClassResource(this.getClass()));
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
