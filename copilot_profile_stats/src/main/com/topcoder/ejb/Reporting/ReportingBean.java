package com.topcoder.ejb.Reporting;

import com.topcoder.common.web.data.report.*;
import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import javax.ejb.EJBException;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class ReportingBean extends BaseEJB {
    private static Logger log = Logger.getLogger(ReportingBean.class);

    /**
     * Execute the given query and returns an ArrayList of arrays of
     * ResultItems.
     */
    public ArrayList getResult(Query query) throws RemoteException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList resultList = new ArrayList();
        int[] returnTypes = query.getReturnTypes();
        Connection conn = null;

        try {
            if (query.getDB() == null) throw new EJBException("Could not execute query, DataSourceName has not been set.");
            conn = DBMS.getConnection(query.getDB());

            log.debug("query:\n" + query.getQuery());
            ps = conn.prepareStatement(query.getQuery());
            rs = ps.executeQuery();
            while (rs.next()) {
                ResultItem[] resultItems = new ResultItem[returnTypes.length];
                for (int i = 0; i < returnTypes.length; i++) {
                    resultItems[i] = getResultItem(rs, returnTypes[i], i + 1);
                }
                resultList.add(resultItems);
            }
        } catch (SQLException sqe) {
            log.debug("query: " + query);
            DBMS.printSqlException(true, sqe);
            throw new RemoteException(sqe.getMessage());
        } catch (Exception e) {
            log.debug("query: " + query);
            e.printStackTrace();
            throw new RemoteException(e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (Exception ignore) {
                log.error("rs   close problem");
            }
            try {
                if (ps != null) ps.close();
            } catch (Exception ignore) {
                log.error("ps   close problem");
            }
            try {
                if (conn != null) conn.close();
            } catch (Exception ignore) {
                log.error("conn close problem");
            }
            rs = null;
            ps = null;
            conn = null;
        }
        return resultList;
    }


    /**
     * Returns a particular type of return item.
     */
    private ResultItem getResultItem(ResultSet rs, int returnType, int col)
            throws SQLException, Exception {
        switch (returnType) {
            case ResultItem.INT:
                return new IntResult(rs.getInt(col));
            case ResultItem.STRING:
                return new StringResult(rs.getString(col));
            case ResultItem.DATE:
                return new DateResult(rs.getDate(col));
            case ResultItem.FLOAT:
                return new FloatResult(rs.getFloat(col));
            default:
                throw new Exception("invalid returnType: " + returnType);
        }
    }


}
