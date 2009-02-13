package com.topcoder.utilities;

import java.util.ArrayList;
import java.sql.*;
import com.topcoder.shared.util.DBMS;

public class DokkahBlade {
  
  private static String _connectString = DBMS.INFORMIX_CONNECT_STRING;
  private static String _informixDriver = DBMS.INFORMIX_DRIVER;
  private static java.sql.Connection conn = null;

  public static void main(String[] args) {

    if (args.length != 1) {
      System.out.println("use: java DokkahBlade <SearchTerm>");
      System.exit(1);
    }   
    try {
      Class.forName(_informixDriver);
      conn = DriverManager.getConnection(_connectString);

      DokkahBlade db = new DokkahBlade();
      ArrayList a = db.find(conn, args[0]);
      for (int i=0; i<a.size(); i++) {
        System.out.println(a.get(i));
      } 
    } catch (Exception e) {
      e.printStackTrace();
      System.exit(1);
    }
     

  }
 
  private ArrayList find(java.sql.Connection conn, String term) {
    PreparedStatement ps = null;
    ResultSet rs = null;
    StringBuffer query = null;
    ArrayList ret = null;
    Problem p = null;
  
    try {
      query = new StringBuffer(100);
      query.append( " SELECT problem_id");
      query.append(        " ,class_name");
      query.append(        " ,method_name");
      query.append(        " ,problem_text");
      query.append(   " FROM problem");
      query.append(  " ORDER BY problem_id");
      ps = conn.prepareStatement(query.toString());
      rs = ps.executeQuery();
   
      ret = new ArrayList();
      while(rs.next()) {
        if (found(rs.getString("problem_text"), term)) {
          p = new Problem(rs.getInt("problem_id"), 
                          rs.getString("class_name"),
                          rs.getString("method_name"),
                          rs.getString("problem_text"));
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
  private boolean found(String text, String term) {
    if (text!=null && text.toLowerCase().indexOf(term.toLowerCase())>-1) return true;
    else return false;
  }

  private void printSqlException(boolean verbose, SQLException sqle) {
    int i = 1;
    System.out.println("*******************************");
    do
      {
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
