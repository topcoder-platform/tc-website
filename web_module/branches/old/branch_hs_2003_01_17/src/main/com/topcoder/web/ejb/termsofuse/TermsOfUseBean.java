package com.topcoder.web.ejb.termsofuse;

import com.topcoder.shared.util.DBMS;
import com.topcoder.util.idgenerator.*;
import com.topcoder.util.idgenerator.sql.*;

import java.rmi.RemoteException;
import java.sql.*;
import javax.ejb.*;
import javax.naming.*;
import javax.sql.*;

public class TermsOfUseBean implements SessionBean {

    private final static String DATA_SOURCE = "java:comp/env/datasource_name";

    private final static String JTS_DATA_SOURCE = "java:comp/env/jts_datasource_name";

    private transient InitialContext initCtx = null;

    private SessionContext ctx;

    public void ejbActivate() {
        /* do nothing */
    }

    public void ejbPassivate() {
        /* do nothing */
    }

    public void ejbCreate() throws CreateException {
        try {
            initCtx = new InitialContext();
        }
        catch (NamingException ne) {
            ne.printStackTrace();
        }
    }

    public void ejbRemove() {
        /* do nothing */
    }

    public void setSessionContext(SessionContext ctx) {
        this.ctx = ctx;
    }

    public long createTermsOfUse() throws EJBException, RemoteException {

        long termsOfUseId = 0;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            if (!IdGenerator.isInitialized()) {
                IdGenerator.init(new SimpleDB(), ds, "sequence_object", "name",
                                 "current_value", 9999999999L, 1, true);
            }

            termsOfUseId = IdGenerator.nextId("TERMS_OF_USE_SEQ");

            dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO terms_of_use (terms_of_use_id) ");
            query.append("VALUES (?)");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, termsOfUseId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                                       "'terms_of_use'. Inserted " + rc + ", should " +
                                       "have inserted 1."));
            }
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw(new EJBException(sqle.getMessage()));
        }
        catch (NamingException ne) {
            ne.printStackTrace();
            throw(new EJBException(ne.getMessage()));
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
        }
        return (termsOfUseId);
    }

    public long getTermsOfUseTypeId(long termsOfUseId)
            throws EJBException, RemoteException {

        long termsOfUseTypeId = 0;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT terms_of_use_type_id ");
            query.append("FROM terms_of_use ");
            query.append("WHERE terms_of_use_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, termsOfUseId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                termsOfUseTypeId = rs.getLong(1);
            }
            else {
                throw(new EJBException("No rows found when selecting from " +
                                       "'terms_of_use' with terms_of_use_id=" +
                                       termsOfUseId + "."));
            }
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw(new EJBException(sqle.getMessage()));
        }
        catch (NamingException ne) {
            ne.printStackTrace();
            throw(new EJBException(ne.getMessage()));
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
        }
        return (termsOfUseTypeId);
    }

    public void setTermsOfUseTypeId(long termsOfUseId,
                                    long termsOfUseTypeId)
            throws EJBException, RemoteException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE terms_of_use ");
            query.append("SET terms_of_use_type_id=? ");
            query.append("WHERE terms_of_use_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, termsOfUseTypeId);
            ps.setLong(2, termsOfUseId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in " +
                                       "'terms_of_use'. Updated " + rc + ", should " +
                                       "have updated 1."));
            }
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw(new EJBException(sqle.getMessage()));
        }
        catch (NamingException ne) {
            ne.printStackTrace();
            throw(new EJBException(ne.getMessage()));
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
        }
    }

    public String getText(long termsOfUseId)
            throws EJBException, RemoteException {

        String text = null;

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT terms_text ");
            query.append("FROM terms_of_use ");
            query.append("WHERE terms_of_use_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setLong(1, termsOfUseId);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                text = DBMS.getTextString(rs, 1);
            }
            else {
                throw(new EJBException("No rows found when selecting from " +
                                       "'terms_of_use' with terms_of_use_id=" +
                                       termsOfUseId + "."));
            }
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw(new EJBException(sqle.getMessage()));
        }
        catch (NamingException ne) {
            ne.printStackTrace();
            throw(new EJBException(ne.getMessage()));
        }
        catch (Exception e) {
            e.printStackTrace();
            throw(new EJBException(e.getMessage()));
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
        }
        return (text);
    }

    public void setText(long _terms_of_use_id, String _text)
            throws EJBException, RemoteException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            String dsName = (String) initCtx.lookup(JTS_DATA_SOURCE);
            DataSource ds = (DataSource) initCtx.lookup(dsName);

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE terms_of_use ");
            query.append("SET terms_text=? ");
            query.append("WHERE terms_of_use_id=?");

            con = ds.getConnection();
            ps = con.prepareStatement(query.toString());
            ps.setBytes(1, DBMS.serializeTextString(_text));
            ps.setLong(2, _terms_of_use_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in " +
                                       "'terms_of_use'. Updated " + rc + ", should " +
                                       "have updated 1."));
            }
        }
        catch (SQLException sqle) {
            sqle.printStackTrace();
            throw(new EJBException(sqle.getMessage()));
        }
        catch (NamingException ne) {
            ne.printStackTrace();
            throw(new EJBException(ne.getMessage()));
        }
        catch (Exception e) {
            e.printStackTrace();
            throw(new EJBException(e.getMessage()));
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (Exception e) {
                    /* do nothing */
                }
            }
        }
    }

};
