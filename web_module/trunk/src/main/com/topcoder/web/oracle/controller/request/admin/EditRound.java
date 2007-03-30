package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.Round;
import com.topcoder.web.oracle.model.RoundStatus;

import java.text.SimpleDateFormat;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2007
 */
public class EditRound extends Base {

    protected void dbProcessing() throws Exception {

        String roundId = getRequest().getParameter(Constants.ROUND_ID);
        String name = getRequest().getParameter(Constants.ROUND_NAME);
        String startTime = getRequest().getParameter(Constants.START_TIME);
        String endTime = getRequest().getParameter(Constants.END_TIME);
        String roundStatusId = getRequest().getParameter(Constants.ROUND_STATUS_ID);

        inputValidation();

        RoundStatus status = null;
        if ("".equals(StringUtils.checkNull(roundStatusId))) {
            addError(Constants.ROUND_STATUS_ID, "Please choose a valid round status.");
        } else {
            status = OracleDAOUtil.getFactory().getRoundStatusDAO().find(new Integer(roundStatusId));
            if (status == null) {
                addError(Constants.ROUND_STATUS_ID, "Please choose a valid round status.");
            }
        }


        if (hasErrors()) {
            loadGeneralEditRoundData();

            for (int i = 0; i < ROUND_PROPS.length; i++) {
                setDefault(Constants.ROUND_PROPERTY + ROUND_PROPS[i],
                        getRequest().getParameter(Constants.ROUND_PROPERTY + ROUND_PROPS[i]));
            }

            if (!"".equals(StringUtils.checkNull(roundId))) {
                setDefault(Constants.ROUND_STATUS_ID,
                        OracleDAOUtil.getFactory().getRoundDAO().find(new Integer(roundId)).getStatus().getId());
            } else if (status != null) {
                setDefault(Constants.ROUND_STATUS_ID, roundStatusId);
            } else {
                setDefault(Constants.ROUND_STATUS_ID, RoundStatus.UNACTIVE);
            }

            setDefault(Constants.ROUND_ID, roundId);
            setDefault(Constants.ROUND_NAME, name);
            setDefault(Constants.START_TIME, startTime);
            setDefault(Constants.END_TIME, endTime);

            setNextPage("/admin/editRound.jsp");
            setIsNextPageInContext(true);
        } else {
            Round round;
            if (!"".equals(StringUtils.checkNull(roundId))) {
                log.debug("existing round");
                round = OracleDAOUtil.getFactory().getRoundDAO().find(new Integer(roundId));
            } else {
                log.debug("new round");
                round = new Round();
            }
            SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
            round.setName(name);
/*
            round.setStartTime(new Timestamp(sdf.parse(startTime).getTime()));
            round.setEndTime(new Timestamp(sdf.parse(endTime).getTime()));
            round.setStatus(status);

            ContestConfig currConfig;
            ContestPropertyDAO dao = StudioDAOUtil.getFactory().getContestPropertyDAO();
            ContestProperty curr;
            for (int i = 0; i < CONTEST_PROPS.length; i++) {
                curr = dao.find(CONTEST_PROPS[i]);
                if (contest.isNew() || contest.getConfig(curr) == null) {
                    currConfig = new ContestConfig();
                    currConfig.setContest(contest);
                    currConfig.setProperty(curr);
                    currConfig.getId().setContest(contest);
                    currConfig.getId().setProperty(curr);
                    contest.addConfig(currConfig);
                } else {
                    currConfig = contest.getConfig(curr);
                }
                String val = getRequest().getParameter(Constants.CONTEST_PROPERTY + CONTEST_PROPS[i]);
                currConfig.setValue(StringUtils.checkNull(val).trim().length() == 0 ? null : val.trim());
            }
*/


/*            StudioDAOUtil.getFactory().getContestDAO().saveOrUpdate(round);*/
            markForCommit();

            setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                    "=AdminViewRound&" + Constants.CONTEST_ID + "=" + round.getId());
            setIsNextPageInContext(false);
        }

    }

    private void inputValidation() throws Exception {
        String name = getRequest().getParameter(Constants.CONTEST_NAME);
        String startTime = getRequest().getParameter(Constants.START_TIME);
        String endTime = getRequest().getParameter(Constants.END_TIME);


        //validate
/*
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
*/


/*
        ValidationResult maxSubmissionsResult =
                new MaxSubmissionsValidator().validate(new StringInput(maxSubmissions));
        if (!maxSubmissionsResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.MAX_SUBMISSIONS, maxSubmissionsResult.getMessage());
        }
*/

    }
}
