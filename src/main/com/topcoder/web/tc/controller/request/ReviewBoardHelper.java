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
 *         <td>Version 1.1 (Specification Review Signup Pages 1.0)</td>
 *         <td>
 *           <ul>
 *             <li>Updated <code>isProjectTypeSupported</code> methods to support specification review projects.</li>
 *           </ul>
 *         </td>
 *     </tr>
 *   </table>
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.1
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
     */
    public static boolean isReviewBoardTypeSupported(String reviewBoardType) {
        return isReviewBoardTypeSupported(reviewBoardType, false);
    }

    /**
     * <p>Checks whether the specified review board type requested by client is currently supported by this controller
     * or not.</p>
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
        || reviewBoardType.equals(String.valueOf(WebConstants.APPLICATION_TESTING_PROJECT_TYPE)); 
        
        if (!supported && includeSpecificationReviews) {
            supported = reviewBoardType.equals(String.valueOf(WebConstants.DESIGN_SPECIFICATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.DEVELOPMENT_SPECIFICATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.ASSEMBLY_SPECIFICATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.ARCHITECTURE_SPECIFICATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.CONCEPTUALIZATION_SPECIFICATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.SPECIFICATION_SPECIFICATION_PROJECT_TYPE))
            || reviewBoardType.equals(String.valueOf(WebConstants.APPLICATION_TESTING_SPECIFICATION_PROJECT_TYPE));
        }
        
        return supported;
    }
}
