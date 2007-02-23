package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.List;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.AssignmentDocumentStatus;
import com.topcoder.web.common.model.AssignmentDocumentType;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;
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

            Payment payment = null;
            if (getRequest().getParameter("assignment_document_text") != null) {
//                String desc = (String) getRequest().getParameter("affidavit_desc");
//                int typeId = Integer.parseInt(getRequest().getParameter("affidavit_type_id"));
//
//                if (desc.trim().length() == 0) {
//                    addError("error", "Please enter a description for the affidavit.");
//                }
//                if (typeId < 0) {
//                    addError("error", "Please select a type");
//                }
//
//                if (hasErrors()) {
//                    setDefault("affidavit_desc", desc);
//                    setDefault("affidavit_type_id", typeId + "");
//                    setDefault("text", getRequest().getParameter("text"));
//                } else {
//                    long roundId = getOptionalLongParameter(ROUND_ID);
//
//                    // Save the Affidavit
//                    Affidavit a = new Affidavit(
//                            roundId < 0 ? null : new Long(roundId),
//                            userId, AFFIDAVIT_STATUS_PENDING, desc, typeId, false, false);
//
//                    if (payment != null) {
//                        a.setPayment(payment.getHeader());
//                    }
//                    String text = "".equals(StringUtils.checkNull(getRequest().getParameter("text"))) ? null : getRequest().getParameter("text");
//                    long affidavitId = dib.addAffidavit(a, text, null);
//                    setNextPage(Links.viewAffidavit(affidavitId));
//                    setIsNextPageInContext(false);
//                    return;
//                }
            } else {
                setDefault("assignment_document_type_id", String.valueOf(AssignmentDocumentType.COMPONENT_COMPETITION_TYPE_ID));
                setDefault("assignment_document_status_id", String.valueOf(AssignmentDocumentStatus.PENDING_STATUS_ID));
            }

            getRequest().setAttribute("user", new UserProfileHeader(dib.getUserProfileHeader(userId)));

            // Give the JSP the list of assignment document Types
            List assignmentDocumentTypes = dib.getAssignmentDocumentTypes();
            getRequest().setAttribute(ASSIGNMENT_DOCUMENT_TYPE_LIST, assignmentDocumentTypes);

            // Give the JSP the list of assignment document Types
            List assignmentDocumentStatus = dib.getAssignmentDocumentStatus();
            getRequest().setAttribute(ASSIGNMENT_DOCUMENT_STATUS_LIST, assignmentDocumentStatus);

            setNextPage(INTERNAL_ADD_ASSIGNMENT_DOCUMENT_JSP);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}

