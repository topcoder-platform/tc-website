package com.topcoder.web.query.bean;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.common.AuthenticationException;
import com.topcoder.shared.util.DBMS;


import javax.servlet.http.*;
import java.io.Serializable;
import java.util.*;

/**
 * @author Greg Paul
 *
 */

public class DBSelectionTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(DBSelectionTask.class);

    private ArrayList dbList;

    /* Creates a new LoginTask */
    public DBSelectionTask() {
        super();
        dbList = new ArrayList();
        dbList.add(DBMS.OLTP_DATASOURCE_NAME);
        dbList.add(DBMS.DW_DATASOURCE_NAME);
    }


	public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws AuthenticationException, Exception {
        HttpSession session = request.getSession(true);
        if (!Authentication.isLoggedIn(session)) {
            log.debug("User not authenticated for access to TCES resource.");
            throw new AuthenticationException("User not authenticated for access to TCES resource.");
        }
	}

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
    }

    public void process(String step) throws Exception {
        super.setNextPage(Constants.COMMAND_LIST_PAGE);
    }

    public void setAttributes(String paramName, String paramValues[]) {
    }

    public List getDbList() {
        return dbList;
    }

    private void setDbs(ArrayList dbList) {
        this.dbList = dbList;
    }

}


