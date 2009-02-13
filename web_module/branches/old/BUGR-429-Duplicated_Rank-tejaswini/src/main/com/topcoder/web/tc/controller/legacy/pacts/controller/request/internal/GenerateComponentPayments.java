package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.DevSupportException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.IllegalUpdateException;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeaderList;

/**
 * @author mktong
 * Create Date: May 16, 2006
 */
public class GenerateComponentPayments extends BaseProcessor implements PactsConstants {


	public final static String IS_DEV_SUPPORT_BY_DESIGNER = "dsd";
	public final static String DEV_SUPPORT_PROJECT = "dsp";
	public final static String DEV_SUPPORT_PROJECT_ID = "dspid";

    public final static String APPLY_REVIEWER_WITHHOLDING_ID = "arwid";
    public final static String PAY_RBOARD_BONUS_ID = "prbbid";

    protected void businessProcessing() throws TCWebException {
        try {
            
            boolean applyReviewerWithholding = StringUtils.checkNull(getRequest().getParameter(APPLY_REVIEWER_WITHHOLDING_ID)).equalsIgnoreCase("on");
            boolean payRboardBonus = StringUtils.checkNull(getRequest().getParameter(PAY_RBOARD_BONUS_ID)).equalsIgnoreCase("on");

            String devSupport = getRequest().getParameter(IS_DEV_SUPPORT_BY_DESIGNER);
            String devSupportProject = getRequest().getParameter(DEV_SUPPORT_PROJECT);
            DataInterfaceBean dib = new DataInterfaceBean();
            Map map = dib.getProjectTerminationStatusTypes();
            getRequest().setAttribute(PROJECT_TERMINATION_STATUS_LIST, map.get(PROJECT_TERMINATION_STATUS_LIST));
            setDefault(IS_DEV_SUPPORT_BY_DESIGNER, devSupport);
            setDefault(DEV_SUPPORT_PROJECT, devSupportProject);

            setDefault(APPLY_REVIEWER_WITHHOLDING_ID , applyReviewerWithholding);
            setDefault(PAY_RBOARD_BONUS_ID , payRboardBonus);
            
            setNextPage(INTERNAL_GENERATE_COMPONENT_PAYMENTS);
            setIsNextPageInContext(true);

            String projectID = StringUtils.checkNull(getRequest().getParameter(PROJECT_ID)).trim();
            String projectTermStatus = StringUtils.checkNull(getRequest().getParameter(PROJECT_TERMINATION_STATUS));
            String client = StringUtils.checkNull(getRequest().getParameter(PROJECT_CLIENT)).trim();
            String devSupportProjectId = StringUtils.checkNull(getRequest().getParameter(DEV_SUPPORT_PROJECT_ID)).trim();
            boolean devSupportDes = "designer".equals(devSupport);
            long devSupportId = 0;
            
        	if (!devSupportDes && !"other".equals(devSupport)) {
        	    addError(PROJECT_TERMINATION_STATUS, "Please select who will receive the development support");
        	    return;
        	}
        	
            if (!devSupportDes) {
                
            	String handle = StringUtils.checkNull(getRequest().getParameter("coder"));
            	
            	if (handle.trim().length() == 0) {
            	    addError(PROJECT_TERMINATION_STATUS, "Please enter the coder that will receive the development support payment");
            	    return;
            	}
                Map m = new HashMap();
                m.put(HANDLE, handle);
                UserProfileHeader[] users = new UserProfileHeaderList(dib.findUsers(m)).getHeaderList();
                
            	if (users.length == 1) {
            		devSupportId = users[0].getId();
            	}
            }
            
            log.debug("devSupportId=" + devSupportId);
            
            if (!projectID.equals("") && !projectTermStatus.equals("") && (devSupportDes || devSupportId > 0)) {
                DataInterfaceBean bean = new DataInterfaceBean();
                int[] counts = new int[4];
                counts[0] =0;
                counts[1] =0;
                counts[2] =0;
                counts[3] =0;
                log.debug("status type " + getRequest().getParameter(PROJECT_TERMINATION_STATUS));
                
                List l;
                if ("none".equals(devSupportProject)) {
                    log.debug("Development support will not be paid");

                    l = bean.generateComponentPayments(Long.parseLong(projectID), Integer.parseInt(projectTermStatus), client, applyReviewerWithholding, payRboardBonus);
                } else {
                    long pid = 0;
                    if ("other".equals(devSupportProject)) {
                        pid = Integer.parseInt(devSupportProjectId);
                        log.debug("Development support paid to project " + pid);
                    } else if ("auto".equals(devSupportProject)) {
                        log.debug("Development support paid to design project");                        
                    } else {
                        addError(PROJECT_TERMINATION_STATUS, "Please select the development support project");
                        return;
                    }
                    
                    l = bean.generateComponentPayments(Long.parseLong(projectID), Integer.parseInt(projectTermStatus), client, devSupportId, pid, applyReviewerWithholding, payRboardBonus);
                    
                }
                
                l = bean.addPayments(l);
                List ids = new ArrayList();
                
                for (int i = 0; i < l.size(); i++) {
                	BasePayment p = (BasePayment) l.get(i);
                	if (p.getPaymentType() == PactsConstants.COMPONENT_PAYMENT) counts[0]++;
                    if (p.getPaymentType() == PactsConstants.REVIEW_BOARD_PAYMENT) counts[1]++;
                    if (p.getPaymentType() == PactsConstants.REVIEW_BOARD_BONUS_PAYMENT) counts[3]++;
                	ids.add(p.getId() + "");
                	
                	List refer = bean.findPayments(CODER_REFERRAL_PAYMENT, p.getId());
                	if (refer.size() > 0) {
                		counts[2]++;
                		BasePayment pr = (BasePayment) refer.get(0);
                    	ids.add(pr.getId() + "");
                	}
                }
                
                getRequest().setAttribute(PAYMENT_ID, ids);
                
                addError(PROJECT_ID, "Success: " + counts[0] + " design/dev, " +
                        counts[1] + " review board, " + counts[2] + " referral payments generated, " +
                        + counts[3] + " review board bonus payments generated ");
            } else {

            	if (!devSupportDes && devSupportId == 0) {
                    addError(PROJECT_TERMINATION_STATUS, "Error: invalid coder for development support");
                }
            	
                if (projectID.equals("")) {
                    addError(PROJECT_ID, "Error: Missing project id");
                }
                if (projectTermStatus.equals("")) {
                    addError(PROJECT_TERMINATION_STATUS, "Error: Missing project termination status");
                }
            }
        } catch (DevSupportException dse) {
            addError("dev_support_error", dse.getMessage());
        } catch (NumberFormatException e) {
            addError(PROJECT_ID, "Error: Please enter a value for project id");
        } catch (IllegalUpdateException e) {
            throw new NavigationException(e.getMessage());
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
