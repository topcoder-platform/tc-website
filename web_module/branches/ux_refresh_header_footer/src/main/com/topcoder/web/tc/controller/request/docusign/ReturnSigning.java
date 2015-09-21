/*
 * Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.docusign;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.tc.Constants;

/**
 * It is a simple controller used to show the returning page.
 *
 * Thread-Safety
 * The base class of this one is not thread-safe, so this class does not guarantee thread-safety.
 *
 * @author vangavroche, gonia_119
 * @version 1.0
 */
public class ReturnSigning extends BaseProcessor {
    /**
     * <p>A <code>Logger</code> to be used for logging.</p>
     */
    private static Logger log = Logger.getLogger(ReturnSigning.class);
    /**
     * The class name.
     */
    private static final String NAMESPACE = ReturnSigning.class.getName();

    /**
     * It simply set the result page.
     */
    protected void businessProcessing() {
        String event = getRequest().getParameter("event");
        log.debug("Enter method " + NAMESPACE + " businessProcessing. the paramters[event="+event+"]");
        getRequest().setAttribute("event", event);
        setNextPage(Constants.RETURN_SIGNING); 
        setIsNextPageInContext(true);
        log.debug("Leave method " + NAMESPACE + " #businessProcessing() with jsp page " +Constants.RETURN_SIGNING );
    }
}
