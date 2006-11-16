/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.apps.review.document.TestCaseReview;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.User;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * Form bean for the test case review editing page.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */

public class TestCaseReviewForm extends ReviewForm {

    // --------------------------------------------------- Instance Variables

    /**
     * The test case reviews.
     */
    private TestCaseReview[] testCaseReviews = null;

    /**
     * The test case review beans for other reviewers.
     */
    private TestCaseReviewBean[] beansOther = null;

    /**
     * The test case review beans for the reviewer himself.
     */
    private TestCaseReviewBean[] beansSelf = null;

    // ----------------------------------------------------------- Properties

    /**
     * Return the related project.
     *
     * @return the related project.
     */
    public Project getProject() {
        return testCaseReviews[0].getProject();
    }

    /**
     * Return the test case reviews to enter.
     *
     * @return the test case reviews to enter.
     */
    public TestCaseReviewBean[] getOtherTestCaseReviews() {
        return beansOther;
    }

    /**
     * Return the test case reviews for the reviewer.
     *
     * @return the test case reviews for the reviewer.
     */
    public TestCaseReviewBean[] getSelfTestCaseReviews() {
        return beansSelf;
    }

    // --------------------------------------------------------- Public Methods

    /**
     * Validate the properties that have been set from this HTTP request,
     * and return an <code>ActionErrors</code> object that encapsulates any
     * validation errors that have been found.  If no errors are found, return
     * <code>null</code> or an <code>ActionErrors</code> object with no
     * recorded error messages.
     *
     * @param mapping The mapping used to select this instance
     * @param request The servlet request we are processing
     *
     * @return an <code>ActionErrors</code> object that encapsulates any
     * validation errors that have been found.
     */
    public ActionErrors validate(ActionMapping mapping,
                                 HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        setValid(true);

        if (beansOther != null) {
            for (int i = 0; i < beansOther.length; i++) {
                String status = beansOther[i].getTestCaseReviewStatus();
                String text = beansOther[i].getReviewText();

                beansOther[i].setValid(true);
                if (status == null || status.length() < 1) {
                    String errorKey = "error.testCaseApproval.required";
                    beansOther[i].setValid(false);
                    setValid(false);
                    errors.add("testCaseReviews[" + i + "]", new ActionError(errorKey));
                }

                if (text == null || text.length() < 1) {
                    String errorKey = "error.testCaseText.required";
                    beansOther[i].setValid(false);
                    setValid(false);
                    errors.add("testCaseReviews[" + i + "]", new ActionError(errorKey));
                }
            }
        }

        return errors;
    }

    // ------------------------------------------------------ Protected Methods

    /**
     * Creates the form bean from the test case reviews.
     *
     * @param testCaseReviews The test case reviews for creating the form bean.
     * @param user The login user.
     */
    protected void fromTestCaseReviews(TestCaseReview[] testCaseReviews, User user) {
        int num = 0;
        int otherIdx = 0;
        int selfIdx = 0;

        for (int i = 0; i < testCaseReviews.length; i++) {
            if (testCaseReviews[i].getReviewer().equals(user)) {
                num++;
            }
        }

        this.testCaseReviews = new TestCaseReview[num];
        this.beansOther = new TestCaseReviewBean[num];
        this.beansSelf = new TestCaseReviewBean[testCaseReviews.length - num];

        for (int i = 0; i < testCaseReviews.length; i++) {
            if (testCaseReviews[i].getReviewer().equals(user)) {
                this.testCaseReviews[otherIdx] = testCaseReviews[i];
                this.beansOther[otherIdx++] = new TestCaseReviewBean(testCaseReviews[i]);
            } else {
                this.beansSelf[selfIdx++] = new TestCaseReviewBean(testCaseReviews[i]);
            }
        }

        setId(testCaseReviews[0].getProject().getId());
    }

    /**
     * Creates the TestCaseReviewData from this form bean.
     *
     * @param orpd The OnlineReviewProjectData to create the TestCaseReviewData.
     * @return the TestCaseReviewData created from this form bean.
     */
    protected TestCaseReviewData toTestCaseReviewData(OnlineReviewProjectData orpd) {
        return new TestCaseReviewData(orpd, testCaseReviews);
    }
}
