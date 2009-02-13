package com.topcoder.web.ejb.rating;

import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.shared.util.DBMS;

import java.sql.*;
import javax.ejb.*;
import javax.sql.DataSource;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class RatingBean extends BaseEJB {


    public void createRating(long coderId, String dataSource) throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;

        try {
            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append(  "INTO rating (coder_id, num_ratings) ");
            query.append("VALUES (?, ?)");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, coderId);
            ps.setInt(2, 0);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                        "'rating'. Inserted " + rc + ", should have " +
                        "inserted 1."));
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw(new EJBException(sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }


}
