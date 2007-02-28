package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.AssignmentDocument;
import com.topcoder.web.common.model.AssignmentDocumentStatus;
import com.topcoder.web.common.model.AssignmentDocumentType;
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
public class AddAssignmentDocument extends PactsHibernateBaseProcessor implements PactsConstants {

    protected void dbProcessing() throws TCWebException {
        try {
            long userId = getLongParameter(USER_ID);

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
                
                // validate reference
                
                if (hasErrors()) {
                    setDefault("expire_date", expireDate);
                    setDefault("assignment_document_type_id", String.valueOf(AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID));
                    setDefault("assignment_document_status_id", String.valueOf(AssignmentDocumentStatus.PENDING_STATUS_ID));
                    setDefault("assignment_document_text", findAssignmentDocumentTypeById(assignmentDocumentTypes, AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID).getTemplate());

                    getRequest().setAttribute("reference_description", "Enter search text for component name:");
                } else {
                    try {
                        AssignmentDocument ad = new AssignmentDocument();
                        User u = new User();
                        u.setId(new Long(userId));
                        ad.setUser(u);
                        ad.setText(assignmentDocumentText);
                        ad.setType(new AssignmentDocumentType(new Long(getRequest().getParameter("assignment_document_type_id"))));
                        ad.setStatus(new AssignmentDocumentStatus(new Long(getRequest().getParameter("assignment_document_status_id"))));
                        ad.setComponentProjectId(new Long(1));
                        ad.setStudioContestId(new Long(1));
                        
                        ad = dib.addAssignmentDocument(ad);
                        log.info("add succeded: " + ad.getId());
                        setNextPage(Links.viewAssignmentDocument(ad.getId().longValue()));
                        setIsNextPageInContext(false);
                        return;
                    } catch (Exception e) {
                        log.info("error while adding assignment document");
                        e.printStackTrace();
                    }
                }
            } else {
                String expireDate = "";
                Calendar date = Calendar.getInstance();
                date.setTime(new Date());
                log.info("ASSIGNMENT_DOCUMENT_DEFAULT_EXPIRATION_PERIOD" + ASSIGNMENT_DOCUMENT_DEFAULT_EXPIRATION_PERIOD.intValue());
                date.add(Calendar.DAY_OF_YEAR, ASSIGNMENT_DOCUMENT_DEFAULT_EXPIRATION_PERIOD.intValue());
                expireDate = new SimpleDateFormat(DATE_FORMAT_STRING).format(date.getTime());

                setDefault("expire_date", expireDate);
                setDefault("assignment_document_type_id", String.valueOf(AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID));
                setDefault("assignment_document_status_id", String.valueOf(AssignmentDocumentStatus.PENDING_STATUS_ID));
                setDefault("assignment_document_text", findAssignmentDocumentTypeById(assignmentDocumentTypes, AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID).getTemplate());

                getRequest().setAttribute("reference_description", "Enter search text for component name:");
            }

            getRequest().setAttribute("user", new UserProfileHeader(dib.getUserProfileHeader(userId)));

            setNextPage(INTERNAL_ADD_ASSIGNMENT_DOCUMENT_JSP);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private AssignmentDocumentType findAssignmentDocumentTypeById(List assignmentDocumentTypes, Long typeId) {
        AssignmentDocumentType adt = null;
        boolean found = false;
        for (Iterator it = assignmentDocumentTypes.iterator(); it.hasNext() && !found;) {
            adt = (AssignmentDocumentType) it.next();
            found = (adt.getId().equals(typeId));
        }
        return found ? adt : null;
    }
}

