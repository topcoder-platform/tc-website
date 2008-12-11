package com.topcoder.web.openaim.controller.request.admin;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.openaim.Constants;
import com.topcoder.web.openaim.dao.OpenAIMDAOFactory;
import com.topcoder.web.openaim.dao.OpenAIMDAOUtil;
import com.topcoder.web.openaim.model.Contest;
import com.topcoder.web.openaim.model.Submission;
import com.topcoder.web.openaim.model.SubmissionStatus;
import com.topcoder.web.openaim.model.ReviewStatus;
import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;
import javax.xml.rpc.ServiceException;
import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.RemoteException;
import java.util.Date;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 12, 2007
 */
public class SendToReview extends Base {

    protected void dbProcessing() throws Exception {

        String contestId = getRequest().getParameter(Constants.CONTEST_ID);
        String submissionId = getRequest().getParameter(Constants.SUBMISSION_ID);
        if (log.isDebugEnabled()) {
            log.debug("contest " + contestId + " submission " + submissionId);
        }

        Long sid = null;

        if ("".equals(StringUtils.checkNull(contestId))) {
            if ("".equals(StringUtils.checkNull(submissionId))) {
                throw new NavigationException("No contest or submission specified");
            } else {
                try {
                    sid = new Long(submissionId);
                } catch (NumberFormatException e) {
                    throw new NavigationException("Invalid submission id specified");
                }

            }
        }


        OpenAIMDAOFactory factory = OpenAIMDAOUtil.getFactory();
        Date now = new Date();

        Long cid;
        Contest c;
        Submission sub = null;
        if (sid == null) {
            try {
                cid = new Long(contestId);
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid contest id specified");
            }
            c = factory.getContestDAO().find(cid);
        } else {
            sub = factory.getSubmissionDAO().find(sid);
            c = sub.getContest();
        }

        //check if all the submissions in the contest have been reviewed.

        if (c.getProject() != null) {
            if (now.after(c.getEndTime())) {
                if (allSubmissionsReviewed(c)) {
                    if (sub != null) {
                        log.debug("processing an indvidual submission");
                        if (hasQualifyingRank(sub)) {
                            if (SubmissionStatus.ACTIVE.equals(sub.getStatus().getId())) {
                                if (sub.getReview() != null && ReviewStatus.PASSED.equals(sub.getReview().getStatus().getId())) {
                                    processSubmission(sub);
                                } else {
                                    throw new NavigationException("Submission has not passed screening.");
                                }
                            } else {
                                throw new NavigationException("Submission is not active.");
                            }
                        } else {
                            throw new NavigationException("Submission rank does not qualify it for inclusion");
                        }
                    } else {
                        log.debug("processing a whole contest full of submissions");
                        for (Submission s : c.getSubmissions()) {
                            if (hasQualifyingRank(s) &&
                                    SubmissionStatus.ACTIVE.equals(s.getStatus().getId()) &&
                                    s.getReview() != null && ReviewStatus.PASSED.equals(s.getReview().getStatus().getId())) {
                                processSubmission(s);
                            }
                        }
                    }
                    setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                            "=AdminSendToReviewResult&" + Constants.CONTEST_ID + "=" + c.getId());
                    setIsNextPageInContext(false);

                } else {
                    throw new NavigationException("Be sure to review all the submissions before attempting to send them to online review");
                }

            } else {
                throw new NavigationException("Sorry, you can't send submissions to online review until the submission phase is over.");
            }

        } else {
            throw new NavigationException("Sorry, this contest is not associated with a project in Online Review.");
        }
    }

    private void processSubmission(Submission s) throws MalformedURLException, RemoteException, ServiceException {
        try {
                if (log.isDebugEnabled()) {
                    log.debug("passed all checks, sending " + s.getId() + " to OR");
                }
                s.setORSubmission(DAOUtil.getFactory().getSubmissionDAO().find(uploadSubmission(s)));
        } catch (ServiceException e) {
            log.error("ServiceException failed when attempting to send submission " + s.getId());
            throw e;
        } catch (MalformedURLException e) {
            log.error("MalformedURLException failed when attempting to send submission " + s.getId());
            throw e;
        } catch (RemoteException e) {
            log.error("RemoteException failed when attempting to send submission " + s.getId());
            throw e;
        }
    }

    private boolean hasQualifyingRank(Submission s) {
        Contest c = s.getContest();
        return !(c.getMaxSubmissions() != null && c.getMaxSubmissions().getValue() != null)
                || s.getRank() != null &&
                s.getRank().compareTo(new Integer(c.getMaxSubmissions().getValue())) <= 0;
    }

    private boolean allSubmissionsReviewed(Contest c) {
        log.debug("start testing if all submissions reviewed");
        int max = -1;
        if (c.getMaxSubmissions() != null && c.getMaxSubmissions().getValue() != null) {
            max = Integer.parseInt(c.getMaxSubmissions().getValue());
        }
        for (Submission s : c.getSubmissions()) {
            if (SubmissionStatus.ACTIVE.equals(s.getStatus().getId()) && s.getRank() <= max && s.getReview() == null) {
                log.debug("end testing if all submissinos reviewed (they were not)");
                return false;
            }
        }
        log.debug("end testing if all submissinos reviewed (they were)");
        return true;
    }


    private final static String END_POINT = "http://" + ApplicationServer.OR_WEBSERVICES_SERVER_NAME + "/review/services/UploadService";

    /**
     * Uploads the submission using the SOAP call.
     *
     * @param s - the submission to upload
     * @return the submission id
     * @throws javax.xml.rpc.ServiceException if any while creating the SOAP call.
     * @throws java.net.MalformedURLException if any while creating the SOAP call.
     * @throws java.rmi.RemoteException       if any while executing.
     */
    public int uploadSubmission(Submission s) throws ServiceException,
            MalformedURLException, RemoteException {

        if (log.isDebugEnabled()) {
            log.debug("sending request to " + END_POINT);
            log.debug(s.getPath().getPath() + s.getSystemFileName() + " " + s.getOriginalFileName());
        }
        // Create the data for the attached file.
        DataHandler dhSource = new DataHandler(new FileDataSource(s.getPath().getPath() + s.getSystemFileName()));

        Service service = new Service();
        Call call = (Call) service.createCall();

        call.setTargetEndpointAddress(new URL(END_POINT));
        QName qnameAttachment = new QName("urn:EchoAttachmentsService", "DataHandler");


        call.setOperationName(new QName("urn:UploadService", "uploadSubmission"));
        call.addParameter("projectId", XMLType.XSD_LONG, ParameterMode.IN);
        call.addParameter("ownerId", XMLType.XSD_LONG, ParameterMode.IN);
        call.addParameter("filename", XMLType.XSD_STRING, ParameterMode.IN);
        call.addParameter(qnameAttachment, XMLType.MIME_DATA_HANDLER, ParameterMode.IN); // Add the file.
        call.setReturnType(XMLType.XSD_LONG);

        //make the file name be the openaim submission id + the file extension
        String fileName = s.getId().toString() + s.getOriginalFileName().substring(s.getOriginalFileName().lastIndexOf('.'));
        // call.
        //todo these should really be int for project id
        return ((Number) call.invoke(new Object[]{s.getContest().getProject().getId().longValue(), s.getSubmitter().getId(),
                fileName, dhSource})).intValue();
    }


}
