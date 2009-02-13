package com.topcoder.web.tc.controller.request.tournament.tchs07;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public class SubmitRegistration extends ViewRegistration {

    protected void regProcessing(Event event, User user) throws Exception {

        String termsAgree = getRequest().getParameter(Constants.TERMS_AGREE);

        String ageInput = StringUtils.checkNull(getRequest().getParameter(AGE));
        String inCollegeInput = StringUtils.checkNull(getRequest().getParameter(IN_COLLEGE));
        String inHighSchoolInput = StringUtils.checkNull(getRequest().getParameter(IN_HIGH_SCHOOL));

        if (log.isDebugEnabled()) {
            log.debug("ageInput " + ageInput + " college " + inCollegeInput + " highschool " + inHighSchoolInput);
        }
        int age = 0;
        try {
            age = Integer.parseInt(ageInput);
        } catch (NumberFormatException e) {
            addError(AGE, "Please enter a valid number for your age.");
        }

        if ("".equals(inCollegeInput)) {
            addError(IN_COLLEGE, "Please respond to this question.");
        }

        if ("".equals(inHighSchoolInput)) {
            addError(IN_HIGH_SCHOOL, "Please respond to this question.");
        }

        if (!"on".equals(termsAgree)) {
            addError(Constants.TERMS_AGREE, "You must agree to the terms in order to continue.");
        }

        if (hasErrors()) {
            setDefault(Constants.TERMS_AGREE, String.valueOf("on".equals(termsAgree)));
            setDefault(AGE, ageInput);
            setDefault(IN_COLLEGE, inCollegeInput);
            setDefault(IN_HIGH_SCHOOL, inHighSchoolInput);
        } else {
            //todo store all their answers about age etc.
            UserDAO userDAO = DAOUtil.getFactory().getUserDAO();
            user.addTerms(DAOUtil.getFactory().getTermsOfUse().find(new Integer(getTermsId())));

            EventRegistration er = new EventRegistration();
            er.getId().setUser(user);
            er.getId().setEvent(event);
            er.setEligible(age <= 20 && age >= 13 && !"on".equals(inCollegeInput) && "on".equals(inHighSchoolInput));

            user.addEventRegistration(er);

            userDAO.saveOrUpdate(user);
            refreshCache();
        }

    }

    protected void setNextPage(Event event, User u) throws Exception {
        if (hasErrors()) {
            setNextPage("/tournaments/tchs07/terms.jsp");
            setIsNextPageInContext(true);
        } else {
            setNextPage("/tournaments/tchs07/termsSuccess.jsp");
            setIsNextPageInContext(true);
        }
    }

    protected void refreshCache() {
        try {
            CacheClient cc = CacheClientFactory.createCacheClient();
            Request r = new Request();
            r.setContentHandle("tchs07_registrants");
            cc.remove(r.getCacheKey());
        } catch (Exception ignore) {
            ignore.printStackTrace();
        }
    }


}
