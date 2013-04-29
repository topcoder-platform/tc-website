/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.forums.replyto.ejb;

import java.io.StringWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.ejb.MessageDrivenBean;
import javax.ejb.MessageDrivenContext;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.MessageListener;

import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;

import com.jivesoftware.base.AuthToken;
import com.jivesoftware.base.JiveGlobals;
import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.base.UserManagerFactory;
import com.jivesoftware.base.UserNotFoundException;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.ForumFactory;
import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.ForumMessageNotFoundException;
import com.jivesoftware.forum.ForumThread;
import com.jivesoftware.forum.MessageRejectedException;
import com.jivesoftware.util.EmailTask;
import com.topcoder.forums.replyto.model.ForumReplyToIdentifier;
import com.topcoder.forums.replyto.util.ForumReplyToIdentifierUtil;
import com.topcoder.forums.replyto.util.UserUtil;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.model.User;

/**
 * This is the Message Driven Bean to process JMS messages which contain
 * forum reply email messages sent from TopCoder members.
 *
 * @author flexme
 * @version 1.0
 * @since Module Assembly - TC Forums Reply To Email Feature
 */
@SuppressWarnings({"rawtypes", "unchecked"})
public class ForumReplyMessageBean implements MessageDrivenBean, MessageListener {
    /**
     * Represents the serial version unique id.
     */
    private static final long serialVersionUID = -3509783490785121235L;

    /**
     * Represents the logger.
     */
    private static final Logger LOGGER = Logger.getLogger(ForumReplyMessageBean.class);

    /**
     * Represents the JIVE property key of "From Name" when sending email.
     */
    private static final String JIVE_EMAIL_FROM_NAME_KEY = "watches.replyTo.email.fromName";

    /**
     * Represents the JIVE property key of "From Email" when sending email.
     */
    private static final String JIVE_EMAIL_FROM_EMAIL_KEY = "watches.replyTo.email.fromEmail";

    /**
     * Represents the JIVE property key of the email subject when the user is unknown.
     */
    private static final String JIVE_EMAIL_UNKOWN_USER_SUBJECT_KEY = "watches.replyTo.email.unknownUser.subject";

    /**
     * Represents the JIVE property key of the email body when the user is unknown.
     */
    private static final String JIVE_EMAIL_UNKOWN_USER_BODY_KEY = "watches.replyTo.email.unknownUser.body";

    /**
     * Represents the JIVE property key of the email subject when the identifier is invalid.
     */
    private static final String JIVE_EMAIL_INVALID_ID_SUBJECT_KEY = "watches.replyTo.email.invalidIdentifier.subject";

    /**
     * Represents the JIVE property key of the email body when the identifier is invalid.
     */
    private static final String JIVE_EMAIL_INVALID_ID_SUBJECT_BODY = "watches.replyTo.email.invalidIdentifier.body";

    /**
     * The pattern to search "On|At xxx wrote:" in multi lines.
     */
    private static final Pattern ON_WROTE_PATTERN_GLOBAL = Pattern.compile("^\\s*((On|At)\\s(.+)wrote:(\\s*))$",
            Pattern.MULTILINE | Pattern.DOTALL | Pattern.CASE_INSENSITIVE);

    /**
     * The pattern to search "On|At xxx wrote:" in a single line.
     */
    private static final Pattern ON_WROTE_PATTERN = Pattern.compile("^\\s*((On|At)\\s(.+)wrote:(\\s*))$",
            Pattern.CASE_INSENSITIVE);

    /**
     * The pattern to search "From:xxx" in a single line.
     */
    private static final Pattern FROM_PATTERN = Pattern.compile("^From(\\s*):(.+)$", Pattern.CASE_INSENSITIVE);

    /**
     * The pattern to search "To:xxx" in a single line.
     */
    private static final Pattern TO_PATTERN = Pattern.compile("^To(\\s*):(.+)$", Pattern.CASE_INSENSITIVE);

    /**
     * The pattern to search "----Original---" or "---Original Message----" in a single line.
     */
    private static final Pattern ORIGINAL_PATTERN = Pattern.compile("^\\s*\\-+\\s*Original\\s*(Message)?\\s*\\-+\\s*$",
            Pattern.CASE_INSENSITIVE);

    /**
     * The patterns to used to match the auto-reply email content.
     */
    private static final Pattern[] AUTO_REPLY_PATTERNS = new Pattern[]{
            Pattern.compile("\\bout\\s+of\\s+(the)?\\s*\\boffice\\b", Pattern.CASE_INSENSITIVE),
            Pattern.compile("\\bautoreply\\b", Pattern.CASE_INSENSITIVE),
            Pattern.compile("\\bauto\\-reply\\b", Pattern.CASE_INSENSITIVE),
            Pattern.compile("\\bauto\\s+reply\\b", Pattern.CASE_INSENSITIVE)
    };

    /**
     * Empty constructor.
     */
    public ForumReplyMessageBean() {
    }

    /**
     * Filter the message body content. Remove the quote content and auto reply content.
     *
     * @param content the original message body content.
     * @param authorEmail the author's email.
     * @return the filtered content.
     */
    private static String filterMessageBodyText(String subject, String content, String authorEmail) {
        content = content.replace("\r\n", "\n");

        for (Pattern pattern : AUTO_REPLY_PATTERNS) {
            if (pattern.matcher(subject).find()) {
                return "";
            }
            if (pattern.matcher(content).find()) {
                return "";
            }
        }

        Matcher matcher = ON_WROTE_PATTERN_GLOBAL.matcher(content);
        authorEmail = authorEmail.toLowerCase();
        if (matcher.find()) {
            content = content.replace(matcher.group(0), matcher.group(0).replace("\n", ""));
        }

        String[] lines = content.split("\n");
        StringBuffer sb = new StringBuffer();
        for (String line : lines) {
            if (ON_WROTE_PATTERN.matcher(line).matches()) {
                break;
            }
            if (ORIGINAL_PATTERN.matcher(line).matches()) {
                break;
            }
            String lowerLine = line.toLowerCase();
            if (lowerLine.contains(authorEmail)) {
                break;
            }
            if (FROM_PATTERN.matcher(line).matches()) {
                break;
            }
            if (TO_PATTERN.matcher(line).matches()) {
                break;
            }
            sb.append(line).append("\n");
        }
        return sb.toString();
    }

    /**
     * Processes JMS messages which contain forum reply email messages.
     * 
     * @param message the JMS message.
     */
    public void onMessage(Message message) {
        LOGGER.info("Process a JMS message");
        try {
            if (message instanceof MapMessage) {
                // Cast to MapMessage
                MapMessage mm = (MapMessage) message;
                
                String recipient =  mm.getString("recipient");
                LOGGER.info("recipient:" + recipient);
                String identifier = recipient.substring(0, recipient.indexOf("@"));
                
                String fromUser = JiveGlobals.getJiveProperty(JIVE_EMAIL_FROM_NAME_KEY);
                String fromEmail = JiveGlobals.getJiveProperty(JIVE_EMAIL_FROM_EMAIL_KEY);
                String toEmail = mm.getString("sender");
                LOGGER.info("sender:" + toEmail);
                
                EmailTask emailTask = new EmailTask();
                Map context = new HashMap();
                context.put("email", toEmail);
                context.put("replyToIdentifier", identifier);
    
                // Check if the user exists
                List<User> users = UserUtil.getUsersByEmail(toEmail);
                if (users.isEmpty()) {
                    // No such user, send email
                    LOGGER.info("Invalid email address:" + toEmail);
                    addEmail(emailTask, JIVE_EMAIL_UNKOWN_USER_SUBJECT_KEY, JIVE_EMAIL_UNKOWN_USER_BODY_KEY,
                            "Anonymous", toEmail, fromUser, fromEmail, context);
                } else {
                    User user = (User) users.get(0);
                    String toUser = user.getHandle();
                    context.put("username", toUser);
                    LOGGER.info("username:" + toUser);
                    // Get the ForumReplyToIdentifier
                    ForumReplyToIdentifier replyToIdentifier = ForumReplyToIdentifierUtil.getByIdentifier(identifier);
                    if (replyToIdentifier == null || replyToIdentifier.getUserId() != user.getId()) {
                        // Invalid identifier, send email
                        LOGGER.info("Invalid identifier:" + identifier);
                        addEmail(emailTask, JIVE_EMAIL_INVALID_ID_SUBJECT_KEY, JIVE_EMAIL_INVALID_ID_SUBJECT_BODY,
                                toUser, toEmail, fromUser, fromEmail, context);
                    } else {
                        LOGGER.info("post the forum reply, userId:" + replyToIdentifier.getUserId()
                                + ", messagseId:" + replyToIdentifier.getMessageId());
                        // Post the reply
                        ForumFactory forumFactory = ForumFactory.getInstance(
                                new TCAuthToken(replyToIdentifier.getUserId()));
                        com.jivesoftware.base.User forumUser = forumFactory.getUserManager().getUser(replyToIdentifier.getUserId());
                        try {
                            ForumMessage messageToReply = forumFactory.getMessage(replyToIdentifier.getMessageId());
                            ForumThread forumThread = messageToReply.getForumThread();
                            ForumMessage newMessage = messageToReply.getForum().createMessage(
                                    UserManagerFactory.getInstance().getUser(replyToIdentifier.getUserId()));
                            String subject = mm.getString("subject");
                            String content = filterMessageBodyText(subject, mm.getString("content"), toEmail);
                            if (content.trim().length() == 0) {
                                LOGGER.info("Ignore this email");
                                return;
                            }
                            newMessage.setSubject(subject);
                            newMessage.setBody(content);
                            forumThread.addMessage(messageToReply, newMessage);
                            // Note that there's no need to create watch
                            // here because the user has already had this thread in watch list
                            
                            ForumFactory masterFactory = ForumFactory.getInstance(new TCAuthToken(100129));
                            ForumCategory category = masterFactory.getForumCategory(
                                    forumThread.getForum().getForumCategory().getID());
                            while (category != null) {
                                category.setModificationDate(forumThread.getModificationDate());
                                category = category.getParentCategory();
                            }
                            
                            forumFactory.getReadTracker().markRead(forumUser, newMessage);
                        } catch (UnauthorizedException e) {
                            // Unauthorized to the thread, send email
                            addEmail(emailTask, JIVE_EMAIL_INVALID_ID_SUBJECT_KEY, JIVE_EMAIL_INVALID_ID_SUBJECT_BODY,
                                    toUser, toEmail, fromUser, fromEmail, context);
                        } catch (MessageRejectedException e) {
                            // can't add message, send email
                            addEmail(emailTask, JIVE_EMAIL_INVALID_ID_SUBJECT_KEY, JIVE_EMAIL_INVALID_ID_SUBJECT_BODY,
                                    toUser, toEmail, fromUser, fromEmail, context);
                        } catch (ForumMessageNotFoundException e) {
                            // can't find the forum message, send email
                            addEmail(emailTask, JIVE_EMAIL_INVALID_ID_SUBJECT_KEY, JIVE_EMAIL_INVALID_ID_SUBJECT_BODY,
                                    toUser, toEmail, fromUser, fromEmail, context);
                        } catch (UserNotFoundException e) {
                            // can't find the user, send email
                            addEmail(emailTask, JIVE_EMAIL_INVALID_ID_SUBJECT_KEY, JIVE_EMAIL_INVALID_ID_SUBJECT_BODY,
                                    toUser, toEmail, fromUser, fromEmail, context);
                        }
                    }
                }
                emailTask.run();
            } else {
                LOGGER.error("A wrong type of message was received from the forum replyTo JMS queue");
            }
        } catch (Exception e) {
            LOGGER.error("Error occurs when processing the message from forum replyTo JMS queue", e);
        }
    }

    /**
     * Adds an email to <code>EmailTask</code>.
     * 
     * @param emailTask the <code>EmailTask</code> instance.
     * @param subjectKey the JIVE property key representing the email subject.
     * @param bodyKey the JIVE property key representing the email body.
     * @param toUser the user name to send to.
     * @param toEmail the email to send to.
     * @param fromUser the from user name.
     * @param fromEmail the from email address.
     * @param context the context.
     * @throws Exception if any error occurs.
     */
    private static void addEmail(EmailTask emailTask, String subjectKey, String bodyKey,
            String toUser, String toEmail, String fromUser, String fromEmail, Map context) throws Exception {
        String subject = replaceTokens(JiveGlobals.getJiveProperty(subjectKey), context);
        String body = replaceTokens(JiveGlobals.getJiveProperty(bodyKey), context);
        emailTask.addMessage(toUser, toEmail, fromUser, fromEmail, subject, body, null);
    }

    /**
     * Uses Velocity Engine to replace tokens in the string with the context.
     *
     * @param string the string.
     * @param context the context.
     * @return the string in which the tokens have been replaced.
     * @throws Exception if any error occurs.
     */
    private static String replaceTokens(String string, Map context) throws Exception {
        VelocityEngine ve = new VelocityEngine();
        ve.init();
        VelocityContext velContext = new VelocityContext(context);
        Writer sw = new StringWriter();
        ve.evaluate(velContext, sw, ForumReplyMessageBean.class.getName(), string);
        return sw.toString();
    }

    /**
     * This is a simple implementation of Jive's AuthToken interface with user ID passed directly.
     *
     * @author TCSASSEMBER
     * @version 1.0
     */
    private static class TCAuthToken implements AuthToken {
        /**
         * Represents the user id.
         */
        private final long userId;

        /**
         * Constructor with the user id.
         *
         * @param userId the user id.
         */
        public TCAuthToken(long userId) {
            this.userId = userId;
        }

        /**
         * Gets the user id.
         * 
         * @return the user id.
         */
        public long getUserID() {
            return userId;
        }

        /**
         * Whether the user is anonymous.
         * 
         * @return always false.
         */
        public boolean isAnonymous() {
            return false;
        }
    }

    /**
     * This method will be called when the EJB instance is to be created.
     */
    public void ejbCreate()
    {
        LOGGER.info("ForumReplyMessageBean.ejbCreate, this=" + hashCode());
    }

    /**
     * This method will be called when the EJB instance is to be removed.
     */
    public void ejbRemove() {
        LOGGER.info("ForumReplyMessageBean.ejbRemove, this=" + hashCode());
    }

    /**
     * Sets the <code>MessageDrivenContext</code> instance.
     * 
     * @param ctx the <code>MessageDrivenContext</code> instance.
     */
    public void setMessageDrivenContext(MessageDrivenContext ctx) {
    }
}
