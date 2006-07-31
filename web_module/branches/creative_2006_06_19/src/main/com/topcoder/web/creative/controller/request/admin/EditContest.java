package com.topcoder.web.creative.controller.request.admin;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.creative.Constants;
import com.topcoder.web.creative.dao.CreativeDAOUtil;
import com.topcoder.web.creative.model.Contest;
import com.topcoder.web.creative.model.ContestConfig;
import com.topcoder.web.creative.model.ContestPrize;
import com.topcoder.web.creative.model.ContestProperty;
import com.topcoder.web.creative.validation.*;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class EditContest extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);
        String name = getRequest().getParameter(Constants.CONTEST_NAME);
        String startTime = getRequest().getParameter(Constants.START_TIME);
        String endTime = getRequest().getParameter(Constants.END_TIME);

        //validate
        ValidationResult nameResult = new ContestNameValidator().validate(new StringInput(name));
        ValidationResult startTimeResult = new StartTimeValidator(endTime).validate(new StringInput(startTime));
        ValidationResult endTimeResult = new EndTimeValidator(startTime).validate(new StringInput(endTime));

        if (!nameResult.isValid()) {
            addError(Constants.CONTEST_NAME, nameResult.getMessage());
        }
        if (!startTimeResult.isValid()) {
            addError(Constants.START_TIME, startTimeResult.getMessage());
        }
        if (!endTimeResult.isValid()) {
            addError(Constants.END_TIME, endTimeResult.getMessage());
        }

        String overview = getRequest().getParameter(Constants.CONTEST_PROPERTY + ContestProperty.CONTEST_OVERVIEW_TEXT);
        String prizeDesc = getRequest().getParameter(Constants.PRIZE_DESCRIPTION + ContestProperty.PRIZE_DESCRIPTION);

        ValidationResult overviewResult = new ContestOverviewValidator().validate(new StringInput(overview));
        if (!overviewResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.CONTEST_OVERVIEW_TEXT, overviewResult.getMessage());
        }

        ValidationResult prizeDescResult = new ContestOverviewValidator().validate(new StringInput(prizeDesc));
        if (!overviewResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.PRIZE_DESCRIPTION, prizeDescResult.getMessage());
        }

        Enumeration paramNames = getRequest().getParameterNames();
        String param;
        HashMap prizes = new HashMap();
        while (paramNames.hasMoreElements()) {
            param = (String) paramNames.nextElement();
            if (param.startsWith(Constants.PRIZE_PLACE)) {
                String place = param.substring(Constants.PRIZE_PLACE.length());
                if (prizes.containsKey(place)) {
                    addError(param, "Duplicate prize");
                } else {
                    prizes.put(place, getRequest().getParameter(param));
                }
            }
        }

        Map.Entry me;
        for (Iterator it = prizes.entrySet().iterator(); it.hasNext();) {
            me = (Map.Entry) it.next();
            ValidationResult prizeResult = new PrizeValidator().validate(new StringInput((String) me.getValue()));
            if (!prizeResult.isValid()) {
                addError(Constants.PRIZE_PLACE + me.getKey(), prizeResult.getMessage());
            }
        }

        if (hasErrors()) {

            setDefault(Constants.CONTEST_PROPERTY + ContestProperty.CONTEST_OVERVIEW_TEXT, overview);
            setDefault(Constants.CONTEST_PROPERTY + ContestProperty.PRIZE_DESCRIPTION, prizeDesc);

            getRequest().setAttribute("prizeCount", new Integer(prizes.size()));
            Map.Entry me1;
            for (Iterator it = prizes.entrySet().iterator(); it.hasNext();) {
                me1 = (Map.Entry) it.next();
                setDefault(Constants.PRIZE_PLACE + me1.getKey(), me1.getValue());
            }

            setDefault(Constants.CONTEST_ID, contestId);
            setDefault(Constants.CONTEST_NAME, name);
            setDefault(Constants.START_TIME, startTime);
            setDefault(Constants.END_TIME, endTime);

            setNextPage("/admin/editContest.jsp");
            setIsNextPageInContext(true);
        } else {
            Contest contest;
            if (!"".equals(StringUtils.checkNull(contestId))) {
                log.debug("existing contest");
                contest = CreativeDAOUtil.getFactory().getContestDAO().find(new Long(contestId));
            } else {
                log.debug("new contest");
                contest = new Contest();
            }
            SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
            contest.setName(name);
            contest.setStartTime(new Timestamp(sdf.parse(startTime).getTime()));
            contest.setEndTime(new Timestamp(sdf.parse(endTime).getTime()));

            ContestConfig conf1 = new ContestConfig();
            conf1.setContest(contest);
            conf1.setProperty(CreativeDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.CONTEST_OVERVIEW_TEXT));
            conf1.setValue(overview);
            conf1.getId().setContest(contest);
            conf1.getId().setProperty(conf1.getProperty());

            ContestConfig conf2 = new ContestConfig();
            conf2.setContest(contest);
            conf2.setProperty(CreativeDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.PRIZE_DESCRIPTION));
            conf2.setValue(prizeDesc);
            conf2.getId().setContest(contest);
            conf2.getId().setProperty(conf2.getProperty());

            contest.addConfig(conf1);
            contest.addConfig(conf2);


            Map.Entry me1;
            for (Iterator it = prizes.entrySet().iterator(); it.hasNext();) {
                me1 = (Map.Entry) it.next();
                ContestPrize cp = new ContestPrize();
                cp.setAmount(new Float((String) me1.getValue()));
                cp.setPlace(new Integer((String) me1.getKey()));
                cp.setContest(contest);
                cp.getId().setContest(contest);
                cp.getId().setPlace(cp.getPlace());
                contest.addPrize(cp);
            }


            CreativeDAOUtil.getFactory().getContestDAO().saveOrUpdate(contest);
            if (log.isDebugEnabled()) {
                log.debug("id is: " + contest.getId());
            }
            markForCommit();

            setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY + "=AdminViewContests");
            setIsNextPageInContext(false);
        }

    }
}
