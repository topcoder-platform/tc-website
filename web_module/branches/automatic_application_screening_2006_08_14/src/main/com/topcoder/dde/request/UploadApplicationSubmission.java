package com.topcoder.dde.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.BaseProcessor;

public class UploadApplicationSubmission extends BaseProcessor {
    private static Logger log = Logger.getLogger(UploadApplicationSubmission.class);

    protected void businessProcessing() throws TCWebException {
        try {
            log.debug("Upload Application request");
            if (getUser().isAnonymous()) {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            } else {
                log.debug("forwarding to upload page");
                setNextPage("/applications/submission_upload.jsp");
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
