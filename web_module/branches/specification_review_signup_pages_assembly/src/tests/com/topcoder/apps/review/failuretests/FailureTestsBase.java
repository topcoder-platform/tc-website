package com.topcoder.apps.review.failuretests;

import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.util.log.*;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

import org.apache.cactus.ServletTestCase;

import java.rmi.*;

import java.sql.*;

import javax.naming.*;

import javax.rmi.PortableRemoteObject;

import javax.sql.*;

import java.util.*;


/**
 *
 *
 * @author $author$
 * @version $Revision$
 */
public class FailureTestsBase extends ServletTestCase {
    protected DocumentManagerLocal dm = null;
    protected ProjectTrackerLocal pt = null;
    protected Context ctx = null;
    protected ReviewerResponsibility[] arrRevResp;
    protected Role[] arrRole;
    protected ProjectType[] arrProjType;
    protected PaymentStatus[] arrPayStatus;
    protected Phase[] arrPhase;

    protected Log _log;

    public FailureTestsBase(String name) {
        super(name);
        try {
            _log = LogFactory.getInstance().getLog("FailureTests");
        } catch (com.topcoder.util.log.LogException e) {
            System.out.println("Could not obtain logger");
        }
    }

    protected void log(String msg) {
        System.out.println(msg);
    }

    /**
     *
     *
     * @throws Exception
     */
    public void setUp() throws Exception {
        ctx = new InitialContext();
        DocumentManagerLocalHome dhome = (DocumentManagerLocalHome) PortableRemoteObject.narrow(ctx.lookup(
                "com.topcoder.apps.review.document.DocumentManagerLocalHome"),
                DocumentManagerLocalHome.class);
        dm = dhome.create();

        ProjectTrackerLocalHome phome = (ProjectTrackerLocalHome) PortableRemoteObject.narrow(ctx.lookup(
                "com.topcoder.apps.review.projecttracker.ProjectTrackerLocalHome"),
                ProjectTrackerLocalHome.class);
        pt = phome.create();


        ReviewerResponsibilityManager mgrReviewerResponsibilityManager = new ReviewerResponsibilityManager();
        mgrReviewerResponsibilityManager.refresh();
        arrRevResp = mgrReviewerResponsibilityManager.getResponsibilities();

        RoleManager mgrRoleManager = new RoleManager();
        mgrRoleManager.refresh();
        arrRole = mgrRoleManager.getRoles();

        ProjectTypeManager mgrProjectTypeManager = new ProjectTypeManager();
        mgrProjectTypeManager.refresh();
        arrProjType = mgrProjectTypeManager.getProjectTypes();

        PaymentStatusManager mgrPaymentStatusManager = new PaymentStatusManager();
        mgrPaymentStatusManager.refresh();
        arrPayStatus = mgrPaymentStatusManager.getPaymentStatuses();

        PhaseManager mgrPhaseManager = new PhaseManager();
        mgrPhaseManager.refresh();
        arrPhase = mgrPhaseManager.getPhases();

    }

    protected void tearDown() throws Exception {
        dm.remove();
        pt.remove();
    }
}
