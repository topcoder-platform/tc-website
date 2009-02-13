package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestConfig;
import com.topcoder.web.studio.model.ContestProperty;
import com.topcoder.web.studio.model.ContestStatus;
import com.topcoder.web.studio.validation.ContestNameValidator;
import com.topcoder.web.studio.validation.ContestOverviewValidator;
import com.topcoder.web.studio.validation.EndTimeValidator;
import com.topcoder.web.studio.validation.StartTimeValidator;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 17, 2006
 */
public class EditContest extends Base {

    protected void dbProcessing() throws Exception {
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);
        String name = getRequest().getParameter(Constants.CONTEST_NAME);
        String startTime = getRequest().getParameter(Constants.START_TIME);
        String endTime = getRequest().getParameter(Constants.END_TIME);
        String contestStatusId = getRequest().getParameter(Constants.CONTEST_STATUS_ID);
        String forumId = getRequest().getParameter(Constants.FORUM_ID);

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

        ContestStatus status = null;
        if ("".equals(StringUtils.checkNull(contestStatusId))) {
            addError(Constants.CONTEST_STATUS_ID, "Please choose a valid contest status.");
        } else {
            status = StudioDAOUtil.getFactory().getContestStatusDAO().find(new Integer(contestStatusId));
            if (status == null) {
                addError(Constants.CONTEST_STATUS_ID, "Please choose a valid contest status.");
            }
        }

        int fid = 0;
        if (!"".equals(StringUtils.checkNull(forumId))) {
            try {
                fid = Integer.parseInt(forumId);
                ResultSetContainer rsc = getForumList();
                boolean found = false;
                ResultSetContainer.ResultSetRow row;
                for (Iterator it = rsc.iterator(); it.hasNext() && !found;) {
                    row = (ResultSetContainer.ResultSetRow) it.next();
                    found = row.getLongItem("forum_id") == fid;
                }
                if (!found) {
                    addError(Constants.FORUM_ID, "Please choose a valid forum");
                }
            } catch (NumberFormatException e) {
                addError(Constants.FORUM_ID, "Please choose a valid forum");
            }
        }

        if (hasErrors()) {
            loadGeneralEditContestData();

            setDefault(Constants.CONTEST_PROPERTY + ContestProperty.CONTEST_OVERVIEW_TEXT, overview);
            setDefault(Constants.CONTEST_PROPERTY + ContestProperty.PRIZE_DESCRIPTION, prizeDesc);

            if (!"".equals(StringUtils.checkNull(contestId))) {
                setDefault(Constants.CONTEST_STATUS_ID,
                        StudioDAOUtil.getFactory().getContestDAO().find(new Long(contestId)).getStatus().getId());
            } else if (status != null) {
                setDefault(Constants.CONTEST_STATUS_ID, contestStatusId);
            } else {
                setDefault(Constants.CONTEST_STATUS_ID, ContestStatus.UNACTIVE);
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
                contest = StudioDAOUtil.getFactory().getContestDAO().find(new Long(contestId));
            } else {
                log.debug("new contest");
                contest = new Contest();
            }
            SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
            contest.setName(name);
            contest.setStartTime(new Timestamp(sdf.parse(startTime).getTime()));
            contest.setEndTime(new Timestamp(sdf.parse(endTime).getTime()));
            contest.setStatus(status);
            contest.setForumId(new Integer(fid));

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

            setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                    "=AdminViewContest&" + Constants.CONTEST_ID + "=" + contest.getId());
            setIsNextPageInContext(false);
        }

    }
}
