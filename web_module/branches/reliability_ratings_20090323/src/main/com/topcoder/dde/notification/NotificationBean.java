/*
 * NotificationBean.java
 *
 * Copyright 2005, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.dde.notification;


import com.topcoder.apps.review.ConfigHelper;
import com.topcoder.apps.review.EJBHelper;
import com.topcoder.apps.review.persistence.Common;
import com.topcoder.file.render.ValueTag;
import com.topcoder.file.render.XMLDocument;
import com.topcoder.file.render.xsl.XSLTransformerWrapper;
import com.topcoder.file.render.xsl.XSLTransformerWrapperException;
import com.topcoder.message.email.EmailEngine;
import com.topcoder.message.email.TCSEmailMessage;
import com.topcoder.util.idgenerator.bean.IdGen;
import com.topcoder.util.idgenerator.bean.IdGenHome;
import com.topcoder.util.log.Level;
import com.topcoder.util.log.Log;
import com.topcoder.util.log.LogException;
import com.topcoder.util.log.LogFactory;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

/**
 * This is the concrete implementation of the Notification interface.
 * The bean is used to send email notifications when some events occur.
 *
 * @author cucu, isv
 * @version 1.1 04/22/2005
 */
public class NotificationBean implements SessionBean {
    private Log log;
    private SessionContext ejbContext;
    private DataSource dataSource;
    private IdGen idGen;

    /**
     * <p>An <code>int</code> providing the SQL error code specific to current database vendor indicating that a foreign
     * key constraint has been violated.</p>
     */
    private static final int FK_VIOLATION_ERROR_CODE = -691;

    /**
     * <p>An <code>int</code> providing the SQL error code specific to current database vendor indicating that a primary
     * key constraint has been violated.</p>
     */
    private static final int PK_VIOLATION_ERROR_CODE = -268;

    private void info(String msg) {
        try {
            log.log(Level.INFO, msg);
        } catch (LogException e1) {
            e1.printStackTrace();
        }
    }

    private void debug(String msg) {
        try {
            log.log(Level.DEBUG, msg);
        } catch (LogException e1) {
            e1.printStackTrace();
        }
    }

    private void error(String msg) {
        try {
            log.log(Level.ERROR, msg);
        } catch (LogException e1) {
            e1.printStackTrace();
        }
    }

    /**
     * <p>Stores a new event in the database.</p>
     *
     * @param event a <code>String</code> providing the the event name.
     * @param description a <code>String</code> providing the description of new notification event.
     * @param typeId a <code>long</code> providing the type of event, as defined in table notification_mail_type_lu.
     * @return a <code>long</code> providing the primary key for the inserted event.
     */
    public long createEvent(String event, String description, long typeId) {
        info("Notification.createEvent " + event + " with type " + typeId);
        Connection conn = null;
        PreparedStatement ps = null;

        long id = -1;
        try {
            conn = dataSource.getConnection();
            ps = conn.prepareStatement("INSERT INTO notification_event "+
                                       "(notification_event_id, event, notification_mail_type_id, description) " +
                                       "VALUES (?,?,?,?)");

            id = idGen.nextId("NOTIFICATION_EVENT_SEQ");

            ps.setLong(1, id);
            ps.setString(2, event);
            ps.setLong(3, typeId);
            ps.setString(4, description);

            int nr = ps.executeUpdate();

            if (nr != 1) {
                throw new Exception("Could not create Event!");
            }

        } catch (Exception e) {
            error("error in createEvent: " + e.toString());
            id = -1;
        } finally {
            Common.close(ps);
            Common.close(conn);
        }

        return id;
    }

    /**
     * <p>Makes a user be notified for an event. If the event doesn't exist, it will be created with the specified type
     * and description. If the user is already notified for that event, nothing happens.</p>
     *
     * @param event the name of the event
     * @param userId the id of the user that be notified for the event
     * @param typeId it will be used in the case that the event must be created.
     * @param description a <code>String</code> providing the description of an event in the case that the event must be
     *        created.
     */
    public void createNotification(String event, long userId, long typeId, String description) {
        info("Notification.createNotification for event " + event + ", user "+ userId + " with type " + typeId
            + " and description " + description);

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        long id;

        try {
            // search the id for the event
            conn = dataSource.getConnection();
            ps = conn.prepareStatement(
                            "SELECT notification_event_id " +
                            "FROM notification_event " +
                            "WHERE event = ?");
            ps.setString(1, event);

            rs = ps.executeQuery();

            // If the event doens't exist, create it.
            if (!rs.next()) {
                id = createEvent(event, description, typeId);
            } else {
                id = rs.getLong(1);
            }

            if (id < 0) {
                throw new Exception("Cannot create event");
            }

            Common.close(rs);
            Common.close(ps);

            // look if the notification for the event for that user is already in the table
            ps = conn.prepareStatement(
                        "SELECT user_id "+
                        "FROM user_notification_event_xref "+
                        "WHERE notification_event_id = ? AND " +
                        "      user_id  = ?");
            ps.setLong(1,id);
            ps.setLong(2,userId);

            rs = ps.executeQuery();

            // if no record was found, create it
            if (!rs.next()) {
                Common.close(rs);
                Common.close(ps);
                ps = conn.prepareStatement(
                        "INSERT INTO user_notification_event_xref "+
                        "     (notification_event_id, user_id) "+
                        "     VALUES(?, ?)");
                ps.setLong(1,id);
                ps.setLong(2,userId);

                ps.executeUpdate();
            }
        } catch (Exception e) {
            error("error in createNotification: " + e.toString());
        } finally {
            Common.close(conn, ps, rs);
        }
    }

    /**
     * <p>Sends mail for notifying that an event has happened. The properties are used to store additional data
     * for the mail template.</p>
     *
     * @param event the event name.
     * @param prop the additional name-values to be used for the mail template.
     */
    public void notifyEvent(String event, Properties prop) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            info("Notification.notifyEvent " + event + " with properties " + prop);

            XMLDocument xmlDocument = new XMLDocument("MAILDATA");

            // Generate the XML document with the tags contained in prop
            for (Iterator it = prop.entrySet().iterator(); it.hasNext();) {
                Map.Entry entry = (Map.Entry) it.next();
                xmlDocument.addTag(new ValueTag((String) entry.getKey(), (String) entry.getValue()));
                //debug(((String) entry.getKey())+"="+((String) entry.getValue()));
            }

            conn = dataSource.getConnection();
            ps = conn.prepareStatement(
                    "SELECT e.address, nmt.mail_template, nmt.subject, nmt.from,  "+
                    "       u.first_name, u.last_name, u.handle "+
                    "FROM notification_event  ne, user_notification_event_xref ue, email e, "+
                    "     user u, notification_mail_type_lu nmt "+
                    "WHERE ne. notification_event_id = ue. notification_event_id AND "+
                    "      ue.user_id = e.user_id AND "+
                    "      e.primary_ind = 1 AND"+
                    "      e.status_id = 1 AND"+
                    "      u.user_id = e.user_id AND "+
                    "      nmt. notification_mail_type_id=ne.notification_mail_type_id AND "+
                    "      ne.event = ? ");

            ps.setString(1,event);
            rs = ps.executeQuery();

            boolean first = true;
            String bodyText = null;
            String from = null;
            String subject = null;


            while (rs.next()) {
                // the first time, the email body is built.  Then, the same body is used for all the destinations.
                if (first) {
                    first = false;

                    String filenameXSL = ConfigHelper.getMailTemplatePath() + rs.getString(2);
                    debug("filenameXSL=" +filenameXSL);

                    bodyText = formatBody(xmlDocument, filenameXSL);
                    debug("body text: " + bodyText);

                    from = rs.getString(4);
                    subject = rs.getString(3);;

                }
                String to = "\"" + rs.getString(5) + " " + rs.getString(6) + "\" <" + rs.getString(1) +">";

                sendMail(from, to, subject, bodyText);
            }


        } catch (Exception e) {
            error("Notification can't be sent because: "+e.toString());
        } finally {
            Common.close(conn, ps, rs);
        }
    }

    /**
     * <p>A <code>String</code> providing the SQL query to be used to locate the details for notification events which
     * are already assigned to specified user.</p>
     */
    private static final String GET_ASSIGNED_EVENTS_QUERY = "SELECT ne.notification_event_id,ne.description,ne.event " +
            "FROM notification_event ne,user_notification_event_xref unex " +
            "WHERE unex.user_id = ? " +
            "AND   unex.notification_event_id = ne.notification_event_id";

    /**
     * <p>Gets the notification events which are assigned to requested user.</p>
     *
     * @param userId a <code>long</code> providing the ID of a user/coder to get the assigned events for.
     * @return a <code>Set</code> of {@link NotificationEvent} instances representing the notification events assigned
     *         to requested user. May return an empty set if there are no notification events assigned to requested user
     *         but never returns <code>null</code>.
     */
    public Set getAssignedEvents(long userId) {
        info("Notification.getAssignedEvents for user "+ userId);

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // A set for collectiing the assigned events
        Set assignedEvents = new TreeSet();

        try {
            // Get the list of assigned events
            conn = dataSource.getConnection();
            ps = conn.prepareStatement(GET_ASSIGNED_EVENTS_QUERY);
            ps.setLong(1, userId);

            rs = ps.executeQuery();

            // Populate the resulting set with assigned events
            NotificationEvent event;
            while (rs.next()) {
                event = new NotificationEvent(rs.getLong(1), rs.getString(2));
                event.setEventName(rs.getString(3));
                assignedEvents.add(event);
            }

        } catch (Exception e) {
            error("error in getAssignedEvents: " + e.toString());
        } finally {
            Common.close(conn, ps, rs);
        }

        return assignedEvents;
    }

    /**
     * <p>A <code>String</code> providing the SQL query to be used to locate the details for notification events which
     * are not assigned to specified user.</p>
     */
    private static final String GET_UNASSIGNED_EVENTS_QUERY = "SELECT ne.notification_event_id,ne.description,ne.event "
            + "FROM notification_event ne "
            + "WHERE NOT ne.notification_event_id IN "
            + "(SELECT notification_event_id FROM user_notification_event_xref WHERE user_id = ?)";

    /**
     * <p>Gets the notification events which are not assigned to requested user.</p>
     *
     * @param userId a <code>long</code> providing the ID of a user/coder to get the non-assigned events for.
     * @return a <code>Set</code> of {@link NotificationEvent} instances representing the notification events which are
     *         not assigned to requested user. May return an empty set if all existing notification events are already
     *         assigned to requested user but never returns <code>null</code>.
     */
    public Set getUnassignedEvents(long userId) {
        info("Notification.getUnassignedEvents for user "+ userId);

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // A set for collectiing the unassigned events
        Set unassignedEvents = new TreeSet();

        try {
            // Get the list of unassigned events
            conn = dataSource.getConnection();
            ps = conn.prepareStatement(GET_UNASSIGNED_EVENTS_QUERY);
            ps.setLong(1, userId);

            rs = ps.executeQuery();

            // Populate the resulting set with unassigned events
            NotificationEvent event;
            while (rs.next()) {
                event = new NotificationEvent(rs.getLong(1), rs.getString(2));
                event.setEventName(rs.getString(3));
                unassignedEvents.add(event);
            }

        } catch (Exception e) {
            error("error in getUnassignedEvents: " + e.toString());
        } finally {
            Common.close(conn, ps, rs);
        }

        return unassignedEvents;
    }

    /**
     * <p>A <code>String</code> providing the SQL command to be used to unassign the specified notification event from
     * specified user.</p>
     */
    private static final String UNASSIGN_EVENT_FROM_USER_COMMAND = "DELETE FROM user_notification_event_xref "
            + "WHERE user_id = ? AND notification_event_id = ?";

    /**
     * <p>Unassigns specified notification event from specified user.</p>
     *
     * @param userId a <code>long</code> providing the ID of a user to unassign the requested notification event from.
     * @param eventId a <code>long</code> providing the ID of a notification event to unassign from the requested user.
     */
    public void unassignEvent(long userId, long eventId) {
        info("Notification.unassignEvent for user "+ userId + " and notification event " + eventId);

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // Get the list of unassigned events
            conn = dataSource.getConnection();
            ps = conn.prepareStatement(UNASSIGN_EVENT_FROM_USER_COMMAND);
            ps.setLong(1, userId);
            ps.setLong(2, eventId);

            ps.executeUpdate();

        } catch (Exception e) {
            error("error in unassignEvent: " + e.toString());
        } finally {
            Common.close(ps);
            Common.close(conn);
        }
    }

    /**
     * <p>A <code>String</code> providing the SQL command to be used to assign the specified notification event to
     * specified user.</p>
     */
    private static final String ASSIGN_EVENT_TO_USER_COMMAND = "INSERT INTO user_notification_event_xref "
        + "(notification_event_id, user_id) VALUES(?, ?)";

    /**
     * <p>Makes a user be notified for an event. If the event doesn't exist, it will not be created and the operation
     * will fail with exception. If the user is already notified for that event, nothing happens.</p>
     *
     * @param eventId a <code>long</code> providing the ID of a notification event to assign to the requested user.
     * @param userId a <code>long</code> providing the ID of a user to assign the requested notification event to.
     * @throws SQLException if the specified event does not exist.
     */
    public void assignEvent(long eventId, long userId) throws SQLException {
        info("Notification.assignEvent for event " + eventId + ", user "+ userId);

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = dataSource.getConnection();

            ps = conn.prepareStatement(ASSIGN_EVENT_TO_USER_COMMAND);
            ps.setLong(1,eventId);
            ps.setLong(2,userId);

            int rowsInserted = ps.executeUpdate();
            if ( rowsInserted != 1) {
                error("assignEvent: Unexpected number of inserted rows - " + rowsInserted);
            }
        } catch (SQLException e) {
            int vendorErrorCode = e.getErrorCode();
            if (vendorErrorCode == FK_VIOLATION_ERROR_CODE) {
                throw e;
            } else if (vendorErrorCode == PK_VIOLATION_ERROR_CODE) {
                error("The event " + eventId + " is already assigned to user " + userId);
            } else {
                error("SQL error in assignEvent: " + e.toString());
            }
        } finally {
            Common.close(ps);
            Common.close(conn);
        }
    }

    /**
     * Send a mail from a user to another user.
     *
     * @param from the sender
     * @param to the destination user
     * @param subject the subject
     * @param messageText the text of the message
     *
     * @throws Exception propagate any exceptions
     */
    private void sendMail(String from, String to, String subject, String messageText) throws Exception {
        if (!EJBHelper.isTestMode()) {
            TCSEmailMessage message = new TCSEmailMessage();
            message.setFromAddress(from);
            message.setToAddress(to, TCSEmailMessage.TO);
            message.setSubject(subject);
            message.setBody(messageText);
            info("Notification sending e-mail to address: " + to);
            EmailEngine.send(message);
        } else {
            debug("--mail--");
            debug("From: " + from);
            debug("To: " + to);
            debug("Subject: " + subject);
            debug(messageText);
            debug("---end--");
        }
    }

    /**
     * Formats the body of the email by appling an XSL transformation to an XML file which is dinamically
     * generated (containing info such as the names of the sender and receiver, the project name and id and the reason.
     *
     * @param bodyXSL the name of the XSL file (template of the body) to be applied
     *
     * @return the formatted body
     *
     * @exception XSLTransformerWrapperException propagated from the document generator
     * @exception FileNotFoundException if the XSL file is not found
     */
    private String formatBody(XMLDocument xmlDocument, String bodyXSL)
                throws XSLTransformerWrapperException, FileNotFoundException {
        String xmlData = xmlDocument.createXML();
        if (EJBHelper.isTestMode()) {
            debug(xmlData);
        }
        XSLTransformerWrapper xslt = new XSLTransformerWrapper(new FileInputStream(bodyXSL));
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        xslt.transform(new ByteArrayInputStream(xmlData.getBytes()), out);
        String result = out.toString();
        return result;
    }

    /**
     * This method is required by the EJB Specification.
     *
     * @throws CreateException DOCUMENT ME!
     */
    public void ejbCreate() throws CreateException {

        dataSource = Common.getDataSource();

        try {
            InitialContext context = new InitialContext();

            Object o = context.lookup("idgenerator/IdGenEJB");
            IdGenHome idGenHome = (IdGenHome) PortableRemoteObject.narrow(o, IdGenHome.class);
            idGen = idGenHome.create();

        } catch (Exception e) {
            throw new CreateException("Could not find bean!" + e);
        }

        try {
            log = LogFactory.getInstance().getLog("com.topcoder.apps.review.notification.NotificationBean");
        } catch (LogException e) {
            e.printStackTrace();
        }

        debug("ProjectTrackerBean created");
    }

    /**
     * @see javax.ejb.SessionBean#ejbRemove()
     */
    public void ejbRemove() throws EJBException {
    }

    /**
     * @see javax.ejb.SessionBean#ejbActivate()
     */
    public void ejbActivate() throws EJBException {
    }

    /**
     * @see javax.ejb.SessionBean#ejbPassivate()
     */
    public void ejbPassivate() throws EJBException {
    }

    /**
     * @see javax.ejb.SessionBean#setSessionContext(javax.ejb.SessionContext)
     */
    public void setSessionContext(SessionContext ctx) throws EJBException {
        this.ejbContext = ctx;
    }
}
