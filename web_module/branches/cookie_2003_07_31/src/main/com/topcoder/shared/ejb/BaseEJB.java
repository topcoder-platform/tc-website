package com.topcoder.shared.ejb;

import com.topcoder.shared.util.logging.Logger;

import javax.ejb.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import java.sql.*;


/**
 * This class is intended to be a base class for all of Medecoms EJBs.  Code
 * common to all EJBs should probably be included here.
 *
 * @author  Jess Evans
 * @version  $Revision$
 */
public abstract class BaseEJB implements SessionBean {
    private static Logger log = Logger.getLogger(BaseEJB.class);

//****************************************************************************
//                               Protected  Members
//****************************************************************************

    /**
     * This method uses the DriverManager.getConnection(String) method to get a
     * database Connection from the regular (non-transactional) service pool
     * using a jdbc connection string.  This is faster and should be used for
     * services which don't require perform multiple inserts/updates to the db.
     *
     * @param pool    the connection pool name
     * @return         a database Connection object.
     * @throws SQLException
     */
    protected static Connection getConnection(String pool) throws SQLException {
        return DriverManager.getConnection("jdbc:weblogic:pool:" + pool);
    }


    /**
     * This method uses the DriverManager.getConnection(String) method to get a
     * database Connection from the transactional service pool using a jdbc
     * connection string.  This should be used when multiple inserts/updates
     * must be performed in one transaction.  JTS will ensure that a bean
     * failure results in a full db rollback.
     *
     * @param pool    the connection pool name
     * @return         a database Connection object.
     * @throws SQLException
     */
    protected static Connection getTransConnection(String pool) throws SQLException {
        return DriverManager.getConnection("jdbc:weblogic:jts:" + pool);
    }


    /**
     * This class returns the context.
     * @return
     */
    protected Context getContext() {
        try {
            if (InitContext == null)
                InitContext = new InitialContext();
        } catch (Exception e) {
            e.printStackTrace();
            log.debug("Error occurred getting context");
        }

        return InitContext;
    }


    /**
     * Returns the tag to append to the default debug statement.
     * This may be overridden for verbose debugging.
     * @return
     */
    protected String getTag() {
        return TAG;
    }


//****************************************************************************
//                                 Get / Set
//****************************************************************************

    /**
     *
     * @param ps
     * @param index
     * @param s
     * @throws SQLException
     */
    protected void setString(PreparedStatement ps, int index, String s) throws SQLException {
        if (s == null || s.equals(""))
            ps.setString(index, null);
        else
            ps.setString(index, s);
    }

    /**
     *
     * @param ps
     * @param index
     * @param i
     * @throws SQLException
     */
    protected void setInt(PreparedStatement ps, int index, Integer i) throws SQLException {
        if (i == null)
            ps.setNull(index, java.sql.Types.INTEGER);
        else
            ps.setInt(index, i.intValue());
    }

    /**
     *
     * @param ps
     * @param index
     * @param f
     * @throws SQLException
     */
    protected void setFloat(PreparedStatement ps, int index, Float f) throws SQLException {
        if (f == null)
            ps.setNull(index, java.sql.Types.FLOAT);
        else
            ps.setFloat(index, f.floatValue());
    }

    /**
     *
     * @param ps
     * @param index
     * @param l
     * @throws SQLException
     */
    protected void setLong(PreparedStatement ps, int index, Long l) throws SQLException {
        if (l == null)
            ps.setNull(index, java.sql.Types.INTEGER);
        else
            ps.setLong(index, l.longValue());
    }

    /**
     *
     * @param ps
     * @param index
     * @param date
     * @throws SQLException
     */
    protected void setDate(PreparedStatement ps, int index, java.sql.Date date) throws SQLException {
        if (date == null)
            ps.setNull(index, java.sql.Types.DATE);
        else
            ps.setDate(index, date);
    }

    /**
     *
     * @param ps
     * @param index
     * @param obj
     * @throws SQLException
     */
    protected void setObject(PreparedStatement ps, int index, Object obj) throws SQLException {
        if (obj == null)
            ps.setNull(index, java.sql.Types.OTHER);
        else
            ps.setObject(index, obj);
    }

    /**
     *
     * @param rs
     * @param index
     * @return
     * @throws SQLException
     */
    protected Object getObject(ResultSet rs, int index) throws SQLException {
        return rs.getObject(index);
    }

    /**
     *
     * @param rs
     * @param index
     * @return
     * @throws SQLException
     */
    protected java.sql.Date getDate(ResultSet rs, int index) throws SQLException {
        return rs.getDate(index);
    }

    /**
     *
     * @param rs
     * @param index
     * @return
     * @throws SQLException
     */
    protected String getString(ResultSet rs, int index) throws SQLException {
        return rs.getString(index);
    }

    /**
     *
     * @param rs
     * @param index
     * @return
     * @throws SQLException
     */
    protected Integer getInt(ResultSet rs, int index) throws SQLException {
        int i = rs.getInt(index);
        if (rs.wasNull())
            return null;
        else
            return new Integer(i);
    }

    /**
     *
     * @param rs
     * @param index
     * @return
     * @throws SQLException
     */
    protected Float getFloat(ResultSet rs, int index) throws SQLException {
        float f = rs.getFloat(index);
        if (rs.wasNull())
            return null;
        else
            return new Float(f);
    }

    /**
     *
     * @param rs
     * @param index
     * @return
     * @throws SQLException
     */
    protected Long getLong(ResultSet rs, int index) throws SQLException {
        long l = rs.getLong(index);
        if (rs.wasNull())
            return null;
        else
            return new Long(l);
    }



//****************************************************************************
//                                 Data Members
//****************************************************************************

    private SessionContext ctx;
    //private transient Properties props;
    private transient Context InitContext;
    private static final String TAG = "BaseEJB";



//****************************************************************************
//                                 EJB lifecycle
//****************************************************************************

    /**
     * This method is required by the EJB Specification
     *
     */
    public void ejbActivate() {
    }


    /**
     * This method is required by the EJB Specification
     *
     */
    public void ejbPassivate() {
    }


    /**
     * This method is required by the EJB Specification.
     * Used to get the context ... for dynamic connection pools.
     * @throws CreateException
     */
    public void ejbCreate() throws CreateException {
        InitContext = getContext();
    }


    /**
     * This method is required by the EJB Specification
     */
    public void ejbRemove() {
    }


    /**
     * Sets the transient SessionContext.
     * Sets the transient Properties.
     * @param ctx
     */
    public void setSessionContext(SessionContext ctx) {
        this.ctx = ctx;
        //props = ctx.getEnvironment();
    }


//****************************************************************************
//                         Dynamic Connection Pooling
//****************************************************************************

    /**
     * Check to see the the connection pool exists.
     * @param poolName - connection pool name
     * @return true if pool exists, false otherwise.
     * @param poolName
     * @return
     */
    public boolean poolExists(String poolName) {
        boolean exists = true;

        try {
            weblogic.jdbc.common.JdbcServices jdbc = (weblogic.jdbc.common.JdbcServices) InitContext.lookup("weblogic.jdbc.JdbcServices");

            if (jdbc.poolExists(poolName)) {
                exists = true;
            } else {
                exists = false;
                log.debug(poolName + " Does Not exists");
            }
        } catch (Exception e) {
            log.debug("Error checking connection pool existence.");
        }

        return exists;
    }


    static {
        new weblogic.jdbc.jts.Driver();    // force static initialization
    }
}
