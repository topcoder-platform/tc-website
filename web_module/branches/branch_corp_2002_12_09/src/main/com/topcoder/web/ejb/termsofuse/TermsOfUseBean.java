package com.topcoder.web.ejb.termsofuse;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.sql.SimpleDB;
import com.topcoder.shared.util.DBMS;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.ejb.EJBException;
import javax.naming.NamingException;
import java.rmi.RemoteException;
import java.sql.SQLException;


/**
 * Bean which modifies Terms Of Use table
 *
 * @author George Nassar
 * @version $Revision$
 */
public class TermsOfUseBean implements SessionBean {
    private static Logger log = Logger.getLogger(TermsOfUseBean.class);
    private SessionContext ctx;

    //required ejb methods
    public void ejbActivate() {}

    /**
     *
     */
    public void ejbPassivate() {}

    /**
     *
     */
    public void ejbCreate() {
        //InitContext = new InitialContext(); // from BaseEJB
    }

    /**
     *
     */
    public void ejbRemove() {}

    /**
     *
     *
     */
    public void setSessionContext(SessionContext ctx) {
        this.ctx = ctx;
    }

    //business methods

    /**
     *
     *
     * @return a long with the unique Terms Of Use ID created
     */
    public long createTermsOfUse() {
        log.debug("createTermsOfUse called...");

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            ctx = new InitialContext();

            if (!IdGenerator.isInitialized()) {
                IdGenerator.init(
                                 new SimpleDB(),
                                 (DataSource)ctx.lookup((String)
                                 ctx.lookup("java:comp/env/datasource_name")),
                                 "sequence_object",
                                 "name",
                                 "current_value",
                                 9999999999L,
                                 1,
                                 true);
            }

            ret = IdGenerator.nextId("TERMSOFUSE_SEQ");

            ds = (DataSource)ctx.lookup((String)ctx.lookup(
                "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("INSERT INTO company " +
                                       "(terms_of_use_id) VALUES (?)");
            ps.setLong(1, ret);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " +
                                       rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                                   true,
                                   sqe);
            throw new EJBException("SQLException creating terms of use ID");
        } catch (NamingException e) {
            throw new EJBException("NamingException creating terms of use ID");
        } catch (Exception e) {
            throw new EJBException("Exception creating terms of use ID:\n" +
                                   e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                              "createTermsOfUse");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in " +
                              "createTermsOfUse");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in createTermsOfUse");
                }
            }
        }

        return (ret);
    }

    /**
     *
     *
     * @param termsOfUseId Terms Of Use ID of entry to set
     * @param text Terms Of Use text to set to
     */
    public void setText(long termsOfUseId, String text) {
        log.debug("setText called...termsOfUseId: " + termsOfUseId +
                  " text: " + text);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup((String)ctx.lookup(
                "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement ("UPDATE terms_of_use SET terms_text" +
                                        " = ? WHERE terms_of_use_id = ?");
            ps.setString(1, text);
            ps.setLong(2, termsOfUseId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                                       rows + " for terms_of_use_id: " +
                                       termsOfUseId + " text: " + text);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                                   true,
                                   sqe);
            throw new EJBException("SQLException updating terms_of_use_id: " +
                                   termsOfUseId + " text: " + text);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating terms_of_use " +
                                   "text");
        } catch (Exception e) {
            throw new EJBException("Exception updating terms_of_use_id: " +
                                   termsOfUseId + " text: " + text + "\n" +
                                   e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in setText");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in setText");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setText");
                }
            }
        }
    }

    /**
     *
     *
     * @param termsOfUseId Terms Of Use ID of entry to set
     * @param id Terms Of Use type ID to set to
     */
    public void setTermsOfUseTypeId(long termsOfUseId, long id) {
        log.debug("setTermsOfUseTypeId called...termsOfUseId: " +
                  termsOfUseId + " id: " + id);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup((String)ctx.lookup(
                "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("UPDATE company SET " +
                                       "terms_of_use_type_id = ? " +
                                       "WHERE terms_of_use_id = ?");
            ps.setLong(1, id);
            ps.setLong(2, termsOfUseId);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in update: " +
                                       rows + " for terms_of_use_id: " +
                                       termsOfUseId +
                                       " terms_of_use_type_id: " + id);
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                                   true,
                                   sqe);
            throw new EJBException("SQLException updating terms_of_use_id: " +
                                   termsOfUseId + " terms_of_use_type_id: " +
                                   id);
        } catch (NamingException e) {
            throw new EJBException("NamingException updating Terms Of Use " +
                                   "type ID");
        } catch (Exception e) {
            throw new EJBException("Exception updating terms_of_use_id: " +
                                   termsOfUseId + " terms_of_use_type_id: " +
                                   id + "\n" + e.getMessage());
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in setName");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in setName");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in setName");
                }
            }
        }
    }

    /**
     *
     *
     * @param termsOfUseId the Terms Of Use ID of the entry
     *
     * @return a String with the entry's Terms Of Use text
     */
    public String getText(long termsOfUseId) {
        log.debug("getText called...terms_of_use_id: " + termsOfUseId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        String ret = null;

        try {
            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup((String)ctx.lookup(
                "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT terms_text FROM " +
                                       "terms_of_use_id " +
                                       "WHERE terms_of_use_id = ?");
            ps.setLong(1, termsOfUseId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getString("terms_text");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                                   true,
                                   sqe);
            throw new EJBException("SQLException getting terms_text for " +
                                   "terms_of_use_id: " +
                                   termsOfUseId);
        } catch (NamingException e) {
            throw new EJBException("NamingException getting terms_of_use_id " +
                                   "text");
        } catch (Exception e) {
            throw new EJBException("Exception getting terms_text for " +
                                   "terms_of_use_id: " +
                                   termsOfUseId + "\n" + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in getText");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in getText");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in getText");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in getText");
                }
            }
        }

        return (ret);
    }

    /**
     *
     *
     * @param termsOfUseId the Terms Of Use ID of the entry
     *
     * @return a long with the entry's Terms Of Use type ID
     */
    public long getTermsOfUseTypeId(long termsOfUseId) {
        log.debug("getTermsOfUseTypeId called...terms_of_use_id: " +
                  termsOfUseId);

        Context ctx = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;
        DataSource ds = null;
        long ret = 0;

        try {
            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup((String)ctx.lookup(
                "java:comp/env/datasource_name"));
            conn = ds.getConnection();

            ps = conn.prepareStatement("SELECT terms_of_use_type_id FROM " +
                                       "terms_of_use " +
                                       "WHERE terms_of_use_id = ?");
            ps.setLong(1, termsOfUseId);

            rs = ps.executeQuery();

            if (rs.next())
                ret = rs.getLong("terms_of_use_type_id");
        } catch (SQLException sqe) {
            DBMS.printSqlException(
                                   true,
                                   sqe);
            throw new EJBException("SQLException getting " +
                                   "terms_of_use_type_id for " +
                                   "terms_of_use_id: " + termsOfUseId);
        } catch (NamingException e) {
            throw new EJBException("NamingException getting primary contact " +
                                   "id");
        } catch (Exception e) {
            throw new EJBException("Exception getting terms_of_use_type_id " +
                                   "for terms_of_use_id: " +
                                   termsOfUseId + "\n" + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close ResultSet in " +
                              "getTermsOfUseTypeId");
                }
            }

            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close PreparedStatement in " +
                              "getTermsOfUseTypeId");
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Connection in " +
                              "getTermsOfUseTypeId");
                }
            }

            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                    log.error("FAILED to close Context in " +
                              "getTermsOfUseTypeId");
                }
            }
        }

        return (ret);
    }
}
