package com.topcoder.shared.dataAccess;

import java.util.*;
import java.rmi.RemoteException;
import javax.naming.*;
import java.sql.Connection;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;

/**
 * This bean processes a Request and returns the data from either the cache if it's available
 * or the data warehouse if what we're looking for is not in the cache.  If we got it from the
 * warehouse, it is added to the cache.
 *
 * @author  Lars Backstrom
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.1.2.3  2002/07/11 17:07:18  gpaul
 *           isClose should be isClosed
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
 *           Revision 1.7  2002/06/27 18:25:52  gpaul
 *           adjustments for a correct ApplicationSever.properties file and DBMS.properties file
 *
 *           Revision 1.6  2002/06/25 01:23:13  gpaul
 *           removed so chatter, added a verbose flag
 *
 *           Revision 1.5  2002/06/13 18:54:45  lbackstrom
 *           distributed cache
 *
 *           Revision 1.4  2002/06/13 18:53:51  lbackstrom
 *           distributed cache
 *
 *           Revision 1.3  2002/06/13 15:05:18  lbackstrom
 *           distributed cache
 *
 *           Revision 1.2  2002/06/12 18:52:31  lbackstrom
 *           distributed cache
 *
 *           Revision 1.1  2002/06/12 18:04:16  lbackstrom
 *           cached version of DataRetrievalBean
 * @see     RequestInt
 */
public class DWCachedDataAccess implements DataAccessInt {
    private static Logger log = Logger.getLogger(DWCachedDataAccess.class);
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
    public DWCachedDataAccess()
    {
        this(86400000);                 //one day in ms
    }
    public DWCachedDataAccess(long expireTime)
    {
        super();
        try
        {
            if(client==null)
                client = CacheClientFactory.createCacheClient();
            this.expireTime = expireTime;
        }
        catch(Exception e)
        {
            System.out.println("ERROR INITIALIZING CACHE CLIENT");
            e.printStackTrace();
        }
    }

    public Map getData(RequestInt request) throws Exception {
        try {
            boolean cached = true;
            String key = request.toString();
            Map map = null;
            Connection conn = null;
            DataRetriever dr = null;
            try {
                map = (Map)(client.get(key));
            }
            catch(Exception e) {
                System.out.println("UNABLE TO ESTABLISH A CONNECTION TO THE CACHE: "+e.getMessage());
                cached = false;
            }
            /* if it was not found in the cache */
            if (map == null) {
              conn = DBMS.getDWConnection();
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
            if(cached) {
                try {
                    client.set(key,map,expireTime);
                }
                catch(Exception e) {
                    System.out.println("UNABLE TO INSERT INTO CACHE: "+e.getMessage());
                }
            }
            return map;
        } catch (Exception e) {
            throw e;
        }
    }
    public void setExpireTime(long expireTime)
    {
        this.expireTime = expireTime;
    }
    public long getExpireTime()
    {
        return expireTime;
    }
}

