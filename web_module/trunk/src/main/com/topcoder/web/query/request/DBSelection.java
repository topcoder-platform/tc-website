package com.topcoder.web.query.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.AuthenticationException;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.common.BaseProcessor;

/**
 * @author Greg Paul
 *
 */

public class DBSelection extends BaseProcessor {

    private static Logger log = Logger.getLogger(DBSelection.class);

    /* Creates a new Login */
    public DBSelection() {
        super();
    }

    protected void businessProcessing() throws Exception {
        super.setNextPage(Constants.DB_SELECTION_PAGE);
    }

}


