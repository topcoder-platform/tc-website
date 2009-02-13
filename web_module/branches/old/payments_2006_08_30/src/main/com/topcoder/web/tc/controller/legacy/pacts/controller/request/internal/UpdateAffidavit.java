package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Map;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Affidavit;
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

                if (hasErrors()) {
            		setDefault("affidavit_desc", desc);
            		setDefault("affidavit_status_id", statusId + "");
            		setDefault("is_notarized", notarized);
            		setDefault("affidavit_type_id", typeId + "");
            		setDefault("date_of_birth", getRequest().getParameter("date_of_birth"));
            		setDefault("family_name", getRequest().getParameter("family_name"));
            		setDefault("aged", getRequest().getParameter("aged"));
                } else {
                    long roundId = getLongParameter(ROUND_ID);

                    affidavit.setRoundId(roundId < 0 ? null : new Long(roundId));
                    affidavit.getHeader().setStatusId(statusId);
                    affidavit.getHeader().setDescription(desc);
                    affidavit.getHeader().setTypeId(typeId);
                    affidavit.getHeader().setNotarized("yes".equalsIgnoreCase(notarized));

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

