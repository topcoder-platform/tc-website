/*
 * CompContestDetails.java
 *
 * Created on July 27, 2005
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.tc.controller.request.compstats;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUseLocal;
import com.topcoder.web.tc.Constants;

/**
 * Updates the db to set that the user has agreed to the terms for downloading submissions.
 * Then it redirects to download submission page.
 *
 * @author cucu
 */
public class DownloadSubmissionAgreeTerms extends Base {

    protected void businessProcessing() throws TCWebException {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        try {
            String projId = getRequest().getParameter(Constants.PROJECT_ID);
            String coderId = getRequest().getParameter(Constants.CODER_ID);

            String termsAgree = getRequest().getParameter(Constants.TERMS_AGREE);
            if (!"on".equals(termsAgree)) {
                addError(Constants.TERMS_AGREE, "You must agree to the terms in order to continue.");
                setNextPage(Constants.DOWNLOAD_SUBMISSION_TERMS);;

                getRequest().setAttribute(Constants.PROJECT_ID, projId);
                getRequest().setAttribute(Constants.CODER_ID, coderId);

                setIsNextPageInContext(true);
                return;
            }


            // update the db
            UserTermsOfUseLocal userTerms = (UserTermsOfUseLocal) createLocalEJB(getInitialContext(), UserTermsOfUse.class);
            
            if (!userTerms.hasTermsOfUse(getUser().getId(), Constants.DOWNLOAD_SUBMISSION_TERMS_OF_USE_ID, DBMS.OLTP_DATASOURCE_NAME)) {
            	userTerms.createUserTermsOfUse(getUser().getId(), Constants.DOWNLOAD_SUBMISSION_TERMS_OF_USE_ID, DBMS.OLTP_DATASOURCE_NAME);
            }

            setNextPage(Constants.DOWNLOAD_SUBMISSION);
            getRequest().setAttribute(Constants.PROJECT_ID, projId);
            getRequest().setAttribute(Constants.CODER_ID, coderId);
            getRequest().setAttribute(Constants.PHASE_ID, getRequest().getParameter(Constants.PHASE_ID));
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


}
