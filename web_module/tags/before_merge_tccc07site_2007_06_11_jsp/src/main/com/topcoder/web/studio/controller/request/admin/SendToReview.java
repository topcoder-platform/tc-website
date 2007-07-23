package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOFactory;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ReviewStatus;
import com.topcoder.web.studio.model.Submission;
import com.topcoder.web.studio.model.SubmissionStatus;
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
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 12, 2007
 */
public class SendToReview extends Base {

    protected void dbProcessing() throws Exception {

        String contestId = getRequest().getParameter(Constants.CONTEST_ID);

        if ("".equals(StringUtils.checkNull(contestId))) {
            throw new NavigationException("No contest specified");
        } else {
            StudioDAOFactory factory = StudioDAOUtil.getFactory();
            Date now = new Date();
            Long cid;
            try {
                cid = new Long(contestId);
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid contest id specified");
            }
            Contest c = factory.getContestDAO().find(cid);
            //check if all the submissions in the contest have been reviewed.

            int count = 0;
            if (c.getProject() != null) {
                if (now.after(c.getEndTime())) {
                    if (allSubmissionsReviewed(c)) {
                        for (Submission s : c.getSubmissions()) {
                            if (hasQualifyingRank(s) &&
                                    SubmissionStatus.ACTIVE.equals(s.getStatus().getId()) &&
                                    s.getReview() != null && ReviewStatus.PASSED.equals(s.getReview().getStatus().getId())) {
                                if (log.isDebugEnabled()) {
                                    log.debug("passed all checks, sending " + s.getId() + " to OR");
                                }
                                s.setORSubmission(DAOUtil.getFactory().getSubmissionDAO().find(uploadSubmission(s)));
                                count++;
                            }
                        }
                        setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                                "=AdminSendToReviewResult&" + Constants.CONTEST_ID + "=" + contestId);
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
    }

    private boolean hasQualifyingRank(Submission s) {
        Contest c = s.getContest();
        return !(c.getMaxSubmissions() != null && c.getMaxSubmissions().getValue() != null)
                || s.getRank() != null &&
                s.getRank().compareTo(new Integer(c.getMaxSubmissions().getValue())) <= 0;
    }

    private boolean allSubmissionsReviewed(Contest c) {
        log.debug("start testing if all submissions reviewed");
        int max = Integer.parseInt(c.getMaxSubmissions().getValue());
        for (Submission s : c.getSubmissions()) {
            if (SubmissionStatus.ACTIVE.equals(s.getStatus().getId()) && s.getRank() <= max && s.getReview() == null) {
                log.debug("end testing if all submissinos reviewed (they were not)");
                return false;
            }
        }
        log.debug("end testing if all submissinos reviewed (they were)");
        return true;
    }


    private final static String END_POINT = "http://" + ApplicationServer.SOFTWARE_SERVER_NAME + "/review/services/UploadService";

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

        //make the file name be the studio submission id + the file extension
        String fileName = s.getId().toString() + s.getOriginalFileName().substring(s.getOriginalFileName().lastIndexOf('.'));
        // call.
        //todo these should really be int for project id
        return ((Number) call.invoke(new Object[]{s.getContest().getProject().getId().longValue(), s.getSubmitter().getId(),
                fileName, dhSource})).intValue();
    }


}
