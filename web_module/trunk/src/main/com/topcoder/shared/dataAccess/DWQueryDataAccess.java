package com.topcoder.shared.dataAccess;

import java.util.*;
import javax.naming.*;
import java.sql.Connection;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;

/** 
 * This bean processes a Request and returns the data from the data warehouse.
 *
 * @author  Greg Paul
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
 * @see     RequestInt
 */
public class DWQueryDataAccess implements DataAccessInt {
    private static Logger log = Logger.getLogger(DWQueryDataAccess.class);
    
    /**
     * This method passes a query request and passes the contents
     * of that request and a connection to the data warehouse 
     * to the QueryRunner.
     *
     * @param   request A <tt>RequestInt</tt> request object containing a number 
     * of queries.
     * @return  A map of the query results, where the keys are strings
     * of query names and the values are <tt>ResultSetContainer</tt> objects.
     * @throws  Exception if there was an error encountered while retrieving
     * the data.
     */
    public Map getData(RequestInt request) throws Exception {
        try {
            Connection conn = DBMS.getDWConnection();
            QueryRunner qr = new QueryRunner(conn);
            Map map = qr.executeCommand(request.getProperties());
            if (conn != null && !conn.isClosed()) {
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

