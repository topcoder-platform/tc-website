package com.topcoder.web.tc.controller.request.compstats;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;

import java.util.Map;

abstract public class Base extends BaseProcessor {

    protected static final Logger log = Logger.getLogger(Base.class);

    public DataAccessInt getDataAccess() throws Exception {
        return getDataAccess(DBMS.TCS_DW_DATASOURCE_NAME, false);
    }

    public DataAccessInt getDataAccess(boolean cached) throws Exception {
        return getDataAccess(DBMS.TCS_DW_DATASOURCE_NAME, cached);
    }

    public DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("Accessing to " + DBMS.TCS_DW_DATASOURCE_NAME);
        }
        if (datasource == null) return null;
        DataAccessInt dAccess = null;
        if (cached)
            dAccess = new CachedDataAccess(datasource);
        else
            dAccess = new DataAccess(datasource);
        return dAccess;
    }

    // returns a rsc from the database using the given command.  It is assumed that
    // the command contains a query with the same name.
    protected ResultSetContainer queryDB(String commandName) throws Exception {
        return queryDB(commandName, commandName);
    }

    // returns a rsc from the database using the given command and given query name.
    protected ResultSetContainer queryDB(String commandName, String queryName) throws Exception {
        Request r = new Request();
        r.setContentHandle(commandName);
        DataAccessInt dai = getDataAccess(true);
        Map result = dai.getData(r);
        return (ResultSetContainer) result.get(queryName);
    }


}
