package com.topcoder.web.tc.controller.request.hs;

import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

/**
 *
 * @author cucu
 */
public class ProblemStatement extends Base { 
    protected void businessProcessing() throws TCWebException {
        try {
            if (!userIdentified()) {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }
            
            if (!hasParameter("pm")) {
                throw new TCWebException("pm parameters is required");                
            } 
            
            Request r = new Request();
            r.setContentHandle("problem_statement");
            r.setProperty("pm", getRequest().getParameter("pm"));
            
            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);

            getRequest().setAttribute("REQUEST_BEAN", r);
            getRequest().setAttribute("QUERY_RESPONSE", result);
            
            setNextPage(Constants.HS_PROBLEM_STATEMENT);
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


}
