/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import java.util.Set;

/**
 * Result class used by the Model classes when admin tries
 * to assign a submitter as reviewer.
 *
 * @author FatClimber
 * @version 1.0
 */
public class SubmitterRemovalResult extends SuccessResult {
    private Set submitterRemovalSet;

    /**
     *
     */
    public SubmitterRemovalResult(Set submitterRemovalSet) {
        super();
        this.submitterRemovalSet = submitterRemovalSet;
    }

    /**
     * @return Returns the submitterRemovalSet.
     */
    public Set getSubmitterRemovalSet() {
        return submitterRemovalSet;
    }

}
