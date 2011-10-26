/**
 * Copyright (c) 2006, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.apps.review.document.InitialSubmission;
import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.shared.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import com.topcoder.apps.review.document.Appeal;

/**
 * Helper class for setting appeal request attribute to handle appeal page layout.
 *
 * @author pulky
 * @version 1.0
 */
class AppealHelper {
    
    static private Logger log = Logger.getLogger(AppealHelper.class);

    /**
     * Constructor (inhibits outside instantiation).
     */
    private AppealHelper() {
    }

    /**
     * Sets appeals page attribute.
     *
     * @param appeal the appeal being handled
     * @param request the ServletRequest being processed
     * @param orpd the project data
     */
    public static void setAppealPageAttributes(Appeal appeal, HttpServletRequest request, OnlineReviewProjectData orpd) {
        // configured functionality to permit edition during appeals phase.
        boolean permitEditDuringAppeals;
        try {
            permitEditDuringAppeals = ConfigHelper.getAllowAppealEditing();
        } catch (Exception e) {
           log.info("Couldn't retrieve configuration for permission to edit appeals, using default: "
                + (ConfigHelper.ALLOW_APPEAL_EDITING_DEFAULT ? "true" : "false") + " reason: " + e.getMessage());
            permitEditDuringAppeals = ConfigHelper.ALLOW_APPEAL_EDITING_DEFAULT;
        }
        
        log.debug("permitEditDuringAppeals: " + permitEditDuringAppeals);

        // if project allows appeals responses during appeal phase, appeals can't be edited.
        boolean responseDuringAppeals = false;
        try {
            ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker();
            Project project = projectTracker.getProject(orpd.getProject(), orpd.getUser().getTCSubject());
            responseDuringAppeals = project.getResponseDuringAppeals();
        } catch (Exception e) {
            // ignore, default is false.
        }

        log.debug("responseDuringAppeals: " + responseDuringAppeals);
        
        if (responseDuringAppeals) {
            request.setAttribute("permitAppealsResponse", new Boolean(true));
        }

        permitEditDuringAppeals = permitEditDuringAppeals && !responseDuringAppeals;            

        long phaseId = orpd.getProject().getCurrentPhaseInstance().getPhase().getId();

        log.debug("permitEditDuringAppeals: " + permitEditDuringAppeals);
        log.debug("phaseId: " + phaseId);
        log.debug("appeal.getId(): " + appeal.getId());
        log.debug("appeal.getAppealer().getId(): " + appeal.getAppealer().getId());
        log.debug("orpd.getUser().getId(): " + orpd.getUser().getId());
        log.debug("appeal.getReviewer().getId(): " + appeal.getReviewer().getId());
        log.debug("Phase.ID_APPEALS: " + Phase.ID_APPEALS);
        log.debug("Phase.ID_APPEALS_RESPONSE: " + Phase.ID_APPEALS_RESPONSE);
        log.debug("appeal.isResolved(): " + appeal.isResolved());

        if (appeal.getAppealer().getId() == orpd.getUser().getId() &&
                (appeal.getId() == -1 || permitEditDuringAppeals) && phaseId == Phase.ID_APPEALS) {
            request.setAttribute("appealerEdit", new Boolean(true));
        } else if (appeal.getReviewer().getId() == orpd.getUser().getId() &&
            // if project is marked as allow responses during appeals phase, permit the edition.
            !appeal.isResolved() && (phaseId == Phase.ID_APPEALS_RESPONSE || (phaseId == Phase.ID_APPEALS &&
                responseDuringAppeals))) {
            request.setAttribute("reviewerEdit", new Boolean(true));
        }
    }
}

