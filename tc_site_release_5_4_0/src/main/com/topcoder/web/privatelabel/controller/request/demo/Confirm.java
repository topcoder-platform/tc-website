package com.topcoder.web.privatelabel.controller.request.demo;

import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.FullRegConfirm;
import com.topcoder.web.privatelabel.controller.request.ResumeRegConfirm;
import com.topcoder.web.privatelabel.model.*;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * @author dok
 * Date: Jan 22, 2004
 */
public class Confirm extends ResumeRegConfirm {
    protected static Logger log = Logger.getLogger(Confirm.class);

    protected void setNextPage() {

        if (hasErrors()) {
            setNextPage(Constants.DEMO_REG_DEMOG_PAGE);
        } else {
            setNextPage(Constants.DEMO_REG_CONFIRM_PAGE);
        }
        setIsNextPageInContext(true);
    }


}
