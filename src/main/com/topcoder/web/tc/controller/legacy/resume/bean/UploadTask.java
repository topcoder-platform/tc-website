package com.topcoder.web.tc.controller.legacy.resume.bean;

import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.*;
import com.topcoder.web.ejb.resume.ResumeServices;

import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;

public class UploadTask extends ResumeTask {
    private static Logger log = Logger.getLogger(UploadTask.class);

    protected void businessProcessing() throws TCWebException {
        try {
            if (!userLoggedIn()) {
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
                    throw new ResumeTaskException("Empty file uploaded");
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
                    if (getRequest().getParameter("compid") != null) {
                        companyId = Long.parseLong(getRequest().getParameter("compid"));
                        db = getCompanyDb(companyId);
                    }
                    ResumeServices resumeServices = (ResumeServices) BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
                    resumeServices.putResume(getUser().getId(), fileType, fileName, fileBytes, db);
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
