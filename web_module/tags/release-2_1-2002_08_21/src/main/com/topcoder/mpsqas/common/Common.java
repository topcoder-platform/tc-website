package com.topcoder.mpsqas.common;

import javax.naming.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public class Common {

    //Databases
    public static final int INFORMIX = 1;
    public static final int POSTGRES = 2;
    public static final int ORACLE = 3;

    //Environments
    public static final int PROD = 1;
    public static final int QA = 2;
    public static final int DEV = 3;

    /** DEV **/
/*
  public static int                   ENVIRONMENT                  = DEV;
  public static String                SERVER_NAME                  = "172.16.1.153";
  public static String                HOST_URL                     = "t3://172.16.1.152:7020";
  public static String[]              WEBLOGIC_CLUSTER_IP          = { "172.16.1.152" };
  public static int                   DB                           = INFORMIX;
  public final static String          BASE_DIR                     = "/export/home/weblog5/classes";
  public final static String          BASE_APP_DIR                 = "/usr/classes";
  public static String                CONNECT_STRING               = "jdbc:oracle:oci8:@jma";
  public static String                POSTGRES_CONNECT_STRING      = "jdbc:postgresql://172.16.1.151:5432/jmabeta";
  public final static int             WEBLOGIC_PORT                = 7020;
  public static String                INFORMIX_CONNECT_STRING      = "jdbc:informix-sqli://172.16.1.151:1526/informixoltp:INFORMIXSERVER=informixoltp_tcp;user=coder;password=coder";
*/

    /** QA (Glastonbury) **/
/*
  public static int                   DB                           = INFORMIX;
  public static String                POSTGRES_CONNECT_STRING      = "jdbc:postgresql://172.16.214.51:5432/qa_transactional";
  public static String                INFORMIX_CONNECT_STRING      = "jdbc:informix-sqli://172.16.214.51:1526/informixoltp:INFORMIXSERVER=informixoltp_tcp;user=coder;password=coder";
  public static int                   ENVIRONMENT                  = QA;
  public static String                SERVER_NAME                  = "172.16.210.99";
  public static String                HOST_URL                     = "t3://jma-cluster.topcoder.com:7001";
  public static String[]              WEBLOGIC_CLUSTER_IP          = { "172.16.212.51", "172.16.212.52" };
  public final static String          BASE_DIR                     = "/export/home/weblog5/classes";
  public final static int             WEBLOGIC_PORT                = 7001;
*/

    //** EXODUS **/
    public static int DB = INFORMIX;
    public static String POSTGRES_CONNECT_STRING = "jdbc:postgresql://192.168.14.51:5432/tcoltp";
    public static String INFORMIX_CONNECT_STRING =
            "jdbc:informix-sqli://192.168.14.51:2020/informixoltp:INFORMIXSERVER=informixoltp_tcp;user=coder;password=coder";
    public static int ENVIRONMENT = PROD;
    public static String SERVER_NAME = "www.topcoder.com";
    public static String HOST_URL = "t3://jma-cluster.topcoder.com:7030";
    public static String[] WEBLOGIC_CLUSTER_IP = {"192.168.12.51", "192.168.12.52"};
    public static String BASE_DIR = "/export/home/apps/classes";
    public final static int WEBLOGIC_PORT = 7030;

    public final static String POOL_DRIVER = "weblogic.jdbc.pool.Driver";
    public final static String POSTGRES_DRIVER = "org.postgresql.Driver";
    public final static String INFORMIX_DRIVER = "com.informix.jdbc.IfxDriver";
    public final static String JMA_INFORMIX_POOL = "jdbc:weblogic:pool:JMAInformixPool";
    public final static String JMA_INFORMIX_POOL_JTS = "jdbc:weblogic:jts:JMAInformixPool";
    public final static String JMA_INFORMIX_DW_POOL = "jdbc:weblogic:pool:JMAInformixDWPool";
    public final static String JMA_INFORMIX_DW_POOL_JTS = "jdbc:weblogic:jts:JMAInformixDWPool";
    public final static String JMA_POSTGRES_POOL = "jdbc:weblogic:pool:JMAPostgresPool";
    public final static String JMA_POSTGRES_POOL_JTS = "jdbc:weblogic:jts:JMAPostgresPool";
    public final static String JMA_POSTGRES_DW_POOL = "jdbc:weblogic:pool:JMAPostgresDWPool";
    public final static String JMA_POSTGRES_DW_POOL_JTS = "jdbc:weblogic:jts:JMAPostgresDWPool";
    public final static String QA_POSTGRES_POOL = "jdbc:weblogic:pool:QAPostgresPool";
    public final static String QA_POSTGRES_POOL_JTS = "jdbc:weblogic:jts:QAPostgresPool";
    public final static String JMA_POOL = "jdbc:weblogic:pool:JMAPool";
    public final static String JMA_POOL_JTS = "jdbc:weblogic:jts:JMAPool";
    public final static String JNDI_FACTORY = "weblogic.jndi.WLInitialContextFactory";
    public final static String JMS_FACTORY = "jms.connection.jmsFactory";
    public final static String JMS_BKP_FACTORY = "jms.connection.jmsFactory_BKP";
    public final static String TRANS_FACTORY = "javax.transaction.UserTransaction";
    public final static String EMAIL_QUEUE = "eMailQueue";
    public final static String MAIL_SERVICES = "jma.MailServicesHome";
    public final static String MPSQAS_SERVICES = "jma.MPSQASServicesHome";
    public final static String COMPILE_QUEUE = "compileQueue";
    public final static String TESTING_QUEUE = "testingQueue";
    public final static String TOPIC = "contestTopic";
    public final static String TZ = "EST";
    public final static String DATEFORMAT = "MMdd HH:mm:ss:SS";

    // Sequence Ids
    public static final int JMA_SEQ = 1;
    public static final int CORPORATE_SEQ = 2;
    public static final int SCHOOL_SEQ = 3;
    public static final int PROBLEM_SEQ = 4;
    public static final int CHALLENGE_SEQ = 5;
    public static final int RTABLE_SEQ = 6;
    public static final int EXPERIENCE_SEQ = 7;
    public static final int EDUCATION_SEQ = 8;
    public static final int RESPONSE_SEQ = 9;


    public static final void logMsg(String in) {
        Calendar cal = Calendar.getInstance(TimeZone.getTimeZone(TZ));
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(DATEFORMAT);
        sdf.setTimeZone(TimeZone.getTimeZone(TZ));
        System.out.println(sdf.format(cal.getTime()) + ": " + in);

    }

    public static final InitialContext getInitialContext() throws NamingException {
        Hashtable env = new Hashtable();
        env.put(Context.INITIAL_CONTEXT_FACTORY, JNDI_FACTORY);
        env.put(Context.PROVIDER_URL, HOST_URL);
        return new InitialContext(env);
    }

    public static final InitialContext getInitialContext(String url) throws NamingException {
        Hashtable env = new Hashtable();
        env.put(Context.INITIAL_CONTEXT_FACTORY, JNDI_FACTORY);
        env.put(Context.PROVIDER_URL, url);
        return new InitialContext(env);
    }

    public static final InitialContext getInitialContextLocal() throws NamingException {
        return new InitialContext();
    }

    public static final java.sql.Connection getInformixConnection() throws SQLException {
        java.sql.Connection conn = null;

        int cnt = 0;
        while (true) {
            cnt++;
            try {
                Driver driver = (Driver) Class.forName(POOL_DRIVER).newInstance();
                conn = driver.connect(JMA_INFORMIX_POOL, null);
                if (conn == null) throw new SQLException();
                break;
            } catch (SQLException e) {
                try {
                    if (cnt >= 10) {
                        System.out.println("ERROR: Could not get Informix connection.");
                        throw e;
                    } else {
                        System.out.println("Could not get Informix Connection... trying again.");
                        Thread.sleep(500);
                    }
                } catch (InterruptedException e2) {
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return conn;
    }

    public static final java.sql.Connection getQAPostgresConnection() throws SQLException {
        java.sql.Connection conn = null;

        int cnt = 0;
        while (true) {
            cnt++;
            try {
                Driver driver = (Driver) Class.forName(POOL_DRIVER).newInstance();
                conn = driver.connect(QA_POSTGRES_POOL, null);
                if (conn == null) throw new SQLException();
                break;
            } catch (SQLException e) {
                try {
                    if (cnt >= 10) {
                        System.out.println("ERROR: Could not get QA POSTGRES connection.");
                        throw e;
                    } else {
                        System.out.println("Could not get QA Postgres Connection... trying again.");
                        Thread.sleep(500);
                    }
                } catch (InterruptedException e2) {
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return conn;
    }


    public static final java.sql.Connection getPostgresConnection() throws SQLException {
        java.sql.Connection conn = null;

        int cnt = 0;
        while (true) {
            cnt++;
            try {
                Driver driver = (Driver) Class.forName(POOL_DRIVER).newInstance();
                conn = driver.connect(JMA_POSTGRES_POOL, null);
                //conn = DriverManager.getConnection(JMA_POOL);
                if (conn == null) throw new SQLException();
                break;
            } catch (SQLException e) {
                try {
                    if (cnt >= 10) {
                        System.out.println("ERROR: Could not get Postgres connection.");
                        throw e;
                    } else {
                        System.out.println("Could not get connection... trying again.");
                        Thread.sleep(500);
                    }
                } catch (InterruptedException e2) {
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return conn;
    }

    public static final java.sql.Connection getConnection() throws SQLException {
        java.sql.Connection conn = null;
        //if (DB.compareToIgnoreCase("Oracle") == 0) {
        if (DB == ORACLE) {

            int cnt = 0;
            while (true) {
                cnt++;
                try {
                    //java.sql.Driver driver = new weblogic.jdbc20.pool.Driver();
                    //conn = driver.connect(JMA_POOL, new java.util.Properties());

                    Driver driver = (Driver) Class.forName(POOL_DRIVER).newInstance();
                    conn = driver.connect(JMA_POOL, null);
                    //conn = DriverManager.getConnection(JMA_POOL);

                    break;
                } catch (SQLException e) {
                    try {
                        if (cnt >= 10) {
                            System.out.println("ERROR: Could not get connection.");
                            throw e;
                        } else {
                            System.out.println("Could not get connection... trying again.");
                            Thread.sleep(500);
                        }
                    } catch (InterruptedException e2) {
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else if (DB == POSTGRES) {
            if (ENVIRONMENT == PROD) {
                conn = getPostgresConnection();
            } else if (ENVIRONMENT == QA) {
                conn = getQAPostgresConnection();
            } else if (ENVIRONMENT == DEV) {
                conn = getPostgresConnection();
            }
        } else if (DB == INFORMIX) {
            conn = getInformixConnection();
        }

        return conn;
    }

    public static final java.sql.Connection getTransConnection() throws SQLException {

        //java.sql.Driver driver = new weblogic.jdbc20.jts.Driver();
        //return driver.connect(JMA_POOL_JTS, new java.util.Properties());
        java.sql.Connection conn = null;
        if (DB == ORACLE) {
            conn = DriverManager.getConnection(JMA_POOL_JTS);
        } else if (DB == POSTGRES) {
            if (ENVIRONMENT == QA) {
                conn = DriverManager.getConnection(QA_POSTGRES_POOL_JTS);
            } else {
                conn = DriverManager.getConnection(JMA_POSTGRES_POOL_JTS);
            }
        } else if (DB == INFORMIX) {
            conn = DriverManager.getConnection(JMA_INFORMIX_POOL_JTS);
        }

        return conn;
    }

    public static final java.sql.Connection getDirectConnection() throws Exception {
        java.sql.Connection result = null;
        if (DB == POSTGRES) {
            try {
                Class.forName(POSTGRES_DRIVER);
            } catch (Exception ex) {
                throw ex;
            }
            result = DriverManager.getConnection(POSTGRES_CONNECT_STRING, "coder", "coder");
        } else {
            try {
                Class.forName(INFORMIX_DRIVER);
            } catch (Exception ex) {
                throw ex;
            }
            result = DriverManager.getConnection(INFORMIX_CONNECT_STRING);
        }
        return result;
    }

    public static final java.sql.Timestamp getCurrentTimestamp(java.sql.Connection conn) throws Exception {
        java.sql.Timestamp result = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            /*********************************************************/
            /*************************Oracle**************************/
            /*********************************************************/
            if (DB == ORACLE) {
                ps = conn.prepareStatement("SELECT SYSDATE FROM dual");
            }
            /*********************************************************/
            /*************************Postgres************************/
            /*********************************************************/
            else if (DB == POSTGRES) {
                ps = conn.prepareStatement("SELECT CURRENT_TIMESTAMP");
            }
            /*********************************************************/
            /*************************Informix************************/
            /*********************************************************/
            else if (DB == INFORMIX) {
                ps = conn.prepareStatement("SELECT CURRENT FROM dual");
            }
            rs = ps.executeQuery();
            if (rs.next()) result = rs.getTimestamp(1);
        } catch (Exception e) {
            throw new Exception("common.Common:getCurrentDate: Error " + e);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    /*****************************************************************************************
     * This generic method deserializes a Blob from the ResultSet and returns the
     * deserialized object.
     *
     * @author ademich
     * @param rs - ResultSet - The ResultSet that the blob should be retrieved from
     * @param column - int - The number of the column in the ResultSet that the blob should be
     *                       retrieved from.
     * @exception RemoteException
     * @return Object - the blob object retrieved from the ResultSet
     ******************************************************************************************
     **/
    public static Object getBlobObject(ResultSet rs, int column)
            throws Exception {
        Object retVal = null;
        ObjectInputStream ois = null;
        Blob bl = null;
        ByteArrayInputStream bs = null;

        try {

            if (Common.DB == ORACLE) {
                bl = (Blob) rs.getObject(column);
                if (bl != null) {
                    ois = new ObjectInputStream(bl.getBinaryStream());
                }
            } else if (Common.DB == POSTGRES) {
                bs = (ByteArrayInputStream) rs.getBinaryStream(column);
                if (bs != null) {
                    ois = new ObjectInputStream(bs);
                }
            } else if (Common.DB == INFORMIX) {
                InputStream is = rs.getBinaryStream(column);
                if (is != null)
                    ois = new ObjectInputStream(is);
            }
            if (ois != null) {
                retVal = ois.readObject();
            }
            System.out.println("RetVal :" + retVal);

            if (ois != null) {
                ois.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("Common: getBlobObject - error: " + e);
        }

        return retVal;

    }

    /*****************************************************************************************
     * This method is used for serializing large (BLOB) objects because it can't be done through
     * SQL.
     *
     * @param obj - Object - the large object to be serialized.
     * @return byte[] - the serialized object as a byte array
     * @exception Exception
     * @author ademich
     ******************************************************************************************
     **/
    public static byte[] serializeBlobObject(Object obj)
            throws Exception {
        if (obj == null)
            throw new Exception("Common.serializeBlobObject:ERROR obj is NULL");


        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        byte[] bytes = null;


        try {
            ObjectOutputStream oos = new ObjectOutputStream(baos);
            oos.writeObject(obj);
            oos.close();
            bytes = baos.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bytes;

    }

    /*****************************************************************************************
     * This method is used for serializing text Strings because it can't be done through
     * SQL. This method should be called when updating or inserting text data types into
     * an INFORMIX database.
     * Example Usage:
     * String text = "text";
     * PreparedStatement ps = connectionVariable.prepareStatement(insertOrUpdateStatement);
     * if (Common.DB.compareToIgnoreCase("Informix") == 0) {
     *    ps.setBytes(column, Common.serializeTextString(text);
     * }
     *
     * @param text - String - the text String to be serialized.
     * @return byte[] - the serialized text String as a byte array
     * @exception Exception
     * @author ademich
     ******************************************************************************************
     **/
    public static byte[] serializeTextString(String text)
            throws Exception {
        if (text == null)
            throw new Exception("Common.serializeTextString:ERROR text is NULL");

        return text.getBytes();

    }

    /*****************************************************************************************
     * This generic method deserializes a text data type from the ResultSet and returns the
     * deserialized String. This method should be called when retrieving a text data type from
     * ANY database.
     * Example Usage:
     * String text = Common.getTextString(rs, columnNum);
     *
     * @param rs - ResultSet - The ResultSet that the String should be retrieved from
     * @param column - int - The number of the column in the ResultSet that the String should be
     *                       retrieved from.
     * @return String - the String retrieved from the Result Set at the column
     * @exception Exception
     * @author ademich
     ******************************************************************************************
     **/
    public static String getTextString(ResultSet rs, int column)
            throws Exception {
        if (rs == null)
            throw new Exception("Common.getTextString:ERROR ResultSet is NULL");
        try {
            byte[] bytes = rs.getBytes(column);
            String text = "";

            if (bytes == null) {
                text = "";
            } else {
                text = new String(bytes);
            }

            return new String(text);
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            throw new Exception(sqle.getMessage());
        }
    }

    /**
     ******************************************************************************************
     * printSqlExceptions()
     * Iterate through and print out informix sql exception information.  Can be called
     * on non-informix sql exceptions.
     * @author Jason Evans
     * @param verbose - whether or not it should print the stack trace
     * @param sqle - a SQL exception
     ******************************************************************************************
     */
    public static void printSqlExceptions(boolean verbose, SQLException sqle) {
        int i = 1;
        System.out.println("*******************************");
        do {
            System.out.println("  Error #" + i + ":");
            System.out.println("    SQLState = " + sqle.getSQLState());
            System.out.println("    Message = " + sqle.getMessage());
            System.out.println("    SQLCODE = " + sqle.getErrorCode());
            if (verbose) sqle.printStackTrace();
            sqle = sqle.getNextException();
            i++;
        } while (sqle != null);
    }

    public static final int getTransSeqId(java.sql.Connection qconn, int sequence_name)
            throws Exception {
        String query = "";
        int result = 0;
        return getSeqId(qconn, sequence_name);
    }


    public static final int getSeqId(int sequence_name) throws Exception {
        Connection conn = null;
        int result = 0;
        try {
            conn = getConnection();
            result = getSeqId(conn, sequence_name);
        } catch (Exception e) {
            throw new Exception(
                    "common.DBMS:getSeqId(String):ERROR:" + e.getMessage()
            );
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }


    public static final int getSeqId(java.sql.Connection qconn, int sequence_name)
            throws Exception {
        boolean getSeqId = true;
        String query = "";
        int result = 0;
        if (DB == POSTGRES) {
            switch (sequence_name) {
                case JMA_SEQ:
                case CHALLENGE_SEQ:
                case EXPERIENCE_SEQ:
                case EDUCATION_SEQ:
                    query = "SELECT nextval('jma_seq')";
                    break;
                case RTABLE_SEQ:
                    query = "SELECT nextval('rtable_seq')";
                    break;
                case PROBLEM_SEQ:
                    query = "SELECT nextval('problem_seq')";
                    break;
                case RESPONSE_SEQ:
                    query = "SELECT nextval('response_seq')";
                    break;
                case SCHOOL_SEQ:
                    query = "SELECT nextval('school_seq')";
                    break;
                case CORPORATE_SEQ:
                    query = "SELECT nextval('subscriber_seq')";
                    break;
                default:
                    Common.logMsg(sequence_name + " IS NOT A RECOGNIZED SEQUENCE ");
                    getSeqId = false;
                    break;
            }
        } else if (DB == INFORMIX) {
            switch (sequence_name) {
                case JMA_SEQ:
                    query = " execute procedure nextval(" + JMA_SEQ + ") ";
                    break;
                case CORPORATE_SEQ:
                    query = " execute procedure nextval(" + CORPORATE_SEQ + ") ";
                    break;
                case SCHOOL_SEQ:
                    query = " execute procedure nextval(" + SCHOOL_SEQ + ") ";
                    break;
                case PROBLEM_SEQ:
                    query = " execute procedure nextval(" + PROBLEM_SEQ + ") ";
                    break;
                case CHALLENGE_SEQ:
                    query = " execute procedure nextval(" + CHALLENGE_SEQ + ") ";
                    break;
                case RTABLE_SEQ:
                    query = " execute procedure nextval(" + RTABLE_SEQ + ") ";
                    break;
                case EXPERIENCE_SEQ:
                    query = " execute procedure nextval(" + EXPERIENCE_SEQ + ") ";
                    break;
                case EDUCATION_SEQ:
                    query = " execute procedure nextval(" + EDUCATION_SEQ + ") ";
                    break;
                case RESPONSE_SEQ:
                    query = " execute procedure nextval(" + RESPONSE_SEQ + ") ";
                    break;
                default:
                    Common.logMsg(sequence_name + " IS NO A RECOGNIZED SEQUENCE ");
                    getSeqId = false;
                    break;
            }
        }

        if (getSeqId)
            return retVal(qconn, query);
        else
            return -1;
    }


    private static int retVal(java.sql.Connection qconn, String query)
            throws Exception {
        Common.logMsg("XXX retVal called....");
        PreparedStatement ps = null;
        ResultSet rs = null;
        int result = 0;
        try {
            ps = qconn.prepareStatement(query);
            ps.executeQuery();

            rs = ps.getResultSet();
            if (rs.next()) {
                result = (rs.getInt(1));
                //System.out.println ("retSeqId: rs.next() result="+result);
            }
        } catch (Exception sqe) {
            sqe.printStackTrace();
            throw new Exception(
                    "common.Common:getSeqId(java.sql.Connection,String):ERROR:" + sqe.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (Exception ignore) {
                }
            }
        }
        return result;
    }
}
