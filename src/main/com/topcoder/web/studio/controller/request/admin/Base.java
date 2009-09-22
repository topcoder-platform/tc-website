/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request.admin;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.tag.ListSelectTag;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.ContestPropertyDAO;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestConfig;
import com.topcoder.web.studio.model.ContestMilestonePrize;
import com.topcoder.web.studio.model.ContestMultiRoundInformation;
import com.topcoder.web.studio.model.ContestProperty;
import com.topcoder.web.studio.model.Document;
import com.topcoder.web.studio.model.Medium;
import com.topcoder.web.studio.model.StudioFileType;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Set;

/**
 * <p>This abstract class provides base functionality for studio administration pages.
 *
 * <p>
 *   Version 1.1 (Studio Multi-Rounds Assembly - Studio Contest Details v1.0) Change notes:
 *   <ol>
 *     <li>New fields were added to <code>loadEditContestData</code> to display stored information.</li>
 *     <li>Contest Format default was added to <code>loadGeneralEditContestData</code>.</li>
 *   </ol>
 * </p>
 *
 * @author dok, isv, pulky
 * @version 1.1
 */
public abstract class Base extends ShortHibernateProcessor {

    /**
     * <p>An <code>Integer</code> array listing the IDs of a contest properties</p>
     *
     * @since 1.0
     */
    protected static final Integer[] CONTEST_PROPS
            = {ContestProperty.MIN_HEIGHT, ContestProperty.MAX_HEIGHT, ContestProperty.MIN_WIDTH,
            ContestProperty.MAX_WIDTH, ContestProperty.CONTEST_OVERVIEW_TEXT, ContestProperty.PRIZE_DESCRIPTION,
            ContestProperty.VIEWABLE_SUBMISSIONS, ContestProperty.MAX_SUBMISSIONS,
            ContestProperty.VIEWABLE_SUBMITTERS, ContestProperty.CLIENT, ContestProperty.FULL_DESCRIPTION,
            ContestProperty.COLOR_REQUIREMENTS, ContestProperty.FONT_REQUIREMENTS, ContestProperty.SIZE_REQUIREMENTS,
            ContestProperty.CONTENT_REQUIREMENTS, ContestProperty.OTHER_REQUIREMENTS,
            ContestProperty.SUBMISSION_FILE_FORMAT, ContestProperty.WINNER_SELECTION, ContestProperty.ELIGIBILITY,
            ContestProperty.OTHER_FILE_TYPES, ContestProperty.REQUIRE_PREVIEW_IMAGE,
            ContestProperty.REQUIRE_PREVIEW_FILE, ContestProperty.DIGITAL_RUN_POINTS};


    /**
     * This method loads all the general data required to present the contest edition page
     *
     * @param contest the contest being edited
     * @throws Exception if any error occurs
     */
    protected void loadGeneralEditContestData() throws Exception {
        getRequest().setAttribute("docTypes", StudioDAOUtil.getFactory().getDocumentTypeDAO().getDocumentTypes());
        getRequest().setAttribute("contestStatuses", StudioDAOUtil.getFactory().getContestStatusDAO().getContestStatuses());
        getRequest().setAttribute("fileTypes", StudioDAOUtil.getFactory().getFileTypeDAO().getFileTypes());

        getRequest().setAttribute("forums", getForumList());
        // 2/10/2009 - changed event type from studio to generic tournament id
        getRequest().setAttribute("events", DAOUtil.getFactory().getEventDAO().getEvents(EventType.TOURNAMENT_ID));

        ArrayList<ListSelectTag.Option> viewSubmissionAnswers = new ArrayList<ListSelectTag.Option>();
        viewSubmissionAnswers.add(new ListSelectTag.Option(String.valueOf(true), "Yes"));
        viewSubmissionAnswers.add(new ListSelectTag.Option(String.valueOf(false), "No"));
        getRequest().setAttribute("viewSubmissionAnswers", viewSubmissionAnswers);

        ArrayList<ListSelectTag.Option> viewSubmittersAnswers = new ArrayList<ListSelectTag.Option>();
        viewSubmittersAnswers.add(new ListSelectTag.Option(String.valueOf(false), "No"));
        viewSubmittersAnswers.add(new ListSelectTag.Option(String.valueOf(true), "Yes"));
        getRequest().setAttribute("viewSubmitterAnswers", viewSubmittersAnswers);

        getRequest().setAttribute("projects", getProjectList());

        getRequest().setAttribute("prizeTypes", StudioDAOUtil.getFactory().getPrizeTypeDAO().getPrizeTypes());

        // Since TopCoder Studio Modifications Assembly v2 - a list of available medium types, contest types, contest
        // channels, options for require preview image and file selections are bound to request
        getRequest().setAttribute("mediums", StudioDAOUtil.getFactory().getMediumDAO().findAll());
        getRequest().setAttribute("contestTypes", StudioDAOUtil.getFactory().getContestTypeDAO().findAll());
        getRequest().setAttribute("contestChannels", StudioDAOUtil.getFactory().getContestChannelDAO().findAll());

        ArrayList<ListSelectTag.Option> requirePreviewImageAnswers = new ArrayList<ListSelectTag.Option>();
        requirePreviewImageAnswers.add(new ListSelectTag.Option(String.valueOf(true), "Yes"));
        requirePreviewImageAnswers.add(new ListSelectTag.Option(String.valueOf(false), "No"));
        getRequest().setAttribute("requirePreviewImageAnswers", requirePreviewImageAnswers);

        ArrayList<ListSelectTag.Option> requirePreviewFileAnswers = new ArrayList<ListSelectTag.Option>();
        requirePreviewFileAnswers.add(new ListSelectTag.Option(String.valueOf(true), "Yes"));
        requirePreviewFileAnswers.add(new ListSelectTag.Option(String.valueOf(false), "No"));
        getRequest().setAttribute("requirePreviewFileAnswers", requirePreviewFileAnswers);

        // single round contest format by default
        setDefault(Constants.CONTEST_FORMAT, ViewContest.SINGLE_ROUND);
    }

    protected ResultSetContainer getForumList() throws Exception {
        Request r = new Request();
        r.setContentHandle("forum_list");
        DataAccessInt da = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        return da.getData(r).get("forum_list");

    }

    /**
     * This method loads all the data required to present the contest edition page for an existing contest
     *
     * @param contest the contest being edited
     * @throws Exception if any error occurs
     */
    protected void loadEditContestData(Contest contest) throws Exception {
        if (contest == null) {
            throw new IllegalArgumentException("null contest specified");
        }
        loadGeneralEditContestData();
        getRequest().setAttribute("contest", contest);

        SimpleDateFormat sdf = new SimpleDateFormat(Constants.JAVA_DATE_FORMAT);

        ContestPropertyDAO dao = StudioDAOUtil.getFactory().getContestPropertyDAO();
        ContestConfig temp;
        for (Integer aCONTEST_PROPS : CONTEST_PROPS) {
            temp = contest.getConfig(dao.find(aCONTEST_PROPS));
            if (temp != null) {
                setDefault(Constants.CONTEST_PROPERTY + aCONTEST_PROPS, temp.getValue());
            }
        }

        Set a = contest.getFileTypes();
        ArrayList<String> fileTypes = new ArrayList<String>(a.size());
        for (Object anA : a) {
            fileTypes.add(((StudioFileType) anA).getId().toString());
        }
        setDefault(Constants.FILE_TYPE, fileTypes);

        setDefault(Constants.CONTEST_STATUS_ID, contest.getStatus().getId());
        setDefault(Constants.CONTEST_ID, contest.getId());
        if (contest.getEvent() != null) {
            setDefault(Constants.EVENT_ID, contest.getEvent().getId());
        }
        setDefault(Constants.CONTEST_NAME, contest.getName());
        setDefault(Constants.START_TIME, sdf.format(contest.getStartTime()));
        setDefault(Constants.END_TIME, sdf.format(contest.getEndTime()));

        if (contest.getProject() != null) {
            setDefault(Constants.PROJECT_ID_KEY, contest.getProject().getId());
        }

        // Since TopCoder Studio Modifications Assembly v2 - new contest properties are set
        Timestamp winnerAnnouncementTime = contest.getWinnerAnnouncementTime();
        if (winnerAnnouncementTime != null) {
            setDefault(Constants.WINNER_ANNOUNCEMENT_TIME, sdf.format(winnerAnnouncementTime));
        }

        Set<Medium> mediums = contest.getMediums();
        for (Medium medium : mediums) {
            setDefault(Constants.MEDIUM + medium.getId(), "true");
        }

        setDefault(Constants.CONTEST_TYPE, contest.getType().getId());
        setDefault(Constants.CONTEST_CHANNEL, contest.getChannel().getId());

        Set<Document> documents = contest.getDocuments();
        for (Document document : documents) {
            setDefault(Constants.DOCUMENT_TYPE_ID + '_' + document.getId(), document.getType().getId());
            setDefault(Constants.DOC_DESC + '_' + document.getId(), StringUtils.checkNull(document.getDescription()));
        }

        getRequest().setAttribute("resultsReady", onlineReviewResultsReady(contest.getId()));

        // set defaults for all new multi-round contest format
        if (contest.getMultiRound() != null && contest.getMultiRound()) {
            setDefault(Constants.CONTEST_FORMAT, ViewContest.MULTI_ROUND);

            ContestMultiRoundInformation multiRoundInfo = contest.getMultiRoundInformation();
            if (multiRoundInfo != null) {
                if (multiRoundInfo.getMilestoneDate() != null) {
                    setDefault(Constants.MILESTONE_DATE, sdf.format(multiRoundInfo.getMilestoneDate()));
                }
                if (multiRoundInfo.getRoundOneIntroduction() != null) {
                    setDefault(Constants.CONTEST_ROUND_ONE_SPECIFICS, multiRoundInfo.getRoundOneIntroduction());
                }
                if (multiRoundInfo.getRoundTwoIntroduction() != null) {
                    setDefault(Constants.CONTEST_ROUND_TWO_SPECIFICS, multiRoundInfo.getRoundTwoIntroduction());
                }
            }
            ContestMilestonePrize milestonePrize = contest.getMilestonePrize();
            if (milestonePrize != null) {
                if (milestonePrize.getAmount() != null) {
                    setDefault(Constants.MILESTONE_PRIZE_AMOUNT, milestonePrize.getAmount());
                }
                if (milestonePrize.getNumberOfSubmissions() != null) {
                    setDefault(Constants.NUMBER_MILESTONE_PRIZES, milestonePrize.getNumberOfSubmissions());
                }
            }
        } else {
            setDefault(Constants.CONTEST_FORMAT, ViewContest.SINGLE_ROUND);
        }
    }

    protected ResultSetContainer getProjectList() throws Exception {
        Request r = new Request();
        r.setContentHandle("project_list");
        DataAccessInt da = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        return (ResultSetContainer) da.getData(r).get("project_list");

    }


    /**
     * not very efficient, consider changing the query so that it just figures out if
     * everything is scored yet or not.
     *
     * @param contestId
     * @return
     * @throws Exception
     */
    private static boolean onlineReviewResultsReady(Long contestId) throws Exception {
        Request r = new Request();
        r.setContentHandle("or_results");
        r.setProperty(Constants.CONTEST_ID, contestId.toString());
        DataAccessInt da = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        ResultSetContainer rsc = da.getData(r).get("or_results");
        if (rsc.isEmpty()) {
            log.debug("no results");
            return false;
        } else {
            for (ResultSetContainer.ResultSetRow row : rsc) {
                if (row.getItem("final_score").getResultData() == null) {
                    log.debug("final score null " + row.getLongItem("submission_id"));
                    return false;
                }
            }
            return true;
        }

    }


}
