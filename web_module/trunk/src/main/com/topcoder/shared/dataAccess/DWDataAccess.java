package com.topcoder.shared.dataAccess;

import java.util.*;
import javax.naming.*;
import java.sql.Connection;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;

/** 
 * This bean processes a Request and returns the data from the data warehouse.
 *
 * @author  Dave Pecora
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.2  2002/06/27 18:25:52  gpaul
 *           adjustments for a correct ApplicationSever.properties file and DBMS.properties file
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
 * @see     RequestInt
 */
public class DWDataAccess implements DataAccessInt {
    private static Logger log = Logger.getLogger(DWDataAccess.class);
    
    /**
     * This method passes a query command request and a connection 
     * to the data retriever and receives and passes on the results
     *
     * @param   request A <tt>RequestInt</tt> request object containing a number 
     * of input property values.
     * @return  A map of the query results, where the keys are strings
     * of query names and the values are <tt>ResultSetContainer</tt> objects.
     * @throws  Exception if there was an error encountered while retrieving
     * the data from the EJB.
     */
    public Map getData(RequestInt request) throws Exception {
        try {
            Connection conn = DBMS.getDWConnection();
            DataRetriever dr = new DataRetriever(conn);
            Map map = dr.executeCommand(request.getProperties());
            if (conn != null) {
              try {
                conn.close();
              } catch (Exception ce) { 
                log.error("Failed to close connection");
              }
            }
            return map;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }
}

