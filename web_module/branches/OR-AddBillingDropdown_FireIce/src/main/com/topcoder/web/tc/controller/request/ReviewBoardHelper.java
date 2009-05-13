/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request;

import com.topcoder.web.common.WebConstants;

/**
 * <p>A simple helper class for Review Board support.</p>
 *
 * <p><b>Change Log:</b></p>
 * <p>
 *   <table>
 *     <tr>
 *         <td>Version 1.0 (TCS Release 2.2.2)</td>
 *         <td>
 *           <ul>
 *             <li>Added helper method for supported project types in review pages.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *     <tr>
 *         <td>Version 1.1 (Studio Coding In Online Review)</td>
 *         <td>
 *           <ul>
 *             <li>Updated <code>isReviewBoardTypeSupported</code> methods to support UI Prototype, RIA Build
 *                 and RIA Component competitions.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *   </table>
 * </p>
 *
 * @author pulky
 * @version 1.1
 */
public final class ReviewBoardHelper {

    /**
     * <p>Checks whether the specified review board type requested by client is currently supported by this controller
     * or not. As of current version only Design, Development, Assembly, Architecture, Conceptualization, Specification
     * and Application Testing review boards are supported.</p>
     *
     * @param reviewBoardType a <code>String</code> referencing the review board type requested by client.
     * @return <code>true</code> if specified review board type is supported; <code>false</code> otherwise.
     */
    public static boolean isReviewBoardTypeSupported(String reviewBoardType) {
        return reviewBoardType.equals(String.valueOf(WebConstants.DESIGN_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.DEVELOPMENT_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.ASSEMBLY_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.ARCHITECTURE_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.CONCEPTUALIZATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.SPECIFICATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.APPLICATION_TESTING_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.UI_PROTOTYPE_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.RIA_BUILD_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.RIA_COMPONENT_PROJECT_TYPE));
    }
}
