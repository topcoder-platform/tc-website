package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.ResumeRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * @author dok
 * @version $Revision: 47354 $ $Date$
 *          Create Date: Oct 31, 2005
 */
public abstract class ResumeRegConfirm extends FullRegConfirm {
    protected SimpleRegInfo makeRegInfo() throws Exception {
        FullRegInfo info = (FullRegInfo) super.makeRegInfo();

        if (!(info instanceof ResumeRegInfo)) {
            info = new ResumeRegInfo(info);
        }

        MultipartRequest req = (MultipartRequest) getRequest();
        UploadedFile file = req.getUploadedFile(Constants.RESUME);

        if (file != null) {
            log.debug("got a file");
            if (file.getContentType() != null) {
                log.debug("got a contenttype");
            } else {
                log.debug("content type was null");
            }
        } else {
            log.debug("didn't get a file");
        }
        if (file != null && file.getContentType() != null) {
            log.debug("FOUND RESUME");
            byte[] fileBytes = new byte[(int) file.getSize()];
            file.getInputStream().read(fileBytes);

            ((ResumeRegInfo) info).setResume(fileBytes);
            ((ResumeRegInfo) info).setResumeContentType(file.getContentType());
            ((ResumeRegInfo) info).setResumeFileName(file.getRemoteFileName());

        }

        return info;
    }

    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        super.checkRegInfo(info);

        try {
            //validate uploaded file, if applicable
            ResumeRegInfo rinfo = (ResumeRegInfo) info;
            if (rinfo.hasResume()) {

                if (rinfo.getResume().length == 0)
                    addError(Constants.FILE, getBundle().getProperty("error_empty_file"));
                else {
                    Map types = getFileTypes(transDb);
                    if (!types.containsKey(rinfo.getResumeContentType())) {
                        log.debug("DID NOT FIND TYPE " + rinfo.getResumeContentType());
                        addError(Constants.FILE, getBundle().getProperty("error_unknown_filetype") + rinfo.getResumeContentType() + ")");
                    }
                }
            }


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
