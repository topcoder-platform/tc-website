/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import com.topcoder.apps.review.rboard.RBoardApplication;
import com.topcoder.apps.review.rboard.RBoardApplicationHome;
import com.topcoder.apps.review.rboard.RBoardRegistrationException;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.error.RequestRateExceededException;
import com.topcoder.web.common.throttle.Throttle;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.tc.Constants;
import com.topcoder.randomstringimg.InvalidConfigException;
import com.topcoder.randomstringimg.ObfuscationException;
import com.topcoder.randomstringimg.RandomStringImage;
import com.topcoder.util.spell.ConfigException;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import java.sql.Timestamp;
import java.util.Map;
import java.io.IOException;
import java.io.FileOutputStream;

/**
 * Process the user request to review a component.
 * <p/>
 * <p/>
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * RBoard related tasks were moved to a tcs bean.
 * </li>
 * </ol>
 * </p>
 * <p/>
 * Version 1.0.2 Change notes:
 * <ol>
 * <li>
 * Transaction management moved into RBoardApplication EJB.
 * </li>
 * </ol>
 * </p>
 *
 * @author dok, pulky
 * @version $Id$
 */
public class ProjectReviewApply extends Base {
    protected long projectId = 0;
    protected int phaseId = 0;
    RBoardApplication rBoardApplication = null;
    private static final Throttle throttle = new Throttle(2, 2000);

    protected void developmentProcessing() throws TCWebException {
        try {
            if (throttle.throttle(getRequest().getSession().getId())) {
                throw new RequestRateExceededException(getRequest().getSession().getId(), getUser().getUserName());
            }
            projectId = Long.parseLong(getRequest().getParameter(Constants.PROJECT_ID));
            phaseId = Integer.parseInt(getRequest().getParameter(Constants.PHASE_ID));
            int reviewTypeId = Integer.parseInt(getRequest().getParameter(Constants.REVIEWER_TYPE_ID));

            if (userIdentified()) {
                //we'll use the existing command, it's overkill, but we're probably not
                //talking high volume here
                Request r = new Request();
                r.setContentHandle("review_project_detail");
                r.setProperty(Constants.PROJECT_ID, StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID)));
                r.setProperty(Constants.PHASE_ID, StringUtils.checkNull(getRequest().getParameter(Constants.PHASE_ID)));
                Map results = getDataAccess().getData(r);
                ResultSetContainer detail = (ResultSetContainer) results.get("review_project_detail");
                int catalog = detail.getIntItem(0, "category_id");
                getRequest().setAttribute("phase_id", detail.getIntItem(0, "phase_id"));

                rBoardApplication = createRBoardApplication();
                nonTransactionalValidation(catalog, reviewTypeId);

                applicationProcessing((Timestamp) detail.getItem(0, "opens_on").getResultData(), reviewTypeId);

                // Put the terms text in the request.
                TermsOfUse terms = ((TermsOfUse) createEJB(getInitialContext(), TermsOfUse.class));
                setDefault(Constants.TERMS, terms.getText(Constants.REVIEWER_TERMS_ID, DBMS.COMMON_OLTP_DATASOURCE_NAME));
            } else {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }
        } catch (PermissionException pe) {
            throw pe;
        } catch (RBoardRegistrationException rbre) {
            throw new NavigationException(rbre.getMessage());
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected RBoardApplication createRBoardApplication() throws CreateException {
        InitialContext ctx = null;
        RBoardApplication rBoardApplication = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.JNDI_FACTORY, ApplicationServer.TCS_APP_SERVER_URL);
            if (log.isDebugEnabled()) {
                log.debug("context: " + ctx.getEnvironment().toString());
            }

            Object objRBoardApplication = ctx.lookup(RBoardApplicationHome.class.getName());
            RBoardApplicationHome rBoardApplicationHome =
                    (RBoardApplicationHome) PortableRemoteObject.narrow(objRBoardApplication, RBoardApplicationHome.class);

            rBoardApplication = rBoardApplicationHome.create();
        } catch (Exception e) {
            throw new CreateException("Could not find bean!" + e);
        } finally {
            close(ctx);
        }
        return rBoardApplication;
    }

    protected void applicationProcessing(Timestamp opensOn, int reviewTypeId) throws Exception {
        boolean primary = new Boolean(StringUtils.checkNull(getRequest().getParameter(Constants.PRIMARY_FLAG))).booleanValue();
        rBoardApplication.validateUserTrans(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, projectId, phaseId, getUser().getId(), opensOn, reviewTypeId, primary);

        UserTermsOfUse userTerms = ((UserTermsOfUse) createEJB(getInitialContext(), UserTermsOfUse.class));

        boolean agreed = userTerms.hasTermsOfUse(getUser().getId(),
                Constants.REVIEWER_TERMS_ID, DBMS.TCS_JTS_OLTP_DATASOURCE_NAME);

        setDefault(Constants.TERMS_AGREE, String.valueOf(agreed));

        loadCaptcha();
        setNextPage(Constants.REVIEWER_TERMS);
        setIsNextPageInContext(true);
    }

    protected void nonTransactionalValidation(int catalog, int reviewTypeId) throws Exception {
        rBoardApplication.validateUser(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, catalog, reviewTypeId, getUser().getId(), phaseId);
    }

    protected void loadCaptcha() throws IOException, InvalidConfigException, ObfuscationException, ConfigException {
        RandomStringImage rsi = new RandomStringImage(Constants.RANDOM_STRING_IMAGE_CONFIG);

        String fileName = getUser().getId() + "_" + System.currentTimeMillis() + ".png";
        FileOutputStream fos = new FileOutputStream(Constants.CAPTCHA_PATH + fileName);
        //so, i'm using the dictionary here because you can't use this component without configuring
        //a dictionary, i went to the effort of getting one, so might as well use it.
        //i'd rather just use a random string, but then i would need a keygenerator component
        //to do that, so i'll just use the dictionary
        String word = rsi.generateRandomFromDictionaries(fos);
        fos.close();
        getRequest().getSession().setAttribute(Constants.CAPTCHA_WORD, word);
        getRequest().setAttribute(Constants.CAPTCHA_FILE_NAME, fileName);
    }

}