package com.topcoder.shared.dataAccess;

import com.topcoder.shared.util.logging.Logger;

import java.sql.Connection;

public class CachedQueryDataAccess extends CachedDataAccess {
    private static Logger log = Logger.getLogger(QueryDataAccess.class);

    /**
     * Constructor that sets the timeout for the object should it need to be
     * cached, to 1 week.
     */
    public CachedQueryDataAccess() {
        this(DEFAULT_EXPIRE_TIME);
    }

    /**
     * Construtor that takes the timeout for the object should it need to
     * be cached.  The object will be removed from the cache atfter
     * <code>expireTime</code> milliseconds.
     * @param expireTime
     */
    public CachedQueryDataAccess(long expireTime) {
        super();
        this.expireTime = expireTime;
    }

    /**
     * Construtor that takes a data source to be used.
     * @param dataSource
     */
    public CachedQueryDataAccess(String dataSource) {
        this(DEFAULT_EXPIRE_TIME);
        this.dataSource = dataSource;
    }

    /**
     * Construtor that takes the timeout for the object should it need to
     * be cached, and a data source.
     * @param expireTime
     * @param dataSource
     */
    public CachedQueryDataAccess(long expireTime, String dataSource) {
        this(expireTime);
        this.dataSource = dataSource;
    }

    protected DataRetrieverInt getDataRetriever(Connection conn) {
        return new QueryRunner(conn);
    }


}


