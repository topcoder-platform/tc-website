package com.topcoder.web.stat.bean;

import java.util.*;
import java.rmi.RemoteException;
import javax.naming.*;
import com.topcoder.common.*;
import com.topcoder.web.stat.ejb.Statistics.*;
import com.topcoder.web.stat.common.*;
import com.topcoder.server.distCache.CacheClient;
import com.topcoder.server.distCache.CacheClientFactory;

/**
 * This bean processes a StatRequestBean and returns the data
 *
 * @author  Dave Pecora
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
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
 *
 *           Revision 1.1.1.1  2002/04/02 17:20:38  steveb
 *           initial web load into cvs
 *
 *           Revision 1.1.2.1  2002/03/16 20:18:09  gpaul
 *           moving these over from the member dev area.
 *
 *           Revision 1.7  2002/03/05 16:14:37  dpecora
 *           - Renamed and relocated EJB
 *           - Query mods to fix up stuff broken by iron_man changes
 *
 *           Revision 1.6  2002/02/27 10:35:25  dpecora
 *           A number of changes:
 *           - Added support for required input arguments to default input queries
 *           - Added support for data sorting prior to row selection
 *           - Removed exception printout from data retrieval bean; it was a duplicate
 *           of the EJB exception printout info
 *           - Added scrolling by room for round statistics
 *           - Various other query modifications
 *
 *           Revision 1.5  2002/02/13 08:35:22  dpecora
 *           Add javadocs, implement ranklists
 *
 *           Revision 1.4  2002/02/06 11:58:29  dpecora
 *           Got the EJB running successfully.  Also updated the scripts to put the
 *           data in the various query tables, in response to various table structure
 *           changes and column renaming.
 *
 *           Revision 1.3  2002/02/06 04:14:00  tbone
 *           added cvs logging and made a few adjustments
 * @see     StatRequestBean
 * @see     StatisticsBean
 */
public class CachedDataRetrievalBean implements StatDataAccessInt {

    /**
     * This method passes a query command request to the statistics EJB and receives
     * and passes on the results.
     *
     * @param   request A <tt>StatRequestBean</tt> request object containing a number
     * of input property values.
     * @return  A map of the query results, where the keys are strings
     * of query names and the values are <tt>ResultSetContainer</tt> objects.
     * @throws  DataRetrievalException if there was an error encountered while retrieving
     * the data from the EJB.
     */
    static CacheClient client;
    private long expireTime;
    private static final boolean VERBOSE = true;
    public CachedDataRetrievalBean()
    {
        this(86400000);                 //one day in ms
    }
    public CachedDataRetrievalBean(long expireTime)
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

    public Map getData(StatRequestBean request) throws DataRetrievalException {
        try {
            boolean cached = true;
            String key = request.toString();
            Map map = null;
            try
            {
                map = (Map)(client.get(key));
            }
            catch(Exception e)
            {
                System.out.println("UNABLE TO ESTABLISH A CONNECTION TO THE CACHE: "+e.getMessage());
                cached = false;
            }
            if(map!=null)
            {
                if (VERBOSE) System.out.println(request.getContentHandle()+" IS in the CACHE");
                return map;
            }
            else if (VERBOSE) System.out.println(request.getContentHandle()+" IS NOT in the CACHE");
            Context c = TCContext.getInitial();
            StatisticsHome sh = (StatisticsHome)
                c.lookup(ApplicationServer.STATISTICS);
            Statistics s = sh.create();
            map = s.executeCommand(request.getProperties());
            if(cached)
            {
                try
                {
                    client.set(key,map,expireTime);
                }
                catch(Exception e)
                {
                    System.out.println("UNABLE TO INSERT INTO CACHE: "+e.getMessage());
                }
            }
            return map;
        } catch (Exception e) {
            throw new DataRetrievalException(e.getMessage());
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

