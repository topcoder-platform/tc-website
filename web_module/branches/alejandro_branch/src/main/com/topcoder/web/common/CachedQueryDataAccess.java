package com.topcoder.web.common;

import com.topcoder.shared.dataAccess.DataRetrieverInt;
import com.topcoder.shared.dataAccess.QueryDataAccess;
import com.topcoder.shared.dataAccess.QueryRunner;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.cache.MaxAge;

import java.sql.Connection;

public class CachedQueryDataAccess extends CachedDataAccess {
    private static Logger log = Logger.getLogger(QueryDataAccess.class);

    /**
     * Constructor that sets the timeout for the object should it need to be
     * cached, to 1 week.
     */
    public CachedQueryDataAccess() {
        this(MaxAge.MAX);
    }

    /**
     * Construtor that takes the timeout for the object should it need to
     * be cached.  The object will be removed from the cache atfter
     * <code>expireTime</code> milliseconds.
     *
     * @param expireTime
     * @deprecated
     */
    public CachedQueryDataAccess(long expireTime) {
        super();
        //this.expireTime = expireTime;
    }

    /**
     * Construtor that takes the timeout for the object should it need to
     * be cached.  The object will be removed from the cache atfter
     * <code>maxAge.age()</code> milliseconds.
     *
     * @param maxAge how long to cache the item for
     */
    public CachedQueryDataAccess(MaxAge maxAge) {
        super(maxAge);
    }


    /**
     * Construtor that takes a data source to be used.
     *
     * @param dataSourceName the datasource to connect to, to retrieve data
     */
    public CachedQueryDataAccess(String dataSourceName) {
        this();
        this.dataSourceName = dataSourceName;
    }

    /**
     * Construtor that takes the timeout for the object should it need to
     * be cached, and a data source.
     *
     * @param expireTime
     * @param dataSourceName the datasource to connect to, to retrieve data
     * @deprecated
     */
    public CachedQueryDataAccess(long expireTime, String dataSourceName) {
        //this(expireTime);
        this();
        this.dataSourceName = dataSourceName;
    }

    /**
     * Construtor that takes the timeout for the object should it need to
     * be cached, and a data source.
     *
     * @param maxAge         how long to cache the item for
     * @param dataSourceName the datasource to connect to, to retrieve data
     */
    public CachedQueryDataAccess(MaxAge maxAge, String dataSourceName) {
        this(maxAge);
        this.dataSourceName = dataSourceName;
    }

    protected DataRetrieverInt getDataRetriever(Connection conn) {
        return new QueryRunner(conn);
    }


}


