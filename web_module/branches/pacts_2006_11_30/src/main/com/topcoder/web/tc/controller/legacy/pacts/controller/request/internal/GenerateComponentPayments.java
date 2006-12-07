package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.List;
import java.util.Map;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.IllegalUpdateException;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * @author mktong
 * Create Date: May 16, 2006
 */
public class GenerateComponentPayments extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        try {
            DataInterfaceBean dib = new DataInterfaceBean();
            Map map = dib.getProjectTerminationStatusTypes();
            getRequest().setAttribute(PROJECT_TERMINATION_STATUS_LIST, map.get(PROJECT_TERMINATION_STATUS_LIST));
            setNextPage(INTERNAL_GENERATE_COMPONENT_PAYMENTS);
            setIsNextPageInContext(true);

            String projectID = StringUtils.checkNull(getRequest().getParameter(PROJECT_ID)).trim();
            String projectTermStatus = StringUtils.checkNull(getRequest().getParameter(PROJECT_TERMINATION_STATUS));
            String client = StringUtils.checkNull(getRequest().getParameter(PROJECT_CLIENT)).trim();
            if (!projectID.equals("") && !projectTermStatus.equals("")) {
                DataInterfaceBean bean = new DataInterfaceBean();
                int[] counts = new int[2];
                counts[0] =0;
                counts[1] =0;
                log.debug("status type " + getRequest().getParameter(PROJECT_TERMINATION_STATUS));
                
                List l = bean.generateComponentPayments(Long.parseLong(projectID), Integer.parseInt(projectTermStatus), client);
                
                // TODO: Enhance! need an addPayments method! 
                for (int i = 0; i < l.size(); i++) {
                	BasePayment p = (BasePayment) l.get(i);
                	p = bean.addPayment(p);
                	log.debug("added payment with id=" + p.getId());
                	if (p.getPaymentType() == PactsConstants.COMPONENT_PAYMENT) counts[0]++;
                	if (p.getPaymentType() == PactsConstants.REVIEW_BOARD_PAYMENT) counts[1]++;
                }
                
                addError(PROJECT_ID, "Success: " + counts[0] + " design/dev payments generated, " +
                        counts[1] + " review board payments generated");
            } else {
                if (projectID.equals("")) {
                    addError(PROJECT_ID, "Error: Missing project id");
                }
                if (projectTermStatus.equals("")) {
                    addError(PROJECT_TERMINATION_STATUS, "Error: Missing project termination status");
                }
            }
        } catch (NumberFormatException e) {
            addError(PROJECT_ID, "Error: Please enter a value for project id");
        } catch (IllegalUpdateException e) {
            throw new NavigationException(e.getMessage());
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
