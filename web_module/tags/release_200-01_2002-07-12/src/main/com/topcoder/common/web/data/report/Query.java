package com.topcoder.common.web.data.report;
import java.util.*;
import java.io.*;
import javax.naming.*;
import java.sql.*;
import com.topcoder.common.*;
import com.topcoder.ejb.Reporting.*;

public class Query implements Serializable {
  
  private StringBuffer query;
  private int[] returnTypes; 
  private int db;
  
  private static final char PLACE_HOLDER = '?';
  public static final int TRANSACTIONAL = 1;
  public static final int WAREHOUSE = 2;
  private static final boolean VERBOSE = false;

  public Query() {
    query = new StringBuffer();
    returnTypes = null;
    db = TRANSACTIONAL;
  }
 
  public Query(String query, int[] returnTypes) {
    this.query = new StringBuffer(query);
    this.returnTypes = returnTypes;
    this.db = TRANSACTIONAL;
  }

  public Query(String query, int[] returnTypes, int db) {
    this.query = new StringBuffer(query);
    this.returnTypes = returnTypes;
    this.db = db;
  }

  //sets
  public void setQuery(StringBuffer query) {
    this.query = query;
  }

  public void setReturnTypes(int[] returnTypes) {
    this.returnTypes = returnTypes;
  }
 
  public void setDB(int db) {
    this.db = db;
  }
  
  //gets
  public String getQuery() {
    return query.toString();
  }
  
  public int[] getReturnTypes() {
    return returnTypes;
  }
 
  public int getDB() {
    return db;
  }

  public String toString() {
    return getQuery();
  }

  /**
   ************************************************************************************
   * Set a int value in a query.  This works somewhat like a prepared statement.
   * we replace PLACE_HOLDER with some value.
   * @author Greg Paul
   ************************************************************************************
   */
  public void setValue(int value) {
    int location = getIndex(query, PLACE_HOLDER);
    if (location > -1)
      query.replace(location, location+1, String.valueOf(value));
  }

  /**
   ************************************************************************************
   * Set a String value in a query.  This works somewhat like a prepared statement.
   * we replace PLACE_HOLDER with some value.
   * @author Greg Paul
   ************************************************************************************
   */
  public void setValue(String value) {
    // replace single quotes with two single quotes.
    StringBuffer buf = new StringBuffer(value);
    for(int i=0; i<buf.length(); i++) {
      char ch = buf.charAt(i);
      if (ch == '\'') {
        buf.replace(i, i+1, "\'\'");
        i++;
      }
    }
    int location = getIndex(query, PLACE_HOLDER);
    if (location > -1)
      query.replace(location, location+1, buf.toString());
  }

  /**
   ************************************************************************************
   * Execute this objects query.  If there is no query, or if the query is incomplete
   * (there are still ?'s even after setting values) then throw an exception.  If 
   * returnTypes is still null, throw exception
   * @author Greg Paul
   ************************************************************************************
   */
  public ArrayList execute() throws Exception {
     ArrayList result = null;
     try {
       Context ctx = TCContext.getInitial();
         ReportingHome rHome = (ReportingHome) ctx.lookup(ApplicationServer.REPORTING);
       Reporting r = rHome.create();
       result = r.getResult(this);
     } catch (Exception e) {
       System.out.println("query: " + query);
       e.printStackTrace();
     }

     return result; 
  } 
 

  ////////////////////////////////////
  //private methods
  ////////////////////////////////////

  /**
   ************************************************************************************
   * Get the index of the specified char in the specified StringBuffer.
   * If we're looking for '?' and occurance is 3, then getIndex will
   * return the 3rd occurance of '?'.
   ************************************************************************************
   */
  private int getIndex(StringBuffer buf, char c) {
    for (int i=0; i<buf.length(); i++) {
      if (buf.charAt(i)==c)
        return i;
    }  
    return -1;
  }

}
 
