package com.topcoder.web.privatelabel.controller.request.dc05;

import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.FullRegConfirm;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.ResumeRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class Confirm extends FullRegConfirm {
    protected void setNextPage() {
        //reg closed
        if (hasErrors()) {
            setNextPage(Constants.DC05_REG_PAGE);
        } else {
            setNextPage(Constants.DC05_REG_CONFIRM_PAGE);
        }
        setIsNextPageInContext(true);

    }

    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        super.checkRegInfo(info);

        try {
            //validate front fields here


        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
