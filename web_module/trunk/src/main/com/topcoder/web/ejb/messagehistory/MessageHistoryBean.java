package com.topcoder.web.ejb.messagehistory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.InitialContext;

/**
 * This class handles interaction with the database regarding revision history of forum messages.
 *
 * @author mtong
 */

public class MessageHistoryBean extends BaseEJB {

    private static Logger log = Logger.getLogger(MessageHistoryBean.class);

    public void addEdit(long messageId, String subject, String body, long modificationDate, String dataSource) {
        int ret = insert("message_history",
                new String[]{"messageid", "subject", "body", "modificationDate"},
                new String[]{String.valueOf(messageId), subject, body, String.valueOf(modificationDate)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows inserted into " +
                    "'message_history'. Inserted " + ret + ", " +
                    "should have inserted 1."));
        }
    }

    public ResultSetContainer getEdits(long messageId, String dataSource) {
        return selectSet("message_history", 
                new String[]{"historyid", "messageid", "subject", "body", "modificationDate"},
                new String[]{},
                new String[]{},
                dataSource);
    }
    
    protected ResultSetContainer selectSet(String tableName, String colNames[], String[] constraintColNames,
            String[] constraintColValues, String dataSource) {
        if (constraintColNames.length != constraintColValues.length)
            throw new IllegalArgumentException("name and value arrays don't have the same number of elements.");
        else {
            StringBuffer query = new StringBuffer(200);
            query.append("select ");
            for (int i = 0; i < colNames.length; i++) {
                query.append(colNames[i]);
                if (colNames.length > 1 && i != colNames.length - 1)
                    query.append(", ");
            }

            query.append(" from ").append(tableName).append(" where ");
            for (int i = 0; i < constraintColNames.length; i++) {
                query.append(constraintColNames[i]).append(" = ?");
                if (constraintColNames.length > 1 && i != constraintColNames.length - 1)
                    query.append(" and ");
            }
            query.append(" order by modificationDate desc ");

            log.debug(query);

            Connection conn = null;
            PreparedStatement ps = null;
            InitialContext ctx = null;
            ResultSet rs = null;
            try {

                conn = DBMS.getConnection(dataSource);
                ps = conn.prepareStatement(query.toString());
                for (int i = 0; i < constraintColNames.length; i++) {
                    ps.setString(i + 1, constraintColValues[i]);
                }
                rs = ps.executeQuery();
                return new ResultSetContainer(rs);

            } catch (SQLException e) {
                DBMS.printSqlException(true, e);
                throw new EJBException(e.getMessage());
            } catch (Exception e) {
                throw new EJBException(e.getMessage());
            } finally {
                close(rs);
                close(ps);
                close(conn);
                close(ctx);
            }

        }
    }
}
