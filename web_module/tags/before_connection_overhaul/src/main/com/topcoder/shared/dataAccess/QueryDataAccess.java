package com.topcoder.shared.dataAccess;

import com.topcoder.shared.util.logging.Logger;

import javax.sql.DataSource;
import java.sql.Connection;
import java.util.Map;

/**
 * This bean processes a {@link com.topcoder.shared.dataAccess.QueryRequest} and returns the data.
 *
 * @author  Greg Paul
 * @version $Revision$
 * @see     QueryRequest
 */
public class QueryDataAccess implements DataAccessInt {
    private static Logger log = Logger.getLogger(QueryDataAccess.class);
    private DataSource dataSource;
    /**
     * Default Constructor
     */
    public QueryDataAccess() {
    }

    /**
     * Construtor that takes a data source to be used.
     * @param dataSource
     */
    public QueryDataAccess(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    /**
     * This method takes a request and passes the contents
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
        Connection conn = dataSource.getConnection();
        try {
            QueryRunner qr = new QueryRunner(conn);
            Map map = qr.executeCommand(request.getProperties());
            return map;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
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

