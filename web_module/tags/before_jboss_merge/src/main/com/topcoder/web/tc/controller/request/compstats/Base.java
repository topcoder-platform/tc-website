package com.topcoder.web.tc.controller.request.compstats;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;

import com.topcoder.shared.util.logging.Logger;


abstract public class Base extends BaseProcessor {

protected static final Logger log = Logger.getLogger(Base.class);

    public DataAccessInt getDataAccess() throws Exception {
        return getDataAccess(DBMS.TCS_DW_DATASOURCE_NAME, false);
    }

    public DataAccessInt getDataAccess(boolean cached) throws Exception {
        return getDataAccess(DBMS.TCS_DW_DATASOURCE_NAME, cached);
    }

    public DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        log.debug("Accessing to " + DBMS.TCS_DW_DATASOURCE_NAME);
        if (datasource == null) return null;
        DataAccessInt dAccess = null;
        if (cached)
            dAccess = new CachedDataAccess(datasource);
        else
            dAccess = new DataAccess(datasource);
        return dAccess;
    }

}
