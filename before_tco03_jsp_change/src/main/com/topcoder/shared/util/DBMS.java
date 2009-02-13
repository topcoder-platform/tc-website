package com.topcoder.shared.util;

import javax.sql.DataSource;
import javax.naming.NamingException;
import java.io.*;
import java.sql.*;


/**
 * A class to hold constants related to the database, and some convenience methods.
 * @author Jason Evans
 * @author ademich
 * @version $Revision$
 */
public class DBMS {

    private static final TCResourceBundle bundle = new TCResourceBundle("DBMS");

    public static final int INFORMIX = getIntProperty("INFORMIX", 1);
    public static int DB = getIntProperty("DB", INFORMIX);

    public final static String DW_DATASOURCE_NAME = getProperty("DW_DATASOURCE_NAME", "DW");
    public final static String OLTP_DATASOURCE_NAME = getProperty("OLTP_DATASOURCE_NAME", "OLTP");
    public final static String JTS_OLTP_DATASOURCE_NAME = getProperty("JTS_OLTP_DATASOURCE_NAME", "JTS_OLTP");
    public final static String CONTEST_ADMIN_DATASOURCE = getProperty("CONTEST_ADMIN_DATASOURCE", "OLTP");
    public final static String CORP_JTS_OLTP_DATASOURCE_NAME = getProperty("CORP_JTS_OLTP_DATASOURCE_NAME", "JTS_CORP_DS");
    public final static String CORP_OLTP_DATASOURCE_NAME = getProperty("CORP_OLTP_DATASOURCE_NAME", "CORP_DS");
    public final static String COMMON_JTS_OLTP_DATASOURCE_NAME = getProperty("CORP_JTS_OLTP_DATASOURCE_NAME", "JTS_DS");
    public final static String COMMON_OLTP_DATASOURCE_NAME = getProperty("COMMON_OLTP_DATASOURCE_NAME", "DS");
    public final static String SCREENING_JTS_OLTP_DATASOURCE_NAME = getProperty("SCREENING_JTS_OLTP_DATASOURCE_NAME", "JTS_SCREENING_OLTP");
    public final static String SCREENING_OLTP_DATASOURCE_NAME = getProperty("SCREENING_JTS_OLTP_DATASOURCE_NAME", "SCREENING_OLTP");
    public final static String HS_DW_DATASOURCE_NAME = getProperty("HS_DW_DATASOURCE_NAME", "HS_DW");
    public final static String HS_OLTP_DATASOURCE_NAME = getProperty("HS_OLTP_DATASOURCE_NAME", "HS_OLTP");
    public final static String HS_JTS_OLTP_DATASOURCE_NAME = getProperty("HS_JTS_OLTP_DATASOURCE_NAME", "JTS_HS_OLTP");


    public final static String JDBC_DRIVER = getProperty("JDBC_DRIVER", "weblogic.jdbc.jts.Driver");
    public final static String POOL_DRIVER = getProperty("POOL_DRIVER", "weblogic.jdbc.pool.Driver");
    public final static String INFORMIX_DRIVER = getProperty("INFORMIX_DRIVER", "com.informix.jdbc.IfxDriver");
    public final static String JMA_INFORMIX_POOL = getProperty("JMA_INFORMIX_POOL", "jdbc:weblogic:pool:JMAInformixPool");
    public final static String JMA_INFORMIX_POOL_JTS = getProperty("JMA_INFORMIX_POOL_JTS", "jdbc:weblogic:jts:JMAInformixPool");
    public final static String JMA_INFORMIX_DW_POOL = getProperty("JMA_INFORMIX_DW_POOL", "jdbc:weblogic:pool:JMAInformixDWPool");
    public final static String JMA_INFORMIX_DW_POOL_JTS = getProperty("JMA_INFORMIX_DW_POOL_JTS", "jdbc:weblogic:jts:JMAInformixDWPool");
    public final static String JMA_POOL = getProperty("JMA_POOL", "jdbc:weblogic:pool:JMAPool");
    public final static String JMA_POOL_JTS = getProperty("JMA_POOL_JTS", "jdbc:weblogic:jts:JMAPool");
    public final static String JMS_FACTORY = getProperty("JMS_FACTORY", "jms.connection.jmsFactory");
    public final static String EMAIL_QUEUE = getProperty("EMAIL_QUEUE", "eMailQueue");
    public final static String COMPILE_QUEUE = getProperty("COMPILE_QUEUE", "compileQueue");
    public final static String TESTING_QUEUE = getProperty("TESTING_QUEUE", "testingQueue");
    public final static String TOPIC = getProperty("TOPIC", "contestTopic");
    public final static String PACTS_QUEUE = getProperty("PACTS_QUEUE", "pactsQueue");

    //formats used by informix for converting string to date(time)
    public final static String INFORMIX_DATE_FORMAT = bundle.getProperty("INFORMIX_DATE_FORMAT", "MM/dd/yy");
    public final static String INFORMIX_DATETIME_FORMAT = bundle.getProperty("INFORMIX_DATETIME_FORMAT", "yyyy-MM-dd HH:mm:ss.SSS");

    // Sequence Ids
    public static final int JMA_SEQ = getIntProperty("MAIN_SEQ", 200);
//    public static final int JMA_SEQ = getIntProperty("JMA_SEQ", 1);
    public static final int CORPORATE_SEQ = getIntProperty("CORPORATE_SEQ", 2);
    public static final int SCHOOL_SEQ = getIntProperty("SCHOOL_SEQ", 3);
    public static final int PROBLEM_SEQ = getIntProperty("PROBLEM_SEQ", 4);
    public static final int CHALLENGE_SEQ = getIntProperty("CHALLENGE_SEQ", 5);
    public static final int RTABLE_SEQ = getIntProperty("RTABLE_SEQ", 6);
    public static final int EXPERIENCE_SEQ = getIntProperty("EXPERIENCE_SEQ", 7);
    public static final int EDUCATION_SEQ = getIntProperty("EDUCATION_SEQ", 8);
    public static final int RESPONSE_SEQ = getIntProperty("RESPONSE_SEQ", 9);
    public static final int PROBLEM_STATE_SEQ = getIntProperty("PROBLEM_STATE_SEQ", 11);
    public static final int SECTOR_SEQ = getIntProperty("SECTOR_SEQ", 13);
    public static final int PT_LOGIN_SEQ = getIntProperty("PT_LOGIN_SEQ", 20);
    public static final int PT_PROJ_SEQ = getIntProperty("PT_PROJ_SEQ", 21);
    public static final int PT_PROJ_TASK_SEQ = getIntProperty("PT_PROJ_TASK_SEQ", 22);
    public static final int PT_PROJ_USR_UPDATE_SEQ = getIntProperty("PT_PROJ_USR_UPDATE_SEQ", 23);
    public static final int PT_PROJ_USR_SEQ = getIntProperty("PT_PROJ_USR_SEQ", 24);
    public static final int PT_PROJ_USR_TASK_SEQ = getIntProperty("PT_PROJ_USR_TASK_SEQ", 25);
    public static final int PT_USR_MESSAGE_SEQ = getIntProperty("PT_USR_MESSAGE_SEQ", 26);
    public static final int PT_PROJ_ISSUE_SEQ = getIntProperty("PT_PROJ_ISSUE_SEQ", 27);
    public static final int AFFIDAVIT_SEQ = getIntProperty("AFFIDAVIT_SEQ", 50);
    public static final int CONTRACT_SEQ = getIntProperty("CONTRACT_SEQ", 51);
    public static final int NOTE_SEQ = getIntProperty("NOTE_SEQ", 52);
    public static final int PAYMENT_SEQ = getIntProperty("PAYMENT_SEQ", 53);
    public static final int PAYMENT_ADDRESS_SEQ = getIntProperty("PAYMENT_ADDRESS_SEQ", 54);
    public static final int PAYMENT_DETAIL_SEQ = getIntProperty("PAYMENT_DETAIL_SEQ", 55);
    public static final int TAX_FORM_SEQ = getIntProperty("TAX_FORM_SEQ", 56);
    public static final int RESUME_SEQ = getIntProperty("RESUME_SEQ", 81);
    public static final int INPUT_SEQ = getIntProperty("INPUT_SEQ", 82);
    public static final int QUERY_SEQ = getIntProperty("QUERY_SEQ", 83);
    public static final int COMMAND_SEQ = getIntProperty("COMMAND_SEQ", 84);
    public static final int COMMAND_GROUP_SEQ = getIntProperty("COMMAND_GROUP_SEQ", 85);

    private static final String getProperty(String key, String defaultValue) {
        return bundle.getProperty(key, defaultValue);
    }

    private static final int getIntProperty(String key, int defaultValue) {
        return bundle.getIntProperty(key, defaultValue);
    }

    /**
     *
     * @return
     * @throws SQLException
     */
    public static final java.sql.Connection getConnection() throws SQLException {
        return getConnection(OLTP_DATASOURCE_NAME);
    }

    /**
     *
     * @return
     * @throws SQLException
     */
    private static final java.sql.Connection getConnection(String dataSourceName) throws SQLException {
        DataSource ds = null;
        try {
            ds = (DataSource)TCContext.getInitial().lookup(dataSourceName);
        } catch (NamingException e) {
            e.printStackTrace();
            throw new SQLException(e.getMessage());
        }
        return ds.getConnection();
    }

    /**
     *
     * @return
     * @throws SQLException
     */
    public static final java.sql.Connection getDWConnection() throws SQLException {
        return getConnection(DW_DATASOURCE_NAME);
    }

    /**
     *
     * @return
     * @throws SQLException
     */
    public static final java.sql.Connection getTransConnection() throws SQLException {
        return getConnection(JTS_OLTP_DATASOURCE_NAME);
//        java.sql.Connection result = null;
//        result = DriverManager.getConnection(DBMS.JMA_INFORMIX_POOL_JTS);
//        return result;
    }

    /**
     *
     * @param qconn
     * @param sequence_name
     * @return
     * @throws Exception
     * @deprecated
     */
    public static final int getTransSeqId(java.sql.Connection qconn, int sequence_name)
            throws Exception {
        //don't use the connection anymore, who cares about having the sequence in the transaction anyway?
        return getSeqId(sequence_name);
    }

    /**
     *
     * @param sequence_name
     * @return
     * @throws Exception
     */
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

    /**
     *
     * @param qconn
     * @param sequence
     * @return
     * @throws Exception
     */
    public static final int getSeqId(java.sql.Connection qconn, int sequence)
            throws Exception {
        boolean getSeqId = true;
        String query = "";
        int result = 0;
        if (sequence == JMA_SEQ)
            query = " execute procedure nextval(" + JMA_SEQ + ") ";
        else if (sequence == CORPORATE_SEQ)
            query = " execute procedure nextval(" + CORPORATE_SEQ + ") ";
        else if (sequence == SCHOOL_SEQ)
            query = " execute procedure nextval(" + SCHOOL_SEQ + ") ";
        else if (sequence == PROBLEM_SEQ)
            query = " execute procedure nextval(" + PROBLEM_SEQ + ") ";
        else if (sequence == CHALLENGE_SEQ)
            query = " execute procedure nextval(" + CHALLENGE_SEQ + ") ";
        else if (sequence == RTABLE_SEQ)
            query = " execute procedure nextval(" + RTABLE_SEQ + ") ";
        else if (sequence == EXPERIENCE_SEQ)
            query = " execute procedure nextval(" + EXPERIENCE_SEQ + ") ";
        else if (sequence == EDUCATION_SEQ)
            query = " execute procedure nextval(" + EDUCATION_SEQ + ") ";
        else if (sequence == RESPONSE_SEQ)
            query = " execute procedure nextval(" + RESPONSE_SEQ + ") ";
        else if (sequence == PROBLEM_STATE_SEQ)
            query = " execute procedure nextval(" + PROBLEM_STATE_SEQ + ") ";
        else if (sequence == SECTOR_SEQ)
            query = " execute procedure nextval(" + SECTOR_SEQ + ") ";
        else if (sequence == PT_LOGIN_SEQ)
            query = " execute procedure nextval(" + PT_LOGIN_SEQ + ") ";
        else if (sequence == PT_PROJ_SEQ)
            query = " execute procedure nextval(" + PT_PROJ_SEQ + ") ";
        else if (sequence == PT_PROJ_TASK_SEQ)
            query = " execute procedure nextval(" + PT_PROJ_TASK_SEQ + ") ";
        else if (sequence == PT_PROJ_USR_UPDATE_SEQ)
            query = " execute procedure nextval(" + PT_PROJ_USR_UPDATE_SEQ + ") ";
        else if (sequence == PT_PROJ_USR_SEQ)
            query = " execute procedure nextval(" + PT_PROJ_USR_SEQ + ") ";
        else if (sequence == PT_PROJ_USR_TASK_SEQ)
            query = " execute procedure nextval(" + PT_PROJ_USR_TASK_SEQ + ") ";
        else if (sequence == PT_USR_MESSAGE_SEQ)
            query = " execute procedure nextval(" + PT_USR_MESSAGE_SEQ + ") ";
        else if (sequence == PT_PROJ_ISSUE_SEQ)
            query = " execute procedure nextval(" + PT_PROJ_ISSUE_SEQ + ") ";
        else if (sequence == AFFIDAVIT_SEQ)
            query = " execute procedure nextval(" + AFFIDAVIT_SEQ + ") ";
        else if (sequence == CONTRACT_SEQ)
            query = " execute procedure nextval(" + CONTRACT_SEQ + ") ";
        else if (sequence == NOTE_SEQ)
            query = " execute procedure nextval(" + NOTE_SEQ + ") ";
        else if (sequence == PAYMENT_SEQ)
            query = " execute procedure nextval(" + PAYMENT_SEQ + ") ";
        else if (sequence == PAYMENT_ADDRESS_SEQ)
            query = " execute procedure nextval(" + PAYMENT_ADDRESS_SEQ + ") ";
        else if (sequence == PAYMENT_DETAIL_SEQ)
            query = " execute procedure nextval(" + PAYMENT_DETAIL_SEQ + ") ";
        else if (sequence == TAX_FORM_SEQ)
            query = " execute procedure nextval(" + TAX_FORM_SEQ + ") ";
        else if (sequence == RESUME_SEQ)
            query = " execute procedure nextval(" + RESUME_SEQ + ") ";
        else
            getSeqId = false;

        if (getSeqId)
            return retVal(qconn, query);
        else
            return -1;
    }

    /**
     *
     * @param qconn
     * @param query
     * @return
     * @throws Exception
     */
    private static int retVal(java.sql.Connection qconn, String query)
            throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        int result = 0;
        try {
            ps = qconn.prepareStatement(query);
            ps.executeQuery();

            rs = ps.getResultSet();
            if (rs.next()) {
                result = (rs.getInt(1));
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


    /**
     * This generic method deserializes a Blob from the ResultSet and returns the
     * deserialized object.
     *
     * @param rs - ResultSet - The ResultSet that the blob should be retrieved from
     * @param column - int - The number of the column in the ResultSet that the blob should be
     *                       retrieved from.
     * @return Object - the blob object retrieved from the ResultSet
     * @throws Exception
     */
    public static Object getBlobObject(ResultSet rs, int column)
            throws Exception {
        Object retVal = null;
        ObjectInputStream ois = null;
        Blob bl = null;
        ByteArrayInputStream bs = null;

        try {

            InputStream is = rs.getBinaryStream(column);
            if (is != null)
                ois = new ObjectInputStream(is);
            if (ois != null) {
                retVal = ois.readObject();
            }

            if (ois != null) {
                ois.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("DBMS: getBlobObject - error: " + e);
        }

        return retVal;

    }

    /**
     * This method is used for serializing large (BLOB) objects because it can't be done through
     * SQL.
     *
     * @param obj - Object - the large object to be serialized.
     * @return byte[] - the serialized object as a byte array
     * @throws Exception
     */
    public static byte[] serializeBlobObject(Object obj)
            throws Exception {
        if (obj == null)
            throw new Exception("DBMS.serializeBlobObject:ERROR obj is NULL");


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

    /**
     * This method is used for serializing text Strings because it can't be done through
     * SQL. This method should be called when updating or inserting text data types into
     * an INFORMIX database.
     * Example Usage:
     * String text = "text";
     * PreparedStatement ps = connectionVariable.prepareStatement(insertOrUpdateStatement);
     * if (DBMS.DB == DBMS.INFORMIX) {
     *    ps.setBytes(column, DBMS.serializeTextString(text);
     * }
     *
     * @param text - String - the text String to be serialized.
     * @return byte[] - the serialized text String as a byte array
     * @throws Exception
     */
    public static byte[] serializeTextString(String text)
            throws Exception {
        if (text == null)
            throw new Exception("DBMS.serializeTextString:ERROR text is NULL");

        return text.getBytes();

    }

    /**
     * This generic method deserializes a text data type from the ResultSet and returns the
     * deserialized String. This method should be called when retrieving a text data type from
     * ANY database.
     * Example Usage:
     * String text = DBMS.getTextString(rs, columnNum);
     *
     * @param rs - ResultSet - The ResultSet that the String should be retrieved from
     * @param column - int - The number of the column in the ResultSet that the String should be
     *                       retrieved from.
     * @return String - the String retrieved from the Result Set at the column
     * @exception Exception
     **/
    public static String getTextString(ResultSet rs, int column)
            throws Exception {
        if (rs == null)
            throw new Exception("DBMS.getTextString:ERROR ResultSet is NULL");
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
     * printSqlException()
     * Iterate through and print out informix sql exception information.  Can be called
     * on non-informix sql exceptions.
     * @param verbose - whether or not it should print the stack trace
     * @param sqle - a SQL exception
     */
    public static void printSqlException(boolean verbose, SQLException sqle) {
        int i = 1;
        if (verbose) {
            System.out.println("*******************************");
            do {
                System.out.println("  Error #" + i + ":");
                System.out.println("    SQLState = " + sqle.getSQLState());
                System.out.println("    Message = " + sqle.getMessage());
                System.out.println("    SQLCODE = " + sqle.getErrorCode());
                sqle.printStackTrace();
                sqle = sqle.getNextException();
                i++;
            } while (sqle != null);
        }
    }


    /**
     * This generic method deserializes a text data type from the ResultSet and returns the
     * deserialized String. This method should be called when retrieving a text data type from
     * ANY database.  Unlike the getTextString() method, this method will return a null String
     * if the database value is null (the getTextString() method returns an empty String).
     *
     * Example Usage:
     * String text = DBMS.getTextStringWithNulls(rs, columnNum);
     *
     * @param rs - ResultSet - The ResultSet that the String should be retrieved from
     * @param column - int - The number of the column in the ResultSet that the String should be
     *                       retrieved from.
     * @return String - the String retrieved from the Result Set at the column
     * @throws Exception
     */
    public static String getTextStringWithNulls(ResultSet rs, int column)
            throws Exception {
        if (rs == null)
            throw new Exception("DBMS.getTextStringWithNulls:ERROR ResultSet is NULL");
        try {
            byte[] bytes = rs.getBytes(column);
            if (bytes == null)
                return null;

            return new String(bytes);
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            throw new Exception(sqle.getMessage());
        }
    }


    /**
     * getSqlExceptionString()
     * Iterate through and collect sql exception information.  Can be called
     * on non-informix sql exceptions.  Returns a string containing the information. <p>
     *
     * One use for this method is with log4j when it is desired to collect exception
     * information into a logfile.
     *
     * @param sqle - a SQL exception
     * @return
     */
    public static String getSqlExceptionString(SQLException sqle) {
        int i = 1;
        StringBuffer sb = new StringBuffer(500);
        sb.append("*******************************\n");
        do {
            sb.append("  Error #" + i + ":\n");
            sb.append("    SQLState = " + sqle.getSQLState() + "\n");
            sb.append("    Message = " + sqle.getMessage() + "\n");
            sb.append("    SQLCODE = " + sqle.getErrorCode() + "\n");
            sqle = sqle.getNextException();
            i++;
        } while (sqle != null);

        return sb.toString();
    }


}
