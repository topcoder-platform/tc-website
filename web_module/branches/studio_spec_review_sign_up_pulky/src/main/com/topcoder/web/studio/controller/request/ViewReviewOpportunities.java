/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;

/**
 * <p>This class will process a view review opportunities request.</p>
 *
 * <p>This processor will use Query Tool to retrieve from the database Studio contests specification reviews.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since Studio Release Assembly - Spec Review Sign up page v1.0
 */
public class ViewReviewOpportunities extends BaseProcessor {

    /**
     * This method executes the actual business logic for this processor.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.common.BaseProcessor#businessProcessing()
     */
    protected void businessProcessing() throws Exception {
        DataAccess da = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("review_opportunities");

        getRequest().setAttribute("reviews", da.getData(r).get("review_opportunities"));
        getRequest().setAttribute("userLoggedIn", userLoggedIn());
        
        setNextPage("/reviewOpportunities.jsp");
        setIsNextPageInContext(true);
    }
}
