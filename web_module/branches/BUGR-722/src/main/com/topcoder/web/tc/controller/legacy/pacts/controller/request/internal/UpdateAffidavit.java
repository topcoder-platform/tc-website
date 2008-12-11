package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Hashtable;
import java.util.Map;

import javax.transaction.Status;
import javax.transaction.TransactionManager;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Affidavit;
import com.topcoder.web.tc.controller.legacy.pacts.common.AffidavitHeaderList;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfile;

/**
 *
 * @author  cucu
 */
public class UpdateAffidavit extends PactsBaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        try {
            DataInterfaceBean dib = new DataInterfaceBean();
            long affidavitId = getOptionalLongParameter(AFFIDAVIT_ID);

            Affidavit affidavit = new Affidavit(dib.getAffidavit(affidavitId));
            PaymentHeader payment =  affidavit.getPayment();

            if (payment.getId() <= 0) {
                payment = null;
            }

            long userId = affidavit.getHeader().getUser().getId();
            UserProfile user = new UserProfile(dib.getUserProfile(userId));
            boolean isFromIndia = "India".equalsIgnoreCase(user.getCountry());
            boolean isAffirmed = affidavit.getHeader().isAffirmed();

            if (getRequest().getParameter("affidavit_desc") == null) {
                setDefault("affidavit_desc", affidavit.getHeader().getDescription());
                setDefault("affidavit_type_id", affidavit.getHeader().getTypeId() + "");
                setDefault("is_notarized", affidavit.getHeader().isNotarized()? "yes" : "no");
                setDefault("affidavit_status_id", affidavit.getHeader().getStatusId() + "");
                setDefault("round_id", affidavit.getRoundId());
                setDefault("date_of_birth", affidavit.getBirthday());
            } else {

                String desc = checkNotEmptyString("affidavit_desc", "Please enter a description for the affidavit.");
                int statusId = Integer.parseInt(getRequest().getParameter("affidavit_status_id"));
                int typeId = checkNonNegativeInt("affidavit_type_id", "Please select a type");
                String notarized = (String) getRequest().getParameter("is_notarized");
                Date birthday = null;
                String familyName = null;
                int aged = -1;

                boolean affirmating = (statusId == AFFIDAVIT_AFFIRMED_STATUS) && !isAffirmed;

                if (affirmating) {
                    if (affidavit.getHeader().getStatusId() == AFFIDAVIT_CANCELED_STATUS ||
                            affidavit.getHeader().getStatusId() == AFFIDAVIT_DELETED_STATUS) {
                        addError("error", "Cannot affirm a canceled or deleted affidavit");
                    }
                    
                    birthday = checkDate("date_of_birth", "Please enter a valid birthday date");
                    if (!birthday.before(new Date()) && birthday.after(new GregorianCalendar(1900,0,1).getTime())) {
                        addError("error", "Please enter a valid birthday date");
                    }

                    if (isFromIndia) {
                        familyName = checkNotEmptyString("family_name", "Please enter a family name");
                        if (getRequest().getParameter("aged").trim().length() > 0) {
                            aged = checkNonNegativeInt("aged", 99, "Please enter a valid age");
                        }
                    }
                }

                if (isAffirmed && (statusId == AFFIDAVIT_CANCELED_STATUS ||
                        statusId == AFFIDAVIT_DELETED_STATUS)) {
                    addError("error", "Cannot cancel or delete an affirmed affidavit");
                }                    
                long roundId = getOptionalLongParameter(ROUND_ID);
                if (roundId > 0 && !(new Long(roundId)).equals(affidavit.getRoundId())) {
                    // updating round Id
                    // duplicate user, round is not allowed.
                    Map query = new Hashtable();
                    String param = String.valueOf(roundId);
                    if (param != null && !param.equals("")) query.put(ROUND_ID, param);
                    param = String.valueOf(userId);
                    if (param != null && !param.equals("")) query.put(USER_ID, param);
    
                    query.put(STATUS_CODE, AFFIDAVIT_PENDING_STATUS + ", " + AFFIDAVIT_AFFIRMED_STATUS
                            + ", " + AFFIDAVIT_EXPIRED_STATUS);

                    Map results = dib.findAffidavits(query);
    
                    AffidavitHeaderList ahl = new AffidavitHeaderList(results);
                    if (ahl.getHeaderList().length > 0) {
                        addError("error", "There is already an affidavit for this user, round");                        
                    }
                }

                if (hasErrors()) {
                    setDefault("affidavit_desc", desc);
                    setDefault("affidavit_status_id", statusId + "");
                    setDefault("is_notarized", notarized);
                    setDefault("affidavit_type_id", typeId + "");
                    setDefault("date_of_birth", getRequest().getParameter("date_of_birth"));
                    setDefault("family_name", getRequest().getParameter("family_name"));
                    setDefault("aged", getRequest().getParameter("aged"));
                } else {

                    affidavit.setRoundId(roundId < 0 ? null : new Long(roundId));
                    affidavit.getHeader().setStatusId(statusId);
                    affidavit.getHeader().setDescription(desc);
                    affidavit.getHeader().setTypeId(typeId);
                    affidavit.getHeader().setNotarized("yes".equalsIgnoreCase(notarized));

                    // add transaction
                    TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);

                    try {
                        tm.begin();
                        dib.updateAffidavit(affidavit);

                        if (affirmating) {
                            if (isFromIndia) {
                                if (aged <= 0) {
                                    aged = calculateAge(birthday);
                                }
                                dib.affirmAffidavit(affidavitId, birthday, familyName, aged);
                            } else {
                                dib.affirmAffidavit(affidavitId, birthday);
                            }
                        }
                        tm.commit();
                    } catch (Exception e) {
                        if (tm != null && (tm.getStatus() == Status.STATUS_ACTIVE || tm.getStatus() == Status.STATUS_MARKED_ROLLBACK)) {
                            tm.rollback();
                        }
                        throw e;
                    }

                    setNextPage(Links.viewAffidavit(affidavitId));
                    setIsNextPageInContext(false);
                    return;
                }
            }

            getRequest().setAttribute("isFromIndia", Boolean.valueOf(isFromIndia));
            getRequest().setAttribute("isAffirmed", Boolean.valueOf(isAffirmed));

            getRequest().setAttribute("affidavitId", affidavitId + "");
            getRequest().setAttribute("user", getUserProfileHeader(userId));

            // Give the JSP the list of Affidavit Types
            Map map = dib.getAffidavitTypes();
            getRequest().setAttribute(AFFIDAVIT_TYPE_LIST, map.get(AFFIDAVIT_TYPE_LIST));

            // Give the JSP the list of Affidavit Statuses
            map = dib.getStatusCodes(PactsConstants.AFFIDAVIT_OBJ);
            getRequest().setAttribute(STATUS_CODE_LIST, map.get(STATUS_CODE_LIST));

            // Give the JSP the list of Rounds
            map = dib.getRounds();
            getRequest().setAttribute(ROUND_LIST, map.get(ROUND_LIST));

            getRequest().setAttribute("payment", payment);

            setNextPage(INTERNAL_UPDATE_AFFIDAVIT_JSP);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}

