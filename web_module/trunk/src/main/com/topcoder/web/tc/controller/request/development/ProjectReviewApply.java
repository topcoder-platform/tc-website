package com.topcoder.web.tc.controller.request.development;

import com.topcoder.web.common.*;
import com.topcoder.web.ejb.rboard.RBoardUser;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.Map;

/**
 * @author dok
 * Date: Feb 12, 2004
 */
public class ProjectReviewApply extends Base {
    protected long projectId = 0;
    protected int phaseId = 0;

    protected void developmentProcessing() throws TCWebException {
        try {


            projectId = Long.parseLong(getRequest().getParameter(Constants.PROJECT_ID));
            phaseId = Integer.parseInt(getRequest().getParameter(Constants.PHASE_ID));

            if (userIdentified()) {

                RBoardUser rbu = (RBoardUser) createEJB(getInitialContext(), RBoardUser.class);

                //we'll use the existing command, it's overkill, but we're probably not
                //talking high volume here
                Request r = new Request();
                r.setContentHandle("review_project_detail");
                r.setProperty(Constants.PROJECT_ID, StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID)));
                r.setProperty(Constants.PHASE_ID, StringUtils.checkNull(getRequest().getParameter(Constants.PHASE_ID)));
                Map results = getDataAccess().getData(r);
                ResultSetContainer detail = (ResultSetContainer) results.get("review_project_detail");
                int catalog = detail.getIntItem(0, "category_id");

                if (catalog == Constants.JAVA_CATALOG_ID) {
                    if (rbu.canReviewJava(DBMS.TCS_OLTP_DATASOURCE_NAME, getUser().getId(), phaseId)) {
                        applicationProcessing();
                    } else {
                        throw new NavigationException("Sorry, you can not review this project because " +
                                "you are not a Java reviewer");
                    }
                } else if (catalog == Constants.DOT_NET_CATALOG_ID) {
                    if (rbu.canReviewDotNet(DBMS.TCS_OLTP_DATASOURCE_NAME, getUser().getId(), phaseId)) {
                        applicationProcessing();
                    } else {
                        throw new NavigationException("Sorry, you can not review this project because " +
                                "you are not a .Net reviewer");
                    }
                } else if (catalog == Constants.FLASH_CATALOG_ID) {
                    if (rbu.canReviewFlash(DBMS.TCS_OLTP_DATASOURCE_NAME, getUser().getId(), phaseId)) {
                        applicationProcessing();
                    } else {
                        throw new NavigationException("Sorry, you can not review this project because " +
                                "you are not a Flash reviewer");
                    }
                } else {
                    throw new TCWebException("unknown catalog found " + catalog);
                }

            } else {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }


        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected void applicationProcessing() throws TCWebException {
        try {
            UserTermsOfUse userTerms = ((UserTermsOfUse) createEJB(getInitialContext(), UserTermsOfUse.class));
            TermsOfUse terms = ((TermsOfUse) createEJB(getInitialContext(), TermsOfUse.class));

            boolean agreed = userTerms.hasTermsOfUse(getUser().getId(),
                    Constants.REVIEWER_TERMS_ID, DBMS.COMMON_OLTP_DATASOURCE_NAME);

            setDefault(Constants.TERMS, terms.getText(Constants.REVIEWER_TERMS_ID, DBMS.COMMON_OLTP_DATASOURCE_NAME));
            setDefault(Constants.TERMS_AGREE, String.valueOf(agreed));

            setNextPage(Constants.REVIEWER_TERMS);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
