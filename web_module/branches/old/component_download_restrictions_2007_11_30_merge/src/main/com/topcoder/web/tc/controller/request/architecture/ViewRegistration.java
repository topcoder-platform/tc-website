package com.topcoder.web.tc.controller.request.architecture;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.ComponentRegistrationServices.ComponentRegistrationServices;
import com.topcoder.web.ejb.ComponentRegistrationServices.ComponentRegistrationServicesLocal;
import com.topcoder.web.ejb.project.Project;
import com.topcoder.web.ejb.project.ProjectLocal;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUseLocal;
import com.topcoder.web.tc.Constants;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 5, 2006
 */
public class ViewRegistration extends BaseProcessor {

    private ComponentRegistrationServicesLocal regServices = null;

    protected int getProjectTypeId(long projectId) throws Exception {
        ProjectLocal pl = (ProjectLocal) createLocalEJB(getInitialContext(), Project.class);
        return pl.getProjectTypeId(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME);
    }

    protected void businessProcessing() throws TCWebException {

        try {
            
            if (!SecurityHelper.hasPermission(getLoggedInUser(), new ClassResource(this.getClass()))) {
                throw new PermissionException(getLoggedInUser(), new ClassResource(this.getClass()));
            }

            validation();

            if (getRequest().getAttribute(Constants.MESSAGE) == null) {
                setDefault(Constants.TERMS, getTerms());
                //we're assuming that if we're here, we got a valid project id
                setDefault(Constants.PROJECT_ID, getRequest().getParameter(Constants.PROJECT_ID));
                setNextPage("/dev/regTerms.jsp");
                setIsNextPageInContext(true);
            } else {
                setNextPage("/dev/message.jsp");
                setIsNextPageInContext(true);
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }

    protected String getTerms() throws Exception {
        TermsOfUseLocal t = (TermsOfUseLocal) createLocalEJB(getInitialContext(), TermsOfUse.class);
        return t.getText(Constants.ARCHITECTURE_TERMS_ID, DBMS.OLTP_DATASOURCE_NAME);

    }

    protected void validation() throws Exception {
        long projectId = 0;
        if (!StringUtils.isNumber(getRequest().getParameter(Constants.PROJECT_ID))) {
            throw new NavigationException("Invalid project specified");
        } else {
            projectId = Long.parseLong(getRequest().getParameter(Constants.PROJECT_ID));
        }

        int projectTypeId = getProjectTypeId(projectId);

        getRequest().setAttribute(Constants.PROJECT_TYPE_ID, new Integer(projectTypeId));

        if (isSuspended(getUser().getId())) {
            getRequest().setAttribute(Constants.MESSAGE, "Sorry, you are not eligible to participate because you are suspended.");
        } else if (!getRegEJB().isRegOpen(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME)) {
            getRequest().setAttribute(Constants.MESSAGE, "Sorry, registration is not currently open.");
        } else if (getRegEJB().isUserRegistered(projectId, getUser().getId(), DBMS.TCS_OLTP_DATASOURCE_NAME)) {
            getRequest().setAttribute(Constants.MESSAGE, "You have already registered for this contest.");
        }
    }

    protected ComponentRegistrationServicesLocal getRegEJB() throws Exception {
        if (regServices == null) {
            regServices = (ComponentRegistrationServicesLocal) createLocalEJB(getInitialContext(),
                    ComponentRegistrationServices.class);
        }
        return regServices;
    }

    private static boolean isSuspended(long userId) throws Exception {
        DataAccessInt dAccess = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("component_suspension");
        r.setProperty("uid", String.valueOf(userId));
        ResultSetContainer rsc = (ResultSetContainer) dAccess.getData(r).get("component_suspension");
        return !rsc.isEmpty();
    }
}



