package com.topcoder.utilities;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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


    private void makePayments() throws Exception {
        log.debug("makePayments running for round " + roundId + " money " + money[1] + " " + money[2] + " " + money[3]);
        //figure out all the winners
        //figure out what they all won
        //insert all the records

        PreparedStatement psSel = null;

        ResultSet rs = null;

        psSel = DBMS.getConnection().prepareStatement(GET_COMPETITORS);
        psSel.setLong(1, roundId);

        rs = psSel.executeQuery();

        ArrayList all = new ArrayList();
        while(rs.next()) {
            all.add(new Data(rs.getLong("room_id"), rs.getLong("coder_id"),
                    rs.getLong("round_id"), rs.getInt("room_placed")));
        }
        log.debug("found " + all.size() + " competitors");

        ArrayList winners = getWinnerPaymentInfo(all);
        for (int i=0; i<winners.size(); i++) {
            log.debug(winners.get(i).toString());
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
                        log.debug(""+currCoders.size() + " coders for place " +  currPlace + " room " + currRoom);
                        //we'll just round everything down
                        int moneyPile = 0;
                        for (int i=currPlace; i<currPlace+currCoders.size()&&i<money.length; i++) {
                            moneyPile+=money[i];
                        }
                        log.debug("pile is " + moneyPile);
                        int prize = moneyPile/currCoders.size();
                        for (int i=0; i<currCoders.size(); i++) {
                            ((Data)currCoders.get(i)).setPrize(prize);
                            ret.add(currCoders.get(i));
                        }
                        currPlace++;
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
