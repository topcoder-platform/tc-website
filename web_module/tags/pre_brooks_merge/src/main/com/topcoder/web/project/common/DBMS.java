package com.topcoder.web.project.common;

import java.io.*;
import java.sql.*;


public class DBMS {


    //Databases
    public static final int INFORMIX = 1;
    public static final int POSTGRES = 2;

    public static final int DEV_DB = INFORMIX;
    public static final int QA_DB = POSTGRES;
    public static final int PROD_DB = POSTGRES;


    //** MEMBER DEV **/

    public static int DB = INFORMIX;
    //  public static String                INFORMIX_CONNECT_STRING      = "jdbc:informix-sqli://172.16.20.19:1526/informixoltp:INFORMIXSERVER=informixoltp_tcp;user=coder;password=coder";
    public static String INFORMIX_CONNECT_STRING = "jdbc:informix-sqli://172.16.20.19:1526/projecttracker:INFORMIXSERVER=informixoltp_tcp;user=coder;password=coder";
    public static String INFORMIX_DW_CONNECT_STRING = "jdbc:informix-sqli://172.16.20.19:1526/coderdevdw:INFORMIXSERVER=informixoltp_tcp;user=coder;password=coder";


    public final static String POOL_DRIVER = "weblogic.jdbc.pool.Driver";
    public final static String INFORMIX_DRIVER = "com.informix.jdbc.IfxDriver";
    public final static String JMA_INFORMIX_POOL = "jdbc:weblogic:pool:JMAInformixPool";
    public final static String JMA_INFORMIX_POOL_JTS = "jdbc:weblogic:jts:JMAInformixPool";
    public final static String JMA_INFORMIX_DW_POOL = "jdbc:weblogic:pool:JMAInformixDWPool";
    public final static String JMA_INFORMIX_DW_POOL_JTS = "jdbc:weblogic:jts:JMAInformixDWPool";
    public final static String JMA_PRODUCTION_POOL = "jdbc:weblogic:pool:JMAProductionPool";
    public final static String JMA_POOL = "jdbc:weblogic:pool:JMAPool";
    public final static String JMA_POOL_JTS = "jdbc:weblogic:jts:JMAPool";
    public final static String JMS_FACTORY = "jms.connection.jmsFactory";
    public final static String EMAIL_QUEUE = "eMailQueue";
    public final static String COMPILE_QUEUE = "compileQueue";
    public final static String TESTING_QUEUE = "testingQueue";
    public final static String TOPIC = "contestTopic";


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
    public static final int PROBLEMSTATE_SEQ = 11;


    // Sequence ID's for PACTS
    public static final int AFFIDAVIT_SEQ = 50;
    public static final int CONTRACT_SEQ = 51;
    public static final int NOTE_SEQ = 52;
    public static final int PAYMENT_SEQ = 53;
    public static final int PAYMENT_ADDRESS_SEQ = 54;
    public static final int PAYMENT_DETAIL_SEQ = 55;
    public static final int TAX_FORM_SEQ = 56;


    public static final int PT_LOGIN_SEQ = 20;
    public static final int PT_PROJ_SEQ = 21;
    public static final int PT_PROJ_TASK_SEQ = 22;
    public static final int PT_PROJ_USR_UPDATE_SEQ = 23;
    public static final int PT_PROJ_USR_SEQ = 24;
    public static final int PT_PROJ_USR_TASK_SEQ = 25;
    public static final int PT_USR_MESSAGE_SEQ = 26;
    public static final int PT_PROJ_ISSUE_SEQ = 27;

    // Language
    public static final int DEFAULT_LANG = 0;
    public static final int JAVA = 1;
    public static final int CPP = 3;

    // Editor
    public static final int STD_EDITOR = 0;
    public static final int VI = 1;

    // User types
    public static int CODER_USER_TYPE_ID = 1;
    public static int SUBSCRIBER_USER_TYPE_ID = 3;


    public static final java.sql.Connection getInformixConnection() throws SQLException {
        java.sql.Connection result = null;
        int cnt = 0;
        while (true) {
            cnt++;
            try {
                Driver driver = (Driver) Class.forName(DBMS.POOL_DRIVER).newInstance();
                result = driver.connect(DBMS.JMA_INFORMIX_POOL, null);
                if (result == null) throw new SQLException();
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
        return result;
    }


    public static final java.sql.Connection getProductionConnection() throws SQLException {
        java.sql.Connection result = null;
        int cnt = 0;
        while (true) {
            cnt++;
            try {
                Driver driver = (Driver) Class.forName(DBMS.POOL_DRIVER).newInstance();
                result = driver.connect(DBMS.JMA_PRODUCTION_POOL, null);
                if (result == null) throw new SQLException();
                break;
            } catch (SQLException e) {
                try {
                    if (cnt >= 10) {
                        System.out.println("ERROR: Could not get Production connection.");
                        throw e;
                    } else {
                        System.out.println("Could not get Production connection... trying again.");
                        Thread.sleep(500);
                    }
                } catch (InterruptedException e2) {
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }


    public static final java.sql.Connection getDWConnection(String connectString) throws SQLException {
        java.sql.Connection result = null;
        int cnt = 0;
        while (true) {
            cnt++;
            try {
                Driver driver = (Driver) Class.forName(DBMS.POOL_DRIVER).newInstance();
                result = driver.connect(connectString, null);
                break;
            } catch (SQLException e) {
                try {
                    if (cnt >= 10) {
                        System.out.println("ERROR: Could not get dw_connection.");
                        throw e;
                    } else {
                        System.out.println("Could not get dw_connection... trying again.");
                        Thread.sleep(500);
                    }
                } catch (InterruptedException e2) {
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }


    public static final java.sql.Connection getConnection() throws SQLException {
        java.sql.Connection result = null;
        result = getInformixConnection();
        return result;
    }


    public static final java.sql.Connection getDWConnection() throws SQLException {
        java.sql.Connection result = null;
        result = getDWConnection(DBMS.JMA_INFORMIX_DW_POOL);
        return result;
    }


    public static final java.sql.Connection getTransConnection() throws SQLException {
        java.sql.Connection result = null;
        result = DriverManager.getConnection(DBMS.JMA_INFORMIX_POOL_JTS);
        return result;
    }


    public static final java.sql.Connection getDirectConnection() throws Exception {
        java.sql.Connection result = null;
        try {
            Class.forName(DBMS.INFORMIX_DRIVER);
        } catch (Exception ex) {
            throw ex;
        }
        result = DriverManager.getConnection(DBMS.INFORMIX_CONNECT_STRING);
        return result;
    }


    public static final java.sql.Connection getDirectDWConnection() throws Exception {
        java.sql.Connection result = null;
        try {
            Class.forName(DBMS.INFORMIX_DRIVER);
        } catch (Exception ex) {
            throw ex;
        }
        result = DriverManager.getConnection(DBMS.INFORMIX_DW_CONNECT_STRING);
        return result;
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
            case PROBLEMSTATE_SEQ:
                query = " execute procedure nextval(" + PROBLEMSTATE_SEQ + ") ";
                break;
            case PT_LOGIN_SEQ:
                query = " execute procedure nextval(" + PT_LOGIN_SEQ + ") ";
                break;
            case PT_PROJ_SEQ:
                query = " execute procedure nextval(" + PT_PROJ_SEQ + ") ";
                break;
            case PT_PROJ_TASK_SEQ:
                query = " execute procedure nextval(" + PT_PROJ_TASK_SEQ + ") ";
                break;
            case PT_PROJ_USR_UPDATE_SEQ:
                query = " execute procedure nextval(" + PT_PROJ_USR_UPDATE_SEQ + ") ";
                break;
            case PT_PROJ_USR_SEQ:
                query = " execute procedure nextval(" + PT_PROJ_USR_SEQ + ") ";
                break;
            case PT_PROJ_USR_TASK_SEQ:
                query = " execute procedure nextval(" + PT_PROJ_USR_TASK_SEQ + ") ";
                break;
            case PT_USR_MESSAGE_SEQ:
                query = " execute procedure nextval(" + PT_USR_MESSAGE_SEQ + ") ";
                break;
            case PT_PROJ_ISSUE_SEQ:
                query = " execute procedure nextval(" + PT_PROJ_ISSUE_SEQ + ") ";
                break;
            case AFFIDAVIT_SEQ:
                query = " execute procedure nextval(" + AFFIDAVIT_SEQ + ") ";
                break;
            case CONTRACT_SEQ:
                query = " execute procedure nextval(" + CONTRACT_SEQ + ") ";
                break;
            case NOTE_SEQ:
                query = " execute procedure nextval(" + NOTE_SEQ + ") ";
                break;
            case PAYMENT_SEQ:
                query = " execute procedure nextval(" + PAYMENT_SEQ + ") ";
                break;
            case PAYMENT_ADDRESS_SEQ:
                query = " execute procedure nextval(" + PAYMENT_ADDRESS_SEQ + ") ";
                break;
            case PAYMENT_DETAIL_SEQ:
                query = " execute procedure nextval(" + PAYMENT_DETAIL_SEQ + ") ";
                break;
            case TAX_FORM_SEQ:
                query = " execute procedure nextval(" + TAX_FORM_SEQ + ") ";
                break;
            default:
                getSeqId = false;
                break;
        }

        if (getSeqId)
            return retVal(qconn, query);
        else
            return -1;
    }


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

            if (DBMS.DB == POSTGRES) {
                bs = (ByteArrayInputStream) rs.getBinaryStream(column);
                if (bs != null) {
                    ois = new ObjectInputStream(bs);
                }
            } else if (DBMS.DB == INFORMIX) {
                InputStream is = rs.getBinaryStream(column);
                if (is != null)
                    ois = new ObjectInputStream(is);
            }
            if (ois != null) {
                retVal = ois.readObject();
            }
            //        System.out.println("RetVal :"+ retVal.toString());
            //        System.out.println("RetVal Class: "+ retVal.getClass());

            if (ois != null) {
                ois.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("DBMS: getBlobObject - error: " + e);
        }

        return retVal;

    }

    /*****************************************************************************************
     * This method is used for serializing large (BLOB) objects because it can't be done through
     * SQL.
     *
     * @param obj - Object - the large object to be serialized.
     * @return byte[] - the serialized object as a byte array
     * @exception ProcessingErrorException
     * @author ademich
     ******************************************************************************************
     **/
    public static byte[] serializeBlobObject(Object obj)
            throws Exception {
        if (obj == null)
            throw new Exception("DBMS.serializeBlobObject:ERROR obj is NULL");


        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        byte[] bytes = null;


        try {
            //      System.out.println("serializing the object");
            ObjectOutputStream oos = new ObjectOutputStream(baos);
            oos.writeObject(obj);
            oos.close();
            bytes = baos.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bytes;

    }

    // This method is used for updating BLOB objects in the database because it can't be done through
    // SQL. An SQL update is used to update an existing row that matches the whereClause. Tables that
    // might be using this method include SYSTEM_TEST_CASES (args) and PROBLEMS (param_types)
    public static void insertBlobObject(String tableName, String fieldName, Object obj, String whereClause) {
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        String sqlStr = "";

        try {
            conn = DBMS.getDirectConnection();
            conn.setAutoCommit(false);
            sqlStr = "UPDATE " + tableName + " SET " + fieldName + " = ? WHERE " + whereClause;

            ps = conn.prepareStatement(sqlStr);
            ps.setBytes(1, DBMS.serializeBlobObject(obj));

            int success = ps.executeUpdate();

            if (success < 1)
                System.out.println("UPDATE " + tableName + " FAILED");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) {
                    conn.commit();
                    conn.setAutoCommit(true);
                    conn.close();
                }
            } catch (Exception ignore) {
            }
        }
    }

    // This is a generic method deserializes a Blob from the database and returns the
    // deserialized object.
    public static Object getBlobObject(String tableName, String fieldName, String whereClause) {
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sqlStr = "";
        Object retVal = new Object();

        try {
            conn = DBMS.getDirectConnection();
            conn.setAutoCommit(false);

            if (whereClause.equals(""))
                sqlStr = "SELECT " + fieldName + " FROM " + tableName;
            else
                sqlStr = "SELECT " + fieldName + " FROM " + tableName + " WHERE " + whereClause;
            ps = conn.prepareStatement(sqlStr);
            rs = ps.executeQuery();

            if (rs.next()) {
                retVal = DBMS.getBlobObject(rs, 1);
                System.out.println("RetVal :" + retVal);

            } else {
                System.out.println("getBlobObject did not find row for query :\n" + sqlStr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (rs != null) rs.close();
                if (conn != null) {
                    conn.commit();
                    conn.close();
                }
            } catch (Exception ignore) {
            }
        }

        return retVal;

    }

    /*****************************************************************************************
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
     * @exception Exception
     * @author ademich
     ******************************************************************************************
     **/
    public static byte[] serializeTextString(String text)
            throws Exception {
        if (text == null)
            throw new Exception("DBMS.serializeTextString:ERROR text is NULL");

        return text.getBytes();

    }

    /*****************************************************************************************
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
     * @author ademich
     ******************************************************************************************
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
     ******************************************************************************************
     * printSqlException()
     * Iterate through and print out informix sql exception information.  Can be called
     * on non-informix sql exceptions.
     * @author Jason Evans
     * @param verbose - whether or not it should print the stack trace
     * @param sqle - a SQL exception
     ******************************************************************************************
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


    /*****************************************************************************************
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
     * @exception Exception
     * @author dpecora
     ******************************************************************************************
     **/
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


}
