package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.AssignmentDocument;
import com.topcoder.web.common.model.AssignmentDocumentStatus;
import com.topcoder.web.common.model.AssignmentDocumentType;
import com.topcoder.web.common.model.ComponentProject;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.model.Contest;
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
//        try {
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
            } catch (IllegalArgumentException iae2) {
            }            

            if (userId + assignmentDocumentId == 0) {
                throw new IllegalArgumentException("Missing parameter " + USER_ID + " or " + ASSIGNMENT_DOCUMENT_ID);
            }
            log.info("1");
            if (hasParameter("expire_date") && getRequest().getParameter("expire_date").trim().length() != 0) {
                expireDate = checkDate("expire_date", "Please enter a valid expire date");
            }
            log.info("2");
            if (hasParameter("affirmed_date") && getRequest().getParameter("affirmed_date").trim().length() != 0) {
                affirmedDate = checkDate("affirmed_date", "Please enter a valid affirmed date");
            }

            DataInterfaceBean dib = new DataInterfaceBean();

            // Give the JSP the list of assignment document Types
            List assignmentDocumentTypes = dib.getAssignmentDocumentTypes();
            getRequest().setAttribute(ASSIGNMENT_DOCUMENT_TYPE_LIST, assignmentDocumentTypes);

            // Give the JSP the list of assignment document status
            List assignmentDocumentStatus = dib.getAssignmentDocumentStatus();
            getRequest().setAttribute(ASSIGNMENT_DOCUMENT_STATUS_LIST, assignmentDocumentStatus);

            String assignmentDocumentText = getRequest().getParameter("assignment_document_text");
            if (assignmentDocumentText != null) {
                if (assignmentDocumentText.trim().length() == 0) {
                    addError("error", "Please enter a text for the assignment document.");
                }

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

                    getRequest().setAttribute("reference_description", "Enter search text for component name:");
                } else {
                    try {
                        AssignmentDocument ad = new AssignmentDocument();
                        if (assignmentDocumentId > 0) {
                            ad.setId(new Long(assignmentDocumentId));
                        }

                        User u = new User();
                        u.setId(new Long(userId));
                        ad.setUser(u);
                        ad.setText(assignmentDocumentText);
                        ad.setType(new AssignmentDocumentType(new Long(getRequest().getParameter("assignment_document_type_id"))));
                        ad.setStatus(new AssignmentDocumentStatus(new Long(getRequest().getParameter("assignment_document_status_id"))));

                        if (ad.getType().getId().equals(AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID)) {
                            ComponentProject cp = new ComponentProject();
                            cp.setId(referenceId);
                            ad.setComponentProject(cp);
                        }
                        if (ad.getType().getId().equals(AssignmentDocumentType.STUDIO_CONTEST_TYPE_ID)) {
                            Contest c = new Contest();
                            c.setId(referenceId);
                            ad.setStudioContest(c);
                        }
                        
                        if (expireDate != null) {
                            ad.setExpireDate(new Timestamp(expireDate.getTime()));
                        }
                        if (affirmedDate != null) {
                            ad.setAffirmedDate(new Timestamp(affirmedDate.getTime()));
                        }
                        ad = dib.addAssignmentDocument(ad);
                        setNextPage(Links.viewAssignmentDocument(ad.getId().longValue()));
                        setIsNextPageInContext(false);
                        return;
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            } else {
                log.info("3");

                if (assignmentDocumentId == 0) {
                    // add
                    Calendar date = Calendar.getInstance();
                    date.setTime(new Date());
                    date.add(Calendar.DAY_OF_YEAR, ASSIGNMENT_DOCUMENT_DEFAULT_EXPIRATION_PERIOD.intValue());

                    setDefault("expire_date", new SimpleDateFormat(DATE_FORMAT_STRING).format(date.getTime()));
                    setDefault("affirmed_date", "");
                    setDefault("assignment_document_type_id", String.valueOf(AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID));
                    setDefault("assignment_document_status_id", String.valueOf(AssignmentDocumentStatus.PENDING_STATUS_ID));
                    setDefault("assignment_document_text", "TODO: use template");
                    getRequest().setAttribute("reference_description", "Enter search text for component name:");
                    getRequest().setAttribute("user", new UserProfileHeader(dib.getUserProfileHeader(userId)));
                    getRequest().setAttribute(ASSIGNMENT_DOCUMENT_ID, "0");
                } else {
                    // update
                    log.info("4");
                    AssignmentDocument ad = dib.getAssignmentDocument(assignmentDocumentId);
                    log.info("5");
                    setDefault("expire_date", ad.getExpireDate() == null ? "" : new SimpleDateFormat(DATE_FORMAT_STRING).format(ad.getExpireDate()));
                    log.info("6");
                    setDefault("affirmed_date", ad.getAffirmedDate() == null ? "" : new SimpleDateFormat(DATE_FORMAT_STRING).format(ad.getAffirmedDate()));
                    log.info("7");
                    setDefault("assignment_document_type_id", String.valueOf(ad.getType().getId()));
                    log.info("8");
                    setDefault("assignment_document_status_id", String.valueOf(ad.getStatus().getId()));
                    log.info("9");
                    setDefault("assignment_document_text", ad.getText());
                    log.info("10");
                    log.info(ad.getComponentProject().getId().toString());
                    if (ad.getType().getId().equals(AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID)) {
                        setDefault("reference_id", String.valueOf(ad.getComponentProject()));
                        getRequest().setAttribute("reference_description", ad.getComponentProject().getDescription());
                    } else {
                        setDefault("reference_id", String.valueOf(ad.getStudioContest()));
                        getRequest().setAttribute("reference_description", ad.getStudioContest().getName());
                    }
                    log.info("11");
                    getRequest().setAttribute("user", new UserProfileHeader(dib.getUserProfileHeader(ad.getUser().getId().longValue())));
                    log.info("12");
                    getRequest().setAttribute(ASSIGNMENT_DOCUMENT_ID, ad.getId().toString());
                    log.info("13");
                }
            }

            setNextPage(INTERNAL_ADD_ASSIGNMENT_DOCUMENT_JSP);
            setIsNextPageInContext(true);
//        } catch (Exception e) {
//            throw new TCWebException(e);
//        }
    }
}
