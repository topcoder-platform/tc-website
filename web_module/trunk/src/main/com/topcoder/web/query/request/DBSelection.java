package com.topcoder.web.query.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

/**
 * @author Greg Paul
 *
 */

public class DBSelection extends BaseProcessor {

    private static Logger log = Logger.getLogger(DBSelection.class);

    public DBSelection() {
        super();
    }

    protected void businessProcessing() throws TCWebException {
        setNextPage(Constants.DB_SELECTION_PAGE);
        setIsNextPageInContext(true);
    }

}


