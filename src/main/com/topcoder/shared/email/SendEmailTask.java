package com.topcoder.shared.email;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.ejb.EmailServices.*;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;
import org.w3c.dom.*;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.*;
import java.rmi.RemoteException;
import java.util.*;

/**
 * The SendEmailTask is responsible for building the list of email
 * destinations, creating the personalized emails, and passing the
 * final emails onto the EmailEngine for sending.
 *
 * SendEmailTask supports both static lists and dynamic lists.
 * Dynamic lists are built at run time by querying the database.
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 *  Log of Changes:
 *           $Log$
 *           Revision 1.3  2002/07/16 21:38:08  gpaul
 *           merging in sord email changes
 *
 *           Revision 1.1.2.24  2002/07/07 23:52:34  sord
 *           Added EmailReportTask.
 *           Split basic task functions into the base class EmailTask
 *
 *           Revision 1.1.2.23  2002/06/12 06:43:52  sord
 *           Added multiple scheduler feature that allows 2 or more schedulers to
 *           share the work of running tasks and provide redundant service.
 *
 *           Revision 1.1.2.22  2002/05/06 05:33:54  sord
 *           Added archiveDetail request when the job is complete.
 *
 *           Revision 1.1.2.21  2002/05/06 03:46:22  sord
 *           Changed logging message for sent mail.
 *
 *           Revision 1.1.2.20  2002/05/06 03:30:32  sord
 *           Moved all configuration stuff to EmailJobScheduler.
 *
 *           Revision 1.1.2.19  2002/05/06 03:00:54  sord
 *           Modified how the configuration is reloaded.
 *
 *           Revision 1.1.2.18  2002/05/06 02:36:18  sord
 *           Fixed compile error.
 *
 *           Revision 1.1.2.17  2002/05/06 02:34:40  sord
 *           Pass non-transactional DB handle to statistics bean (since it doesn't need it).
 *
 *           Revision 1.1.2.16  2002/05/06 01:59:48  sord
 *           Added configuration options for thread control and resource limits.
 *
 *           Revision 1.1.2.15  2002/05/03 09:07:01  sord
 *           Used jobType to determine if job detail records have been built.
 *
 *           Revision 1.1.2.14  2002/05/01 08:47:03  sord
 *           Fixed typo in error message.
 *
 *           Revision 1.1.2.13  2002/05/01 08:42:09  sord
 *           More error message formatting.
 *
 *           Revision 1.1.2.12  2002/05/01 08:06:43  sord
 *           Added more text to reason for failures.
 *
 *           Revision 1.1.2.11  2002/04/30 07:35:48  sord
 *           Implemented the commandId to list conversion.
 *
 *           Revision 1.1.2.10  2002/04/28 05:24:30  sord
 *           Changed command code for debugging purposes.
 *           Mark jobs that throw an exception as incomplete.
 *
 *           Revision 1.1.2.9  2002/04/28 03:22:35  sord
 *           Added commandId implementation.
 *           Mark jobs complete when they are.
 *
 *           Revision 1.1.2.8  2002/04/27 08:47:32  sord
 *           Fixed status of failed email messages.
 *
 *           Revision 1.1.2.7  2002/04/27 08:35:05  sord
 *           Fixes to parsing of memberXML data.
 *
 *           Revision 1.1.2.6  2002/04/27 07:42:49  sord
 *           Added printing of stack logs for debugging purposes.
 *
 *           Revision 1.1.2.5  2002/04/27 07:28:27  sord
 *           Added parsing of the member XML to get the email address to send to.
 *
 *           Revision 1.1.2.4  2002/04/25 08:41:04  sord
 *           Added additional functionallity.
 *
 *           Revision 1.1.2.3  2002/04/25 07:07:16  sord
 *           Implemented sending functionallity.
 *
 *           Revision 1.1.2.2  2002/04/25 05:59:54  sord
 *           Additional functionallity.
 *
 *           Revision 1.1.2.1  2002/04/25 04:54:20  sord
 *           Initial version.
 *
 */
public class SendEmailTask extends EmailTask implements Runnable {

    private static Logger log = Logger.getLogger(SendEmailTask.class);

    /**
     * Creates a new object.  The object will be able to send a set of emails
     * when the run method is called (probably from a new thread).
     * @param ctx
     * @param scheduler
     * @param jobId
     * @param controlId
     */
    public SendEmailTask(Context ctx, EmailJobScheduler scheduler, int jobId, long controlId) {
        super(ctx, scheduler, jobId, controlId);
    }

    /**
     * This function does the work of sending the emails for an email job.
     *
     * It reads the job data (template, from info, subject, and list/command source.
     * If it is the first time this has been run, it verifies there aren't any
     * partial results and then builds the job detail records from the data source,
     * clearing the data source if successful.
     *
     * Then it scans the detail records, sending an email for each record it finds.
     */
    public void doWork() {
        boolean incomplete = true;
        try {
            EmailJob job = ((EmailJobHome) ctx.lookup("com.topcoder.shared.ejb.EmailServices.EmailJob")).create();
            EmailList list = ((EmailListHome) ctx.lookup("com.topcoder.shared.ejb.EmailServices.EmailList")).create();
            EmailTemplate template = ((EmailTemplateHome) ctx.lookup("com.topcoder.shared.ejb.EmailServices.EmailTemplate")).create();
            EmailServer server = ((EmailServerHome) ctx.lookup("com.topcoder.shared.ejb.EmailServices.EmailServer")).create();

            long lastCheck = new Date().getTime();
            int jobType = job.getJobTypeId(jobId);
            int status = job.getStatusId(jobId);
            int templateId = job.getTemplateId(jobId);
            int listId = job.getListId(jobId);
            int commandId = job.getCommandId(jobId);
            String fromAddress = job.getFromAddress(jobId);
            String fromPersonal = job.getFromPersonal(jobId);
            String subject = job.getSubject(jobId);
            String templateXSL = template.getData(templateId);

            // The jobThrottle limits how many emails will be sent per second.
            int jobThrottle = scheduler.getMaxEmailsPerSecond();

            // verify that the job is still scheduled for this instance.
            // if not, quit without updating anything.
            if (!verifyJob(server)) {
                incomplete = false;
                return;
            }

            TCSEmailMessage message = new TCSEmailMessage();
            message.setFromAddress(fromAddress, fromPersonal);
            message.setSubject(subject);

            /* Email jobs have two stages. The first stage builds the job from
             * a list resource (either a static list or a command query).
             * Once the job is built, changes to the orginal resource will no
             * longer affect the job.
             */
            if (jobType == server.EMAIL_JOB_TYPE_PRE) {
                if (listId != 0) {
                    buildDetailFromList(ctx, jobId, listId);
                } else if (commandId != 0) {
                    buildDetailFromCommand(ctx, jobId, commandId);
                }
            }

            /* Fetch the job results from the database.
             * For each receipient that hasn't been sent an email, fetch the
             * receipient's data from the database and send them an email.
             */
            Map results = job.getJobDetailResults(jobId);
            Set detailIds = results.keySet();
            Iterator detailItr = detailIds.iterator();
            for (int cycleCount = 0; detailItr.hasNext(); cycleCount++) {
                if (cycleCount >= jobThrottle) {
                    long now = new Date().getTime();
                    long sleepTime = 0;
                    if (lastCheck < now) sleepTime = now - lastCheck;
                    if (sleepTime > 1000) sleepTime = 1000; // sleepTime should *NEVER* be more than a second, so just in case the clock got changed, limit it to a 1 second wait.
                    try {
                        Thread.sleep(sleepTime);
                    } catch (InterruptedException e) {
                        // since catching the exception clears the status. Re-interrupt the thread.
                        Thread.currentThread().interrupt();
                    }
                    cycleCount = 0; // this should also get set to zero in the following check, but to be safe set it here also.
                }

                // Check if the thread has been asked to stop.
                if (Thread.currentThread().isInterrupted()) {
                    server.setJobStatus(jobId, server.READY);
                    incomplete = false;
                    return;
                }

                // every so often check some items to see if we need to change
                // what we are doing (like, has the job has been canceled...)
                long now = new Date().getTime();
                if (lastCheck + 1000 < now) {
                    lastCheck = now;
                    status = job.getStatusId(jobId);
                    if (status != server.ACTIVE) {
                        incomplete = false;
                        return;
                    }
                    cycleCount = 0;

                    // verify that the job is still scheduled for this instance...
                    if (!verifyJob(server)) {
                        incomplete = false;
                        return;
                    }
                }

                Object key = detailItr.next();
                int detailId = 0;
                try {
                    // check the status of the next receipient and send an email if necessary
                    detailId = ((Integer) key).intValue();
                    int detailStatus = ((Integer) results.get(key)).intValue();
                    if (detailStatus == server.MSG_NONE) {
                        String memberXML = job.getJobDetailData(jobId, detailId);
                        sendMessage(message, templateXSL, memberXML);
                        server.setDetailStatus(jobId, detailId, server.MSG_SENT, "Sent");
                        log.debug("Job " + jobId + ", Detail " + detailId
                                + ": sent to ("
                                + message.getToAddress(TCSEmailMessage.TO)[0]
                                + ")");
                    } else {
                        // no work to do, don't count this receipient in the cycleCount
                        cycleCount--;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    log.warn("Failed to send email to " + key + " (" + e.toString() + ")");
                    if (detailId != 0) {
                        // mark as failed for unknown reasons
                        server.setDetailStatus(jobId, detailId, server.MSG_FAILED, e.toString());
                    }
                }
            }
            server.setJobStatus(jobId, server.COMPLETE);
            incomplete = false;

            // archive records now that the job is done
            server.archiveDetail(jobId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (incomplete && ctx != null) {
                try {
                    EmailServer server = ((EmailServerHome) ctx.lookup("com.topcoder.shared.ejb.EmailServices.EmailServer")).create();
                    server.setJobStatus(jobId, server.INCOMPLETE);
                } catch (Exception ignore) {
                }
            }
        }
    }


    /**
     * This function assembles and sends a single email for an email job.
     * @param message
     * @param templateXSL
     * @param memberXML
     * @throws TransformerConfigurationException
     * @throws Exception
     */
    private void sendMessage(TCSEmailMessage message, String templateXSL, String memberXML)
            throws TransformerConfigurationException, Exception {
        Reader memberReader = null;
        Reader templateReader = null;
        try {
            TransformerFactory tFactory = TransformerFactory.newInstance();
            // Get the XML input document and the stylesheet, both in the servlet
            // engine document directory.
            memberReader = new StringReader(memberXML);
            templateReader = new StringReader(templateXSL);
            Source memberSource = new StreamSource(memberReader);
            Source templateSource = new StreamSource(templateReader);
            // Generate the transformer.
            Transformer transformer = tFactory.newTransformer(templateSource);
            // Perform the transformation, sending the output to the response.
            StringWriter msg = new StringWriter();
            Result xmlResult = new StreamResult(msg);
            transformer.transform(memberSource, xmlResult);
            parseEmail(message, memberXML);
            message.setBody(msg.toString());
            EmailEngine.send(message);
        } finally {
            try {
                if (memberReader != null) memberReader.close();
            } catch (Exception e) {
            }
            try {
                if (templateReader != null) templateReader.close();
            } catch (Exception e) {
            }
        }
    }

    /**
     * This function parses the source XML data and fills in the appropriate message
     * fields (like the TO address).
     * @param message
     * @param memberXML
     * @throws Exception
     */
    private void parseEmail(TCSEmailMessage message, String memberXML)
            throws Exception {
        String ret = null;
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        Reader reader = null;
        try {
            DocumentBuilder builder = factory.newDocumentBuilder();
            reader = new StringReader(memberXML);
            InputSource source = new InputSource(reader);
            Document document = builder.parse(source);

            NodeList nodes = document.getElementsByTagName("member");
            nodes = ((Element) (nodes.item(0))).getElementsByTagName("email_address");
            String emailAddress = ((Text) (((Element) (nodes.item(0))).getFirstChild())).getData();
            message.setToAddress(emailAddress, TCSEmailMessage.TO);
        } catch (SAXException sxe) {
            // Error generated during parsing
            Exception x = sxe;
            if (sxe.getException() != null)
                x = sxe.getException();
            x.printStackTrace();
            throw new Exception("Failed to parse to address : " + x.toString());
        } catch (ParserConfigurationException pce) {
            // Parser with specified options can't be built
            pce.printStackTrace();
            throw new Exception("Failed to parse to address : " + pce.toString());
        } catch (IOException ioe) {
            // I/O error
            ioe.printStackTrace();
            throw new Exception("Failed to parse to address : " + ioe.toString());
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("Failed to parse TO address : " + e.toString());
        } finally {
            try {
                if (reader != null) reader.close();
            } catch (Exception e) {
            }
        }
    }

    /**
     * This function copys the data from a email list to the job detail records.
     * Once it succeeds, the listId is cleared and the job detail records become the
     * source for future attempts.
     * @param ctx
     * @param jobId
     * @param listId
     * @throws NamingException
     * @throws RemoteException
     * @throws CreateException
     */
    private void buildDetailFromList(Context ctx, int jobId, int listId)
            throws NamingException, RemoteException, CreateException {
        EmailJob job = ((EmailJobHome) ctx.lookup("com.topcoder.shared.ejb.EmailServices.EmailJob")).create();
        EmailList list = ((EmailListHome) ctx.lookup("com.topcoder.shared.ejb.EmailServices.EmailList")).create();
        EmailServer server = ((EmailServerHome) ctx.lookup("com.topcoder.shared.ejb.EmailServices.EmailServer")).create();
        long lastCheck = new Date().getTime();

        server.clearDetailRecords(jobId);

        if (!verifyJob(server)) return;

        Set members = list.getMembers(listId);
        Iterator memberItr = members.iterator();
        for (; memberItr.hasNext();) {
            Object memberIdObj = memberItr.next();
            int memberId = 0;

            long now = new Date().getTime();
            if (lastCheck + 1000 < now) {
                lastCheck = now;
                if (!verifyJob(server)) {
                    return;
                }
            }
            try {
                // add each list member to the job
                memberId = ((Integer) memberIdObj).intValue();
                String memberData = list.getData(listId, memberId);
                server.addDetailRecord(jobId, memberData);
            } catch (Exception e) {
                e.printStackTrace();
                log.warn("Failed to add member " + memberIdObj);
            }
        }
        server.setJobType(jobId, EmailServer.EMAIL_JOB_TYPE_POST);
    }

    /**
     * This function runs a command and save the results in the job detail records.
     * Once it succeeds, the commandId is cleared and the job detail records become
     * the source for future attempts.
     * @param ctx
     * @param jobId
     * @param commandId
     * @throws NamingException
     * @throws RemoteException
     * @throws CreateException
     * @throws Exception
     */
    private void buildDetailFromCommand(Context ctx, int jobId, int commandId)
            throws NamingException, RemoteException, CreateException, Exception {
        EmailJob job = ((EmailJobHome) ctx.lookup("com.topcoder.shared.ejb.EmailServices.EmailJob")).create();
        EmailList list = ((EmailListHome) ctx.lookup("com.topcoder.shared.ejb.EmailServices.EmailList")).create();
        EmailServer server = ((EmailServerHome) ctx.lookup("com.topcoder.shared.ejb.EmailServices.EmailServer")).create();
        StringBuffer memberData = new StringBuffer(500);
        long lastCheck = new Date().getTime();

        server.clearDetailRecords(jobId);
        if (!verifyJob(server)) return;

        String commandName = job.getCommandName(jobId);
        Map m = new HashMap();
        m.put("c", commandName);

        Map inputs = job.getCommandParams(jobId);
        Iterator inputKeyItr = inputs.keySet().iterator();
        for (; inputKeyItr.hasNext();) {
            Object inputObj = inputKeyItr.next();
            int inputId = ((Integer) inputObj).intValue();
            m.put(job.getCommandParamName(inputId), (String) inputs.get(inputObj));
        }

        Map listMap = null;
        RequestInt dataRequest = new Request(m);
        DataAccessInt dai = new OLTPDataAccess();
        try {
            listMap = dai.getData(dataRequest);
        } catch (Exception ignore) {
            // It is possible that a job could be created and started by the
            // scheduler before all the command parameters have been set.
            // If we fail to build the list, wait a short while and try again
            // just in case that was the problem.
            try {
                Thread.sleep(60000);
            } catch (InterruptedException e) {
                // since catching the exception clears the status. Re-interrupt the thread.
                Thread.currentThread().interrupt();
            }
            if (!verifyJob(server)) return;
            listMap = dai.getData(dataRequest);
        }
        Iterator listItr = listMap.values().iterator();
        for (; listItr.hasNext();) {
            ResultSetContainer results = (ResultSetContainer) (listItr.next());
            for (int row = 0; row < results.getRowCount(); row++) {
                long now = new Date().getTime();
                if (lastCheck + 1000 < now) {
                    lastCheck = now;
                    if (!verifyJob(server)) {
                        return;
                    }
                }
                try {
                    // add each results member to the job
                    memberData.setLength(0);
                    memberData.append("<member>");
                    for (int col = 0; col < results.getColumnCount(); col++) {
                        memberData.append("<");
                        memberData.append(results.getColumnName(col));
                        memberData.append(">");
                        memberData.append(results.getItem(row, col).toString());
                        memberData.append("</");
                        memberData.append(results.getColumnName(col));
                        memberData.append(">");
                    }
                    memberData.append("</member>");

                    server.addDetailRecord(jobId, memberData.toString());
                } catch (Exception e) {
                    e.printStackTrace();
                    log.warn("Failed to add member " + row + ": " + memberData.toString());
                }
            }
        }
        server.setJobType(jobId, EmailServer.EMAIL_JOB_TYPE_POST);
    }
}

