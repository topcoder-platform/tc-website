package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.security.UserPrincipal;

/**
 *
 * @author gpaul 06.26.2003
 */
public class FullRegSubmit extends SimpleRegSubmit {

    protected void registrationProcessing() throws TCWebException {

        /*
          don't need to check the data cuz it should have
          already been done.  we got it all from the session
          so it should be good
        */
        commit(regInfo);
        clearRegInfo();
        setNextPage(Constants.SIMPLE_REG_SUCCESS_PAGE);
        setIsNextPageInContext(true);
    }

    protected UserPrincipal store(SimpleRegInfo regInfo) throws Exception {
        return super.store(regInfo);
        //TODO do the rest of the db stuff, demog etc.
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        //get all reg info from the session, no changes should have been made at this point
        FullRegInfo info = (FullRegInfo)getRegInfoFromPersistor();
        if (info==null) {
            throw new Exception("Registration info not found in persistor");
        }

        return info;
    }


}
