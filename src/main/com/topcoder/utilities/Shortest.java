package com.topcoder.utilities;

import java.io.*;
import java.util.*;
import java.sql.*;
import com.topcoder.common.*;
import java.text.DateFormat;
import java.text.*;

public class Shortest {


  public static void main(String args[]) throws SQLException, Exception {
      int round_id=0;
      try{
        round_id = Integer.parseInt(args[0]);
      }catch(Exception e)
      {
          System.out.println("Usage: java com.topcoder.utilities.Shortest <round_id>");
          return;
      }
      Shortest s = new Shortest();
      s.printReport(round_id,1);
      s.printReport(round_id,2);
  }

  private void printReport(int round_id, int division_id) {
    CommentStripper cs = new CommentStripper();
    Log.msg("In printReport");
    java.sql.Connection conn = null;
    PreparedStatement ps = null;
    PreparedStatement ps1 = null;
    StringBuffer query = null;
    StringBuffer query1 = null;
    ResultSet rs = null;
    ResultSet rs1 = null;
    ArrayList problems = null;

    try {
      conn = DBMS.getDirectConnection();
      query = new StringBuffer(300);

      query = new StringBuffer(300);
      query.append( " SELECT problem_id FROM round_problem WHERE round_id = ? AND division_id = ? ORDER BY difficulty_id");

      ps = conn.prepareStatement(query.toString());
      ps.setInt(1, round_id);
      ps.setInt(2, division_id);
      rs = ps.executeQuery();
      problems = new ArrayList();
      while(rs.next()) {
        problems.add(new Integer(rs.getInt(1)));
      }

      query = new StringBuffer(300);
      query.append("SELECT sub.submission_text, sub.submission_points, u.handle ");
      query.append(" FROM submission sub, problem_state ps, room r, room_result rr, user u ");
      query.append(" WHERE ps.coder_id = rr.coder_id ");
      query.append(" AND ps.round_id = ?");
      query.append(" AND rr.round_id = ?");
      query.append(" AND rr.room_id = r.room_id");
      query.append(" AND r.division_id = ?");
      query.append(" AND problem_id = ?");
      query.append(" AND ps.status_id = 150");
      query.append(" AND sub.problem_state_id = ps.problem_state_id");
      query.append(" AND ps.coder_id = u.coder_id");
      ps = conn.prepareStatement(query.toString());
      ps.setInt(1,round_id);
      ps.setInt(2,round_id);
      ps.setInt(3,division_id);
      for(int i = 0 ;i<problems.size();i++)
      {
          int problem_id = ((Integer)(problems.get(i))).intValue();
          ps.setInt(4,problem_id);
          rs = ps.executeQuery();
          int min = Integer.MAX_VALUE;
          String best = "";
          String text = rs.getString(1);
          float points = rs.getFloat(2);
          while(rs.next())
          {
              String processed = cs.stripComments(text);
              if(processed.length()<min)
              {
                  min = processed.length();
                  best = rs.getString(3);
                  System.out.println("Current best is: "+min+" for: "+best);
              }
          }
          System.out.println("*** BEST FOR DIVISION "+division_id+" PROBLEM "+ (i+1)+" ***")
          System.out.println(best);
      }

    } catch (Exception e) {
      e.printStackTrace();
    }
  }





}
