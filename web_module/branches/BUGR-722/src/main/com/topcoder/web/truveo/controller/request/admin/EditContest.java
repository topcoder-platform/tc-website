package com.topcoder.web.truveo.controller.request.admin;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.validation.ListInput;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.truveo.Constants;
import com.topcoder.web.truveo.dao.ContestPropertyDAO;
import com.topcoder.web.truveo.dao.FileTypeDAO;
import com.topcoder.web.truveo.dao.TruveoDAOUtil;
import com.topcoder.web.truveo.model.Contest;
import com.topcoder.web.truveo.model.ContestConfig;
import com.topcoder.web.truveo.model.ContestProperty;
import com.topcoder.web.truveo.model.ContestStatus;
import com.topcoder.web.truveo.model.TruveoFileType;
import com.topcoder.web.truveo.validation.*;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

/**
 * @author dok
 * @version $Revision: 70395 $ Date: 2005/01/01 00:00:00
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
        String eventId = getRequest().getParameter(Constants.EVENT_ID);
        String projectId = getRequest().getParameter(Constants.PROJECT_ID_KEY);
        List fileTypes = getRequest().getParameterValues(Constants.FILE_TYPE) == null ?
                Collections.EMPTY_LIST : Arrays.asList(getRequest().getParameterValues(Constants.FILE_TYPE));

        inputValidation();

        ContestStatus status = null;
        if ("".equals(StringUtils.checkNull(contestStatusId))) {
            addError(Constants.CONTEST_STATUS_ID, "Please choose a valid contest status.");
        } else {
            status = TruveoDAOUtil.getFactory().getContestStatusDAO().find(new Integer(contestStatusId));
            if (status == null) {
                addError(Constants.CONTEST_STATUS_ID, "Please choose a valid contest status.");
            }
        }


        if (hasErrors()) {
            loadGeneralEditContestData();

            for (Integer aCONTEST_PROPS : CONTEST_PROPS) {
                setDefault(Constants.CONTEST_PROPERTY + aCONTEST_PROPS,
                        getRequest().getParameter(Constants.CONTEST_PROPERTY + aCONTEST_PROPS));
            }

            if (!"".equals(StringUtils.checkNull(contestId))) {
                setDefault(Constants.CONTEST_STATUS_ID,
                        TruveoDAOUtil.getFactory().getContestDAO().find(new Long(contestId)).getStatus().getId());
            } else if (status != null) {
                setDefault(Constants.CONTEST_STATUS_ID, contestStatusId);
            } else {
                setDefault(Constants.CONTEST_STATUS_ID, ContestStatus.UNACTIVE);
            }

            setDefault(Constants.CONTEST_ID, contestId);
            setDefault(Constants.CONTEST_NAME, name);
            setDefault(Constants.START_TIME, startTime);
            setDefault(Constants.END_TIME, endTime);
            setDefault(Constants.FILE_TYPE, fileTypes);

            setNextPage("/admin/editContest.jsp");
            setIsNextPageInContext(true);
        } else {
            Contest contest;
            if (!"".equals(StringUtils.checkNull(contestId))) {
                log.debug("existing contest");
                contest = TruveoDAOUtil.getFactory().getContestDAO().find(new Long(contestId));
            } else {
                log.debug("new contest");
                contest = new Contest();
            }
            SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
            contest.setName(name);
            contest.setStartTime(new Timestamp(sdf.parse(startTime).getTime()));
            contest.setEndTime(new Timestamp(sdf.parse(endTime).getTime()));
            contest.setStatus(status);
            if (!"".equals(StringUtils.checkNull(forumId))) {
                contest.setForumId(new Integer(forumId));
            }

            if (!"".equals(StringUtils.checkNull(projectId))) {
                contest.setProject(DAOUtil.getFactory().getProjectDAO().find(new Integer(projectId)));
            }

            ContestConfig currConfig;
            ContestPropertyDAO dao = TruveoDAOUtil.getFactory().getContestPropertyDAO();
            ContestProperty curr;
            for (Integer aCONTEST_PROPS : CONTEST_PROPS) {
                curr = dao.find(aCONTEST_PROPS);
                if (contest.getId() == null || contest.getConfig(curr) == null) {
                    currConfig = new ContestConfig();
                    currConfig.setProperty(curr);
                    contest.addConfig(currConfig);
                } else {
                    currConfig = contest.getConfig(curr);
                }
                String val = getRequest().getParameter(Constants.CONTEST_PROPERTY + aCONTEST_PROPS);
                currConfig.setValue(StringUtils.checkNull(val).trim().length() == 0 ? null : val.trim());
            }

            FileTypeDAO fDao = TruveoDAOUtil.getFactory().getFileTypeDAO();
            HashSet<TruveoFileType> fts = new HashSet<TruveoFileType>();
            for (Object fileType : fileTypes) {
                fts.add(fDao.find(new Integer((String) fileType)));
            }
            contest.setFileTypes(fts);
            if (!"".equals(StringUtils.checkNull(eventId))) {
                contest.setEvent(DAOUtil.getFactory().getEventDAO().find(new Long(eventId)));
            }

            TruveoDAOUtil.getFactory().getContestDAO().saveOrUpdate(contest);

            if (log.isDebugEnabled()) {
                closeConversation();
                beginCommunication();
                Contest myContest = TruveoDAOUtil.getFactory().getContestDAO().find(contest.getId());
                log.debug("overview size after commit is " + (myContest.getOverview().getValue() == null ?
                        "null" : "" + myContest.getOverview().getValue().length()));
            }


            setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                    "=ViewContest&" + Constants.CONTEST_ID + "=" + contest.getId());
            setIsNextPageInContext(false);
        }

    }

    private void inputValidation() throws Exception {
        String name = getRequest().getParameter(Constants.CONTEST_NAME);
        String startTime = getRequest().getParameter(Constants.START_TIME);
        String endTime = getRequest().getParameter(Constants.END_TIME);
        String overview = getRequest().getParameter(Constants.CONTEST_PROPERTY + ContestProperty.CONTEST_OVERVIEW_TEXT);
        String prizeDesc = getRequest().getParameter(Constants.CONTEST_PROPERTY + ContestProperty.PRIZE_DESCRIPTION);
        String minWidth = getRequest().getParameter(Constants.CONTEST_PROPERTY + ContestProperty.MIN_WIDTH);
        String maxWidth = getRequest().getParameter(Constants.CONTEST_PROPERTY + ContestProperty.MAX_WIDTH);
        String minHeight = getRequest().getParameter(Constants.CONTEST_PROPERTY + ContestProperty.MIN_HEIGHT);
        String maxHeight = getRequest().getParameter(Constants.CONTEST_PROPERTY + ContestProperty.MAX_HEIGHT);
        String viewableSubmissions = getRequest().getParameter(Constants.CONTEST_PROPERTY + ContestProperty.VIEWABLE_SUBMISSIONS);
        String viewableSubmitters = getRequest().getParameter(Constants.CONTEST_PROPERTY + ContestProperty.VIEWABLE_SUBMITTERS);
        String maxSubmissions = getRequest().getParameter(Constants.CONTEST_PROPERTY + ContestProperty.MAX_SUBMISSIONS);
        String forumId = getRequest().getParameter(Constants.FORUM_ID);
        String eventId = getRequest().getParameter(Constants.EVENT_ID);
        String projectId = getRequest().getParameter(Constants.PROJECT_ID_KEY);


        if (log.isDebugEnabled()) {
            log.debug("prize desc size " + (prizeDesc == null ? "null" : String.valueOf(prizeDesc.length())));
        }

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

        ValidationResult overviewResult = new ContestOverviewValidator().validate(new StringInput(overview));
        if (!overviewResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.CONTEST_OVERVIEW_TEXT, overviewResult.getMessage());
        }

        ValidationResult prizeDescResult = new PrizeDescriptionValidator().validate(new StringInput(prizeDesc));
        if (!prizeDescResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.PRIZE_DESCRIPTION, prizeDescResult.getMessage());
        }

        ValidationResult minWidthResult = new MinWidthValidator(maxWidth).validate(new StringInput(minWidth));
        if (!minWidthResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.MIN_WIDTH, minWidthResult.getMessage());
        }

        ValidationResult maxWidthResult = new MaxWidthValidator(minWidth).validate(new StringInput(maxWidth));
        if (!maxWidthResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.MAX_WIDTH, maxWidthResult.getMessage());
        }

        ValidationResult minHeightResult = new MinHeightValidator(maxHeight).validate(new StringInput(minHeight));
        if (!minHeightResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.MIN_HEIGHT, minHeightResult.getMessage());
        }

        ValidationResult maxHeightResult = new MaxHeightValidator(minHeight).validate(new StringInput(maxHeight));
        if (!maxHeightResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.MAX_HEIGHT, maxHeightResult.getMessage());
        }

        ValidationResult viewableSubmissionsResult =
                new BooleanValidator().validate(new StringInput(viewableSubmissions));
        if (!viewableSubmissionsResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.VIEWABLE_SUBMISSIONS, viewableSubmissionsResult.getMessage());
        }

        ValidationResult viewableSubmittersResult =
                new BooleanValidator().validate(new StringInput(viewableSubmitters));
        if (!viewableSubmittersResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.VIEWABLE_SUBMITTERS, viewableSubmittersResult.getMessage());
        }

        ValidationResult maxSubmissionsResult =
                new MaxSubmissionsValidator().validate(new StringInput(maxSubmissions));
        if (!maxSubmissionsResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.MAX_SUBMISSIONS, maxSubmissionsResult.getMessage());
        }


        List a = getRequest().getParameterValues(Constants.FILE_TYPE) == null ?
                Collections.EMPTY_LIST : Arrays.asList(getRequest().getParameterValues(Constants.FILE_TYPE));
        ValidationResult fileTypeResult = new FileTypeValidator().validate(new ListInput(a));
        if (!fileTypeResult.isValid()) {
            addError(Constants.FILE_TYPE, fileTypeResult.getMessage());
        }

        int fid;
        if (!"".equals(StringUtils.checkNull(forumId))) {
            try {
                fid = Integer.parseInt(forumId);
                ResultSetContainer rsc = getForumList();
                boolean found = false;
                ResultSetContainer.ResultSetRow row;
                for (Iterator<ResultSetContainer.ResultSetRow> it = rsc.iterator(); it.hasNext() && !found;) {
                    row = it.next();
                    found = row.getLongItem("forum_id") == fid;
                }
                if (!found) {
                    addError(Constants.FORUM_ID, "Please choose a valid forum");
                }
            } catch (NumberFormatException e) {
                addError(Constants.FORUM_ID, "Please choose a valid forum");
            }
        }

        if (!"".equals(StringUtils.checkNull(eventId))) {
            try {
                if (DAOUtil.getFactory().getEventDAO().find(new Long(eventId)) == null) {
                    addError(Constants.EVENT_ID, "Please choose a valid event");
                }
            } catch (NumberFormatException e) {
                addError(Constants.EVENT_ID, "Please choose a valid event");
            }
        }

        long pid = 0;
        if (!"".equals(StringUtils.checkNull(projectId))) {
            try {
                pid = Long.parseLong(projectId);
                ResultSetContainer rsc = getProjectList();
                boolean found = false;
                ResultSetContainer.ResultSetRow row;
                for (Iterator it = rsc.iterator(); it.hasNext() && !found;) {
                    row = (ResultSetContainer.ResultSetRow) it.next();
                    found = row.getLongItem("project_id") == pid;
                }
                if (!found) {
                    addError(Constants.PROJECT_ID_KEY, "Please choose a valid project");
                }
            } catch (NumberFormatException e) {
                addError(Constants.PROJECT_ID_KEY, "Please choose a valid project");
            }
        }

    }
}
