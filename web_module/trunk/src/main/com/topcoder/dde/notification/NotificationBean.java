/*
 * NotificationBean.java
 *
 * Copyright 2005, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.dde.notification;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import com.topcoder.apps.review.persistence.Common;

import com.topcoder.apps.review.EJBHelper;
import com.topcoder.apps.review.ConfigHelper;

import com.topcoder.file.render.RecordTag;
import com.topcoder.file.render.ValueTag;
import com.topcoder.file.render.XMLDocument;
import com.topcoder.file.render.xsl.XSLTransformerWrapper;
import com.topcoder.file.render.xsl.XSLTransformerWrapperException;
import com.topcoder.message.email.EmailEngine;
import com.topcoder.message.email.TCSEmailMessage;

import com.topcoder.util.TCException;
import com.topcoder.util.idgenerator.bean.IdGen;
import com.topcoder.util.idgenerator.bean.IdGenHome;
import com.topcoder.util.log.Level;
import com.topcoder.util.log.Log;
import com.topcoder.util.log.LogException;
import com.topcoder.util.log.LogFactory;

import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;


import java.util.Iterator;
import java.util.Properties;
import java.util.Map;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

/**
 * This is the concrete implementation of the Notification interface.
 * The bean is used to send email notifications when some events occur.
 *
 * @author cucu
 */
public class NotificationBean implements SessionBean {
    private Log log;
    private SessionContext ejbContext;
    private DataSource dataSource;
    private IdGen idGen;

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
     * Store a new event in the database.
     *
     * @event the event name
     * @typeId type of event, as defined in table notification_mail_type_lu.
     *
     * @return the primary key for the inserted event.
     */
    public long createEvent(String event, long typeId) {
        info("Notification.createEvent " + event + " with type " + typeId);
        Connection conn = null;
        PreparedStatement ps = null;

        long id = -1;
        try {
            conn = dataSource.getConnection();
            ps = conn.prepareStatement("INSERT INTO notification_event "+
                                       "(notification_event_id, event, notification_mail_type_id) " +
                                       "VALUES (?,?,?)");

            id = idGen.nextId("NOTIFICATION_EVENT_SEQ");

            ps.setLong(1, id);
            ps.setString(2, event);
            ps.setLong(3,typeId);

            int nr = ps.executeUpdate();

            if (nr != 1) {
                throw new Exception("Could not create Event!");
            }

        } catch (Exception e) {
            info("error in createEvent: " + e.toString());
            id = -1;
        } finally {
            Common.close(ps);
            Common.close(conn);
        }

        return id;
    }

    /**
     * Make a user be notified for an event.  If the event doesn't exist, it will be created with the type "typeId".
     * If the user is already notified for that event, nothing happens.
     *
     * @param the name of the event
     * @userId the id of the user that be notified for the event
     * @typeId it will be used in the case that the event must be created.
     */
    public void createNotification(String event, long userId, long typeId) {
        info("Notification.createNotification for event " + event + ", user "+ userId + " with type " + typeId);
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
                id = createEvent(event, typeId);
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
            info("error in createNotification: " + e.toString());
        } finally {
            Common.close(conn, ps, rs);
        }
    }

    /**
     * Sends mail for notifying that an event has happened. The properties are used to store additional data
     * for the mail template.
     *
     * @param event the event name
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
                info(((String) entry.getKey())+"="+((String) entry.getValue()));
            }

            conn = dataSource.getConnection();
            ps = conn.prepareStatement(
                    "SELECT e.address, nmt.mail_template, nmt.subject, nmt.from,  "+
                    "       u.first_name, u.last_name, u.handle "+
                    "FROM notification_event  ne, user_notification_event_xref ue, email e, "+
                    "     user u, notification_mail_type_lu nmt "+
                    "WHERE ne. notification_event_id = ue. notification_event_id AND "+
                    "      ue.user_id = e.user_id AND "+
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
                    info ("filenameXSL=" +filenameXSL);

                    bodyText = formatBody(xmlDocument, filenameXSL);
                    info("body text: " + bodyText);

                    from = rs.getString(4);
                    subject = rs.getString(3);;

                }
                String to = "\"" + rs.getString(5) + " " + rs.getString(6) + "\" <" + rs.getString(1) +">";

                sendMail(from, to, subject, bodyText);
            }


        } catch (Exception e) {
            info("Notification can't be sent because: "+e.toString());
        } finally {
            Common.close(conn, ps, rs);
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
            info("--mail--");
            info("From: " + from);
            info("To: " + to);
            info("Subject: " + subject);
            info(messageText);
            info("---end--");
        }
    }

    /**
     * Formats the body of the email by appling an XSL transformation to an XML file which is dinamically
     * generated (containing info such as the names of the sender and receiver, the project name and id and the reason.
     *
     * @param from the sender user
     * @param to the receiver user
     * @param proj the project
     * @param reason the reason
     * @param changeType the type of the project change (a combination of the constants defined in this class)
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
            info(xmlData);
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
