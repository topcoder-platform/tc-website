package com.topcoder.utilities;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Shortest {

    private static Logger log = Logger.getLogger(Shortest.class);

    public static void main(String args[]) throws SQLException, Exception {
        int round_id = 0;
        try {
            round_id = Integer.parseInt(args[0]);
        } catch (Exception e) {
            System.out.println("Usage: java com.topcoder.utilities.Shortest <round_id>");
            return;
        }
        Shortest s = new Shortest();
        System.out.println("NOT INCLUDING COMMENTS");
        s.printReport(round_id, 1);
        System.out.println("******************************************************************");
        s.printReport(round_id, 2);
    }

    private void printReport(int round_id, int division_id) {
        CommentStripper cs = new CommentStripper();
        log.debug("In printReport");
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        PreparedStatement ps1 = null;
        StringBuffer query = null;
        StringBuffer query1 = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        ArrayList problems = null;

        try {
            TCResourceBundle bundle = new TCResourceBundle("DBMS");

            Class.forName(DBMS.INFORMIX_DRIVER);
            conn = DriverManager.getConnection(bundle.getProperty("INFORMIX_CONNECT_STRING", ""));

            query = new StringBuffer(300);
            query.append(" SELECT problem_id, difficulty_id FROM round_problem WHERE round_id = ? AND division_id = ? ORDER BY difficulty_id");

            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, round_id);
            ps.setInt(2, division_id);
            rs = ps.executeQuery();
            problems = new ArrayList();
            while (rs.next()) {
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
            query.append(" AND ps.coder_id = u.user_id");
            query.append(" AND ps.submission_number = sub.submission_number");
            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, round_id);
            ps.setInt(2, round_id);
            ps.setInt(3, division_id);
            for (int i = 0; i < problems.size(); i++) {
                int problem_id = ((Integer) (problems.get(i))).intValue();
                ps.setInt(4, problem_id);
                rs = ps.executeQuery();
                int min = Integer.MAX_VALUE;
                int second = Integer.MAX_VALUE;
                float bestPoints = 0;
                float secondPoints = 0;
                String best = "";
                String secondBest = "";
                String s = "";
                while (rs.next()) {
                    String text = rs.getString(1);
                    float points = rs.getFloat(2);
                    String processed = cs.stripComments(text);
                    if (processed.length() < min) {
                        second = min;
                        secondPoints = bestPoints;
                        secondBest = best;
                        min = processed.length();
                        s = processed;
                        best = rs.getString(3);
                        bestPoints = points;
//                System.out.println("Current best is: "+min+" for: "+best);
                    } else if (processed.length() < second) {
                        second = processed.length();
                        secondBest = rs.getString(3);
                        secondPoints = points;
                    }
                }
                System.out.println("*** BEST FOR DIVISION " + division_id + " PROBLEM " + (i + 1) + " with " + bestPoints + " points is " + best + " with about " + min + " keystrokes***");
                System.out.println("*** SECOND BEST FOR DIVISION " + division_id + " PROBLEM " + (i + 1) + " with " + secondPoints + " points is " + secondBest + " with about " + second + " keystrokes***");
                System.out.println();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
