package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestConfig;
import com.topcoder.web.studio.model.ContestProperty;
import com.topcoder.web.studio.validation.ContestNameValidator;
import com.topcoder.web.studio.validation.ContestOverviewValidator;
import com.topcoder.web.studio.validation.EndTimeValidator;
import com.topcoder.web.studio.validation.StartTimeValidator;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class EditContest extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
        //todo forum id
        //todo status
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
        if (log.isDebugEnabled()) {
            log.debug("overview is : " + overview);
        }
        String prizeDesc = getRequest().getParameter(Constants.CONTEST_PROPERTY + ContestProperty.PRIZE_DESCRIPTION);
        if (log.isDebugEnabled()) {
            log.debug("prize desc is : " + prizeDesc);
        }

        ValidationResult overviewResult = new ContestOverviewValidator().validate(new StringInput(overview));
        if (!overviewResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.CONTEST_OVERVIEW_TEXT, overviewResult.getMessage());
        }

        ValidationResult prizeDescResult = new ContestOverviewValidator().validate(new StringInput(prizeDesc));
        if (!overviewResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.PRIZE_DESCRIPTION, prizeDescResult.getMessage());
        }


        if (hasErrors()) {
            getRequest().setAttribute("docTypes", StudioDAOUtil.getFactory().getDocumentTypeDAO().getDocumentTypes());

            setDefault(Constants.CONTEST_PROPERTY + ContestProperty.CONTEST_OVERVIEW_TEXT, overview);
            setDefault(Constants.CONTEST_PROPERTY + ContestProperty.PRIZE_DESCRIPTION, prizeDesc);

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
                contest = StudioDAOUtil.getFactory().getContestDAO().find(new Long(contestId));
            } else {
                log.debug("new contest");
                contest = new Contest();
            }
            SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
            contest.setName(name);
            contest.setStartTime(new Timestamp(sdf.parse(startTime).getTime()));
            contest.setEndTime(new Timestamp(sdf.parse(endTime).getTime()));

            ContestConfig overviewConfig;
            ContestProperty overviewProperty =
                    StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.CONTEST_OVERVIEW_TEXT);
            if (contest.isNew() || contest.getConfig(overviewProperty) == null) {
                overviewConfig = new ContestConfig();
                overviewConfig.setContest(contest);
                overviewConfig.setProperty(overviewProperty);
                overviewConfig.getId().setContest(contest);
                overviewConfig.getId().setProperty(overviewProperty);
                contest.addConfig(overviewConfig);
            } else {
                overviewConfig = contest.getConfig(overviewProperty);
            }
            if (log.isDebugEnabled()) {
                log.debug("setting value to " + overview);
            }
            overviewConfig.setValue(overview);


            ContestConfig prizeConfig;
            ContestProperty prizeProperty =
                    StudioDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.PRIZE_DESCRIPTION);
            if (contest.isNew() || contest.getConfig(prizeProperty) == null) {
                prizeConfig = new ContestConfig();
                prizeConfig.setContest(contest);
                prizeConfig.setProperty(prizeProperty);
                prizeConfig.getId().setContest(contest);
                prizeConfig.getId().setProperty(prizeProperty);
                contest.addConfig(prizeConfig);
            } else {
                prizeConfig = contest.getConfig(prizeProperty);
            }
            if (log.isDebugEnabled()) {
                log.debug("setting value to " + prizeDesc);
            }
            prizeConfig.setValue(prizeDesc);

            StudioDAOUtil.getFactory().getContestDAO().saveOrUpdate(contest);
            if (log.isDebugEnabled()) {
                log.debug("id is: " + contest.getId());
            }
            markForCommit();

            setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY + "=AdminViewContests");
            setIsNextPageInContext(false);
        }

    }
}
