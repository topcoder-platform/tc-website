/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;

/**
 * <p>A controller to handle the requests for displaying the list of active reviewers for the requested review board
 * type. The desired review board type is expected to be provided as {@link Constants#PROJECT_TYPE_ID} request
 * parameter.</p>
 *
 * <p><b>Change Log:</b></p>
 *
 * <p>
 *   <table>
 *     <tr>
 *         <td>TCS Release 2.2.0</td>
 *         <td>
 *           <ul>
 *             <li>Added public non-argument constructor to follow the current TC standards for code development.</li>
 *             <li>Fully documented the class to follow current TC standards for code documentation.</li>
 *             <li>Refactored the logic for referencing the review board types by client requests. Now the clients will
 *             pass project type ID instead of component project phase type ID to refer to review board type.</li>
 *             <li>Refactored the logic for handling the requests to split the logic for checking the supported review
 *             board types and mapping them to appropriate view into separate private methods.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *     <tr>
 *         <td>TCS Release 2.2.1</td>
 *         <td>
 *           <ul>
 *             <li>Added support for <code>Architecture</code> review board types.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *     <tr>
 *         <td>Version 1.3 (TCS Release 2.2.2)</td>
 *         <td>
 *           <ul>
 *             <li>Added support for Conceptualization, Specification and Application Testing project types.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *     <tr>
 *         <td>Version 1.4 (Studio Coding In Online Review)</td>
 *         <td>
 *           <ul>
 *             <li>Added support for UI Prototype, RIA Build and RIA Component competitions.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *   </table>
 * </p>
 *
 * @author dok, isv, pulky
 * @version 1.4
 */
public class ReviewBoard extends Base {

    /**
     * <p>Constructs new <code>ReviewBoard</code> instance. This implementation does nothing.</p>
     */
    public ReviewBoard() {
    }

    /**
     * <p>Handles the request for displaying the list of reviewers for the review board type provided as
     * {@link Constants#PROJECT_TYPE_ID} request parameter.</p>
     *
     * <p>Looks up for the list of reviewers for the requested review board type, binds it to request and forwards
     * to the corresponding JSP depending on requested review board type.</p>
     *
     * @throws TCWebException if an unexpected error occurs.
     * @throws NavigationException if requested review board type is not supported.
     */
    protected void businessProcessing() throws TCWebException {
        String projectTypeId = StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_TYPE_ID));
        if (ReviewBoardHelper.isReviewBoardTypeSupported(projectTypeId)) {
            Request r = new Request();
            r.setContentHandle("review_board_members");
            r.setProperty(Constants.PROJECT_TYPE_ID, projectTypeId);
            try {
                DataAccessInt dai = getDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME, true);
                getRequest().setAttribute("memberList", dai.getData(r).get("review_board_members"));
                String reviewBoardView = getReviewBoardView(projectTypeId);
                setNextPage(reviewBoardView);
                setIsNextPageInContext(true);
            } catch (TCWebException e) {
                throw e;
            } catch (Exception e) {
                throw new TCWebException(e);
            }
        } else {
            throw new NavigationException("Invalid project type specified " + projectTypeId);
        }
    }

    /**
     * <p>Gets the logical name for the view which is to be used for displaying the list of members of review board of
     * specified type requested by client.</p>
     *
     * @param reviewBoardType a <code>String</code> referencing the review board type requested by client.
     * @return a <code>String</code> referencing the view to be used for displaying the list of reviewers for specified
     *         review board.
     * @since TCS Release 2.2.0 (TCS-55)
     */
    private String getReviewBoardView(String reviewBoardType) {
        if (reviewBoardType.equals(String.valueOf(WebConstants.DESIGN_PROJECT_TYPE))) {
            return "/review_board/design.jsp";
        } else if (reviewBoardType.equals(String.valueOf(WebConstants.DEVELOPMENT_PROJECT_TYPE))) {
            return "/review_board/development.jsp";
        } else if (reviewBoardType.equals(String.valueOf(WebConstants.ASSEMBLY_PROJECT_TYPE))) {
            return "/review_board/assembly.jsp";
        } else if (reviewBoardType.equals(String.valueOf(WebConstants.ARCHITECTURE_PROJECT_TYPE))) {
            return "/review_board/architecture.jsp";
        } else {
            // we don't need to check for project types, they are already verified.
            return Constants.UNIFIED_MEET_REVIEW_BOARD_PAGE;
        }
    }
}
