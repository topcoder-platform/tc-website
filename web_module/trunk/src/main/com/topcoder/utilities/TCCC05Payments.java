package com.topcoder.utilities;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.util.idgenerator.IdGenerator;
import com.topcoder.util.idgenerator.sql.SimpleDB;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.util.*;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 6, 2005
 */
public class TCCC05Payments {
    private static final Logger log = Logger.getLogger(TCCC05Payments.class);

    private long roundId = 0;
    private int[] money = new int[4];

    public static void main(String[] args) {
        TCCC05Payments p = new TCCC05Payments();
        if (args.length!=4) {
            p.printUsage();
        } else {
            try {
                p.setRoundId(Long.parseLong(args[0]));
                p.setFirstPlace(Integer.parseInt(args[1]));
                p.setSecondPlace(Integer.parseInt(args[2]));
                p.setThirdPlace(Integer.parseInt(args[3]));
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
        log.info("usage: java "+ this.getClass().getName() + " <round_id> <1st money> <2nd money> <3rd money>");
    }

    private void setRoundId(long roundId) {
        this.roundId = roundId;
    }

    private void setFirstPlace(int firstPlace) {
        this.money[1] = firstPlace;
    }

    private void setSecondPlace(int secondPlace) {
        this.money[2] = secondPlace;
    }

    private void setThirdPlace(int thirdPlace) {
        this.money[3] = thirdPlace;
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
            " order by rr.room_id asc, rr.room_placed asc";

    private final static String ADD_PAYMENT =
            " INSERT INTO round_payment (round_payment_id, round_id, coder_id, paid, payment_type_id) " +
            " VALUES (?,?,?,?,?)";


    private void makePayments() throws Exception {
        log.info("makePayments running for round " + roundId + " money " + money[1] + " " + money[2] + " " + money[3]);
        //figure out all the winners
        //figure out what they all won
        //insert all the records

        PreparedStatement psSel = null;
        PreparedStatement psIns = null;
        ResultSet rs = null;
        Connection conn = DBMS.getConnection();
        InitialContext ctx = TCContext.getInitial();

        try {

            psSel = conn.prepareStatement(GET_COMPETITORS);
            psSel.setLong(1, roundId);

            rs = psSel.executeQuery();

            ArrayList all = new ArrayList();
            while(rs.next()) {
                all.add(new Data(rs.getLong("room_id"), rs.getLong("coder_id"),
                        rs.getLong("round_id"), rs.getInt("room_placed")));
            }
            log.info("found " + all.size() + " competitors");

            ArrayList winners = getWinnerPaymentInfo(all);
            psIns = conn.prepareStatement(ADD_PAYMENT);

            if (!IdGenerator.isInitialized()) {
                IdGenerator.init(
                        new SimpleDB(),
                        (DataSource) ctx.lookup(DBMS.OLTP_DATASOURCE_NAME),
                        "sequence_object",
                        "name",
                        "current_value",
                        9999999999L,
                        1,
                        false
                );
            }

            int count=0;
            for (int i=0; i<winners.size(); i++) {
                psIns.clearParameters();
                psIns.setLong(1,IdGenerator.nextId("PAYMENT_ID_SEQ"));
                psIns.setLong(2,((Data)winners.get(i)).getRoundId());
                psIns.setLong(3,((Data)winners.get(i)).getCoderId());
                psIns.setInt(4, ((Data)winners.get(i)).getPrize());
                psIns.setInt(5, 1); //Contest Payment	1
                psIns.executeUpdate();
                count++;
            }
            log.debug("" + count + " total rows added");

        } finally {
            if (rs!= null) {
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
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                }
            }

        }




    }

    private ArrayList getWinnerPaymentInfo(ArrayList all) {

        ArrayList ret = new ArrayList();
        if (!all.isEmpty()) {

            TreeMap placeMap = new TreeMap();
            Data[] data = (Data[])all.toArray(new Data[0]);
            ArrayList coders = null;
            HashSet rooms = new HashSet();
            for (int i=0; i<data.length; i++) {
                //bucket everyone into room/placed buckets
                coders = (ArrayList)placeMap.get(data[i].getRoomId()+" " + data[i].getPlaced());
                rooms.add(new Long(data[i].getRoomId()));
                if (coders==null) {
                    coders = new ArrayList();
                }
                coders.add(data[i]);
                placeMap.put(data[i].getRoomId()+" " + data[i].getPlaced(), coders);
            }

            Long currRoom = null;
            ArrayList currCoders = null;
            for (Iterator it = rooms.iterator(); it.hasNext();) {
                currRoom = (Long)it.next();
                int count = 0;
                int currPlace = 1;
                boolean done = false;
                while (currPlace<=3&&count<=3&&!done) {
                    currCoders = (ArrayList)placeMap.get(currRoom+" " + currPlace);
                    if (currCoders==null) {
                        done=true;
                    } else {
                        count+=currCoders.size();
                        //we'll just round everything down
                        int moneyPile = 0;
                        for (int i=currPlace; i<currPlace+currCoders.size()&&i<money.length; i++) {
                            moneyPile+=money[i];
                        }
                        int prize = (int)Math.ceil((double)moneyPile/(double)currCoders.size());
                        for (int i=0; i<currCoders.size(); i++) {
                            ((Data)currCoders.get(i)).setPrize(prize);
                            ret.add(currCoders.get(i));
                        }
                        currPlace+=currCoders.size();
                    }
                }
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
