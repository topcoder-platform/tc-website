package com.topcoder.web.query.bean.task;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.AuthenticationException;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.common.BaseProcessor;

/**
 * @author Greg Paul
 *
 */

public class DBSelectionTask extends BaseProcessor {

    private static Logger log = Logger.getLogger(DBSelectionTask.class);

    /* Creates a new LoginTask */
    public DBSelectionTask() {
        super();
    }


	protected void baseProcessing() throws Exception {
        if (userIdentified()) {
            throw new AuthenticationException("User not authenticated for access to query tool resource.");
        }
 	}

    protected void businessProcessing() throws Exception {
        super.setNextPage(Constants.DB_SELECTION_PAGE);
    }

}


