package com.topcoder.web.tc.controller.request.survey;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.rmi.PortableRemoteObject;

abstract public class Base extends BaseProcessor {


    public DataAccessInt getDataAccess() throws Exception {
        return getDataAccess(DBMS.OLTP_DATASOURCE_NAME, false);
    }

    public DataAccessInt getDataAccess(boolean cached) throws Exception {
        return getDataAccess(DBMS.OLTP_DATASOURCE_NAME, cached);
    }

    public DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (datasource == null) return null;
        InitialContext context = new InitialContext();
        DataSource ds = (DataSource)
                PortableRemoteObject.narrow(context.lookup(datasource),
                        DataSource.class);
        close(context);
        DataAccessInt dAccess = null;
        if (cached)
            dAccess = new CachedDataAccess(ds);
        else
            dAccess = new DataAccess(ds);
        return dAccess;
    }

}
