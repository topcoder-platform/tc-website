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
 * This bean processes a RequestInt and returns the data from either the cache if it's available
 * or the transactional database if what we're looking for is not in the cache.  If we got it from the
 * db, it is added to the cache.
 *
 * @author Greg Paul
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
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
    public OLTPCachedDataAccess()
    {
        this(86400000);                 //one day in ms
    }
    public OLTPCachedDataAccess(long expireTime)
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
            /* it was not in the cache */
            if (map == null) {
              conn = DBMS.getConnection();
              dr = new DataRetriever(conn);
              map = dr.executeCommand(request.getProperties());
              if (conn != null) {
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

