package com.topcoder.web.tc.controller.request.hs;

import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

/**
 *
 * @author cucu
 */
public class RoundOverview extends Base { 
    
    protected void businessProcessing() throws TCWebException {
        try {
            Request r = new Request();
            r.setContentHandle("HS_RoundOverview");

            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);
            //ResultSetContainer rsc = (ResultSetContainer) result.get("hs_rounds");

            getRequest().setAttribute("resultMap", result);
            
            setNextPage(Constants.HS_ROUND_OVERVIEW);
            setNextPage("/hs/roundOverview.jsp");
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    
}
