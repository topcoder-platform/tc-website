package com.topcoder.utilities;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;

import java.sql.*;
import java.util.ArrayList;

public class WriterReport {

    private static Logger log = Logger.getLogger(WriterReport.class);

    public static void main(String args[]) throws SQLException, Exception {
        WriterReport wr = new WriterReport();
        wr.printReport();
    }

    private void printReport() {

        log.info("In printReport");
        java.sql.Connection conn = null;
        PreparedStatement ps = null;
        PreparedStatement ps1 = null;
        StringBuffer query = null;
        StringBuffer query1 = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        ArrayList div1Counts = null;
        ArrayList div2Counts = null;

        try {
            TCResourceBundle bundle = new TCResourceBundle("DBMS");

            Class.forName(DBMS.INFORMIX_DRIVER);
            conn = DriverManager.getConnection(bundle.getProperty("INFORMIX_CONNECT_STRING", ""));

            query = new StringBuffer(300);
            query.append(" SELECT count(*), r.round_id, rs.start_time");
            query.append(" FROM room_result rr");
            query.append(" ,room r");
            query.append(" ,round_segment rs");
            query.append(" WHERE rr.attended='Y'");
            query.append(" AND rr.round_id = r.round_id");
            query.append(" AND rr.room_id = r.room_id");
            query.append(" AND rr.round_id = rs.round_id");
            query.append(" AND (rr.round_id < 1000 OR rr.round_id >= 2000)");
            query.append(" AND r.division_id = ?");
            query.append(" AND rs.segment_id = 1");
            query.append(" GROUP BY r.round_id, rs.start_time");
            query.append(" ORDER BY rs.start_time ASC");

            ps = conn.prepareStatement(query.toString());
            ps.setInt(1, 1);
            rs = ps.executeQuery();
            div1Counts = new ArrayList();
            while (rs.next()) {
                div1Counts.add(new CoderCount(rs.getInt(1), rs.getInt(2), rs.getDate(3)));
            }
            ps.setInt(1, 2);
            rs = ps.executeQuery();
            div2Counts = new ArrayList();
            while (rs.next()) {
                div2Counts.add(new CoderCount(rs.getInt(1), rs.getInt(2), rs.getDate(3)));
            }
            if (div1Counts.size() == 0) {
                System.out.println("0 records found for div1");
                return;
            } else if (div2Counts.size() == 0) {
                System.out.println("0 records found for div2");
                return;
            }

            query = new StringBuffer(300);
            query.append(" SELECT SUM(CASE WHEN ps.status_id = 150 AND rp.difficulty_id = 1 AND rp.division_id = 1 THEN 1 ELSE 0 END) as div1_easy_success");
            query.append(" ,SUM(CASE WHEN ps.status_id = 150 AND rp.difficulty_id = 2 AND rp.division_id = 1 THEN 1 ELSE 0 END) as div1_med_success");
            query.append(" ,SUM(CASE WHEN ps.status_id = 150 AND rp.difficulty_id = 3 AND rp.division_id = 1 THEN 1 ELSE 0 END) as div1_hard_success");
            query.append(" ,SUM(CASE WHEN ps.status_id >= 130 AND rp.difficulty_id = 1 AND rp.division_id = 1 THEN 1 ELSE 0 END) as div1_easy_submit");
            query.append(" ,SUM(CASE WHEN ps.status_id >= 130 AND rp.difficulty_id = 2 AND rp.division_id = 1 THEN 1 ELSE 0 END) as div1_med_submit");
            query.append(" ,SUM(CASE WHEN ps.status_id >= 130 AND rp.difficulty_id = 3 AND rp.division_id = 1 THEN 1 ELSE 0 END) as div1_hard_submit");
            query.append(" ,SUM(CASE WHEN ps.status_id = 150  AND rp.difficulty_id = 1 AND rp.division_id = 1 THEN ps.points ELSE 0 END) as div1_easy_tot_points");
            query.append(" ,SUM(CASE WHEN ps.status_id = 150 AND rp.difficulty_id = 2 AND rp.division_id = 1 THEN ps.points ELSE 0 END) as div1_easy_tot_points");
            query.append(" ,SUM(CASE WHEN ps.status_id = 150 AND rp.difficulty_id = 3 AND rp.division_id = 1 THEN ps.points ELSE 0 END) as div1_easy_tot_points");
            query.append(" ,SUM(CASE WHEN ps.status_id = 150 AND rp.difficulty_id = 1 AND rp.division_id = 2 THEN 1 ELSE 0 END) as div2_easy_success");
            query.append(" ,SUM(CASE WHEN ps.status_id = 150 AND rp.difficulty_id = 2 AND rp.division_id = 2 THEN 1 ELSE 0 END) as div2_med_success");
            query.append(" ,SUM(CASE WHEN ps.status_id = 150 AND rp.difficulty_id = 3 AND rp.division_id = 2 THEN 1 ELSE 0 END) as div2_hard_success");
            query.append(" ,SUM(CASE WHEN ps.status_id >= 130 AND rp.difficulty_id = 1 AND rp.division_id = 2 THEN 1 ELSE 0 END) as div2_easy_submit");
            query.append(" ,SUM(CASE WHEN ps.status_id >= 130 AND rp.difficulty_id = 2 AND rp.division_id = 2 THEN 1 ELSE 0 END) as div2_med_submit");
            query.append(" ,SUM(CASE WHEN ps.status_id >= 130 AND rp.difficulty_id = 3 AND rp.division_id = 2 THEN 1 ELSE 0 END) as div2_hard_submit");
            query.append(" ,SUM(CASE WHEN ps.status_id = 150 AND rp.difficulty_id = 1 AND rp.division_id = 2 THEN ps.points ELSE 0 END) as div2_easy_tot_points");
            query.append(" ,SUM(CASE WHEN ps.status_id = 150 AND rp.difficulty_id = 2 AND rp.division_id = 2 THEN ps.points ELSE 0 END) as div2_easy_tot_points");
            query.append(" ,SUM(CASE WHEN ps.status_id = 150 AND rp.difficulty_id = 3 AND rp.division_id = 2 THEN ps.points ELSE 0 END) as div2_easy_tot_points");
            query.append(" ,c.name");
            query.append(" ,r.round_id");
            query.append(" FROM problem_state ps");
            query.append(" ,problem p");
            query.append(" ,round r");
            query.append(" ,round_problem rp");
            query.append(" ,contest c");
            query.append(" ,room_result rr");
            query.append(" ,room ro");
            query.append(" WHERE ps.problem_id = p.problem_id");
            query.append(" AND r.round_id = ?");
            query.append(" AND rp.round_id = r.round_id");
            query.append(" AND rp.problem_id = p.problem_id");
            query.append(" AND rp.problem_id = ps.problem_id");
            query.append(" AND ps.round_id = r.round_id ");
            query.append(" AND rr.round_id = r.round_id");
            query.append(" AND rr.coder_id = ps.coder_id");
            query.append(" AND rr.round_id = rp.round_id");
            query.append(" AND rr.round_id = ro.round_id");
            query.append(" AND rr.room_id = ro.room_id");
            query.append(" AND ro.round_id = ps.round_id");
            query.append(" AND rp.round_id = ro.round_id");
            query.append(" AND ro.division_id = rp.division_id");
            query.append(" AND c.contest_id = r.contest_id");
            query.append(" GROUP BY r.round_id, r.name, c.name");

            ps = conn.prepareStatement(query.toString());

            CoderCount cc1 = null;
            CoderCount cc2 = null;

            int i = div1Counts.size() <= 20 ? 0 : div1Counts.size() - 20;

            for (; i < div1Counts.size(); i++) {
                cc1 = (CoderCount) div1Counts.get(i);
                for (int j = 0; j < div2Counts.size(); j++) {
                    cc2 = (CoderCount) div2Counts.get(j);
                    if (cc1.getRoundId() == cc2.getRoundId()) break;
                }

                if (cc1.getCount() == 0) {
                    System.out.println("No coders in round " + cc1.getRoundId());
                } else {
                    ps.setInt(1, cc1.getRoundId());
                    rs = ps.executeQuery();
                    if (rs.next())
                        printRow(rs, cc1, cc2);
                    else
                        System.out.println("something screwed up " + cc1.getRoundId());
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    private static void printRow(ResultSet rs, CoderCount div1Count, CoderCount div2Count) throws Exception {

        System.out.println(" ** Contest " + rs.getString(19) + " **");
        System.out.println("   *******  DIVISION I  *********");
        System.out.println("Easy Success       " + 100 * (float) rs.getInt(1) / div1Count.getCount() + "%" + "\t " + rs.getInt(1) + " of " + div1Count.getCount());
        System.out.println("Med Success        " + 100 * (float) rs.getInt(2) / div1Count.getCount() + "%" + "\t " + rs.getInt(2) + " of " + div1Count.getCount());
        System.out.println("Hard Success       " + 100 * (float) rs.getInt(3) / div1Count.getCount() + "%" + "\t " + rs.getInt(3) + " of " + div1Count.getCount());
        System.out.println("Easy Submitted     " + 100 * (float) rs.getInt(4) / div1Count.getCount() + "%" + "\t " + rs.getInt(4) + " of " + div1Count.getCount());
        System.out.println("Med Submitted      " + 100 * (float) rs.getInt(5) / div1Count.getCount() + "%" + "\t " + rs.getInt(5) + " of " + div1Count.getCount());
        System.out.println("Hard Submitted     " + 100 * (float) rs.getInt(6) / div1Count.getCount() + "%" + "\t " + rs.getInt(6) + " of " + div1Count.getCount());
        System.out.println("Easy Avg. Points   " + (float) rs.getInt(7) / rs.getInt(1));
        System.out.println("Med Avg. Points    " + (float) rs.getInt(8) / rs.getInt(2));
        System.out.println("Hard Avg. Points   " + (float) rs.getInt(9) / rs.getInt(3));
        System.out.println("");
        System.out.println("   *******  DIVISION II  *********");
        System.out.println("Easy Success       " + 100 * (float) rs.getInt(10) / div2Count.getCount() + "%" + "\t " + rs.getInt(10) + " of " + div2Count.getCount());
        System.out.println("Med Success        " + 100 * (float) rs.getInt(11) / div2Count.getCount() + "%" + "\t " + rs.getInt(11) + " of " + div2Count.getCount());
        System.out.println("Hard Success       " + 100 * (float) rs.getInt(12) / div2Count.getCount() + "%" + "\t " + rs.getInt(12) + " of " + div2Count.getCount());
        System.out.println("Easy Submitted     " + 100 * (float) rs.getInt(13) / div2Count.getCount() + "%" + "\t " + rs.getInt(13) + " of " + div2Count.getCount());
        System.out.println("Med Submitted      " + 100 * (float) rs.getInt(14) / div2Count.getCount() + "%" + "\t " + rs.getInt(14) + " of " + div2Count.getCount());
        System.out.println("Hard Submitted     " + 100 * (float) rs.getInt(15) / div2Count.getCount() + "%" + "\t " + rs.getInt(15) + " of " + div2Count.getCount());
        System.out.println("Easy Avg. Points   " + (float) rs.getInt(16) / rs.getInt(10));
        System.out.println("Med Avg. Points    " + (float) rs.getInt(17) / rs.getInt(11));
        System.out.println("Hard Avg. Points   " + (float) rs.getInt(18) / rs.getInt(12));
        System.out.println("");
        System.out.println("");
        System.out.println("");


    }

    class CoderCount implements Comparable {
        private int _count = 0;
        private int _roundId = 0;
        private java.sql.Date _date = null;

        CoderCount(int count, int roundId, java.sql.Date date) {
            _count = count;
            _roundId = roundId;
            _date = date;
        }

        public int compareTo(Object other) {
            return _date.compareTo(((CoderCount) other).getDate());
        }

        int getCount() {
            return _count;
        }

        int getRoundId() {
            return _roundId;
        }

        java.sql.Date getDate() {
            return _date;
        }

        void setCount(int count) {
            _count = count;
        }

        void setRoundId(int roundId) {
            _roundId = roundId;
        }

        void setDate(java.sql.Date date) {
            _date = date;
        }
    }


}
