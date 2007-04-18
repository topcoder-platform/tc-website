package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.dao.RoundPropertyDAO;
import com.topcoder.web.oracle.dao.OracleDAOFactory;
import com.topcoder.web.oracle.model.*;
import com.topcoder.web.oracle.validation.EndTimeValidator;
import com.topcoder.web.oracle.validation.RoundNameValidator;
import com.topcoder.web.oracle.validation.StartTimeValidator;
import com.topcoder.web.oracle.validation.RoundStatusValidator;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2007
 */
public class EditRound extends Base {

    protected void dbProcessing() throws Exception {

        String roundId = getRequest().getParameter(Constants.ROUND_ID);
        String contestId = getRequest().getParameter(Constants.CONTEST_ID);
        String name = getRequest().getParameter(Constants.ROUND_NAME);
        String regStartTime = getRequest().getParameter(Constants.START_TIME+Phase.REGISTRATION);
        String regEndTime = getRequest().getParameter(Constants.END_TIME+Phase.REGISTRATION);
        String submissionStartTime = getRequest().getParameter(Constants.START_TIME+ Phase.SUBMISSION);
        String submissionEndTime = getRequest().getParameter(Constants.END_TIME+ Phase.SUBMISSION);
        String roundStatusId = getRequest().getParameter(Constants.ROUND_STATUS_ID);

        inputValidation();

        OracleDAOFactory f = OracleDAOUtil.getFactory();

        Contest c=null;
        Round round=null;

        if ("".equals(StringUtils.checkNull(roundId))) {
            c = f.getContestDAO().find(new Integer(contestId));
            if (c==null) {
                throw new NavigationException("Invalid contest specified.");
            }
        } else {
            round = f.getRoundDAO().find(new Integer(roundId));
            if (round==null) {
                throw new NavigationException("Invalid round specified.");
            }
        }

        if (hasErrors()) {
            loadGeneralEditRoundData();

            for (Integer aROUND_PROPS : ROUND_PROPS) {
                setDefault(Constants.ROUND_PROPERTY + aROUND_PROPS,
                        getRequest().getParameter(Constants.ROUND_PROPERTY + aROUND_PROPS));
            }
            RoundStatus status = f.getRoundStatusDAO().find(new Integer(roundStatusId));

            if (!"".equals(StringUtils.checkNull(roundId))) {
                setDefault(Constants.ROUND_STATUS_ID,
                        f.getRoundDAO().find(new Integer(roundId)).getStatus().getId());
            } else if (status != null) {
                setDefault(Constants.ROUND_STATUS_ID, roundStatusId);
            } else {
                setDefault(Constants.ROUND_STATUS_ID, RoundStatus.UNACTIVE);
            }

            setDefault(Constants.CONTEST_ID, contestId);
            setDefault(Constants.ROUND_ID, roundId);
            setDefault(Constants.ROUND_NAME, name);
            setDefault(Constants.START_TIME+Phase.REGISTRATION, regStartTime);
            setDefault(Constants.END_TIME+Phase.REGISTRATION, regEndTime);
            setDefault(Constants.START_TIME+Phase.SUBMISSION, submissionStartTime);
            setDefault(Constants.END_TIME+Phase.SUBMISSION, submissionEndTime);

            setNextPage("/admin/editRound.jsp");
            setIsNextPageInContext(true);
        } else {
            if (round==null) {
                log.debug("new round");
                round = new Round();
                c.addRound(round);
            }
            round.setName(name);

            SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);


            RoundPhase reg = round.getPhase(Phase.REGISTRATION);
            if (reg==null) {
                reg = new RoundPhase();
                reg.setPhase(f.getPhaseDAO().find(Phase.REGISTRATION));
                round.addPhase(reg);
            }

            reg.setStartTime(new Timestamp(sdf.parse(regStartTime).getTime()));
            reg.setEndTime(new Timestamp(sdf.parse(regEndTime).getTime()));


            RoundPhase submission = round.getPhase(Phase.SUBMISSION);
            if (submission==null) {
                submission = new RoundPhase();
                submission.setPhase(f.getPhaseDAO().find(Phase.SUBMISSION));
                round.addPhase(submission);
            }
            submission.setStartTime(new Timestamp(sdf.parse(submissionStartTime).getTime()));
            submission.setEndTime(new Timestamp(sdf.parse(submissionEndTime).getTime()));

            round.setStatus(f.getRoundStatusDAO().find(new Integer(roundStatusId)));

            RoundConfig currConfig;
            RoundPropertyDAO dao = f.getRoundPropertyDAO();
            RoundProperty curr;
            for (Integer prop : ROUND_PROPS) {
                curr = dao.find(prop);
                if (round.isNew() || !round.getConfigMap().containsKey(curr.getId())) {
                    currConfig = new RoundConfig();
                    currConfig.setProperty(curr);
                    round.addConfig(currConfig);
                } else {
                    currConfig = round.getConfig(curr.getId());
                }
                String val = getRequest().getParameter(Constants.ROUND_PROPERTY + prop);
                currConfig.setValue(StringUtils.checkNull(val).trim().length() == 0 ? null : val.trim());
            }

            //an attempt to get the round id populated so we can redirect correctly
            OracleDAOUtil.getFactory().getContestDAO().saveOrUpdate(c);

            setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                    "=AdminViewRound&" + Constants.ROUND_ID + "=" + round.getId()+"&" +
                    Constants.CONTEST_ID + "=" + round.getContest().getId());
            setIsNextPageInContext(false);
        }

    }

    


    private void inputValidation() throws Exception {
        String name = getRequest().getParameter(Constants.ROUND_NAME);
        String regStartTime = getRequest().getParameter(Constants.START_TIME+Phase.REGISTRATION);
        String regEndTime = getRequest().getParameter(Constants.END_TIME+Phase.REGISTRATION);
        String submissionStartTime = getRequest().getParameter(Constants.START_TIME+ Phase.SUBMISSION);
        String submissionEndTime = getRequest().getParameter(Constants.END_TIME+ Phase.SUBMISSION);
        String roundStatusId = getRequest().getParameter(Constants.ROUND_STATUS_ID);


        //validate
        ValidationResult nameResult = new RoundNameValidator().validate(new StringInput(name));
        ValidationResult regStartTimeResult = new StartTimeValidator(regEndTime).validate(new StringInput(regStartTime));
        ValidationResult regEndTimeResult = new EndTimeValidator(regStartTime).validate(new StringInput(regEndTime));
        ValidationResult subStartTimeResult = new StartTimeValidator(submissionEndTime).validate(new StringInput(submissionStartTime));
        ValidationResult subEndTimeResult = new EndTimeValidator(submissionStartTime).validate(new StringInput(submissionEndTime));
        ValidationResult roundStatusResult = new RoundStatusValidator().validate(new StringInput(roundStatusId));

        if (!nameResult.isValid()) {
            addError(Constants.ROUND_NAME, nameResult.getMessage());
        }
        if (!regStartTimeResult.isValid()) {
            addError(Constants.START_TIME+Phase.REGISTRATION, regStartTimeResult.getMessage());
        }
        if (!regEndTimeResult.isValid()) {
            addError(Constants.END_TIME+Phase.REGISTRATION, regEndTimeResult.getMessage());
        }
        if (!subStartTimeResult.isValid()) {
            addError(Constants.START_TIME+Phase.SUBMISSION, subStartTimeResult.getMessage());
        }
        if (!subEndTimeResult.isValid()) {
            addError(Constants.END_TIME+Phase.SUBMISSION, subEndTimeResult.getMessage());
        }
        if (!roundStatusResult.isValid()) {
            addError(Constants.ROUND_STATUS_ID, roundStatusResult.getMessage());
        }

    }
}
