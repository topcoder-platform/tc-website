package com.topcoder.web.privatelabel.controller.request.google04;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.*;
import com.topcoder.servlet.request.*;
import java.util.*;
import com.topcoder.web.privatelabel.model.*;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.common.*;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;


public class Confirm extends FullRegConfirm {
    protected void setNextPage() {
        //reg closed
        setNextPage(Constants.GOOGLE04_REG_CLOSED_PAGE);
        setIsNextPageInContext(true);

/*
        if (hasErrors()) {
            setNextPage(Constants.GOOGLE04_REG_DEMOG_PAGE);
        } else {
            setNextPage(Constants.GOOGLE04_REG_CONFIRM_PAGE);
        }
        setIsNextPageInContext(true);
*/

    }
    
    protected SimpleRegInfo makeRegInfo() throws Exception {
        FullRegInfo info;
        info = (FullRegInfo)super.makeRegInfo();
        
        if(!(info instanceof ResumeRegInfo))
        {
            info = new ResumeRegInfo(info);
        }
        
        MultipartRequest req = (MultipartRequest)getRequest();
        UploadedFile file = req.getUploadedFile(Constants.RESUME);
        
        if (file != null && file.getContentType() != null) {
                log.debug("FOUND RESUME");
                ((ResumeRegInfo)info).setUploadedFile(file);
            }
        
        return info;
    }

    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        super.checkRegInfo(info);    
        
        try
        {
            //validate uploaded file, if applicable
            ResumeRegInfo rinfo = (ResumeRegInfo)info;
            if(rinfo.getUploadedFile() != null)
            {
                byte[] fileBytes = null;   

                fileBytes = new byte[(int) rinfo.getUploadedFile().getSize()];
                rinfo.getUploadedFile().getInputStream().read(fileBytes);
                if (fileBytes == null || fileBytes.length == 0)
                    addError(Constants.FILE, "Sorry, the file you attempted to upload was empty.");
                else {
                    //fileType = Integer.parseInt(file.getParameter("fileType"));
                    Map types = getFileTypes(transDb);
                    if(!types.containsKey(rinfo.getUploadedFile().getContentType()) )
                    {
                        log.debug("DID NOT FIND TYPE " + rinfo.getUploadedFile().getContentType());
                        addError(Constants.FILE, "Unsupported file type (" + rinfo.getUploadedFile().getContentType() + ")");
                    }
                }
            }
            
        
        }
        catch(Exception e)
        {
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
            ret.put(row.getStringItem("mime_type"), new Long( row.getLongItem("file_type_id")) );
        }
        return ret;
    }
}
