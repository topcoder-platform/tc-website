package com.topcoder.utilities;

import com.topcoder.shared.util.DBMS;

import java.sql.*;
import java.util.ArrayList;

public class DokkahBlade {

    private static java.sql.Connection conn = null;

    public static void main(String[] args) {
//  7-26-2002 changed to allow multiple search terms- Lars
/*    if (args.length != 1) {
      System.out.println("use: java DokkahBlade <SearchTerm>");
      System.exit(1);
    }*/
        try {
            conn = DBMS.getConnection();

            DokkahBlade db = new DokkahBlade();
            ArrayList a = db.find(conn, args);
            for (int i = 0; i < a.size(); i++) {
                System.out.println(a.get(i));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }


    }

    private ArrayList find(java.sql.Connection conn, String[] terms) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer query = null;
        ArrayList ret = null;
        Problem p = null;

        try {
            for (int i = 0; i < terms.length; i++)
                terms[i] = terms[i].toLowerCase();
            query = new StringBuffer(100);
            query.append(" SELECT problem_id");
            query.append(" , component_id");
            query.append(" ,class_name");
            query.append(" ,method_name");
            query.append(" ,component_text");
            query.append(" FROM component");
            query.append(" ORDER BY component_id");
            ps = conn.prepareStatement(query.toString());
            rs = ps.executeQuery();

            ret = new ArrayList();
            while (rs.next()) {
                if (found(rs.getString("component_text"), terms)) {
                    p = new Problem(rs.getInt("component_id"),
                            rs.getString("class_name"),
                            rs.getString("method_name"),
                            rs.getString("component_text"));
                    ret.add(p);
                }
            }
        } catch (SQLException se) {
            printSqlException(true, se);
            System.exit(1);
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }
        return ret;

    }

    private boolean found(String text, String[] terms) {
//  7-26-2002 changed to allow multiple search terms- Lars
        if (text == null) return false;
        text = text.toLowerCase();
        for (int i = 0; i < terms.length; i++)
            if (text.indexOf(terms[i]) == -1) return false;
        return true;
    }

    private void printSqlException(boolean verbose, SQLException sqle) {
        int i = 1;
        System.out.println("*******************************");
        do {
            System.out.println("  Error #" + i + ":");
            System.out.println("    SQLState = " + sqle.getSQLState());
            System.out.println("    Message = " + sqle.getMessage());
            System.out.println("    SQLCODE = " + sqle.getErrorCode());
            if (verbose)
                sqle.printStackTrace();
            sqle = sqle.getNextException();
            i++;
        } while (sqle != null);
    }

    class Problem {
        int _problemId = 0;
        String _className = null;
        String _methodName = null;
        String _statement = null;

        Problem(int problemId, String className, String methodName, String statement) {
            _problemId = problemId;
            _className = className;
            _methodName = methodName;
            _statement = statement;
        }

        public String toString() {
            StringBuffer buf = new StringBuffer();
            buf.append("Problem: ");
            buf.append(_problemId);
            buf.append("   Class: ");
            buf.append(_className);
            buf.append("   Method: ");
            buf.append(_methodName);
            buf.append("\n----------------------------------------------------------------------------------\n");
            buf.append(_statement);
            buf.append("\n----------------------------------------------------------------------------------\n");
            return buf.toString();
        }
    }

}
