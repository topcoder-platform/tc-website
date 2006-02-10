package com.topcoder.util.informixinit;

import org.jboss.system.ServiceMBeanSupport;

import javax.management.*;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/********************************************************************
 * This class initialises the "LOCK WAIT" time of Informix database
 * connections.
 * This functionality is implemented as a JBoss-specific MBean.
 *
 * @author Micah Modell
 *******************************************************************/
public class InitialiseInformixJDBC extends ServiceMBeanSupport
        implements InitialiseInformixJDBCMBean {
    private static final String NAME = "InitialiseInformixJDBC";
    private static final String CFG_STMT = "SET LOCK MODE TO WAIT 5";

    private static String status = "Not Initialised";

    private Boolean isInitialised = Boolean.FALSE;

    /************************************************************
     * Obtain a descriptive name for this MBean.
     *
     * @return the name of this MBean.
     ***********************************************************/
    public String getName() {
        return NAME;
    }

    /************************************************************
     * Determine whether the connections initialised
     * properly or not.
     *
     * @return <code>True</code> if the connections
     *      have been properly; <code>False</code> otherwise.
     ***********************************************************/
    public Boolean isInitialised() {
        return isInitialised;
    }

    /************************************************************
     * Determine whether the connections initialised
     * properly or not.
     *
     * @return <code>True</code> if the connections
     *      have been properly; <code>False</code> otherwise.
     ***********************************************************/
    public String getInitStatus() {
        return status;
    }

    /************************************************************
     * Obtain and initialise our connections here.
     ***********************************************************/
    public void startService() throws Exception {
        initHelper();
    }

    /************************************************************
     * Manually perform a refresh of the connections.
     ***********************************************************/
    public void manualRefresh() throws Exception {
        initHelper();
    }

    /************************************************************
     * perform the actual initialisation here.
     ***********************************************************/
    private void initHelper() throws Exception {
//obtain and initialise connections
        DataSource ds = null;
        try {
//Obtain the DataSource from the JNDI tree
            InitialContext ctx = new InitialContext();

            MBeanServer mbs = (MBeanServer) MBeanServerFactory.
                    findMBeanServer(null).get(0);

//Create the ObjectName
            java.util.Hashtable keys = new java.util.Hashtable();
            keys.put("service", "LocalTxPool");
            keys.put("name", "InformixDS");
            ObjectName on = new ObjectName("jboss.jca", keys);

            Integer maxSize = (Integer) mbs.getAttribute(on, "MaxSize");
            ds = (DataSource) ctx.lookup(
                    "java:InformixDS");
            ctx.close();
            Connection conn[ ] = new Connection[maxSize.intValue()];
            Boolean different = Boolean.TRUE;
            for (int counter = 0; counter < conn.length; counter++) {
                conn[counter] = ds.getConnection();
                Statement stmt = conn[counter].createStatement();
                stmt.execute(CFG_STMT);
                try {
                    stmt.close();
                } catch (SQLException sql_ex) {
//Do Nothing
                    status += sql_ex.getMessage();
                }

                for (int inner = 0; inner < counter - 1; inner++) {
                    different = conn[counter].equals(conn[inner])
                            ? Boolean.FALSE : Boolean.TRUE;
                }
            }
            for (int counter = 0; counter < conn.length; counter++) {
                try {
                    conn[counter].close();
                } catch (SQLException sql_ex) {
//Do Nothing
                    status += sql_ex.getMessage();
                }
            }
            isInitialised = different;
            status = isInitialised.booleanValue()
                    ? "Initialised Properly" : "Not Initialised Properly";
        } catch (AttributeNotFoundException anf_ex) {
//error handling here
            status += "<br>\nANF_Ex:" + anf_ex.getMessage();
        } catch (MBeanException mb_ex) {
//error handling here
            status += "<br>\nMB_Ex:" + mb_ex.getMessage();
        } catch (InstanceNotFoundException inf_ex) {
//error handling here
            status += "<br>\nINF_Ex:" + inf_ex.getMessage();
        } catch (ReflectionException r_ex) {
//error handling here
            status += "<br>\nR_Ex:" + r_ex.getMessage();
        } catch (MalformedObjectNameException mon_ex) {
//error handling here
            status += "<br>\nMON_Ex:" + mon_ex.getMessage();
        } catch (NamingException n_ex) {
//error handling here
            status += "\nN_Ex:" + n_ex.getMessage();
        } catch (SQLException sql_ex) {
//error handling here
            status += "\nSQL_Ex:" + sql_ex.getMessage();
        }
    }
}

