/*
 * Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
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
 *     <tr>
 *         <td>Version 1.2 (Testing Competition Split Release Assembly 1.0)</td>
 *         <td>
 *           <ul>
 *               <li>Updated Application Testing to Test Suites.</li>
 *               <li>Added support for new Test Scenarios competitions.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *     <tr>
 *         <td>Version 1.3 (Specification Review Integration 1.0)</td>
 *         <td>
 *           <ul>
 *             <li>Updated <code>isProjectTypeSupported</code> methods to support specification review projects.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *     <tr>
 *         <td>Version 1.4 (Content Creation Contest Online Review and TC Site Integration Assembly version 1.0)</td>
 *         <td>
 *           <ul>
 *             <li>Updated {@link #isReviewBoardTypeSupported(String, boolean)} method.</li> 
 *           </ul>
 *         </td>
 *     </tr>
 *   </table>
 * </p>
 *
 * @author pulky, snow01, FireIce
 * @version 1.4
 */
public final class ReviewBoardHelper {

	/**
     * <p>Checks whether the specified review board type requested by client is currently supported by this controller
     * or not.</p>
     *
     * <p>Note: Specification review won't be supported by this call.</p>
     *
     * @param reviewBoardType a <code>String</code> referencing the review board type requested by client.
     * be included in the supported types for the validation.
     * @return <code>true</code> if specified review board type is supported; <code>false</code> otherwise.
	 * @since 1.3
     */
    public static boolean isReviewBoardTypeSupported(String reviewBoardType) {
        return isReviewBoardTypeSupported(reviewBoardType, false);
    }

    /**
     * <p>Checks whether the specified review board type requested by client is currently supported by this controller
     * or not. As of current version only Design, Development, Assembly, Architecture, Conceptualization, Specification,
     * Test Suites and Test Scenarios review boards and their specification reviews are supported.</p>
     *
     * Updated for Specification Review Integration 1.0
     *      - Added check for spec review project types.
     *
     * @param reviewBoardType a <code>String</code> referencing the review board type requested by client.
	 * @param includeSpecificationReviews a <code>boolean</code> specifying if specification review projects should
     * be included in the supported types for the validation.
     * @return <code>true</code> if specified review board type is supported; <code>false</code> otherwise.
     */
    public static boolean isReviewBoardTypeSupported(String reviewBoardType, boolean includeSpecificationReviews) {
        boolean supported = reviewBoardType.equals(String.valueOf(WebConstants.DESIGN_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.DEVELOPMENT_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.ASSEMBLY_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.ARCHITECTURE_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.CONCEPTUALIZATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.SPECIFICATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.TEST_SUITES_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.TEST_SCENARIOS_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.UI_PROTOTYPE_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.RIA_BUILD_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.RIA_COMPONENT_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.CONTENT_CREATION_PROJECT_TYPE));

		if (!supported && includeSpecificationReviews) {
            supported = reviewBoardType.equals(String.valueOf(WebConstants.DESIGN_SPECIFICATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.DEVELOPMENT_SPECIFICATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.ASSEMBLY_SPECIFICATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.ARCHITECTURE_SPECIFICATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.CONCEPTUALIZATION_SPECIFICATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.SPECIFICATION_SPECIFICATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.TEST_SUITES_SPECIFICATION_PROJECT_TYPE))
			|| reviewBoardType.equals(String.valueOf(WebConstants.TEST_SCENARIOS_SPECIFICATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.UI_PROTOTYPE_SPECIFICATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.RIA_BUILD_SPECIFICATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.RIA_COMPONENT_SPECIFICATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.CONTENT_CREATION_SPECIFICATION_PROJECT_TYPE));
        }

        return supported;
    }
}
