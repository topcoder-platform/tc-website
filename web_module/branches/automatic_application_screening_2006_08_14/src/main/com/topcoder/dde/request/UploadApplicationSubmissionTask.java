package com.topcoder.dde.request;

import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.BaseProcessor;

public class UploadApplicationSubmissionTask extends BaseProcessor {
    private static Logger log = Logger.getLogger(UploadApplicationSubmissionTask.class);

    protected void businessProcessing() throws TCWebException {
        try {
            if (getUser().isAnonymous()) {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            } else {
                MultipartRequest req = (MultipartRequest) getRequest();
                UploadedFile file = req.getUploadedFile("file1");

                if (file != null && file.getContentType() != null) {
                    log.debug("FOUND RESUME");
                    byte[] fileBytes = new byte[(int) file.getSize()];
                    file.getInputStream().read(fileBytes);
                    if (file == null) {
                        throw new TCWebException("Empty file uploaded");
                    } else {
                        String fileName = file.getRemoteFileName();
                        getRequest().setAttribute("file_name", fileName);

//                        ResumeServices resumeServices = (ResumeServices) BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
//                        resumeServices.putResume(getUser().getId(), fileType, fileName, fileBytes, DBMS.OLTP_DATASOURCE_NAME);
                        setNextPage("/applications/upload_results.jsp");
                    }
                }
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
