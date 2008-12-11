package com.topcoder.utilities;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.IdGeneratorClient;
import com.topcoder.shared.util.logging.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @author dok
 * @version $Revision: 66662 $ $Date$
 *          Create Date: Jan 6, 2005
 */
public class TCCC06Payments {
    private static final Logger log = Logger.getLogger(TCCC06Payments.class);

    private long roundId = 0;
    private int money = 0;

    public static void main(String[] args) {
        TCCC06Payments p = new TCCC06Payments();
        if (args.length != 2) {
            p.printUsage();
        } else {
            try {
                p.setRoundId(Long.parseLong(args[0]));
                p.setPrize(Integer.parseInt(args[1]));
                p.makePayments();
            } catch (NumberFormatException e) {
                p.printUsage();
            } catch (SQLException e) {
                DBMS.printSqlException(true, e);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }

    private void printUsage() {
        log.info("usage: java " + this.getClass().getName() + " <round_id> <prize>");
    }

    private void setRoundId(long roundId) {
        this.roundId = roundId;
    }

    private void setPrize(int firstPlace) {
        this.money = firstPlace;
    }


    private final static String GET_COMPETITORS =
            "select rr.room_id, rr.round_id, rr.room_placed, rr.coder_id" +
                    " from room_result rr " +
                    " , room r " +
                    " where rr.round_id = ? " +
                    " and rr.round_id = r.round_id " +
                    " and rr.room_id = r.room_id " +
                    " and r.room_type_id = 2 " +
                    " and rr.point_total > 0 " +
                    " and rr.attended = 'Y' " +
                    " and rr.advanced = 'Y' ";

    private final static String ADD_PAYMENT =
            " INSERT INTO round_payment (round_payment_id, round_id, coder_id, paid, payment_type_id) " +
                    " VALUES (?,?,?,?,?)";


    private void makePayments() throws Exception {
        log.info("makePayments running for round " + roundId + " money " + money);
        //figure out all the winners
        //figure out what they all won
        //insert all the records

        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        ResultSet rs = null;
        Connection conn = DBMS.getDirectConnection();

        try {

            psSel = conn.prepareStatement(GET_COMPETITORS);
            psSel.setLong(1, roundId);

            rs = psSel.executeQuery();

            ArrayList all = new ArrayList();
            while (rs.next()) {
                all.add(new Data(rs.getLong("room_id"), rs.getLong("coder_id"),
                        rs.getLong("round_id"), rs.getInt("room_placed")));
            }
            log.info("found " + all.size() + " competitors");

            ArrayList winners = getWinnerPaymentInfo(all);
            psIns = conn.prepareStatement(ADD_PAYMENT);

            int count = 0;
            for (int i = 0; i < winners.size(); i++) {
                psIns.clearParameters();
                psIns.setLong(1, IdGeneratorClient.getSeqId("PAYMENT_ID_SEQ"));
                psIns.setLong(2, ((Data) winners.get(i)).getRoundId());
                psIns.setLong(3, ((Data) winners.get(i)).getCoderId());
                psIns.setInt(4, ((Data) winners.get(i)).getPrize());
                psIns.setInt(5, 1); //Contest Payment	1
                psIns.executeUpdate();
                count++;
            }
            log.debug("" + count + " total rows added");

        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception ignore) {
                }
            }

            if (psSel != null) {
                try {
                    psSel.close();
                } catch (Exception ignore) {
                }
            }
            if (psIns != null) {
                try {
                    psIns.close();
                } catch (Exception ignore) {
                }
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ignore) {
                }
            }

        }


    }

    private ArrayList getWinnerPaymentInfo(ArrayList all) {

        ArrayList ret = new ArrayList();
        if (!all.isEmpty()) {

            Data[] data = (Data[]) all.toArray(new Data[0]);
            for (int i = 0; i < data.length; i++) {
                data[i].setPrize(money);
                ret.add(data[i]);
            }
        }

        return ret;

    }


    private class Data {
        private long roomId = 0;
        private long coderId = 0;
        private long roundId = 0;
        private int placed = 0;
        private int prize = 0;

        private Data(long roomId, long coderId, long roundId, int placed) {
            this.roomId = roomId;
            this.coderId = coderId;
            this.roundId = roundId;
            this.placed = placed;
        }

        private long getRoomId() {
            return roomId;
        }

        private long getCoderId() {
            return coderId;
        }

        private long getRoundId() {
            return roundId;
        }

        private int getPlaced() {
            return placed;
        }

        private int getPrize() {
            return prize;
        }

        private void setPrize(int prize) {
            this.prize = prize;
        }

        public String toString() {
            return "room " + roomId + " coder " + coderId + " round " +
                    roundId + " placed " + placed + " prize " + prize;
        }

    }


}
