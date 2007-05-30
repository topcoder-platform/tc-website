/*
 * TCCC05StudentReps.java
 *
 * Created on October 13, 2004, 9:51 AM
 */

package com.topcoder.web.tc.controller.request.util;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

/**
 *
 * @author  rfairfax
 */
public class TCCC05StudentReps extends Base {

    protected void businessProcessing() throws TCWebException {
        try {
            Request r = new Request();
            r.setContentHandle("tccc05_student_reps");

            getRequest().setAttribute("studentRepList", getDataAccess().getData(r).get("tccc05_student_reps"));

            setNextPage(Constants.TCCC05_STUDENT_REPS);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
