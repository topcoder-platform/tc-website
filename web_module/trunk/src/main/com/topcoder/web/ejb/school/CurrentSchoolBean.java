package com.topcoder.web.ejb.school;

import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.shared.util.DBMS;

import javax.ejb.EJBException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CurrentSchoolBean extends BaseEJB {
    public void createCurrentSchool(long coderId, String schoolName, long schoolId, String dataSource) throws EJBException {

        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;

        try {
            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append(  "INTO current_school (coder_id, school_name, school_id) ");
            query.append("VALUES (?, ?, ?)");

            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup(dataSource);
            conn = ds.getConnection();
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, coderId);
            ps.setString(2, schoolName);
            ps.setLong(3, schoolId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                        "'current_school'. Inserted " + rc + ", should have " +
                        "inserted 1."));
            }
        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw(new EJBException(sqle.getMessage()));
        } catch (NamingException e) {
            e.printStackTrace();
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }

    }
}
