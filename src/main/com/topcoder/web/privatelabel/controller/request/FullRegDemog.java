package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.resume.ejb.ResumeServices.ResumeServices;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.InitialContext;

/**
 *
 * @author gpaul 07.02.2003
 */
public class FullRegDemog extends FullRegBase {
    protected static Logger log = Logger.getLogger(FullRegDemog.class);

    protected void registrationProcessing() throws TCWebException {

        checkRegInfo(regInfo);

        if (hasErrors()) {
            getRequest().setAttribute("countryList", getCountryList());
            getRequest().setAttribute("stateList", getStateList());
            setNextPage(Constants.VERIZON_REG_PAGE);
            setDefaults(regInfo);
        } else {
            try {
                getRequest().setAttribute("fileTypeList", getFileTypes());
                getRequest().setAttribute("questionList", getQuestions());
            } catch (Exception e) {
                throw new TCWebException(e);
            }
            setNextPage(Constants.VERIZON_REG_DEMOG_PAGE);
        }
        setIsNextPageInContext(true);
    }

    protected ResultSetContainer getFileTypes() throws Exception {
        InitialContext ctx = null;
        ResultSetContainer ret = null;
        try {
            ctx = new InitialContext();
            ResumeServices resume = (ResumeServices) createEJB(ctx, ResumeServices.class);
            ret = resume.getFileTypes();
        } finally {
            close(ctx);
        }
        return ret;
    }

}

