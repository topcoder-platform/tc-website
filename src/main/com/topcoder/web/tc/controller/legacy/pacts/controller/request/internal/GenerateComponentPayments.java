/*
 * Copyright (C) 2004 - 2012 TopCoder Inc., All Rights Reserved.
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

    protected void businessProcessing() throws TCWebException {
        try {
            long currentUserId = getAuthentication().getActiveUser().getId();

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
                int[] counts = new int[7];
                log.debug("status type " + getRequest().getParameter(PROJECT_TERMINATION_STATUS));

                List resourceIds = new ArrayList();
                List lst = bean.generateComponentPayments(Long.parseLong(projectID), Integer.parseInt(projectTermStatus), client, resourceIds);
                lst = bean.addOnlineReviewPayments(lst, resourceIds, currentUserId);

                List<String> ids = new ArrayList<String>();

                for (int i = 0; i < lst.size(); i++) {
                    BasePayment p = (BasePayment) lst.get(i);
                    if (p.getPaymentType() == PactsConstants.CONTEST_PAYMENT) counts[0]++;
                    if (p.getPaymentType() == PactsConstants.CONTEST_MILESTONE_PAYMENT) counts[1]++;
                    if (p.getPaymentType() == PactsConstants.REVIEW_BOARD_PAYMENT) counts[3]++;
                    if (p.getPaymentType() == PactsConstants.COPILOT_PAYMENT) counts[4]++;
                    if (p.getPaymentType() == PactsConstants.SPECIFICATION_REVIEW_PAYMENT) counts[5]++;
                    if (p.getPaymentType() == PactsConstants.MARATHON_MATCH_NON_TAXABLE_PAYMENT) counts[6]++;

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

    /**
     * Generates a success message containing the counts for each type of payment generated.
     *
     * @param counts an array containing the number of payments generated for each payment type.
     * @return a String containing the success message.
     */
    private String generateSuccessMessage(int[] counts) {
        final String[] countType = new String[] {
            " contest prize", " contest milestone prize", " referral", " review board", " copilot", " specification review",
            " marathon match (non-taxable)"};

        StringBuffer sb = new StringBuffer();

        sb.append("Success: ");
        boolean first = true;
        for (int i = 0; i < countType.length; ++i) {
            if (counts[i] > 0) {
                if (first) {
                    first = false;
                } else {
                    sb.append(", ");
                }
                sb.append(counts[i]);
                sb.append(countType[i]);
            }
        }
        sb.append(" payments generated");

        return sb.toString();
    }
}
