/*
 * NotificationBean.java
 *
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.dde.notification;

/*
import com.topcoder.apps.review.ConcurrentModificationException;
import com.topcoder.apps.review.GeneralSecurityException;
import com.topcoder.apps.review.document.DocumentManagerLocal;
import com.topcoder.apps.review.document.DocumentManagerLocalHome;
import com.topcoder.apps.review.document.InvalidEditException;
import com.topcoder.apps.review.document.ReviewScorecard;
import com.topcoder.apps.review.document.ScreeningScorecard;
import com.topcoder.apps.review.security.AdminPermission;
import com.topcoder.apps.review.security.AggregationPermission;
import com.topcoder.apps.review.security.FinalReviewPermission;
import com.topcoder.apps.review.security.ReviewPermission;
import com.topcoder.apps.review.security.ScreenPermission;
import com.topcoder.apps.review.security.SubmitFinalFixPermission;
import com.topcoder.apps.review.security.SubmitPermission;
import com.topcoder.apps.review.security.ViewProjectPermission;

import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PolicyMgrRemote;
import com.topcoder.security.admin.PolicyMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.policy.PermissionCollection;
import com.topcoder.security.policy.PolicyRemote;
import com.topcoder.security.policy.PolicyRemoteHome;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
*/

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
 * This is the concrete implementation of the ProjectTracker interface.
 *
 * @author TCSDeveloper
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

    public long createEvent(String event, long typeId) {
        info("Notification.createEvent " + event + " with type " + typeId);
/*        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = dataSource.getConnection();
            ps = conn.prepareStatement("INSERT INTO notification_event "+
                                       "(notification_event_id, event, notification_mail_type_id) " +
                                       "VALUES (?,?,?)");
            ps.setLong(1, idGen.nextId());
            ps.setString(2, event);
            ps.setLong(3,typeId);
            int nr = ps.executeUpdate();

            if (nr != 1) {
                String errorMsg = "Notification.createEvent(): Could not create Event!";
                error(errorMsg);
                ejbContext.setRollbackOnly();
//qq ver                throw new InvalidEditException(errorMsg);
            }
            Common.close(ps);
        } catch (SQLException e) {
            ejbContext.setRollbackOnly();
// qq ver            throw new InvalidEditException("SQL Exception: " + e.getMessage());

        } finally {
            Common.close(conn, ps, rs);
        }
*/
        return 5L;
    }

    public void createNotification(String event, long userId, long typeId) {
        info("Notification.createNotification for event " + event + ", user "+ userId + " with type " + typeId);
    }

    public void notifyEvent(String event, Properties prop) {
        info("Notification.notifyEvent " + event + " with properties " + prop);

        XMLDocument xmlDocument = new XMLDocument("MAILDATA");

        for (Iterator it = prop.entrySet().iterator(); it.hasNext();) {
            Map.Entry entry = (Map.Entry) it.next();
            xmlDocument.addTag(new ValueTag((String) entry.getKey(), (String) entry.getValue()));
            info(((String) entry.getKey())+"="+((String) entry.getValue()));
        }


        String filenameXSL = ConfigHelper.getMailTemplatePath() + "forum_post_notification.xsl"; //qq
        info ("filenameXSL=" +filenameXSL);

        String bodyText = formatBody(xmlDocument, filenameXSL);
        info("body text: " + bodyText);
        sendMail("notification@gmail.com", "amarcu@gmail.com", "subject", bodyText);
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
     * This method is required by the EJB Specification. Used to get the context ... for dynamic connection pools.
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
