package com.topcoder.utilities;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;

import javax.naming.Context;
import javax.naming.InitialContext;
import java.sql.*;
import java.util.Hashtable;

/**
 * This program is used to change query information stored
 * in the "query" data warehouse table. <p>
 *
 * The command line is as follows: <p>
 *
 * java QueryLoader &lt;data source&gt; &lt;query ID&gt; &lt;query name&gt; &lt;ranking&gt;
 * &lt;rank_column_index&gt; &lt;query text&gt; <p>
 *
 * If the query should have a ranklist associated with it, ranking
 * should be 1 and rank_column_index should be the index of the query column
 * to rank by.  Otherwise, both ranking and rank_column_index should be 0.
 *
 * If a row with the given query ID already exists in the query
 * table, the row will be updated with the given name and text.
 * If the row does not exist, it will be inserted.  The program
 * will report the updated query text from the database, which
 * should match the query text given in the command line.  A
 * sample call to this program:<p>
 *
 * java QueryLoader 20 "My Sample Query" 0 0 "select * from level"
 *
 * @author  Greg Paul
 * @author  Dave Pecora
 * @version $Revision$
 */

public class QueryLoader {

    private static final String DEFAULT_DATA_SOURCE = "DW";
    String data_source, id, name, ranking, column_index, text;

    private QueryLoader(String query_id, String query_name, String rankingInt,
                        String rank_column_index, String query_text) {
        data_source = DEFAULT_DATA_SOURCE;
        id = query_id;
        name = query_name;
        ranking = rankingInt;
        column_index = rank_column_index;
        text = query_text;
    }

    private QueryLoader(String query_data_source, String query_id, String query_name, String rankingInt,
                        String rank_column_index, String query_text) {
        data_source = query_data_source;
        id = query_id;
        name = query_name;
        ranking = rankingInt;
        column_index = rank_column_index;
        text = query_text;
    }

    public static void main(String[] args) {
        QueryLoader x = null;
        if (args.length == 5) {
            x = new QueryLoader(args[0], args[1], args[2], args[3], args[4]);
        } else if (args.length == 6) {
            x = new QueryLoader(args[0], args[1], args[2], args[3], args[4], args[5]);
        } else {
            System.out.println("This program is used to load query records.");
            System.out.println("Usage: QueryLoader <data_source_name> <ID> <name> <ranking> <rank_column_index> <text>");
            return;
        }
        x.putText();
        System.out.println("The returned text is " + x.getText());

    }


    private void putText() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sqlStr = "";
        char quote = '"';
        Context ctx = null;

        try {

            Hashtable ht = new Hashtable();
            ht.put(Context.INITIAL_CONTEXT_FACTORY, "weblogic.jndi.WLInitialContextFactory");
            ht.put(Context.PROVIDER_URL, ApplicationServer.HOST_URL);
            ctx = new InitialContext(ht);
            javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup(this.data_source);
            conn = ds.getConnection();

            //conn = DBMS.getDirectDWConnection();

            sqlStr = "SELECT count(*) FROM query WHERE query_id=" + id;
            ps = conn.prepareStatement(sqlStr);
            rs = ps.executeQuery();
            boolean hasRecord = false;
            while (rs.next()) {
                int i = rs.getInt(1);
                if (i > 0)
                    hasRecord = true;
                break;
            }
            rs.close();
            rs = null;
            ps.close();
            ps = null;

            if (hasRecord) {
                sqlStr = "UPDATE query SET name = " + quote + name + quote +
                        ", text = ? , ranking = " + ranking + ", column_index = " + column_index +
                        " WHERE query_id = " + id;
            } else {
                sqlStr = "INSERT INTO query VALUES(" + id + ",?," +
                        quote + name + quote + "," + ranking + "," + column_index + ")";
            }

            ps = conn.prepareStatement(sqlStr);
            ps.setBytes(1, DBMS.serializeTextString(text));

            int success = ps.executeUpdate();

            if (success < 1)
                System.out.println("Table update failed");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                    rs = null;
                } catch (Exception ignore) {
                    ignore.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                    ps = null;
                } catch (Exception ignore) {
                    ignore.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (Exception ignore) {
                    ignore.printStackTrace();
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                    ctx = null;
                } catch (Exception ignore) {
                    ignore.printStackTrace();
                }
            }

        }

    }

    private String getText() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sqlStr = "";
        String retVal = "";
        Context ctx = null;

        try {

            Hashtable ht = new Hashtable();
            ht.put(Context.INITIAL_CONTEXT_FACTORY, "weblogic.jndi.WLInitialContextFactory");
            ht.put(Context.PROVIDER_URL, ApplicationServer.HOST_URL);
            ctx = new InitialContext(ht);
            javax.sql.DataSource ds = (javax.sql.DataSource) ctx.lookup(this.data_source);
            conn = ds.getConnection();

            //conn = DBMS.getDirectDWConnection();

            sqlStr = "SELECT TEXT FROM QUERY WHERE query_id=" + id;
            System.out.println("sqlStr: " + sqlStr);

            ps = conn.prepareStatement(sqlStr);

            rs = ps.executeQuery();
            if (rs.next())
                retVal = DBMS.getTextString(rs, 1);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                    rs = null;
                } catch (Exception ignore) {
                    ignore.printStackTrace();
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                    ps = null;
                } catch (Exception ignore) {
                    ignore.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (Exception ignore) {
                    ignore.printStackTrace();
                }
            }
            if (ctx != null) {
                try {
                    ctx.close();
                    ctx = null;
                } catch (Exception ignore) {
                    ignore.printStackTrace();
                }
            }
        }

        return retVal;

    }
}
