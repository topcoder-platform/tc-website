package com.topcoder.web.oracle.controller.request.admin;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.oracle.Constants;
import com.topcoder.web.oracle.dao.OracleDAOUtil;
import com.topcoder.web.oracle.model.Contest;
import com.topcoder.web.oracle.model.ContestStatus;
import com.topcoder.web.oracle.model.ContestType;
import com.topcoder.web.oracle.validation.ContestNameValidator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2007
 */
public class EditContest extends Base {


    protected void dbProcessing() throws Exception {

        String contestId = getRequest().getParameter(Constants.CONTEST_ID);
        String name = getRequest().getParameter(Constants.CONTEST_NAME);
        String contestStatusId = getRequest().getParameter(Constants.CONTEST_STATUS_ID);
        String contestTypeId = getRequest().getParameter(Constants.CONTEST_TYPE_ID);

        inputValidation();


        ContestStatus status = OracleDAOUtil.getFactory().getContestStatusDAO().find(new Integer(contestStatusId));
        ContestType type = OracleDAOUtil.getFactory().getContestTypeDAO().find(new Integer(contestTypeId));

        if (hasErrors()) {
            loadGeneralEditContestData();

            if (!"".equals(StringUtils.checkNull(contestId))) {
                Contest c=OracleDAOUtil.getFactory().getContestDAO().find(new Integer(contestId));
                setDefault(Constants.CONTEST_STATUS_ID, c.getStatus().getId());
                setDefault(Constants.CONTEST_TYPE_ID,c.getType().getId());
            } else if (status != null) {
                setDefault(Constants.CONTEST_STATUS_ID, contestStatusId);
            } else {
                setDefault(Constants.CONTEST_STATUS_ID, ContestStatus.UNACTIVE);
            }

            if (type!=null) {
                setDefault(Constants.CONTEST_TYPE_ID, contestTypeId);
            }

            setDefault(Constants.CONTEST_ID, contestId);
            setDefault(Constants.CONTEST_NAME, name);

            setNextPage("/admin/editContest.jsp");
            setIsNextPageInContext(true);
        } else {
            Contest contest;
            if (!"".equals(StringUtils.checkNull(contestId))) {
                log.debug("existing contest");
                contest = OracleDAOUtil.getFactory().getContestDAO().find(new Integer(contestId));
            } else {
                log.debug("new contest");
                contest = new Contest();
            }
            contest.setName(name);
            contest.setStatus(status);
            contest.setType(type);


            OracleDAOUtil.getFactory().getContestDAO().saveOrUpdate(contest);

            setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                    "=AdminViewContest&" + Constants.CONTEST_ID + "=" + contest.getId());
            setIsNextPageInContext(false);
        }

    }

    private void inputValidation() throws Exception {
        String name = getRequest().getParameter(Constants.CONTEST_NAME);
        String contestStatusId = getRequest().getParameter(Constants.CONTEST_STATUS_ID);
        String contestTypeId = getRequest().getParameter(Constants.CONTEST_TYPE_ID);

        //validate
        ValidationResult nameResult = new ContestNameValidator().validate(new StringInput(name));

        if (!nameResult.isValid()) {
            addError(Constants.CONTEST_NAME, nameResult.getMessage());
        }

        ContestStatus status;
        if ("".equals(StringUtils.checkNull(contestStatusId))) {
            addError(Constants.CONTEST_STATUS_ID, "Please choose a valid contest status.");
        } else {
            status = OracleDAOUtil.getFactory().getContestStatusDAO().find(new Integer(contestStatusId));
            if (status == null) {
                addError(Constants.CONTEST_STATUS_ID, "Please choose a valid contest status.");
            }
        }

        ContestType type;
        if ("".equals(StringUtils.checkNull(contestTypeId))) {
            addError(Constants.CONTEST_TYPE_ID, "Please choose a valid contest type.");
        } else {
            type = OracleDAOUtil.getFactory().getContestTypeDAO().find(new Integer(contestTypeId));
            if (type == null) {
                addError(Constants.CONTEST_TYPE_ID, "Please choose a valid contest type.");
            }
        }


    }

}
