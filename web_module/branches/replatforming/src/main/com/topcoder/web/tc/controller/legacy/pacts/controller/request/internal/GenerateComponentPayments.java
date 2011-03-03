/*
 * Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
 */
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
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.IllegalUpdateException;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeaderList;

/**
 * <strong>Purpose</strong>:
 * A processor to generate automated payments.
 *
 * <p>
 *   Version 1.1 (Testing Competition Split Release Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated Application Testing to Test Suites</li>
 *     <li>Added support for new Test Scenarios competitions.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.2 (Copilot Selection Contest Online Review and TC Site Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added support for new Copilot Posting competitions.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.3 (Online Review Payments and Status Automation Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Update {@link #businessProcessing()} method to support payment releases if any available.</li>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.4 (Content Creation Contest Online Review and TC Site Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated {@link #businessProcessing()} method.</li>
 *     <li>Updated {@link #generateSuccessMessage(int[])}  method.</li>
 *   </ol>
 * </p>
 *
 * @author mktong, pulky, Blues, FireIce
 * @version 1.4
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
                Map<String, String> m = new HashMap<String, String>();
                m.put(HANDLE, handle);
                UserProfileHeader[] users = new UserProfileHeaderList(dib.findUsers(m)).getHeaderList();

                if (users.length == 1) {
                    devSupportId = users[0].getId();
                }
            }

            log.debug("devSupportId=" + devSupportId);

            if (!projectID.equals("") && !projectTermStatus.equals("") && (devSupportDes || devSupportId > 0)) {
                DataInterfaceBean bean = new DataInterfaceBean();
                // [BUGR-1452] - add support for paying other project types
                // [BUGR-1842] - add support for UI/RIA project types
                int[] counts = new int[17];
                log.debug("status type " + getRequest().getParameter(PROJECT_TERMINATION_STATUS));

                List resourceIds = new ArrayList();
                List lst;
                if ("none".equals(devSupportProject)) {
                    log.debug("Development support will not be paid");

                    lst = bean.generateComponentPayments(Long.parseLong(projectID), Integer.parseInt(projectTermStatus), client, applyReviewerWithholding, payRboardBonus, resourceIds);
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

                    lst = bean.generateComponentPayments(Long.parseLong(projectID), Integer.parseInt(projectTermStatus), client, devSupportId, pid, applyReviewerWithholding, payRboardBonus, resourceIds);

                }

                lst = bean.addOnlineReviewPayments(lst, resourceIds);

                List<String> ids = new ArrayList<String>();

                for (int i = 0; i < lst.size(); i++) {
                    BasePayment p = (BasePayment) lst.get(i);
                    // TODO: find a better way to avoid duplicating these magic numbers, to ensure they're always in sync
                    if (p.getPaymentType() == PactsConstants.COMPONENT_PAYMENT) counts[0]++;
                    if (p.getPaymentType() == PactsConstants.REVIEW_BOARD_PAYMENT) counts[1]++;
                    if (p.getPaymentType() == PactsConstants.REVIEW_BOARD_BONUS_PAYMENT) counts[3]++;

                    // [BUGR-1452] - add support for paying other project types
                    if (p.getPaymentType() == PactsConstants.CONCEPTUALIZATION_CONTEST_PAYMENT) counts[4]++;
                    if (p.getPaymentType() == PactsConstants.SPECIFICATION_CONTEST_PAYMENT) counts[5]++;
                    if (p.getPaymentType() == PactsConstants.ARCHITECTURE_PAYMENT) counts[6]++;
                    if (p.getPaymentType() == PactsConstants.TEST_SUITES_PAYMENT) counts[7]++;
                    if (p.getPaymentType() == PactsConstants.ASSEMBLY_PAYMENT) counts[8]++;
                    // [BUGR-1842] - add support for UI/RIA project types
                    if (p.getPaymentType() == PactsConstants.UI_PROTOTYPE_COMPETITION_PAYMENT) counts[9]++;
                    if (p.getPaymentType() == PactsConstants.RIA_BUILD_COMPETITION_PAYMENT) counts[10]++;
                    if (p.getPaymentType() == PactsConstants.RIA_COMPONENT_COMPETITION_PAYMENT) counts[11]++;

                    if (p.getPaymentType() == PactsConstants.TEST_SCENARIOS_PAYMENT) counts[12]++;

                    if (p.getPaymentType() == PactsConstants.COPILOT_PAYMENT) counts[13]++;

                    if (p.getPaymentType() == PactsConstants.SPECIFICATION_REVIEW_PAYMENT) counts[14]++;

		            if (p.getPaymentType() == PactsConstants.COPILOT_POSTING_PAYMENT) counts[15]++;

                    if (p.getPaymentType() == PactsConstants.CONTENT_CREATION_PAYMENT) counts[16]++;

                    ids.add(p.getId() + "");

                    List refer = bean.findPayments(CODER_REFERRAL_PAYMENT, p.getId());
                    if (refer.size() > 0) {
                        counts[2]++;
                        BasePayment pr = (BasePayment) refer.get(0);
                        ids.add(pr.getId() + "");
                    }
                }

                getRequest().setAttribute(PAYMENT_ID, ids);

                addError(PROJECT_ID, generateSuccessMessage(counts));
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

    /**
     * Generates a success message containing the counts for each type of payment generated.
     *
     * @param counts an array containing the number of payments generated for each payment type.
     * @return a String containing the success message.
     */
    private String generateSuccessMessage(int[] counts) {
        // TODO: find a better way to avoid duplicating these magic numbers, to ensure they're always in sync
        // [BUGR-1842] - add support for UI/RIA project types
        final int[] countIndex = new int[] { 0, 4, 5, 6, 8, 7, 1, 3, 2, 9, 10, 11, 12, 13, 14, 15, 16};
        final String[] countType = new String[] {
                " design/development", " conceptualization", " specification", " architecture",
                " assembly", "  test suites", " review board", " review board bonus", " referral",
                " UI prototype", " RIA Build", " RIA Component", " test scenarios", " copilot", " specification review", "copilot posting",
                " content creation"
        };

        StringBuffer sb = new StringBuffer();

        sb.append("Success: ");
        boolean first = true;
        for (int i = 0; i < countIndex.length; ++i) {
            if (counts[countIndex[i]] > 0) {
                if (first) {
                    first = false;
                } else {
                    sb.append(", ");
                }
                sb.append(counts[countIndex[i]]);
                sb.append(countType[i]);
            }
        }
        sb.append(" payments generated");

        return sb.toString();
    }
}
