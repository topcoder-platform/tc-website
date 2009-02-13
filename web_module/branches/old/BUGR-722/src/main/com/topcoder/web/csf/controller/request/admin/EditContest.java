package com.topcoder.web.csf.controller.request.admin;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.validation.ListInput;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.csf.Constants;
import com.topcoder.web.csf.dao.CSFDAOUtil;
import com.topcoder.web.csf.dao.ContestPropertyDAO;
import com.topcoder.web.csf.dao.FileTypeDAO;
import com.topcoder.web.csf.model.Contest;
import com.topcoder.web.csf.model.ContestConfig;
import com.topcoder.web.csf.model.ContestProperty;
import com.topcoder.web.csf.model.ContestStatus;
import com.topcoder.web.csf.validation.*;
import org.hibernate.metadata.ClassMetadata;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
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
        String projectId = getRequest().getParameter(Constants.PROJECT_ID_KEY);
        List fileTypes = getRequest().getParameterValues(Constants.FILE_TYPE) == null ?
                Collections.EMPTY_LIST : Arrays.asList(getRequest().getParameterValues(Constants.FILE_TYPE));
        /*if (log.isDebugEnabled()) {
            for (Iterator it = fileTypes.iterator(); it.hasNext();) {
                log.debug("filetype: " + it.next());
            }
        }*/

        inputValidation();

        ContestStatus status = null;
        if ("".equals(StringUtils.checkNull(contestStatusId))) {
            addError(Constants.CONTEST_STATUS_ID, "Please choose a valid contest status.");
        } else {
            status = CSFDAOUtil.getFactory().getContestStatusDAO().find(new Integer(contestStatusId));
            if (status == null) {
                addError(Constants.CONTEST_STATUS_ID, "Please choose a valid contest status.");
            }
        }


        if (hasErrors()) {
            loadGeneralEditContestData();

            for (int i = 0; i < CONTEST_PROPS.length; i++) {
                setDefault(Constants.CONTEST_PROPERTY + CONTEST_PROPS[i],
                        getRequest().getParameter(Constants.CONTEST_PROPERTY + CONTEST_PROPS[i]));
            }

            if (!"".equals(StringUtils.checkNull(contestId))) {
                setDefault(Constants.CONTEST_STATUS_ID,
                        CSFDAOUtil.getFactory().getContestDAO().find(new Long(contestId)).getStatus().getId());
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
                //log.debug("existing contest");
                contest = CSFDAOUtil.getFactory().getContestDAO().find(new Long(contestId));
            } else {
                //log.debug("new contest");
                contest = new Contest();
            }
            SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
            contest.setName(name);
            contest.setStartTime(new Timestamp(sdf.parse(startTime).getTime()));
            contest.setEndTime(new Timestamp(sdf.parse(endTime).getTime()));
            contest.setStatus(status);
            if (forumId != null && !"".equals(StringUtils.checkNull(forumId))) {
                contest.setForumId(new Integer(forumId));
            }

            ContestConfig currConfig;
            ContestPropertyDAO dao = CSFDAOUtil.getFactory().getContestPropertyDAO();
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

            FileTypeDAO fDao = CSFDAOUtil.getFactory().getFileTypeDAO();
            HashSet fts = new HashSet();
            for (Iterator it = fileTypes.iterator(); it.hasNext();) {
                //log.debug("addVote a file type");
                fts.add(fDao.find(new Integer((String) it.next())));
            }
            contest.setFileTypes(fts);

            if (log.isDebugEnabled()) {
                log.debug("overview size " + (contest.getOverview().getValue() == null ? "null" : "" + contest.getOverview().getValue().length()));
            }

            ClassMetadata cmd = HibernateUtils.getFactory().getClassMetadata(Contest.class);

            for (int i = 0; i < cmd.getPropertyNames().length; i++) {
                log.debug("stuff: " + cmd.getPropertyType(cmd.getPropertyNames()[i]));
            }


            CSFDAOUtil.getFactory().getContestDAO().saveOrUpdate(contest);
            markForCommit();

            if (log.isDebugEnabled()) {
                closeConversation();
                beginCommunication();
                Contest myContest = CSFDAOUtil.getFactory().getContestDAO().find(contest.getId());
                log.debug("overview size after commit is " + (myContest.getOverview().getValue() == null ?
                        "null" : "" + myContest.getOverview().getValue().length()));
            }


            setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                    "=AdminViewContest&" + Constants.CONTEST_ID + "=" + contest.getId());
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
        String maxSubmissions = getRequest().getParameter(Constants.CONTEST_PROPERTY + ContestProperty.MAX_SUBMISSIONS);
        String forumId = getRequest().getParameter(Constants.FORUM_ID);
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
                new ViewableSubmissionsValidator().validate(new StringInput(viewableSubmissions));
        if (!viewableSubmissionsResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.VIEWABLE_SUBMISSIONS, viewableSubmissionsResult.getMessage());
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
