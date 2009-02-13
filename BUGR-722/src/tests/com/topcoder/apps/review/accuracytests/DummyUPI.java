/*
 * TCS Online Review
 *
 * DummyUPI.java
 *
 * Copyright (c) 2003  TopCoder, Inc.  All rights reserved.
 */
package com.topcoder.apps.review.accuracytests;

import com.topcoder.apps.review.projecttracker.PhaseInstance;
import com.topcoder.apps.review.projecttracker.ProjectType;
import com.topcoder.apps.review.projecttracker.UserProjectInfo;
import com.topcoder.apps.review.projecttracker.UserRole;

/**
 * A special purpose subclass of UserProjectInfo intended
 * merely to convey a project id to the ProjectTracker bean for Project
 * retrieval.
 *
 * @author ThinMan
 * @version 1.0
 */
class DummyUPI extends UserProjectInfo {

    public DummyUPI(long projId) {
        super(projId, null, null, null, null, null, null, null);
    }

}
