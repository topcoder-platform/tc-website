/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.forums.replyto.job;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Hashtable;
import java.util.Properties;

import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Queue;
import javax.jms.QueueConnection;
import javax.jms.QueueConnectionFactory;
import javax.jms.QueueSender;
import javax.jms.QueueSession;
import javax.mail.BodyPart;
import javax.mail.Flags.Flag;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Store;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.file.fieldconfig.NodeList;
import com.topcoder.util.scheduler.scheduling.ScheduledEnable;


/**
 * <p>
 * This is the job to retrieve forum reply emails via POP3 protocol and put the emails to a configured JMS queue.
 * All retrieved emails are deleted then.
 * </p>
 * <p>
 * This job reads its configuration parameters from a properties file. Here are the configuration parameters for
 * this job:
 * </p>
 * <table border="1" cellspacing="2" cellpadding="3">
 * <tr>
 * <th>Name</th>
 * <th>Description</th>
 * <th>Value</th>
 * </tr>
 * <tr>
 * <td>mail.host</td>
 * <td>The email server host.</td>
 * <td>Non-null, non-empty string. Required.</td>
 * </tr>
 * <tr>
 * <td>mail.username</td>
 * <td>The email user name for the catch-all alias user.</td>
 * <td>Non-null, non-empty string. Required.</td>
 * </tr>
 * <tr>
 * <td>mail.password</td>
 * <td>The email password for the catch-all alias user.</td>
 * <td>Non-null, non-empty string. Required.</td>
 * </tr>
 * <tr>
 * <td>jndi.initial_context_factory_class</td>
 * <td>The JNDI initial context factory class name.</td>
 * <td>Non-null, non-empty string. Required.</td>
 * </tr>
 * <tr>
 * <td>jndi.provider_url</td>
 * <td>The JNDI provider URL.</td>
 * <td>Non-null, non-empty string. Required.</td>
 * </tr>
 * <tr>
 * <td>jms.connection_factory.jndi_name</td>
 * <td>The JMS connection factory JNDI lookup name.</td>
 * <td>Non-null, non-empty string. Required.</td>
 * </tr>
 * <tr>
 * <td>jms.queue.jndi_name</td>
 * <td>The JMS queue JNDI lookup name.</td>
 * <td>Non-null, non-empty string. Required.</td>
 * </tr>
 * </table>
 * <p>
 * <b>Sample configuration file:</b>
 *
 * <pre>
 * mail.host=localhost
 * mail.username=user
 * mail.password=password
 * jndi.initial_context_factory_class=org.apache.activemq.jndi.ActiveMQInitialContextFactory
 * jndi.provider_url=vm://localhost?broker.persistent=false
 * jms.connection_factory.jndi_name=jms_connection
 * jms.queue.jndi_name=jms_queue
 * </pre>
 *
 * </p>
 * <p>
 * <code>ForumReplyEmailRetrievalJob</code> reads configuration values from provided file in its constructor. It
 * does not have a no argument constructor so the <code>JobType.JOB_TYPE_JAVA_CLASS</code> cannot be used for
 * configured job.
 * </p>
 * <p>
 * <code>JobType.JOB_TYPE_SCHEDULED_ENABLE_OBJECT_NAMESPACE</code> can be used to pass the configuration file path
 * to the job in <code>ObjectFactory</code> configuration as following:<br/>
 * <code>SampleConfig.xml</code>
 *
 * <pre>
 * &lt;?xml version="1.0" encoding="UTF-8"?&gt;
 * &lt;CMConfig&gt;
 *     &lt;Config name="com.topcoder.util.scheduler.scheduling.job"&gt;
 *         &lt;Property name="ObjectFactoryNamespace"&gt;
 *             &lt;Value&gt;com.topcoder.util.objectfactory&lt;/Value&gt;
 *         &lt;/Property&gt;
 *         &lt;Property name="ScheduledEnableObjectKey"&gt;
 *             &lt;Value&gt;myJob&lt;/Value&gt;
 *         &lt;/Property&gt;
 *     &lt;/Config&gt;
 *     &lt;Config name="com.topcoder.util.objectfactory"&gt;
 *         &lt;Property name="myJob"&gt;
 *             &lt;Property name="type"&gt;
 *                 &lt;Value&gt;com.topcoder.forums.replyto.job.ForumReplyEmailRetrievalJob&lt;/Value&gt;
 *             &lt;/Property&gt;
 *             &lt;Property name="params"&gt;
 *                 &lt;Property name="param1"&gt;
 *                     &lt;Property name="type"&gt;
 *                         &lt;Value&gt;String&lt;/Value&gt;
 *                     &lt;/Property&gt;
 *                     &lt;Property name="value"&gt;
 *                         &lt;Value&gt;test_files/config.properties&lt;/Value&gt;
 *                     &lt;/Property&gt;
 *                 &lt;/Property&gt;
 *             &lt;/Property&gt;
 *         &lt;/Property&gt;
 *     &lt;/Config&gt;
 * &lt;/CMConfig&gt;
 *
 * </pre>
 *
 * </p>
 * <p>
 * <b>Sample usage:</b>
 *
 * <pre>
 * ConfigManager cm = ConfigManager.getInstance();
 * cm.add(&quot;SampleConfig.xml&quot;);
 *
 * Job job =
 *     new Job(&quot;forumReplyEmailRetrievalJob&quot;, JobType.JOB_TYPE_SCHEDULED_ENABLE_OBJECT_NAMESPACE,
 *         &quot;com.topcoder.util.scheduler.scheduling.job&quot;);
 *
 * Connection connection = null;
 * javax.jms.Session jmsSession = null;
 * try {
 *     // connect
 *     connection = ... // create from JMS ConnectionFactory
 *     connection.start();
 *
 *     jmsSession = connection.createSession(false, javax.jms.Session.AUTO_ACKNOWLEDGE);
 *     Queue queue = jmsSession.createQueue(&quot;TestQueue&quot;);
 *
 *     // create consumer to read from queue
 *     MessageConsumer consumer = jmsSession.createConsumer(queue);
 *
 *     consumer.setMessageListener(new MessageListener() {
 *         public void onMessage(javax.jms.Message msg) {
 *             MapMessage mapMessage = (MapMessage) msg;
 *             System.out.println(&quot;----- Message -----&quot;);
 *             try {
 *                 System.out.println(&quot;SENDER: &quot; + mapMessage.getString(&quot;sender&quot;));
 *                 System.out.println(&quot;RECIPIENT: &quot; + mapMessage.getString(&quot;recipient&quot;));
 *                 System.out.println(&quot;CONTENT: &quot; + mapMessage.getString(&quot;content&quot;));
 *             } catch (JMSException e) {
 *                 // ignored
 *             }
 *         }
 *     });
 *
 *     // start the job
 *     job.start();
 *
 *     Thread.sleep(1000);
 *
 *     job.stop();
 * } finally {
 *     if (connection != null) {
 *         try {
 *             connection.close();
 *         } catch (JMSException e) {
 *             // ignored
 *         }
 *     }
 * }
 * </pre>
 *
 * </p>
 * <p>
 * <b>Thread Safety:</b> This class is not thread safe as it is mutable, however it will never be used by multiple
 * threads as per Job Scheduling component.
 * </p>
 *
 * @author albertwang, TCSDEVELOPER, flexme
 * @version 1.0
 * @since Module Assembly - TC Forums Reply To Email Feature
 */
public class ForumReplyEmailRetrievalJob implements ScheduledEnable {
    /**
     * <p>
     * Represents the name of inbox folder to retrieve email messages from.
     * </p>
     */
    private static final String INBOX_FOLDER = "INBOX";

    /**
     * <p>
     * Represents the mail protocol used to retrieve email messages.
     * </p>
     */
    private static final String PROTOCOL = "pop3";

    /**
     * <p>
     * Represents the logger used to perform logging.
     * </p>
     * <p>
     * It will be initialized in place as a non-null Logger and won't change afterwards.
     * </p>
     */
    private static final Logger LOGGER = Logger.getLogger(ForumReplyEmailRetrievalJob.class);

    /**
     * <p>
     * Represents the signature of run() method.
     * </p>
     */
    private static final String RUN_SIGNATURE = ForumReplyEmailRetrievalJob.class.getName() + "#run()";

    /**
     * <p>
     * Represents the email server host.
     * </p>
     * <p>
     * It cannot be null or empty. It will be initialized in constructor and won't change afterwards.
     * </p>
     */
    private final String mailServerHost;

    /**
     * <p>
     * Represents the email user name for the catch-all alias user.
     * </p>
     * <p>
     * It cannot be null or empty. It will be initialized in constructor and won't change afterwards.
     * </p>
     */
    private final String mailUsername;

    /**
     * <p>
     * Represents the email password for the catch-all alias user.
     * </p>
     * <p>
     * It cannot be null or empty. It will be initialized in constructor and won't change afterwards.
     * </p>
     */
    private final String mailPassword;

    /**
     * <p>
     * Represents the JNDI initial context factory class name.
     * </p>
     * <p>
     * It cannot be null or empty. It will be initialized in constructor and won't change afterwards.
     * </p>
     */
    private final String jndiInitialContextFactoryClass;

    /**
     * <p>
     * Represents the JNDI provider URL.
     * </p>
     * <p>
     * It cannot be null or empty. It will be initialized in constructor and won't change afterwards.
     * </p>
     */
    private final String jndiProviderUrl;

    /**
     * <p>
     * Represents the JMS connection factory JNDI lookup name.
     * </p>
     * <p>
     * It cannot be null or empty. It will be initialized in constructor and won't change afterwards.
     * </p>
     */
    private final String jmsConnectionFactoryJNDIName;

    /**
     * <p>
     * Represents the JMS queue JNDI lookup name.
     * </p>
     * <p>
     * It cannot be null or empty. It will be initialized in constructor and won't change afterwards.
     * </p>
     */
    private final String jmsQueueJNDIName;

    /**
     * <p>
     * The job status.
     * </p>
     * <p>
     * It cannot be null or empty.
     * </p>
     */
    private String status = ScheduledEnable.NOT_STARTED;

    /**
     * <p>
     * The job name.
     * </p>
     * <p>
     * Can be null and can be empty. This value is mutable and is managed using the getter and setter.
     * </p>
     */
    private String jobName;

    /**
     * <p>
     * Creates a new instance of <code>ForumReplyEmailRetrievalJob</code> with values from specified configuration
     * file.
     * </p>
     *
     * @param propertiesFile
     *            the configuration properties file path
     * @throws IllegalArgumentException
     *             if <code>propertiesFile</code> is <code>null</code>/empty
     * @throws ConfigurationException
     *             if there's any configuration error while reading the file, or if any required property is
     *             missing, or if any property is empty
     */
    public ForumReplyEmailRetrievalJob(String propertiesFile) {
        if (propertiesFile == null || propertiesFile.trim().length() == 0) {
            throw new IllegalArgumentException("propertiesFile should not be null or empty");
        }

        // loads the configuration file into properties object
        Properties config = loadProperties(propertiesFile);

        // reads the configuration values into the respective fields
        mailServerHost = getProperty(config, "mail.host");
        mailUsername = getProperty(config, "mail.username");
        mailPassword = getProperty(config, "mail.password");

        jndiInitialContextFactoryClass = getProperty(config, "jndi.initial_context_factory_class");
        jndiProviderUrl = getProperty(config, "jndi.provider_url");

        jmsConnectionFactoryJNDIName = getProperty(config, "jms.connection_factory.jndi_name");
        jmsQueueJNDIName = getProperty(config, "jms.queue.jndi_name");
    }

    /**
     * <p>
     * Loads properties list in the specified file path.
     * </p>
     *
     * @param configFile
     *            the configuration file path
     * @return loaded properties
     * @throws ConfigurationException
     *             if any error occurs while loading properties
     */
    private static Properties loadProperties(String configFile) {
        Properties config = new Properties();
        InputStream inStream = null;
        try {
            inStream = new BufferedInputStream(new FileInputStream(configFile));
            config.load(inStream);
        } catch (IllegalArgumentException e) {
            throw new ConfigurationException(configFile + " contains malformed Unicode escape sequence", e);
        } catch (SecurityException e) {
            throw new ConfigurationException("Security error occurs while loading properties from " + configFile,
                e);
        } catch (IOException e) {
            throw new ConfigurationException("An I/O error occurs while loading properties from " + configFile, e);
        } finally {
            if (inStream != null) {
                try {
                    inStream.close();
                } catch (IOException e) {
                    // quietly dropped
                }
            }
        }
        return config;
    }

    /**
     * <p>
     * Gets a value specified by property key from given configuration.
     * </p>
     *
     * @param config
     *            the properties to get the property value from
     * @param key
     *            the property key
     * @return property value
     * @throws ConfigurationException
     *             if required property is not found, or if property value is empty
     */
    private static String getProperty(Properties config, String key) {
        String value = config.getProperty(key);

        if (value == null) {
            throw new ConfigurationException("Missing required property '" + key + "'");
        }

        if (value.trim().length() == 0) {
            throw new ConfigurationException("The property '" + key + "' should not be empty");
        }

        return value;
    }

    /**
     * <p>
     * Executes the job. It retrieves all email messages found in INBOX folder via POP3 protocol. Then for each
     * email message, it puts the email message sender, recipient and body text to pre-configured JMS queue. All
     * emails are deleted from INBOX after being processed.
     * </p>
     */
    public void run() {
        LOGGER.debug("[Entering method {" + RUN_SIGNATURE + "}]");
        status = ScheduledEnable.RUNNING;

        Store mailStore = null;
        Folder inboxFolder = null;

        Session mailSession = Session.getDefaultInstance(new Properties(), null);

        try {
            // Setup email access
            mailStore = mailSession.getStore(PROTOCOL);
            mailStore.connect(mailServerHost, mailUsername, mailPassword);

            inboxFolder = mailStore.getFolder(INBOX_FOLDER);
            inboxFolder.open(Folder.READ_WRITE);

            // Retrieve all messages from INBOX folder
            Message[] messages = inboxFolder.getMessages();

            // queue messages to the JMS
            queueMessages(messages);
        } catch (IllegalStateException e) {
            logError("An illegal state has occurred when retrieving email messages", e);
        } catch (MessagingException e) {
            logError("Fails to read email messages from server", e);
        } finally {
            closeMailResources(inboxFolder, mailStore);
        }

        status = ScheduledEnable.SUCCESSFUL;
        LOGGER.debug("[Exiting method {" + RUN_SIGNATURE + "}]");
    }

    /**
     * <p>
     * For each email message, it puts the email message sender, recipient and content as a map message to the JMS
     * queue.
     * </p>
     *
     * @param messages
     *            an array of email messages
     * @throws MessagingException
     *             if any error occurs while reading email sender, recipient or content
     */
    private void queueMessages(Message[] messages) throws MessagingException {
        QueueConnection connection = null;
        QueueSession session = null;
        QueueSender sender = null;
        try {
            // Setup JMS, lookup the JMS connection factory and JMS queue by JNDI name
            Context ctx = createJMSContext();
            QueueConnectionFactory connectionFactory =
                (QueueConnectionFactory) ctx.lookup(jmsConnectionFactoryJNDIName);
            Queue queue = (Queue) ctx.lookup(jmsQueueJNDIName);

            // create connection to queue
            connection = connectionFactory.createQueueConnection();
            connection.start();

            // create queue session
            session = connection.createQueueSession(false, QueueSession.AUTO_ACKNOWLEDGE);

            // create queue sender
            sender = session.createSender(queue);

            for (Message message : messages) {
                // Put to JMS queue
                MapMessage mapMessage = session.createMapMessage();

                // get the first from and to
                mapMessage.setString("sender", ((InternetAddress) message.getFrom()[0]).getAddress());
                InternetAddress recipient = (InternetAddress) message.getRecipients(RecipientType.TO)[0];
                mapMessage.setString("recipient", recipient.getAddress());

                String subject = message.getSubject();
                mapMessage.setString("subject", subject);
                // get the body text
                String body = getMessageBodyText(message);
                mapMessage.setString("content", body);

                // send the message to the queue
                sender.send(mapMessage);

                // Mark message as deleted
                message.setFlag(Flag.DELETED, true);
            }
        } catch (NamingException e) {
            logError("Fails to look up JMS resources by JNDI name", e);
        } catch (ClassCastException e) {
            logError("Incorrect object type is provided by JNDI name", e);
        } catch (JMSException e) {
            logError("An error has occurred while dealing with JMS", e);
        } catch (IOException e) {
            logError("An I/O error has occurred while reading the email content", e);
        } finally {
            closeJMSResources(sender, session, connection);
        }
    }

    /**
     * <p>
     * Closes the given mail folder and mail store. The mail folder is expunged when it is closed.
     * </p>
     *
     * @param folder
     *            the folder to close
     * @param mailStore
     *            the store to close
     */
    private static void closeMailResources(Folder folder, Store mailStore) {
        // Close mail folder and store
        if (folder != null && folder.isOpen()) {
            try {
                // close the folder
                // and expunge the messages marked as deleted
                folder.close(true);
            } catch (MessagingException e) {
                logError("Fails to close a mail folder", e);
            }
        }

        if (mailStore != null && mailStore.isConnected()) {
            try {
                mailStore.close();
            } catch (MessagingException e) {
                logError("Fails to close the email store", e);
            }
        }
    }

    /**
     * <p>
     * Closes the JMS queue sender, queue session and queue connection.
     * </p>
     *
     * @param sender
     *            the sender to close
     * @param session
     *            the session to close
     * @param connection
     *            the connection to close
     */
    private static void closeJMSResources(QueueSender sender, QueueSession session, QueueConnection connection) {
        if (sender != null) {
            // close the queue sender
            try {
                sender.close();
            } catch (JMSException e) {
                logError("Fails to close the JMS queue sender", e);
            }
        }

        if (session != null) {
            // close the queue session
            try {
                session.close();
            } catch (JMSException e) {
                logError("Fails to close the JMS queue session", e);
            }
        }

        if (connection != null) {
            // close the queue connection
            try {
                connection.close();
            } catch (JMSException e) {
                logError("Fails to close the JMS connection", e);
            }
        }
    }

    /**
     * <p>
     * Gets the body text of given message. If message's content is String (plain text) then it is returned as is.
     * If content is Multipart, then the body text is the first found body part. If content is not any of those
     * two, then the String representation of the content will be used.
     * </p>
     *
     * @param message
     *            the message to get its body text.
     * @return the body text
     * @throws IOException
     *             if an I/O error occurs while reading content
     * @throws MessagingException
     *             if any messaging error occurs while reading content
     */
    private static String getMessageBodyText(Message message) throws IOException, MessagingException {
        Object content = message.getContent();

        if (content instanceof String) {
            return (String) content;
        } else if (content instanceof Multipart) {
            return getMultipartBodyText((Multipart) content);
        }

        // the content is neither plain text nor multipart
        // simply get the string representation of the content
        return content.toString();
    }

    /**
     * <p>
     * Finds the first encountered body part with content type 'text/plain' and without filename as the body of
     * message.
     * </p>
     *
     * @param multipart
     *            the multipart to get its body text
     * @return the body text
     * @throws IOException
     *             if an I/O error occurs while reading the parts
     * @throws MessagingException
     *             if any messaging error occurs while reading the parts
     */
    private static String getMultipartBodyText(Multipart multipart) throws IOException, MessagingException {
        String body = null;

        int multipartCount = multipart.getCount();

        // for each part, check if it is an attachment or body content
        for (int i = 0; i < multipartCount; i++) {
            BodyPart part = multipart.getBodyPart(i);

            Object content = part.getContent();
            String partFileName = part.getFileName();

            // skip if the part is attachment
            if (partFileName != null) {
                continue;
            }

            if (content instanceof String && body == null) {
                // if body is already constructed before, then ignore any other bodies
                body = (String) content;
            } else if (part.isMimeType("multipart/alternative")) {
                // handle message that provides alternative body contents
                // Most commonly, multipart/alternative is used for email with two parts,
                // one plain text (text/plain) and one HTML (text/html).
                body = getMultipartBodyText((Multipart) content);
            }
        }

        return body;
    }

    /**
     * <p>
     * Creates a context to look up the JMS ConnectionFactory and JMS Queue by JNDI name.
     * </p>
     *
     * @return the context
     * @throws NamingException
     *             if any error occurs while looking up object
     */
    private Context createJMSContext() throws NamingException {
        Hashtable<String, String> env = new Hashtable<String, String>();
        env.put(Context.INITIAL_CONTEXT_FACTORY, jndiInitialContextFactoryClass);
        env.put(Context.PROVIDER_URL, jndiProviderUrl);

        return new InitialContext(env);
    }

    /**
     * <p>
     * Simply returns if the job is done.
     * </p>
     *
     * @return <code>true</code> if the job is done, <code>false</code> otherwise
     */
    public boolean isDone() {
        return (status.equals(ScheduledEnable.SUCCESSFUL) || status.equals(ScheduledEnable.FAILED));
    }

    /**
     * <p>
     * This is invoked by the Scheduler when the Scheduler is stopped. Nothing is done here. If the job is still
     * running, then it will let be run until it's finished. Since it's running in its own thread, nothing can be
     * done here so that there is no need to block the scheduler's thread.
     * </p>
     */
    public void close() {
        status = ScheduledEnable.SUCCESSFUL;
    }

    /**
     * <p>
     * Returns the status of this job whether it is already done or it is still running.
     * </p>
     *
     * @return the status.
     */
    public String getStatus() {
        return status;
    }

    /**
     * <p>
     * Returns the status of this job whether it is already done or it is still running.
     * </p>
     *
     * @return the status.
     */
    public String getRunningStatus() {
        return status;
    }

    /**
     * <p>
     * Returns the message data.
     * </p>
     *
     * @return message
     */
    public NodeList getMessageData() {
        return null;
    }

    /**
     * <p>
     * Returns the name of this job.
     * </p>
     *
     * @return the job's name
     */
    public String getJobName() {
        return jobName;
    }

    /**
     * <p>
     * Sets the name of this job.
     * </p>
     *
     * @param jobName
     *            the job's name
     */
    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    /**
     * <p>
     * Logs the given exception at error level.
     * </p>
     *
     * @param message
     *            the error message
     * @param error
     *            the exception to log
     */
    private static void logError(String message, Throwable error) {
        LOGGER.error("[Error in method {" + RUN_SIGNATURE + "}: Details {" + message + "}]", error);
    }
}
