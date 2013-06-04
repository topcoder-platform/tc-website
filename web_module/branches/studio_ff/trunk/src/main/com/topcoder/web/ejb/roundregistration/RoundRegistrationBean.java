package com.topcoder.web.ejb.roundregistration;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.Context;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * <p>
 * the round registration ejb.
 * </p>
 *
 *
 * <p>
 * Changes in version 1.0 (TopCoder Competition Engine - Event Support For Registration v1.0):
 * <ol>
 * <li>Added {@link #getEventRegistration(int,int)} to get the event registration data.</li>
 * <li>Added {@link #getRoundEvent(int)} to get the round event data.</li>
 * <li>Added {@link #isUserActive(int)} to check whether the user is active.</li>
 * <li>Added {@link #checkRegistrationStatus(long,long)} to check whether the registration status.</li>
 * </ol>
 * </p>
 * @author TCSASSEMBLER
 * @version 1.0
 */

public class RoundRegistrationBean extends BaseEJB {

    private static final Logger log = Logger.getLogger(RoundRegistrationBean.class);
    /**
     * <p>
     * the no eligible message to notify user.
     * </p>
     */
    private static final String NOT_ELIGIBLE_TO_REGISTER = "You are not eligible to participate in this competition.";
    /**
     * <p>
     * get event registration query.
     * </p>
     */
    private static final String GET_EVENT_REGISTRATION_QUERY = "SELECT user_id,event_id,eligible_ind"
        + " FROM event_registration re WHERE user_id=? AND event_id=?";

    /**
     * <p>
     * get the round event data.
     * </p>
     */
    private static final String GET_ROUND_EVENT_QUERY = "SELECT re.event_id,re.event_name,re.registration_url"
        + " FROM round_event re WHERE re.round_id=?";
    /**
     * the eligible_ind = 1 in event_registration table to register legally.
     */
    private static final int ELIGIBLE_TO_REGISTER = 1;
    public void createRoundRegistration(long userId, long roundId) throws EJBException {
        log.debug("createRoundRegistration called... user_id=" + userId + " roundId=" + roundId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;

        try {
            conn = DBMS.getConnection(DBMS.JTS_OLTP_DATASOURCE_NAME);

            ps = conn.prepareStatement("INSERT INTO round_registration (round_id, coder_id, timestamp, eligible) VALUES (?,?,current,?)");
            ps.setLong(1, roundId);
            ps.setLong(2, userId);
            ps.setInt(3, 1);

            int rows = ps.executeUpdate();

            if (rows != 1)
                throw new EJBException("Wrong number of rows in insert: " + rows);
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException creating RoundRegistration user_id=" + userId + " roundId=" + roundId);
        } catch (Exception e) {
            throw new EJBException("Exception creating RoundRegistration user_id=" + userId + " roundId=" + roundId +
                    ":\n" + e.getMessage());
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }
    
    public boolean exists(long userId, long roundId) throws EJBException {
        log.debug("exists called... user_id=" + userId + " roundId=" + roundId);

        Context ctx = null;
        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection(DBMS.JTS_OLTP_DATASOURCE_NAME);

            ps = conn.prepareStatement("SELECT * FROM round_registration WHERE coder_id = ? AND round_id = ?");
            ps.setLong(1, userId);
            ps.setLong(2, roundId);

            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException exists user_id=" + userId + " roundId=" + roundId);
        } catch (Exception e) {
            throw new EJBException("Exception exists user_id=" + userId + " roundId=" + roundId + ":\n" + e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
    
    }
    
    /**
     * <p>
     * get the event registration data.
     * </p>
     * @param userId
     *         the user id.
     * @param eventId
     *         the event id.
     * @return the event registration data.
     * @throws EJBException
     */
    private EventRegistration getEventRegistration(long userId, long eventId) throws EJBException {
        log.debug("getEventRegistration called... user_id=" + userId + " eventId=" + eventId);

        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection(DBMS.JTS_OLTP_DATASOURCE_NAME);

            ps = conn.prepareStatement(GET_EVENT_REGISTRATION_QUERY);
            ps.setLong(1, userId);
            ps.setLong(2, eventId);
            rs = ps.executeQuery();            
            if (rs.next()) {
                EventRegistration re = new EventRegistration();
                re.setEligibleInd(rs.getInt(3));
                return re;
            }
            return null;
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException exists user_id=" + userId + " eventId=" + eventId);
        } catch (Exception e) {
            throw new EJBException("Exception exists user_id=" + userId + " eventId=" + eventId + ":\n" + e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
    }

    /**
     * <p>
     * get the round event data.
     * </p>
     * @param roundId
     *         the round id.
     * @return the round event data.
     * @throws EJBException
     */
    private RoundEvent getRoundEvent(long roundId) throws EJBException {
        log.debug("getRoundEvent called... roundId=" + roundId);

        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection(DBMS.JTS_OLTP_DATASOURCE_NAME);

            ps = conn.prepareStatement(GET_ROUND_EVENT_QUERY);
            ps.setLong(1, roundId);
            rs = ps.executeQuery();            
           
            if (rs.next()) {
                RoundEvent re = new RoundEvent();
                re.setEventId(rs.getInt(1));
                re.setEventName(rs.getString(2));
                re.setRegistrationUrl(rs.getString(3));
                return re;
            }            
            return null;
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException getRoundEvent roundId=" + roundId);
        } catch (Exception e) {
            throw new EJBException("Exception getRoundEvent roundId=" + roundId + ":\n" + e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
    }
    /**
     * <p>
     * check the registration status.
     * </p>
     * @param userId
     *         the user id.
     * @param roundId
     *         the round id.
     * @return the registration message.
     * @throws EJBException
     */
    public String checkRegistrationStatus(long userId,long roundId) throws EJBException {
        try {
            if(!isUserActive(userId))
                return NOT_ELIGIBLE_TO_REGISTER;
            RoundEvent eventData = getRoundEvent(roundId);
            if (eventData != null) {
                EventRegistration evd = getEventRegistration(userId, eventData.getEventId());
                if (evd == null) {
                    StringBuffer message = new StringBuffer ();
                    message.append("In order to participate in this competition, you must register for ")
                        .append("<font color=\"red\">"+eventData.getEventName()+"</font>")
                        .append(". Registration is available at: ").append("<a href=\""+eventData.getRegistrationUrl()+"\">here</a>")
                        .append(". Please register at the provided URL first and then repeat registration at Marathon Match Active Contests page.");
                    return message.toString();
                } else if( evd.getEligibleInd()!= ELIGIBLE_TO_REGISTER) {
                    return NOT_ELIGIBLE_TO_REGISTER;
                }
            }

        }catch(Exception e) {
            throw new EJBException("Exception checkRegistrationStatus user_id=" + userId + ":\n" + e.getMessage());
        }
        return null;
    }
    /**
     * <p>
     * to check the user is active.
     * </p>
     * @param userId
     *         the user id.
     * @return true=user is active.
     * @throws EJBException
     */
    private boolean isUserActive(long userId) throws EJBException {
        log.debug("isUserActive called... user_id=" + userId);

        PreparedStatement ps = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = DBMS.getConnection(DBMS.JTS_OLTP_DATASOURCE_NAME);

            ps = conn.prepareStatement("SELECT * FROM user WHERE user_id = ? AND status = ?");
            ps.setLong(1, userId);
            ps.setString(2, "A");
            
            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException sqe) {
            DBMS.printSqlException(true, sqe);
            throw new EJBException("SQLException isUserActive user_id=" + userId);
        } catch (Exception e) {
            throw new EJBException("Exception isUserActive user_id=" + userId + ":\n" + e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
    }
    /**
     * <p>
     * the round event data.
     * </p>
     * @author TCSASSEMBLER
     * @version 1.0
     */
    private class RoundEvent {
        /**
         * <p>
         * the event id.
         * </p>
         */
        private long eventId;
        /**
         * <p>
         * the event name.
         * </p>
         */
        private String eventName;
        /**
         * <p>
         * the registration url.
         * </p>
         */
        private String registrationUrl;
        /**
         * <p>
         * the getter method of event id.
         * </p>
         * @return the event id.
         */
        public long getEventId() {
            return eventId;
        }
        /**
         * <p>
         * the setter method of event id.
         * </p>
         * @param eventId
         *          the event id.
         */
        public void setEventId(long eventId) {
            this.eventId = eventId;
        }
        /**
         * <p>
         * the getter method of event name.
         * </p>
         * @return the event name.
         */
        public String getEventName() {
            return eventName;
        }
        /**
         * <p>
         * the setter method of event name.
         * </p>
         * @param eventName
         *         the event name.
         */
        public void setEventName(String eventName) {
            this.eventName = eventName;
        }
        /**
         * <p>
         * the getter method of registration url.
         * </p>
         * @return the registration url.
         */
        public String getRegistrationUrl() {
            return registrationUrl;
        }
        /**
         * <p>
         * the setter method of registration url.
         * </p>
         * @param registrationUrl
         *         the registration url.
         */
        public void setRegistrationUrl(String registrationUrl) {
            this.registrationUrl = registrationUrl;
        }        
    }
    /**
     * <p>
     * the event registration data.
     * </p>
     * @author TCSASSEMBLER
     * @version 1.0
     */
    private class EventRegistration {
        /**
         * <p>the eligible indication.</p>
         */
        private int eligibleInd;
        /**
         * <p>
         * the getter method of the eligible indication.
         * </p>
         * @return the eligible indication.
         */
        public int getEligibleInd() {
            return eligibleInd;
        }
        /**
         * <p>
         * the setter method of the eligible indication.
         * </p>
         * @param eligibleInd
         *         the eligible indication.
         */
        public void setEligibleInd(int eligibleInd) {
            this.eligibleInd = eligibleInd;
        }
    }
}
