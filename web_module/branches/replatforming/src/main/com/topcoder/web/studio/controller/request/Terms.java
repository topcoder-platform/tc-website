/*
 * Copyright (C) 2006-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.termsofuse.TermsOfUseEntity;
import com.topcoder.web.ejb.termsofuse.TermsOfUseLocator;
import com.topcoder.web.studio.Constants;

/**
 * <p>A controller for handling the requests for viewing the terms of use which user has accepted.</p>
 *
 * <p>
 * Version 1.1 (Re-platforming Studio Release 4 Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Re-factored the logic for terms processing.</li>
 *   </ol>
 * </p>
 * 
 * @author dok, TCSDEVELOPER
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 19, 2006
 */
public class Terms extends ShortHibernateProcessor {

    /**
     * <p>Implements the business logic for request processing.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    protected void dbProcessing() throws Exception {
        Integer termsId = new Integer(StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_ID)));
        com.topcoder.web.ejb.termsofuse.TermsOfUse termsOfUseService = TermsOfUseLocator.getService();
        TermsOfUseEntity terms = termsOfUseService.getEntity(termsId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
        getResponse().setStatus(200);
        getResponse().setContentType("text/html");
        getResponse().getWriter().print(terms.getTermsText());
        getResponse().flushBuffer();
    }
}
