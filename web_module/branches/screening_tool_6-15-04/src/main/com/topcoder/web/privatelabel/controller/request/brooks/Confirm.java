package com.topcoder.web.privatelabel.controller.request.brooks;

import com.topcoder.web.privatelabel.controller.request.FullRegConfirm;
import com.topcoder.web.privatelabel.model.*;
import com.topcoder.web.privatelabel.Constants;

import com.topcoder.web.common.MultipartRequest;
import com.topcoder.servlet.request.*;

/**
 * @author dok
 * Date: Jan 22, 2004
 */
public class Confirm extends FullRegConfirm {
    protected void setNextPage() {

        if (hasErrors()) {
            setNextPage(Constants.BROOKS_REG_DEMOG_PAGE);
        } else {
            setNextPage(Constants.BROOKS_REG_CONFIRM_PAGE);
        }
        setIsNextPageInContext(true);
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
        
        if (file != null) {
                ((ResumeRegInfo)info).setUploadedFile(file);
            }
        
        return info;
    }

}
