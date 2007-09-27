package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * Presents a combo box of stages and seasons whose that are potentially complete 
 * (i.e. passed the end date), altough there can be active projects yet.
 * 
 * @author Cucu
 */
public class ViewGenerateDRPayments extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        
        try {
            Request r = new Request();
            r.setContentHandle("dr_finished_periods");
            ResultSetContainer rsc = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME).getData(r).get("dr_finished_periods");
            
            
            getRequest().setAttribute("periods" , rsc);

            setNextPage(INTERNAL_VIEW_GENERATE_DR_PAYMENTS);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

