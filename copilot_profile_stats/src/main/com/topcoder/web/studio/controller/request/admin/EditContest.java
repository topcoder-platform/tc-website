/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request.admin;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.dwload.CacheClearer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.validation.ListInput;
import com.topcoder.web.common.validation.NonEmptyValidator;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.ContestChannelDAO;
import com.topcoder.web.studio.dao.ContestPropertyDAO;
import com.topcoder.web.studio.dao.ContestTypeDAO;
import com.topcoder.web.studio.dao.FileTypeDAO;
import com.topcoder.web.studio.dao.MediumDAO;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestChannel;
import com.topcoder.web.studio.model.ContestConfig;
import com.topcoder.web.studio.model.ContestMilestonePrize;
import com.topcoder.web.studio.model.ContestMultiRoundInformation;
import com.topcoder.web.studio.model.ContestProperty;
import com.topcoder.web.studio.model.ContestStatus;
import com.topcoder.web.studio.model.ContestType;
import com.topcoder.web.studio.model.Medium;
import com.topcoder.web.studio.model.PrizeType;
import com.topcoder.web.studio.model.StudioFileType;
import com.topcoder.web.studio.validation.BooleanValidator;
import com.topcoder.web.studio.validation.ClientNameValidator;
import com.topcoder.web.studio.validation.ContestChannelValidator;
import com.topcoder.web.studio.validation.ContestConfigValueValidator;
import com.topcoder.web.studio.validation.ContestNameValidator;
import com.topcoder.web.studio.validation.ContestOverviewValidator;
import com.topcoder.web.studio.validation.ContestTypeValidator;
import com.topcoder.web.studio.validation.DigitalRunPointsValidator;
import com.topcoder.web.studio.validation.EndTimeValidator;
import com.topcoder.web.studio.validation.FileTypeValidator;
import com.topcoder.web.studio.validation.MaxHeightValidator;
import com.topcoder.web.studio.validation.MaxSubmissionsValidator;
import com.topcoder.web.studio.validation.MaxWidthValidator;
import com.topcoder.web.studio.validation.MediumValidator;
import com.topcoder.web.studio.validation.MilestoneDateValidator;
import com.topcoder.web.studio.validation.MilestonePrizeAmountValidator;
import com.topcoder.web.studio.validation.MinHeightValidator;
import com.topcoder.web.studio.validation.MinWidthValidator;
import com.topcoder.web.studio.validation.PrizeDescriptionValidator;
import com.topcoder.web.studio.validation.StartTimeValidator;
import com.topcoder.web.studio.validation.WinnerAnnouncementTimeValidator;

/**
 * <p>This class will process an administrator request to edit contest information.</p>
 *
 * <p>
 *   Version 1.1 (Studio Multi-Rounds Assembly - Studio Contest Details v1.0) Change notes:
 *   <ol>
 *     <li>Added Validations to new multi round specific fields.</li>
 *   </ol>
 * </p>
 *
 * @author dok, isv, pulky
 * @version 1.1
 */
public class EditContest extends Base {

    /**
     * <p>A <code>Integer</code> array listing the IDs of textual contest configuration properties which may be set for
     * the contest.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    private final static Integer[] ADDITIONAL_CONTEST_CONFIG_PROP_IDS
            = {ContestProperty.FULL_DESCRIPTION, ContestProperty.COLOR_REQUIREMENTS, ContestProperty.FONT_REQUIREMENTS,
               ContestProperty.SIZE_REQUIREMENTS, ContestProperty.CONTENT_REQUIREMENTS,
               ContestProperty.OTHER_REQUIREMENTS,
               ContestProperty.SUBMISSION_FILE_FORMAT, ContestProperty.WINNER_SELECTION, ContestProperty.ELIGIBILITY,
               ContestProperty.OTHER_FILE_TYPES};

    /**
     * <p>A <code>String</code> array listing the textual presentations of textual contest configuration properties
     * which may be set for the contest.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    private final static String[] ADDITIONAL_CONTEST_CONFIG_PROP_NAMES
            = {"full description", "color requirements", "font requirements", "size requirements",
               "content requirements", "other requirements", "submission file format", "winner selection",
               "eligibility", "other file types"};

    /**
     * <p>A <code>boolean</code> array listing the flags indicating whether the textual contest configuration properties
     * which may be set for the contest are required or not.</p>
     *
     * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1)
     */
    private final static boolean[] ADDITIONAL_CONTEST_CONFIG_REQ
            = {true, false, false, false, false, false, true, true, true, false};


    /**
     * This method executes the actual business logic for this processor.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.common.LongHibernateProcessor#dbProcessing()
     */
    protected void dbProcessing() throws Exception {

        inputValidation();

        TCRequest request = getRequest();
        String contestId = request.getParameter(Constants.CONTEST_ID);
        String name = request.getParameter(Constants.CONTEST_NAME);
        String startTime = request.getParameter(Constants.START_TIME);
        String endTime = request.getParameter(Constants.END_TIME);
        String contestStatusId = request.getParameter(Constants.CONTEST_STATUS_ID);
        String forumId = request.getParameter(Constants.FORUM_ID);
        String eventId = request.getParameter(Constants.EVENT_ID);
        String projectId = request.getParameter(Constants.PROJECT_ID_KEY);
        List fileTypes = request.getParameterValues(Constants.FILE_TYPE) == null ?
                Collections.EMPTY_LIST : Arrays.asList(request.getParameterValues(Constants.FILE_TYPE));
        String winnerAnnouncementTime = request.getParameter(Constants.WINNER_ANNOUNCEMENT_TIME);
        List<String> mediumTypes = getSelectedMediums();
        String contestTypeId = request.getParameter(Constants.CONTEST_TYPE);
        String contestChannelId = request.getParameter(Constants.CONTEST_CHANNEL);

        ContestStatus status = null;
        if ("".equals(StringUtils.checkNull(contestStatusId))) {
            addError(Constants.CONTEST_STATUS_ID, "Please choose a valid contest status.");
        } else {
            status = StudioDAOUtil.getFactory().getContestStatusDAO().find(new Integer(contestStatusId));
            if (status == null) {
                addError(Constants.CONTEST_STATUS_ID, "Please choose a valid contest status.");
            }
        }


        if (hasErrors()) {
            loadGeneralEditContestData();

            for (Integer aCONTEST_PROPS : CONTEST_PROPS) {
                setDefault(Constants.CONTEST_PROPERTY + aCONTEST_PROPS,
                        request.getParameter(Constants.CONTEST_PROPERTY + aCONTEST_PROPS));
            }

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
            setDefault(Constants.WINNER_ANNOUNCEMENT_TIME, winnerAnnouncementTime);
            setDefault(Constants.FILE_TYPE, fileTypes);
            setDefault(Constants.FILE_TYPE, fileTypes);
            for (String mediumId : mediumTypes) {
                setDefault(Constants.MEDIUM + mediumId, "true");
            }
            setDefault(Constants.CONTEST_TYPE, contestTypeId);
            setDefault(Constants.CONTEST_CHANNEL, contestChannelId);

            setDefault(Constants.CONTEST_FORMAT, request.getParameter(Constants.CONTEST_FORMAT));
            setDefault(Constants.MILESTONE_DATE, request.getParameter(Constants.MILESTONE_DATE));
            setDefault(Constants.CONTEST_ROUND_ONE_SPECIFICS,
                request.getParameter(Constants.CONTEST_ROUND_ONE_SPECIFICS));
            setDefault(Constants.CONTEST_ROUND_TWO_SPECIFICS,
                request.getParameter(Constants.CONTEST_ROUND_TWO_SPECIFICS));
            setDefault(Constants.MILESTONE_PRIZE_AMOUNT, request.getParameter(Constants.MILESTONE_PRIZE_AMOUNT));
            setDefault(Constants.NUMBER_MILESTONE_PRIZES, request.getParameter(Constants.NUMBER_MILESTONE_PRIZES));

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

                // Since TopCoder Studio Modifications Assembly - Save the ID of a user who have created the contest
                // (Req# 5.4)
                long createUserId = getUser().getId();
                contest.setCreateUserId(createUserId);
            }
            SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);
            contest.setName(name);
            contest.setStartTime(new Timestamp(sdf.parse(startTime).getTime()));
            contest.setEndTime(new Timestamp(sdf.parse(endTime).getTime()));
            contest.setWinnerAnnouncementTime(new Timestamp(sdf.parse(winnerAnnouncementTime).getTime()));
            contest.setStatus(status);
            if (!"".equals(StringUtils.checkNull(forumId))) {
                contest.setForumId(new Integer(forumId));
            }

            if (!"".equals(StringUtils.checkNull(projectId))) {
                contest.setProject(DAOUtil.getFactory().getProjectDAO().find(new Integer(projectId)));
            }

            ContestConfig currConfig;
            ContestPropertyDAO dao = StudioDAOUtil.getFactory().getContestPropertyDAO();
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
                String val = request.getParameter(Constants.CONTEST_PROPERTY + aCONTEST_PROPS);
                currConfig.setValue(StringUtils.checkNull(val).trim().length() == 0 ? null : val.trim());
            }

            FileTypeDAO fDao = StudioDAOUtil.getFactory().getFileTypeDAO();
            HashSet<StudioFileType> fts = new HashSet<StudioFileType>();
            for (Object fileType : fileTypes) {
                fts.add(fDao.find(new Integer((String) fileType)));
            }
            contest.setFileTypes(fts);
            if (!"".equals(StringUtils.checkNull(eventId))) {
                contest.setEvent(DAOUtil.getFactory().getEventDAO().find(new Long(eventId)));
            }

            // Since TopCoder Studio Modifications v2 Assembly (Req# 5.1.5) - the intended medium types are set
            MediumDAO mediumDAO = StudioDAOUtil.getFactory().getMediumDAO();
            Set<Medium> mediums = new HashSet<Medium>();
            for (String mediumId : mediumTypes) {
                mediums.add(mediumDAO.find(new Integer(mediumId)));
            }
            contest.setMediums(mediums);

            // Since TopCoder Studio Modifications Assembly (Req# 5.4)
            // Set the Require Preview Image and Require Preview File properties based on the contest type
            ContestTypeDAO contestTypeDAO = StudioDAOUtil.getFactory().getContestTypeDAO();
            ContestType contestType = contestTypeDAO.find(new Integer(contestTypeId));
            contest.setType(contestType);

            // Since TopCoder Studio Modifications Assembly v2 (Req# 5.5) - set the contest channel
            ContestChannelDAO contestChannelDAO = StudioDAOUtil.getFactory().getContestChannelDAO();
            ContestChannel contestChanel = contestChannelDAO.find(new Integer(contestChannelId));
            contest.setChannel(contestChanel);

            // populate multi round specific attributes
            String contestFormat = request.getParameter(Constants.CONTEST_FORMAT);
            if (ViewContest.MULTI_ROUND.equals(contestFormat)) {
                ContestMilestonePrize milestonePrize =
                    contest.getMilestonePrize() != null ? contest.getMilestonePrize() : new ContestMilestonePrize();

                String numberMilestonePrizes =
                    StringUtils.checkNull(request.getParameter(Constants.NUMBER_MILESTONE_PRIZES)).trim();
                if (numberMilestonePrizes.length() == 0 || numberMilestonePrizes.equals("0")) {
                    milestonePrize.setNumberOfSubmissions(0);
                    milestonePrize.setAmount(null);
                } else {
                    milestonePrize.setNumberOfSubmissions(
                            new Integer(request.getParameter(Constants.NUMBER_MILESTONE_PRIZES)));
                    milestonePrize.setAmount(new Float(request.getParameter(Constants.MILESTONE_PRIZE_AMOUNT)));
                }
                milestonePrize.setCreateDate(new Timestamp(new Date().getTime()));
                milestonePrize.setNumberOfSubmissions(
                    new Integer(request.getParameter(Constants.NUMBER_MILESTONE_PRIZES)));
                PrizeType prizeType = new PrizeType();
                prizeType.setId(PrizeType.MILESTONE);
                milestonePrize.setType(prizeType);

                if (milestonePrize.getId() == null) {
                    StudioDAOUtil.getFactory().getContestMilestonePrizeDAO().saveOrUpdate(milestonePrize);
                    contest.setMilestonePrize(milestonePrize);
                }

                ContestMultiRoundInformation multiRoundInformation =
                    contest.getMultiRoundInformation() != null ? contest.getMultiRoundInformation() :
                        new ContestMultiRoundInformation();
                multiRoundInformation.setMilestoneDate(
                    new Timestamp(sdf.parse(request.getParameter(Constants.MILESTONE_DATE)).getTime()));
                multiRoundInformation.setRoundOneIntroduction(
                    request.getParameter(Constants.CONTEST_ROUND_ONE_SPECIFICS));
                multiRoundInformation.setRoundTwoIntroduction(
                    request.getParameter(Constants.CONTEST_ROUND_TWO_SPECIFICS));

                if (multiRoundInformation.getId() == null) {
                    StudioDAOUtil.getFactory().getContestMultiRoundInformationDAO().saveOrUpdate(multiRoundInformation);
                    contest.setMultiRoundInformation(multiRoundInformation);
                }

                contest.setMultiRound(Boolean.TRUE);
            } else {
                contest.setMultiRound(Boolean.FALSE);
            }

            StudioDAOUtil.getFactory().getContestDAO().saveOrUpdate(contest);

            if (log.isDebugEnabled()) {
                closeConversation();
                beginCommunication();
                Contest myContest = StudioDAOUtil.getFactory().getContestDAO().find(contest.getId());
                log.debug("overview size after commit is " + (myContest.getOverview().getValue() == null ?
                        "null" : "" + myContest.getOverview().getValue().length()));
            }

            CacheClearer.removelike("studio_home_data");

            setNextPage(getSessionInfo().getServletPath() + "?" + Constants.MODULE_KEY +
                    "=ViewContest&" + Constants.CONTEST_ID + "=" + contest.getId());
            setIsNextPageInContext(false);
        }

    }

    /**
     * Private helper method to validate contest input
     *
     * @throws Exception if any error occurs
     */
    private void inputValidation() throws Exception {
        TCRequest request = getRequest();
        String name = request.getParameter(Constants.CONTEST_NAME);
        String startTime = request.getParameter(Constants.START_TIME);
        String endTime = request.getParameter(Constants.END_TIME);
        String overview = request.getParameter(Constants.CONTEST_PROPERTY + ContestProperty.CONTEST_OVERVIEW_TEXT);
        String prizeDesc = request.getParameter(Constants.CONTEST_PROPERTY + ContestProperty.PRIZE_DESCRIPTION);
        String minWidth = request.getParameter(Constants.CONTEST_PROPERTY + ContestProperty.MIN_WIDTH);
        String maxWidth = request.getParameter(Constants.CONTEST_PROPERTY + ContestProperty.MAX_WIDTH);
        String minHeight = request.getParameter(Constants.CONTEST_PROPERTY + ContestProperty.MIN_HEIGHT);
        String maxHeight = request.getParameter(Constants.CONTEST_PROPERTY + ContestProperty.MAX_HEIGHT);

        // Since Digital Run v2.0
        String digitalRunPoints = request.getParameter(Constants.CONTEST_PROPERTY + ContestProperty.DIGITAL_RUN_POINTS);

        String viewableSubmissions
                = request.getParameter(Constants.CONTEST_PROPERTY + ContestProperty.VIEWABLE_SUBMISSIONS);
        String viewableSubmitters
                = request.getParameter(Constants.CONTEST_PROPERTY + ContestProperty.VIEWABLE_SUBMITTERS);
        String maxSubmissions = request.getParameter(Constants.CONTEST_PROPERTY + ContestProperty.MAX_SUBMISSIONS);
        String forumId = request.getParameter(Constants.FORUM_ID);
        String eventId = request.getParameter(Constants.EVENT_ID);
        String projectId = request.getParameter(Constants.PROJECT_ID_KEY);

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

        ValidationResult digitalRunPointsResult = new DigitalRunPointsValidator().validate(new StringInput(digitalRunPoints));
        if (!digitalRunPointsResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.DIGITAL_RUN_POINTS, digitalRunPointsResult.getMessage());
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
            addError(Constants.CONTEST_PROPERTY + ContestProperty.VIEWABLE_SUBMISSIONS,
                     viewableSubmissionsResult.getMessage());
        }

        ValidationResult viewableSubmittersResult =
                new BooleanValidator().validate(new StringInput(viewableSubmitters));
        if (!viewableSubmittersResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.VIEWABLE_SUBMITTERS,
                     viewableSubmittersResult.getMessage());
        }

        ValidationResult maxSubmissionsResult =
                new MaxSubmissionsValidator().validate(new StringInput(maxSubmissions));
        if (!maxSubmissionsResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.MAX_SUBMISSIONS, maxSubmissionsResult.getMessage());
        }


        List a = request.getParameterValues(Constants.FILE_TYPE) == null ?
                Collections.EMPTY_LIST : Arrays.asList(request.getParameterValues(Constants.FILE_TYPE));
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

        // Since TopCoder Studio Modifications Assembly v2 (Req# 5.1.1) - the client name, winner announcement time,
        // medium types, additional config properties are validated
        String clientName = request.getParameter(Constants.CONTEST_PROPERTY + ContestProperty.CLIENT);
        ValidationResult clientNameResult = new ClientNameValidator().validate(new StringInput(clientName));
        if (!clientNameResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.CLIENT, clientNameResult.getMessage());
        }

        String winnerAnnouncementTime = request.getParameter(Constants.WINNER_ANNOUNCEMENT_TIME);
        ValidationResult winnerAnnouncementTimeResult
                = new WinnerAnnouncementTimeValidator(endTime).validate(new StringInput(winnerAnnouncementTime));
        if (!winnerAnnouncementTimeResult.isValid()) {
            addError(Constants.WINNER_ANNOUNCEMENT_TIME, winnerAnnouncementTimeResult.getMessage());
        }

        ValidationResult mediumResult = new MediumValidator().validate(new ListInput(getSelectedMediums()));
        if (!mediumResult.isValid()) {
            addError(Constants.MEDIUM, mediumResult.getMessage());
        }

        for (int i = 0; i < ADDITIONAL_CONTEST_CONFIG_PROP_IDS.length; i++) {
            Integer configId = ADDITIONAL_CONTEST_CONFIG_PROP_IDS[i];
            String propName = ADDITIONAL_CONTEST_CONFIG_PROP_NAMES[i];
            boolean propRequired = ADDITIONAL_CONTEST_CONFIG_REQ[i];
            String propValue = request.getParameter(Constants.CONTEST_PROPERTY + configId);
            ValidationResult configResult
                    = new ContestConfigValueValidator(propName, propRequired).validate(new StringInput(propValue));
            if (!configResult.isValid()) {
                addError(Constants.CONTEST_PROPERTY + configId, configResult.getMessage());
            }
        }

        String contestType = request.getParameter(Constants.CONTEST_TYPE);
        ValidationResult contestTypeResult = new ContestTypeValidator().validate(new StringInput(contestType));
        if (!contestTypeResult.isValid()) {
            addError(Constants.CONTEST_TYPE, contestTypeResult.getMessage());
        }

        String contestChannel = request.getParameter(Constants.CONTEST_CHANNEL);
        ValidationResult contestChannelResult = new ContestChannelValidator().validate(new StringInput(contestChannel));
        if (!contestChannelResult.isValid()) {
            addError(Constants.CONTEST_CHANNEL, contestChannelResult.getMessage());
        }

        String requirePreviewImage
                = request.getParameter(Constants.CONTEST_PROPERTY + ContestProperty.REQUIRE_PREVIEW_IMAGE);
        ValidationResult requirePreviewImageResult
                = new BooleanValidator().validate(new StringInput(requirePreviewImage));
        if (!requirePreviewImageResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.REQUIRE_PREVIEW_IMAGE,
                     requirePreviewImageResult.getMessage());
        }

        String requirePreviewFile
                = request.getParameter(Constants.CONTEST_PROPERTY + ContestProperty.REQUIRE_PREVIEW_FILE);
        ValidationResult requirePreviewFileResult
                = new BooleanValidator().validate(new StringInput(requirePreviewFile));
        if (!requirePreviewFileResult.isValid()) {
            addError(Constants.CONTEST_PROPERTY + ContestProperty.REQUIRE_PREVIEW_FILE,
                     requirePreviewFileResult.getMessage());
        }

        // validation for multi round contests
        String contestFormat = request.getParameter(Constants.CONTEST_FORMAT);
        if (ViewContest.MULTI_ROUND.equals(contestFormat)) {
            // validate milestone date only if start and end time are already ok
            if (startTimeResult.isValid() && endTimeResult.isValid()) {
                String milestoneDate = request.getParameter(Constants.MILESTONE_DATE);
                ValidationResult milestoneDateResult =
                    new MilestoneDateValidator(startTime, endTime).validate(new StringInput(milestoneDate));

                if (!milestoneDateResult.isValid()) {
                    addError(Constants.MILESTONE_DATE, milestoneDateResult.getMessage());
                }
            }

            // validate round one specifics
            String contestRoundOneSpecifics = request.getParameter(Constants.CONTEST_ROUND_ONE_SPECIFICS);
            ValidationResult contestRoundOneSpecificsResult =
                new NonEmptyValidator("Please enter the round one specifics text for this contest.").validate(
                    new StringInput(contestRoundOneSpecifics));

            if (!contestRoundOneSpecificsResult.isValid()) {
                addError(Constants.CONTEST_ROUND_ONE_SPECIFICS, contestRoundOneSpecificsResult.getMessage());
            }

            // validate round two specifics
            String contestRoundTwoSpecifics = request.getParameter(Constants.CONTEST_ROUND_TWO_SPECIFICS);
            ValidationResult contestRoundTwoSpecificsResult =
                new NonEmptyValidator("Please enter the round two specifics text for this contest.").validate(
                    new StringInput(contestRoundTwoSpecifics));
            
            if (!contestRoundTwoSpecificsResult.isValid()) {
                addError(Constants.CONTEST_ROUND_TWO_SPECIFICS, contestRoundTwoSpecificsResult.getMessage());
            }

            // validate milestone prize
            String milestonePrizeAmount = request.getParameter(Constants.MILESTONE_PRIZE_AMOUNT);
            String numberMilestonePrizes = request.getParameter(Constants.NUMBER_MILESTONE_PRIZES);
            ValidationResult milestonePrizeAmountResult =
                new MilestonePrizeAmountValidator(numberMilestonePrizes).validate(
                    new StringInput(milestonePrizeAmount));

            if (!milestonePrizeAmountResult.isValid()) {
                addError(Constants.MILESTONE_PRIZE_AMOUNT, milestonePrizeAmountResult.getMessage());
            }
        }
    }

    /**
     * <p>Gets the IDs of selected medium types based on the parameters of the current request.</p>
     *
     * @return a <code>List</code> listing the IDs of selected medium types.
     * @since TopCoder Studio Modifications v2 Assembly (Req# 5.1.5)
     */
    private List<String> getSelectedMediums() {
        List<String> result = new ArrayList<String>();
        TCRequest request = getRequest();
        Enumeration paramNames = request.getParameterNames();
        while (paramNames.hasMoreElements()) {
            String paramName = (String) paramNames.nextElement();
            if (paramName.startsWith(Constants.MEDIUM)) {
                String paramValue = request.getParameter(paramName);
                if ("on".equals(paramValue)) {
                    String mediumId = paramName.substring(Constants.MEDIUM.length());
                    result.add(mediumId);
                }
            }
        }
        return result;
    }
}
