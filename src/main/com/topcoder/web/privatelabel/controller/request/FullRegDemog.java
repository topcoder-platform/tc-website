package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.privatelabel.Constants;

import java.util.Collections;
import java.util.List;


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
        } else {
            try {
                List l = getQuestionList();
                Collections.sort(l);
                getRequest().setAttribute("questionList", l);
            } catch (Exception e) {
                throw new TCWebException(e);
            }
            setNextPage(Constants.VERIZON_REG_DEMOG_PAGE);
        }
        setDefaults(regInfo);
        setIsNextPageInContext(true);
    }

}

