package com.topcoder.apps.review.failuretests;

import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

import org.apache.cactus.ServletTestCase;

import java.rmi.*;

import java.sql.*;

import javax.naming.*;

import javax.rmi.PortableRemoteObject;

import javax.sql.*;


/**
 *
 *
 * @author $author$
 * @version $Revision$
 */
public class NullFailureCases extends FailureTestsBase {
    /**
     * Creates a new NullFailureCases object.
     *
     * @param name
     */
    public NullFailureCases(String name) {
        super(name);
    }

    /**
     *
     *
     * @throws Exception
     */
    public void testNullArgssaveProject() throws Exception {
        try {
            pt.saveProject(null, null, null);
        } catch (RuntimeException e) {


            return;
        }

        fail("expected a nullpointerexception.");

    }

    /**
     *
     *
     * @throws Exception
     */
    public void testNullArgsgetProjectInfo() throws Exception {
        try {
            pt.getProjectInfo(null);
        } catch (RuntimeException e) {


            return;
        }

        fail("expected a nullpointerexception.");

    }

    /**
     *
     *
     * @throws Exception
     */
    public void testNullArgsgetProject() throws Exception {
        try {
            pt.getProject(null, null);
        } catch (RuntimeException e) {


            return;
        }

        fail("expected a nullpointerexception.");

    }

    /**
     *
     *
     * @throws Exception
     */
    public void testNullArgsgetAggregation() throws Exception {
        try {
            dm.getAggregation(null, null);
        } catch (RuntimeException e) {


            return;
        }

        fail("expected a nullpointerexception.");

    }

    /**
     *
     *
     * @throws Exception
     */
    public void testNullArgsgetAggregationReview() throws Exception {
        try {
            dm.getAggregationReview(null, null);
        } catch (RuntimeException e) {


            return;
        }

        fail("expected a nullpointerexception.");

    }

    /**
     *
     *
     * @throws Exception
     */
    public void testNullArgsgetFinalFixes() throws Exception {
        try {
            dm.getFinalFixSubmission(null, null);
        } catch (RuntimeException e) {


            return;
        }

        fail("expected a nullpointerexception.");

    }

    /**
     *
     *
     * @throws Exception
     */
    public void testNullArgsgetFinalReview() throws Exception {
        try {
            dm.getFinalReview(null, null);
        } catch (RuntimeException e) {


            return;
        }

        fail("expected a nullpointerexception.");

    }

    /**
     *
     *
     * @throws Exception
     */
    public void testNullArgsgetInitialSubmission() throws Exception {
        try {
            dm.getInitialSubmissions(null, null);
        } catch (RuntimeException e) {


            return;
        }

        fail("expected a nullpointerexception.");

    }

    /**
     *
     *
     * @throws Exception
     */
    public void testNullArgsgetReviewScorecard() throws Exception {
        try {
            dm.getReviewScorecard(null, null);
        } catch (RuntimeException e) {


            return;
        }

        fail("expected a nullpointerexception.");

    }

    /**
     *
     *
     * @throws Exception
     */
    public void testNullArgsgetScreeningScorecard() throws Exception {
        try {
            dm.getScreeningScorecard(null, null);
        } catch (RuntimeException e) {


            return;
        }

        fail("expected a nullpointerexception.");

    }

    /**
     *
     *
     * @throws Exception
     */
    public void testNullArgsgetTestCaseReview() throws Exception {
        try {
            dm.getTestCaseReview(null, null);
        } catch (RuntimeException e) {


            return;
        }

        fail("expected a nullpointerexception.");

    }

    /**
     *
     *
     * @throws Exception
     */
    public void testNullArgssaveAggregation() throws Exception {
        try {
            dm.saveAggregation(null, null);
        } catch (RuntimeException e) {


            return;
        }

        fail("expected a nullpointerexception.");

    }

    /**
     *
     *
     * @throws Exception
     */
    public void testNullArgssaveAggregationReview() throws Exception {
        try {
            dm.saveAggregationReview(null, null);
        } catch (RuntimeException e) {


            return;
        }

        fail("expected a nullpointerexception.");

    }

    /**
     *
     *
     * @throws Exception
     */
    public void testNullArgssaveFinalFixSubmission() throws Exception {
        try {
            dm.saveFinalFixSubmission(null, null);
        } catch (RuntimeException e) {


            return;
        }

        fail("expected a nullpointerexception.");

    }

    /**
     *
     *
     * @throws Exception
     */
    public void testNullArgssaveFinalReview() throws Exception {
        try {
            dm.saveFinalReview(null, null);
        } catch (RuntimeException e) {


            return;
        }

        fail("expected a nullpointerexception.");

    }

    /**
     *
     *
     * @throws Exception
     */
    public void testNullArgssaveReviewScorecard() throws Exception {
        try {
            dm.saveReviewScorecard(null, null);
        } catch (RuntimeException e) {


            return;
        }

        fail("expected a nullpointerexception.");

    }

    /**
     *
     *
     * @throws Exception
     */
    public void testNullArgssaveScreeningScorecard() throws Exception {
        try {
            dm.saveScreeningScorecard(null, null);
        } catch (RuntimeException e) {
            return;
        }

        fail("expected a nullpointerexception.");

    }

    /**
     *
     *
     * @throws Exception
     */
    public void testNullArgssaveSubmission() throws Exception {
        try {
            dm.saveInitialSubmission(null, null);
        } catch (RuntimeException e) {


            return;
        }

        fail("expected a nullpointerexception.");

    }

    /**
     *
     *
     * @throws Exception
     */
    public void testNullArgssaveTestCaseReview() throws Exception {
        try {
            dm.saveTestCaseReview(null, null);
        } catch (RuntimeException e) {


            return;
        }

        fail("expected a nullpointerexception.");

    }
}
