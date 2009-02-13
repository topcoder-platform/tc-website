package com.topcoder.web.corp.common;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.rmi.PortableRemoteObject;

public class Util {
    public static DataAccessInt getDataAccess() throws Exception {
        return getDataAccess(Constants.DATA_SOURCE, false);
    }
    public static DataAccessInt getDataAccess(boolean cached) throws Exception {
        return getDataAccess(Constants.DATA_SOURCE, cached);
    }

    public static DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if(datasource == null) return null;
        DataAccessInt dAccess = null;
        if (cached) dAccess = new CachedDataAccess(datasource);
        else dAccess = new DataAccess(datasource);
        return dAccess;
    }
}
