package com.topcoder.web.query.bean;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.query.common.Constants;
import com.topcoder.web.query.common.AuthenticationException;
import com.topcoder.shared.util.DBMS;


import javax.servlet.http.*;
import java.io.Serializable;
import java.util.*;

/**
 * Processes the db selection task
 * @author Greg Paul
 *
 */

public class DBSelectionTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(LoginTask.class);

    private ArrayList dbList;

    private String db;

    /* Creates a new LoginTask */
    public DBSelectionTask() {
        super();
        dbList.add(DBMS.OLTP_DATASOURCE_NAME);
        dbList.add(DBMS.DW_DATASOURCE_NAME);
        super.setNextPage(Constants.COMMAND_LIST_PAGE);
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

    public void process() throws Exception {
        if (!getDbList().contains(getDb())) {
            throw new Exception("Invalid db selection: " + getDb());
        }
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(Constants.DB_PARAM))
            setDb(value);

    }

    public List getDbList() {
        return dbList;
    }

    private void setDbs(ArrayList dbList) {
        this.dbList = dbList;
    }

    public String getDb() {
        return db;
    }

    public void setDb(String db) {
        this.db = db;
    }


}


