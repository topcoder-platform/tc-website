package com.topcoder.shared.dataAccess;

import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.Context;
import javax.sql.DataSource;
import java.sql.Connection;
import java.util.Map;

/**
 * This bean processes a RequestInt and returns the data from either the cache if it's available
 * or the transactional database if what we're looking for is not in the cache.  If we got it from the
 * db, it is added to the cache.
 *
 * @author Greg Paul
 * @version $Revision$
 *  Log of Changes:
 *           $Log$
 *           Revision 1.4  2002/07/31 17:25:36  gpaul
 *           make the default time for a cached item 1 week
 *
 *           Revision 1.3  2002/07/23 23:37:21  gpaul
 *           use DataSources rather than DBMS to get connections
 *
 *           Revision 1.2  2002/07/12 17:15:46  gpaul
 *           merged baby
 *
 *           Revision 1.1.2.2  2002/07/11 17:05:55  gpaul
 *           check if connection is closed before attempting to do it.
 *
 *           Revision 1.1.2.1  2002/07/09 23:41:27  gpaul
 *           switched to use com.topcoder.shared.util.logging.Logger
 *
 *           Revision 1.1  2002/07/03 00:30:22  gpaul
 *           moving over here
 *
 * @see     RequestInt
 */
public class OLTPCachedDataAccess implements DataAccessInt {
    private static Logger log = Logger.getLogger(OLTPCachedDataAccess.class);
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
    private static CacheClient client;
    private long expireTime;

    /**
     * Default constructor, set the timeout to 1 week if the object is not cached
     */
    public OLTPCachedDataAccess() {
        this(1000 * 60 * 60 * 24 * 7);                 //one week in ms
    }

    /**
     * Constructor that sets the timeout to the given value if the object is not cached
     * @param expireTime
     */
    public OLTPCachedDataAccess(long expireTime) {
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
     * Returns the data after executing the request
     * @param request
     * @return the data
     * @throws Exception
     */
    public Map getData(RequestInt request) throws Exception {
        try {
            boolean cached = true;
            String key = request.toString();
            Map map = null;
            Connection conn = null;
            DataRetriever dr = null;
            try {
                map = (Map) (client.get(key));
            } catch (Exception e) {
                System.out.println("UNABLE TO ESTABLISH A CONNECTION TO THE CACHE: " + e.getMessage());
                cached = false;
            }
            /* it was not in the cache */
            if (map == null) {
                Context ctx = TCContext.getInitial();
                DataSource ds = (DataSource) ctx.lookup("OLTP");
                conn = ds.getConnection();
                dr = new DataRetriever(conn);
                map = dr.executeCommand(request.getProperties());
                if (conn != null && !conn.isClosed()) {
                    try {
                        conn.close();
                    } catch (Exception ce) {
                        log.error("Failed to close connection");
                    }
                }
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
}

