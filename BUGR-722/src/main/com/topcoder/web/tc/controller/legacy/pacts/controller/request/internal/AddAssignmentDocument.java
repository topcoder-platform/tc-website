package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.pacts.DeleteAffirmedAssignmentDocumentException;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocument;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentStatus;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocumentType;
import com.topcoder.web.ejb.pacts.assignmentdocuments.ComponentProject;
import com.topcoder.web.ejb.pacts.assignmentdocuments.StudioContest;
import com.topcoder.web.ejb.pacts.assignmentdocuments.User;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader;

/**
 *
 * @author  pulky
 */
public class AddAssignmentDocument extends PactsBaseProcessor implements PactsConstants {

    protected void businessProcessing() throws Exception {
        long userId = 0;
        long assignmentDocumentId = 0;
        Date expireDate = null;
        Date affirmedDate = null;
        
        try {
            assignmentDocumentId = getLongParameter(ASSIGNMENT_DOCUMENT_ID);
        } catch (IllegalArgumentException iae) {
        }

        try {
            userId = getLongParameter(USER_ID);
        } catch (IllegalArgumentException iae) {
        }            

        if (userId + assignmentDocumentId == 0) {
            throw new IllegalArgumentException("Missing parameter " + USER_ID + " or " + ASSIGNMENT_DOCUMENT_ID);
        }

        if (hasParameter("expire_date") && getRequest().getParameter("expire_date").trim().length() != 0) {
            expireDate = checkDate("expire_date", "Please enter a valid expire date");
        }

        if (hasParameter("affirmed_date") && getRequest().getParameter("affirmed_date").trim().length() != 0) {
            affirmedDate = checkDate("affirmed_date", "Please enter a valid affirmed date");
        }

        DataInterfaceBean dib = new DataInterfaceBean();

        // Give the JSP the list of assignment document Types
        List<AssignmentDocumentType> assignmentDocumentTypes = dib.getAssignmentDocumentTypes();
        // We can't use this page for Global Assignment Documents
        assignmentDocumentTypes.remove(new AssignmentDocumentType(AssignmentDocumentType.GLOBAL_TYPE_ID));
        getRequest().setAttribute(ASSIGNMENT_DOCUMENT_TYPE_LIST, assignmentDocumentTypes);

        // Give the JSP the list of assignment document status
        List assignmentDocumentStatus = dib.getAssignmentDocumentStatus();
        getRequest().setAttribute(ASSIGNMENT_DOCUMENT_STATUS_LIST, assignmentDocumentStatus);

        String submissionTitle = getRequest().getParameter("submission_title");
        if (hasParameter("submission_title") && submissionTitle.trim().length() == 0) {
            addError("error", "Please enter a text for the submission title.");
        }

        if (hasParameter("assignment_document_type_id") && 
                getRequest().getParameter("assignment_document_type_id").equals(AssignmentDocumentType.GLOBAL_TYPE_ID.toString())) {
            addError("error", "Invalid assignment document type.");
        }

        if (hasParameter("submission_title")) {

            String assignmentDocumentText = getRequest().getParameter("assignment_document_text");

            if (!hasParameter("search_list")) {
                addError("error", "Please enter a reference for the assignment document.");
            }
            Long referenceId = new Long(getRequest().getParameter("search_list"));

            if (hasErrors()) {
                setDefault("reference_id", StringUtils.htmlEncode(getRequest().getParameter("reference_id")));
                setDefault("expire_date", StringUtils.htmlEncode(getRequest().getParameter("expire_date")));
                setDefault("affirmed_date", StringUtils.htmlEncode(getRequest().getParameter("affirmed_date")));
                setDefault("assignment_document_type_id", StringUtils.htmlEncode(getRequest().getParameter("assignment_document_type_id")));
                setDefault("assignment_document_status_id", StringUtils.htmlEncode(getRequest().getParameter("assignment_document_status_id")));
                setDefault("assignment_document_text", StringUtils.htmlEncode(getRequest().getParameter("assignment_document_text")));
                setDefault("assignment_document_hard_copy", StringUtils.htmlEncode(getRequest().getParameter("assignment_document_hard_copy")));

                getRequest().setAttribute("reference_description", "Enter search text for component name:");
            } else {
                try {
                    storeAssignmentDocument(userId, assignmentDocumentId, expireDate, affirmedDate, dib, 
                            submissionTitle, assignmentDocumentText, referenceId);
                    return;
                } catch (Exception e) {
                    e.printStackTrace();
                    addError("error", e.getMessage());

                    setDefault("reference_id", referenceId);
                    setDefault("expire_date", StringUtils.htmlEncode(getRequest().getParameter("expire_date")));
                    setDefault("affirmed_date", StringUtils.htmlEncode(getRequest().getParameter("affirmed_date")));
                    setDefault("assignment_document_type_id", StringUtils.htmlEncode(getRequest().getParameter("assignment_document_type_id")));
                    setDefault("assignment_document_status_id", StringUtils.htmlEncode(getRequest().getParameter("assignment_document_status_id")));
                    setDefault("assignment_document_text", StringUtils.htmlEncode(getRequest().getParameter("assignment_document_text")));
                    setDefault("assignment_document_hard_copy", StringUtils.htmlEncode(getRequest().getParameter("assignment_document_hard_copy")));

                    getRequest().setAttribute("reference_description", "Enter search text for component name:");
                }
            }
        } else {
            // first time on this page
            if (assignmentDocumentId == 0) {
                prepareForAddition(userId, dib);
            } else {
                prepareForUpdate(assignmentDocumentId, dib);
            }
        }

        setNextPage(INTERNAL_ADD_ASSIGNMENT_DOCUMENT_JSP);
        setIsNextPageInContext(true);
    }

    /**
     * @param userId
     * @param assignmentDocumentId
     * @param expireDate
     * @param affirmedDate
     * @param dib
     * @param submissionTitle
     * @param assignmentDocumentText
     * @param referenceId
     * @throws NumberFormatException
     * @throws RemoteException
     * @throws DeleteAffirmedAssignmentDocumentException
     */
    private void storeAssignmentDocument(long userId, long assignmentDocumentId, Date expireDate, Date affirmedDate, 
            DataInterfaceBean dib, String submissionTitle, String assignmentDocumentText, Long referenceId) throws NumberFormatException, RemoteException, DeleteAffirmedAssignmentDocumentException {
        AssignmentDocument ad = new AssignmentDocument();
        if (assignmentDocumentId > 0) {
            ad.setId(new Long(assignmentDocumentId));
        } else {
            // only set text if it's not an update
            ad.setText(assignmentDocumentText);
        }

        User u = new User();
        u.setId(new Long(userId));
        ad.setUser(u);
        ad.setSubmissionTitle(submissionTitle);
        ad.setType(new AssignmentDocumentType(new Long(getRequest().getParameter("assignment_document_type_id"))));
        ad.setStatus(new AssignmentDocumentStatus(new Long(getRequest().getParameter("assignment_document_status_id"))));

        if (ad.getType().getId().equals(AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID)) {
            ComponentProject cp = new ComponentProject();
            cp.setId(referenceId);
            ad.setComponentProject(cp);
        }
        if (ad.getType().getId().equals(AssignmentDocumentType.STUDIO_CONTEST_TYPE_ID)) {
            StudioContest c = new StudioContest();
            c.setId(referenceId);
            ad.setStudioContest(c);
        }
        
        ad.setHardCopy(new Boolean("on".equals(getRequest().getParameter("assignment_document_hard_copy"))));

        if (expireDate != null) {
            ad.setExpireDate(new Timestamp(expireDate.getTime()));
        }
        if (affirmedDate != null) {
            ad.setAffirmedDate(new Timestamp(affirmedDate.getTime()));
        }
        ad = dib.addAssignmentDocument(ad);
        setNextPage(Links.viewAssignmentDocument(ad.getId().longValue()));
        setIsNextPageInContext(false);
    }

    /**
     * @param assignmentDocumentId
     * @param dib
     * @throws RemoteException
     * @throws SQLException
     */
    private void prepareForUpdate(long assignmentDocumentId, DataInterfaceBean dib) throws RemoteException, SQLException {
        // update
        AssignmentDocument ad = dib.getAssignmentDocument(assignmentDocumentId);
        setDefault("assignment_document_hard_copy", String.valueOf(ad.isHardCopy()));
        setDefault("expire_date", ad.getExpireDate() == null ? "" : new SimpleDateFormat(DATE_FORMAT_STRING).format(ad.getExpireDate()));
        setDefault("affirmed_date", ad.getAffirmedDate() == null ? "" : new SimpleDateFormat(DATE_FORMAT_STRING).format(ad.getAffirmedDate()));
        setDefault("assignment_document_type_id", String.valueOf(ad.getType().getId()));
        setDefault("assignment_document_status_id", String.valueOf(ad.getStatus().getId()));
        setDefault("submission_title", ad.getSubmissionTitle());
        if (ad.getType().getId().equals(AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID)) {
            setDefault("reference_id", String.valueOf(ad.getComponentProject().getId()));
            getRequest().setAttribute("reference_description", ad.getComponentProject().getDescription());
        } else {
            setDefault("reference_id", String.valueOf(ad.getStudioContest().getId()));
            getRequest().setAttribute("reference_description", ad.getStudioContest().getName());
        }
        getRequest().setAttribute("user", new UserProfileHeader(dib.getUserProfileHeader(ad.getUser().getId().longValue())));
        getRequest().setAttribute(ASSIGNMENT_DOCUMENT_ID, ad.getId().toString());
    }

    /**
     * @param userId
     * @param dib
     * @throws RemoteException
     * @throws SQLException
     */
    private void prepareForAddition(long userId, DataInterfaceBean dib) throws RemoteException, SQLException {
        // add
        Calendar date = Calendar.getInstance();
        date.setTime(new Date());
        date.add(Calendar.DAY_OF_YEAR, ASSIGNMENT_DOCUMENT_DEFAULT_EXPIRATION_PERIOD.intValue());

        setDefault("assignment_document_hard_copy", "false");
        setDefault("affirmed_date", "");
        setDefault("reference_id", "0");
        setDefault("assignment_document_type_id", String.valueOf(AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID));
        setDefault("assignment_document_status_id", String.valueOf(AssignmentDocumentStatus.PENDING_STATUS_ID));
        setDefault("assignment_document_text", "");
        setDefault("submission_title", "");
        getRequest().setAttribute("reference_description", "Enter search text for component name:");
        getRequest().setAttribute("user", new UserProfileHeader(dib.getUserProfileHeader(userId)));
        getRequest().setAttribute(ASSIGNMENT_DOCUMENT_ID, "0");
    }
}
