package com.topcoder.web.stat.bean;

import java.util.*;
import javax.naming.*;
import com.topcoder.common.*;
import com.topcoder.web.stat.ejb.Statistics.*;
import com.topcoder.web.stat.common.*;

/** 
 * This bean processes a StatRequestBean and returns the data
 *
 * @author  Dave Pecora
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
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
public class DataRetrievalBean implements StatDataAccessInt {
    
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
    public Map getData(StatRequestBean request) throws DataRetrievalException {
        try {
            Context c = TCContext.getInitial();
            StatisticsHome sh = (StatisticsHome) 
                c.lookup(ApplicationServer.STATISTICS);
            Statistics s = sh.create();
            Map map = s.executeCommand(request.getProperties());
            return map;
        } catch (Exception e) {
            throw new DataRetrievalException(e.getMessage());
        }
    }
}

