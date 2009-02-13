package com.topcoder.web.common;

/*
import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;
*/

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataRetrieverInt;
import com.topcoder.shared.dataAccess.RequestInt;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.cache.CacheClient;
import com.topcoder.web.common.cache.CacheClientFactory;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.common.cache.address.AddressFactory;
import com.topcoder.web.common.cache.address.CacheAddress;

import java.sql.Connection;
import java.util.Map;

/**
 * This bean processes a {@link com.topcoder.shared.dataAccess.RequestInt} and returns the data from either the cache if it's available
 * or the data source if what we're looking for is not in the cache.  If we got it from the data source, it is added to the cache.
 *
 * @author Lars Backstrom
 * @version $Revision$
 * @see com.topcoder.shared.dataAccess.RequestInt
 */
public class CachedDataAccess extends DataAccess {
    private static Logger log = Logger.getLogger(CachedDataAccess.class);
    private MaxAge maxAge;
//    protected static final int DEFAULT_EXPIRE_TIME = 1000 * 60 * 60 * 24 * 3;
    //protected static final int DEFAULT_EXPIRE_TIME = 1000 * 60 * 60 * 4;

    /**
     * Constructor that sets the timeout for the object should it need to be
     * cached, default to <code>MaxAge.MAX</code>.
     */
    public CachedDataAccess() {
        this(MaxAge.MAX);
    }

    /**
     * Construtor that takes the timeout for the object should it need to
     * be cached.  The object will be removed from the cache atfter
     * <code>maxAge.age()</code> milliseconds.
     *
     * @param maxAge how long it should live in the cache
     */
    public CachedDataAccess(MaxAge maxAge) {
        super();
        this.maxAge = maxAge;
    }

    /**
     * Construtor that takes a data source to be used.
     *
     * @param dataSourceName the datasource to connect to, to retrieve data
     */
    public CachedDataAccess(String dataSourceName) {
        this(MaxAge.MAX);
        this.dataSourceName = dataSourceName;
    }

    /**
     * Construtor that takes the timeout for the object should it need to
     * be cached, and a data source.
     *
     * @param expireTime
     * @param dataSourceName
     * @deprecated
     */
    public CachedDataAccess(long expireTime, String dataSourceName) {
        //this(expireTime);
        //ignore for now, todo fix this so that it takes a MaxAge
        this.dataSourceName = dataSourceName;
    }

    /**
     * Construtor that takes the timeout for the object should it need to
     * be cached, and a data source.
     *
     * @param maxAge         how long it should live in the cache
     * @param dataSourceName the datasource to connect to, to retrieve data
     */
    public CachedDataAccess(MaxAge maxAge, String dataSourceName) {
        this(maxAge);
        this.dataSourceName = dataSourceName;
    }


    /**
     * This method passes a query command request and a connection
     * to the data retriever and receives and passes on the results.
     *
     * @param request A <tt>RequestInt</tt> request object containing a number
     *                of input property values.
     * @return A map of the query results, where the keys are strings
     *         of query names and the values are <tt>ResultSetContainer</tt> objects.
     * @throws Exception if there was an error encountered while retrieving
     *                   the data from the EJB.
     */
    public Map<String, ResultSetContainer> getData(RequestInt request) throws Exception {
        Connection conn = null;
        try {
            boolean hasCacheConnection = true;
            CacheAddress address = AddressFactory.create(request, maxAge);
            Map<String, ResultSetContainer> map = null;
            DataRetrieverInt dr = null;
            CacheClient cc = null;
            try {
                //cc = CacheClientFactory.createCacheClient();
                cc = CacheClientFactory.create();
                map = (Map<String, ResultSetContainer>) (cc.get(address));
            } catch (Exception e) {

                if (log.isDebugEnabled()) {
                    log.error("UNABLE TO ESTABLISH A CONNECTION TO THE CACHE: ", e);
                } else {
                    log.error("UNABLE TO ESTABLISH A CONNECTION TO THE CACHE: " + e.getMessage());
                }
                hasCacheConnection = false;
            }
            /* if it was not found in the cache */
            if (map == null) {
                conn = DBMS.getConnection(dataSourceName);
                dr = getDataRetriever(conn);
                map = dr.executeCommand(request.getProperties());
                /* attempt to add this object to the cache */
                if (hasCacheConnection) {
                    try {
                        cc.set(address, map, maxAge);
                    } catch (Exception e) {

                        if (log.isDebugEnabled()) {
                            log.error("UNABLE TO INSERT INTO CACHE: ", e);
                        } else {
                            log.error("UNABLE TO INSERT INTO CACHE: " + e.getMessage());
                        }

                    }
                }
            }
            return map;
        } catch (Exception e) {
            throw e;
        } finally {
            if (conn != null && !conn.isClosed()) {
                try {
                    conn.close();
                } catch (Exception ce) {
                    log.error("Failed to close connection");
                }
            }
        }
    }

    /**
     * @param expireTime
     * @deprecated
     */
    public void setExpireTime(long expireTime) {
        //this.expireTime = expireTime;
        //ignore for now, todo fix this so that it takes a MaxAge
    }

    public void setMaxAge(MaxAge maxAge) {
        this.maxAge = maxAge;
    }


}

