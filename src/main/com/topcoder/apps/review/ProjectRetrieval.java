/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.AbstractScorecard;
import com.topcoder.apps.review.document.AbstractSubmission;
import com.topcoder.apps.review.document.TestCase;
import com.topcoder.apps.review.projecttracker.Project;

/**
 * Retrieval class used by the Model classes to return a project and the scorecards for that project.
 *
 * @author adic
 * @version 1.0
 */
public class ProjectRetrieval extends SuccessResult {

    /**
     * The project.
     */
    private Project project = null;

    /**
     * The scorecards.
     */
    private AbstractScorecard[] scorecards = null;

    /**
     * The submissions of this project.
     */
    private AbstractSubmission[] submissions = null;

    /**
     * The testcases of this project.
     */
    private TestCase[] testCases = null;

    /**
     * Array of scorecard template id:s
     */
    long[] templateId = null;

    /**
     * Constructor.
     *
     * @param project the project
     * @param scorecards the scorecards
     * @param submissions the submissions
     */
    ProjectRetrieval(Project project, AbstractScorecard[] scorecards, AbstractSubmission[] submissions,
                     TestCase[] testCases, long[] templateId) {
        this.project = project;
        this.scorecards = scorecards;
        this.submissions = submissions;
        this.testCases = testCases;
        this.templateId = templateId;
    }

    /**
     * Get the contained project.
     *
     * @return the contained project
     */
    public Project getProject() {
        return project;
    }

    /**
     * Get the contained scorecards.
     *
     * @return the contained scorecards
     */
    public AbstractScorecard[] getScorecards() {
        return scorecards;
    }

    /**
     * Get the contained submissions.
     *
     * @return the submissions of this project.
     */
    public AbstractSubmission[] getSubmissions() {
        return submissions;
    }

    /**
     * @return Returns the testCases.
     */
    public TestCase[] getTestCases() {
        return testCases;
    }

    /**
     * @return Returns the templateId.
     */
    public long[] getTemplateId() {
        return templateId;
    }
}

