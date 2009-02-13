package com.topcoder.web.tc.controller.legacy.pacts.messaging.request;

/**
 * QueueRequest.java
 *
 * Created on October 24, 2001, 8:43 PM
 */

import com.topcoder.shared.messaging.QueueMessageReceiver;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.legacy.pacts.messaging.handler.MessageHandler;
import com.topcoder.web.tc.controller.legacy.pacts.messaging.handler.MessageHandlerFactory;

import javax.jms.ObjectMessage;
import javax.naming.InitialContext;

/**
 ********************************************************************************
 * The QueueRequest class is responsible for managing the queue services of a
 * specific type. After handling the request, the queue thread then goes back to
 * monitoring the queue.
 *
 * @author Alex Roman
 * @version v1.0
 ********************************************************************************
 */
public class QueueRequest {

    private static Logger log = Logger.getLogger(QueueRequest.class);
    //private static final long EXPIRED_TIME = 10000;
    //private static final long MAIN_WAIT = 200;
    private String queueType = "";
    private boolean active = true;
    private QueueMessageReceiver qmr = null;
    private MessageHandler mh = null;

    /**
     * The queue constructor initializes a receiver to pick up messages off
     * of the queue.
     *
     * @param queueType       Name of the queue to listen on.
     */
    public QueueRequest(String queueType) throws Exception {
        this.queueType = queueType;

        mh = MessageHandlerFactory.getMessageHandler(queueType);

        init(); // initialize the queue
    }

    /**
     * The init method is called from the constructor, and also when the application
     * server connection is lost and a new connection needs to be established.
     */
    private void init() {
        boolean successfull = false;
        try {
            //InitialContext ctx = TCContext.getInitial("172.16.210.55:1100");
            InitialContext ctx = TCContext.getInitial();
            // keep trying to initialize the queue until it starts
            while (!successfull) {
                try {


                    this.qmr = new QueueMessageReceiver(ApplicationServer.JMS_FACTORY, this.queueType, ctx);
                    this.qmr.setAutoCommit(true);
                    this.qmr.setTransacted(false);
                    this.qmr.setFaultTolerant(false);
                    log.debug("PACTS message receiver initialized...");
                    successfull = true;
                } catch (Exception e) {
                    e.printStackTrace();
                    log.error("ERROR: Could not initialize JMS... trying again.");
                    try {
                        Thread.sleep(2000);
                    } catch (InterruptedException e1) {
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * This method reads and processes messages off the initialized queue while
     * the queue reader is still active. If any problem arise, the queue reader
     * is deactivated and the process exits.
     */
    public void listen() {
        try {

            // Continuously block on the message queue
            while (isActive()) {
                ObjectMessage msg = null;

                log.debug("QueueReader is waiting for messages...");
                try {
                    msg = qmr.getMessage(1000);
                } catch (Exception e) {
                    log.error("ERROR: Error retreiving next message.");
                    init();                               // try reinitializing the queue
                    e.printStackTrace();
                }

                if (msg != null) {
                    log.info("QueueReader got message.");

                    boolean success = false;

                    try {
                        success = processMessage(msg);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    if (!success) {
                        deactivate();
                    }
                }
            }

        } catch (Exception e) {
            log.error("ERROR PROCESSING MESSAGES FROM THE '" + this.queueType + "'...KILLING QUEUE READER");
        } finally {
            deactivate();
            close();    // clean up
        }
    }

    /**
     * processMessage extracts the submission object from the recovered message.
     * Testing is next attempted. Once finished relevant data is written to
     * the database. On completion, a success/failure status is returned.
     *
     * @return boolean        compile status (true/false)
     */
    private boolean processMessage(ObjectMessage msg) {
        return mh.processMessage(msg);
    }

    /**
     * Close the connection to the Queue
     */
    public void close() {
        try {
            this.qmr.deactivate();
            this.qmr.close();
        } catch (Exception e) {
            log.error("WARNING:  Could not close the queue.");
            e.printStackTrace();
        }
    }

    /**
     * This method deactivates the queue reader process, there by destroying it.
     */
    private void deactivate() {
        this.active = false;
    }

    /**
     * This method returns the status pertaining to the activity of the queue reader.
     *
     * @return boolean      The active status of the reader
     */
    private boolean isActive() {
        return this.active;
    }

    /**
     * The main function is used launch the queue reader thread.
     *
     * @params args[0]      Queue type to initialize
     */
    public static void main(String args[]) throws Exception {
        if (args.length != 1) {
            System.out.println("USAGE: java services.message.QueueRequest 'queue'");
            System.exit(1);
        }

        // retrieve parameters
        String queueType = args[0];

        QueueRequest qreader = new QueueRequest(queueType);
        qreader.listen();       // start processing messages off the queue
        System.exit(1);         // This is to kill any hung threads
    }
}
