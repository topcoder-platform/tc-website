package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.Map;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Affidavit;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentHeader;

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
            long userId = affidavit.getHeader().getUser().getId();
                
            if (getRequest().getParameter("affidavit_desc") == null) {
                setDefault("affidavit_desc", affidavit.getHeader().getDescription());
                setDefault("affidavit_type_id", affidavit.getHeader().getTypeId());
        		setDefault("is_notarized", affidavit.getHeader().isNotarized());
        		setDefault("affidavit_status_id", affidavit.getHeader().getStatusId());
        		setDefault("round_id", affidavit.getRoundId());
        	
            } else {
        		
        		String desc = (String) getRequest().getParameter("affidavit_desc"); 
        		int statusId = Integer.parseInt(getRequest().getParameter("affidavit_status_id"));
        		int typeId = Integer.parseInt(getRequest().getParameter("affidavit_type_id"));
        		String notarized = (String) getRequest().getParameter("is_notarized");
        		
        		boolean affirmating = (statusId == AFFIDAVIT_AFFIRMED_STATUS) && !affidavit.getHeader().isAffirmed();
        		
                if (desc.trim().length() == 0) {
                    addError("error", "Please enter a description for the affidavit.");
                }
                if (typeId < 0) {
                    addError("error", "Please select a type");
                }
                if (affirmating) {
                	// TODO check birthday
                	
                	// TODO if coder is from india...
                }

                if (hasErrors()) {
            		setDefault("affidavit_desc", desc);
            		setDefault("affidavit_status_id", statusId);
            		setDefault("is_notarized", notarized);
            		setDefault("affidavit_type_id", typeId);
                } else {
                    long roundId = getLongParameter(ROUND_ID);

                    affidavit.setRoundId(roundId < 0 ? null : new Long(roundId));
                    affidavit.getHeader().setStatusId(statusId);
                    affidavit.getHeader().setDescription(desc);
                    affidavit.getHeader().setTypeId(typeId);
                    affidavit.getHeader().setNotarized("yes".equalsIgnoreCase(notarized));

                    dib.updateAffidavit(affidavit);
                    
                    if (affirmating) {
                    	// TODO affirmation
                	}
                    setNextPage(Links.viewAffidavit(affidavitId));
                    setIsNextPageInContext(false);
                    return;
                }
            }


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

            setNextPage("/pacts/internal/updateAffidavitNew.jsp");
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}

