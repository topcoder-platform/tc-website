package com.topcoder.web.tc.controller.request.resume;

import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.tc.controller.request.Base;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class UploadTask extends Base {
    private static Logger log = Logger.getLogger(UploadTask.class);

    protected void businessProcessing() throws TCWebException {
        try {
            if (!SecurityHelper.hasPermission(getLoggedInUser(), new ClassResource(this.getClass()))) {
                log.debug("User not logged in, can't download a file.");
                throw new TCWebException("User not logged in, can't download a file.");
            }

            MultipartRequest req = (MultipartRequest) getRequest();
            UploadedFile file = req.getUploadedFile("file1");

            if (file != null && file.getContentType() != null) {
                log.debug("FOUND RESUME");
                byte[] fileBytes = new byte[(int) file.getSize()];
                file.getInputStream().read(fileBytes);
                if (file == null) {
                    throw new TCWebException("Empty file uploaded");
                } else {
                    Map types = getFileTypes(DBMS.OLTP_DATASOURCE_NAME);
                    int fileType = -1;
                    if (types.containsKey(file.getContentType())) {
                        log.debug("FOUND TYPE");
                        fileType = ((Long) types.get(file.getContentType())).intValue();
                    } else {
                        log.debug("DID NOT FIND TYPE " + file.getContentType());
                    }
                    String fileName = file.getRemoteFileName();
                    ResumeServices resumeServices = (ResumeServices) BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
                    resumeServices.putResume(getUser().getId(), fileType, fileName, fileBytes, DBMS.OLTP_DATASOURCE_NAME);
                    setNextPage("/resume/upload_success.jsp");
                }
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected Map getFileTypes(String db) throws Exception {
        Request r = new Request();
        r.setContentHandle("file_types");
        Map qMap = getDataAccess(db, true).getData(r);
        ResultSetContainer questions = (ResultSetContainer) qMap.get("file_types");
        ResultSetContainer.ResultSetRow row = null;

        Map ret = new HashMap();
        for (Iterator it = questions.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            ret.put(row.getStringItem("mime_type"), new Long(row.getLongItem("file_type_id")));
        }
        return ret;
    }


}
