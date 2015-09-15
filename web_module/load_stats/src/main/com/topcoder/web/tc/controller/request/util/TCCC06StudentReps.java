package com.topcoder.web.tc.controller.request.util;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.request.Base;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 25, 2006
 */
public class TCCC06StudentReps extends Base {

    protected void businessProcessing() throws TCWebException {
        try {
            Request r = new Request();
            r.setContentHandle("tccc06_student_reps");

            getRequest().setAttribute("studentRepList", getDataAccess().getData(r).get("tccc06_student_reps"));

            setNextPage("/tournaments/tccc06/student_reps_results.jsp");
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
