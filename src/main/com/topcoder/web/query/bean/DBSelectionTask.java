package com.topcoder.web.query.bean;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.Authentication;
import com.topcoder.web.query.common.AuthenticationException;
import com.topcoder.web.query.common.Constants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.Serializable;

/**
 * @author Greg Paul
 *
 */

public class DBSelectionTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(DBSelectionTask.class);

    /* Creates a new LoginTask */
    public DBSelectionTask() {
        super();
    }


	public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws AuthenticationException, Exception {
        super.servletPreAction(request, response);
        if (!super.getAuthentication().isLoggedIn()) {
            throw new AuthenticationException("User not authenticated for access to query tool resource.");
        }
	}

    public void process(String step) throws Exception {
        super.setNextPage(Constants.DB_SELECTION_PAGE);
    }

    public void setAttributes(String paramName, String paramValues[]) {
    }

}


