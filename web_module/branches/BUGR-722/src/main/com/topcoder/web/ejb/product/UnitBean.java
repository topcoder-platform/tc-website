package com.topcoder.web.ejb.product;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.common.IdGeneratorClient;

import javax.ejb.EJBException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * Bean which modifies Unit table
 *
 * @author Greg Paul
 * @version $Revision: 45943 $
 */
public class UnitBean extends BaseEJB {
    private static Logger log = Logger.getLogger(UnitBean.class);
    private static final String DATA_SOURCE = "java:comp/env/datasource_name";
    private static final String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";

    public long createUnit(int unitTypeId) {
        log.debug("createUnit called...");

        Context ctx = null;
        PreparedStatement ps = null; // could just use Statement
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            ctx = new InitialContext();

            ret = IdGeneratorClient.getSeqId("UNIT_SEQ");

            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement("INSERT INTO unit (unit_id, " +
                    "unit_type_id) VALUES (?,?)");
            ps.setLong(1, ret);
            ps.setInt(2, unitTypeId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating unit");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating unit");
        } catch (Exception e) {
            throw new EJBException("Exception creating unit:\n" +
                    e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }

        return (ret);
    }

    public String getUnitDesc(long unitId) {
        log.debug("getUnitDesc called...unit_id: " + unitId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement("SELECT unit_desc FROM unit " +
                    "WHERE unit_id = ?");
            ps.setLong(1, unitId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("unit_desc");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting unit_desc");
        } catch (Exception e) {
            throw new EJBException("Exception getting unit_desc\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return (ret);
    }

    public int getUnitTypeId(long unitId) {
        log.debug("getCost called...unit_id: " + unitId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        int ret = 0;

        try {
            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement("SELECT unit_type_id FROM unit " +
                    "WHERE unit_id = ?");
            ps.setLong(1, unitId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getInt("unit_type_id");
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getting cost");
        } catch (Exception e) {
            throw new EJBException("Exception getting cost\n" +
                    e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }

        return (ret);
    }

    public void setUnitDesc(long unitId, String unitDesc) {
        log.debug("setUnitDesc called...unitId: " + unitId +
                " unitDesc: " + unitDesc);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement("UPDATE unit SET unit_desc = ?" +
                    "WHERE unit_id = ?");
            ps.setString(1, unitDesc);
            ps.setLong(2, unitId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating unitDesc");
        } catch (Exception e) {
            throw new EJBException("Exception updating unitDesc\n" +
                    e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void setUnitTypeId(long unitId, int unitTypeId) {
        log.debug("setCost called...unitId: " + unitId + "unitTypeId: " +
                unitTypeId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            conn = DBMS.getConnection(JTS_DATA_SOURCE);

            ps = conn.prepareStatement("UPDATE unit SET unit_type_id = ? " +
                    "WHERE unit_id = ?");
            ps.setInt(1, unitTypeId);
            ps.setLong(2, unitId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong cost of rows in update: " +
                        rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException updating cost");
        } catch (Exception e) {
            throw new EJBException("Exception updating cost\n" +
                    e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

}
