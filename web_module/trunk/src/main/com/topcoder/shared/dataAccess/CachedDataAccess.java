package com.topcoder.shared.dataAccess;

import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.shared.util.logging.Logger;

import javax.sql.DataSource;
import java.sql.Connection;
import java.util.Map;

/**
 * This bean processes a {@link com.topcoder.shared.dataAccess.RequestInt} and returns the data from either the cache if it's available
 * or the data source if what we're looking for is not in the cache.  If we got it from the data source, it is added to the cache.
 *
 * @author  Lars Backstrom
 * @version $Revision$
 * @see     RequestInt
 */
public class CachedDataAccess implements DataAccessInt {
    private static Logger log = Logger.getLogger(CachedDataAccess.class);
    private static CacheClient client;
    private long expireTime;
    private DataSource dataSource;
    private static final int DEFAULT_EXPIRE_TIME = 1000 * 60 * 60 * 24 * 7;

    /**
     * Constructor that sets the timeout for the object should it need to be
     * cached, to 1 week.
     */
    public CachedDataAccess() {
        this(DEFAULT_EXPIRE_TIME);  
    }

    /**
     * Construtor that takes the timeout for the object should it need to
     * be cached.  The object will be removed from the cache atfter
     * <code>expireTime</code> milliseconds.
     * @param expireTime
     */
    public CachedDataAccess(long expireTime) {
        super();
        try {
            if (client == null)
                client = CacheClientFactory.createCacheClient();
            this.expireTime = expireTime;
        } catch (Exception e) {
            System.out.println("ERROR INITIALIZING CACHE CLIENT");
            e.printStackTrace();
        }
    }

    /**
     * Construtor that takes a data source to be used.
     * @param dataSource
     */
    public CachedDataAccess(DataSource dataSource) {
        this(DEFAULT_EXPIRE_TIME);
        this.dataSource = dataSource;
    }
       
    /**
     * Construtor that takes the timeout for the object should it need to
     * be cached, and a data source.
     * @param expireTime
     * @param dataSource
     */
    public CachedDataAccess(long expireTime, DataSource dataSource) {
        this(expireTime);
        this.dataSource = dataSource;
    }
       
    /**
     * This method passes a query command request and a connection
     * to the data retriever and receives and passes on the results.
     *
     * @param   request A <tt>RequestInt</tt> request object containing a number
     * of input property values.
     * @return  A map of the query results, where the keys are strings
     * of query names and the values are <tt>ResultSetContainer</tt> objects.
     * @throws  Exception if there was an error encountered while retrieving
     * the data from the EJB.
     */
    public Map getData(RequestInt request) throws Exception {
        Connection conn = null;
        try {
            boolean cached = true;
            String key = request.toString();
            Map map = null;
            DataRetriever dr = null;
            try {
                map = (Map) (client.get(key));
            } catch (Exception e) {
                System.out.println("UNABLE TO ESTABLISH A CONNECTION TO THE CACHE: " + e.getMessage());
                cached = false;
            }
            /* if it was not found in the cache */
            if (map == null) {
                conn = dataSource.getConnection();
                dr = new DataRetriever(conn);
                map = dr.executeCommand(request.getProperties());
            }
            /* attempt to add this object to the cache */
            if (cached) {
                try {
                    client.set(key, map, expireTime);
                } catch (Exception e) {
                    System.out.println("UNABLE TO INSERT INTO CACHE: " + e.getMessage());
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
     *
     * @param expireTime
     */
    public void setExpireTime(long expireTime) {
        this.expireTime = expireTime;
    }

    /**
     *
     * @return
     */
    public long getExpireTime() {
        return expireTime;
    }
    
    /**
     * @param dataSource
     */
    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    /**
     * @return this object's data source
     */
    public DataSource getDataSource() {
        return dataSource;
    }
}

