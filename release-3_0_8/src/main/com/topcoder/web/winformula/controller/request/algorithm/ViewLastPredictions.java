/*
 * ViewLastPredictions
 * 
 * Created Aug 8, 2008
 */
package com.topcoder.web.winformula.controller.request.algorithm;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.winformula.Constants;

/**
 * @autor Diego Belfer (Mural)
 * @version $Id$
 */
public class ViewLastPredictions extends Base {
    protected static final Logger log = Logger.getLogger(ViewLastPredictions.class);

    protected void longContestProcessing() throws TCWebException {
        try {
            setNextPage(Constants.PAGE_LAST_PREDICTIONS);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
