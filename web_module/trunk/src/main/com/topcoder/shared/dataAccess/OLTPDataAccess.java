package com.topcoder.shared.dataAccess;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.Context;
import javax.sql.DataSource;
import java.sql.Connection;
import java.util.Map;

/**
 * This bean processes a RequestInt and returns the data from the Transactional database.
 *
 * @author  Dave Pecora
 * @version $Revision$
 * @see     RequestInt
 */
public class OLTPDataAccess implements DataAccessInt {
    private static Logger log = Logger.getLogger(OLTPDataAccess.class);

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
        try {
            Context ctx = TCContext.getInitial();
            DataSource ds = (DataSource) ctx.lookup("OLTP");
            Connection conn = ds.getConnection();
            DataRetriever dr = new DataRetriever(conn);
            Map map = dr.executeCommand(request.getProperties());
            if (conn != null && !conn.isClosed()) {
                try {
                    conn.close();
                } catch (Exception ce) {
                    log.error("Failed to close connection");
                }
            }
            return map;
        } catch (Exception e) {
            throw e;
        }
    }
}

