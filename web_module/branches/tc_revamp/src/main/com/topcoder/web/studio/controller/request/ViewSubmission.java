/*
 * Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.util.Date;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.model.User;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.DAOFactory;
import com.topcoder.web.studio.dao.DAOUtil;
import com.topcoder.web.studio.dto.Project;
import com.topcoder.web.studio.dto.Resource;

/**
 * <p>This class will process a request to view contest submissions.</p> 
 * 
 * <p>
 *   Version 1.1 (Re-platforming Studio Release 3 Assembly) Change notes:
 *   <ol>
 *     <li>Updated the logic to use contests hosted in <code>tcs_catalog</code> database instead of
 *     <code>studio_oltp</code> database.</li>
 *   </ol>
 * </p>
 * 
 * <p>
 * Version 1.2 (Replatforming Studio Release 5) change notes:
 *   <ol>
 *     <li>Using the dto classes in com.topcoder.web.studio.dto package instead of in com.topcoder.web.common.model.comp package.</li>
 *   </ol>
 * </p>
 * 
 * @author dok, pvmagacho, TCSASSEMBER
 * @version 1.2
 */
public class ViewSubmission extends BaseSubmissionDataProcessor {
    /**
     * <p>Constructs new <code>ViewSubmission</code> instance. This implementation does nothing.</p>
     * 
     * @since 1.1
     */
    public ViewSubmission() {
    }

    /**
     * This method executes the actual business logic for this processor.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            DAOFactory factory = DAOUtil.getFactory();
            Long contestId;
            try {
                contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid Contest Specified");
            }

            Project contest = factory.getProjectDAO().find(contestId.intValue());
            Date now = new Date();
            if (now.before(contest.getStartTime()) ||
                    now.after(contest.getEndTime()) ||
                    !Project.STATUS_ACTIVE.equals(contest.getStatusId())) {
                throw new NavigationException("Inactive contest specified.");
            }

            User user = factory.getUserDAO().find(getUser().getId());

            Resource resource = RegistrationHelper.getSubmitterResource(contest, user.getId());
            if (resource == null) {
                throw new NavigationException("User not registered for the contest");
            }

            if ("on".equalsIgnoreCase(Constants.GLOBAL_AD_FLAG)) {
                getRequest().setAttribute("has_global_ad", PactsServicesLocator.getService().
                    hasGlobalAD(getUser().getId()));
            }

            setDefault(Constants.CONTEST_ID, contestId.toString());
            setDefault(Constants.SUBMISSION_RANK, "1");
            
            loadSubmissionData(resource, contest, factory.getSubmissionDAO(), factory.getUploadDAO());
            setNextPage("/submit.jsp");
            setIsNextPageInContext(true);
        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

    }
}
