/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.onsite.controller.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import java.util.Iterator;
import java.util.ArrayList;
import java.util.List;
import com.topcoder.shared.netCommon.messages.spectator.ComponentScoreUpdate;
import com.topcoder.shared.netCommon.messages.spectator.ComponentAppeal;
import com.topcoder.shared.netCommon.messages.spectator.ComponentTimeUpdate;
import com.topcoder.shared.netCommon.messages.spectator.DefineComponentContest;
import com.topcoder.shared.netCommon.messages.spectator.ComponentData;
import com.topcoder.shared.netCommon.messages.spectator.ComponentCoder;
import com.topcoder.shared.netCommon.messages.spectator.CoderData;

/**
 * <strong>Purpose</strong>:
 * Helper class to build Spectator messages packets.
 * 
 * @author pulky
 * @version 1.0
 */
class SpectatorMessagesHelper {
    
    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(SpectatorMessagesHelper.class);
    
    /**
     * Builds and Gets the ComponentScoreUpdate messages for the processor.
     *
     * @param rscComponentScore the ResultSetContainer retrieved from the DB.
     * @param contestId the contest id of the required data.
     * @param roundId the round id of the required data.
     * @param componentId the component id of the required data.
     *
     * Notes: ContestID, RoundID and ComponentID are mirrored as requested by the front-end application.
     *
     * @return a List with all the ComponentScoreUpdate messages.
     */
    protected static List getScoresMessagePacket(final ResultSetContainer rscComponentScore, final long contestId, 
        final long roundId, final long componentId) {
        List scoresList = new ArrayList(rscComponentScore.size());
        if (rscComponentScore.size() > 0) {
            Iterator it = rscComponentScore.iterator();
            ResultSetContainer.ResultSetRow rsr;
            while (it.hasNext()) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();

                // ContestID, RoundID and ComponentID are mirrored as requested by the front-end application
                // int casting must be done due to compatibility issues with the front-end.
                // score is requested to be transformed to an int(E-2)
                scoresList.add(new ComponentScoreUpdate(
                    (int) contestId, (int) roundId, componentId, 
                    (int) rsr.getLongItem("user_id"), 
                    (int) rsr.getLongItem("author_id"),
                    (int) (rsr.getFloatItem("score") * 100)));
            }
        }
        return scoresList;
    }

    /**
     * Builds and Gets the ComponentAppeal messages for the processor.
     *
     * @param rscComponentAppeal the ResultSetContainer retrieved from the DB.
     * @param contestId the contest id of the required data.
     * @param roundId the round id of the required data.
     * @param componentId the component id of the required data.
     *
     * Notes: ContestID, RoundID and ComponentID are mirrored as requested by the front-end application.
     *
     * @return a List with all the ComponentAppeal messages.
     */
    protected static List getAppealsMessagePacket(final ResultSetContainer rscComponentAppeal, final long contestId, 
        final long roundId, final long componentId) {
        List appealsList = new ArrayList(rscComponentAppeal.size());
        if (rscComponentAppeal.size() > 0) {
            Iterator it = rscComponentAppeal.iterator();
            ResultSetContainer.ResultSetRow rsr;
            while (it.hasNext()) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                String appealStatus = null;
                Object successful = rsr.getItem("successful").getResultData();
                int isResolved = rsr.getIntItem("is_resolved");
                if (isResolved == 0 || successful == null) {
                    appealStatus = ComponentAppeal.APPEAL_PENDING;
                } else {
                    switch (((Number) successful).intValue()) {
                        case 0:
                            appealStatus = ComponentAppeal.APPEAL_REJECTED;
                            break;
                        case 1:
                            appealStatus = ComponentAppeal.APPEAL_SUCCESSFUL;
                            break;
                    }
                }

                // ContestID, RoundID and ComponentID are mirrored as requested by the front-end application
                // int casting must be done due to compatibility issues with the front-end.
                appealsList.add(new ComponentAppeal(
                    (int) contestId, (int) roundId, componentId, 
                    rsr.getLongItem("appeal_id"), 
                    (int) rsr.getLongItem("user_id"), 
                    (int) rsr.getLongItem("author_id"),
                    appealStatus));
            }
        }
        return appealsList;
    }

    /**
     * Builds and Gets the DefineComponentContest message for the processor.
     *
     * @param rscComponentCoder the ResultSetContainer retrieved from the DB with the coders data.
     * @param rscReviewerData the ResultSetContainer retrieved from the DB with the reviewers data.
     * @param rscComponentData the ResultSetContainer retrieved from the DB with the component data.
     * @param contestId the contest id of the required data.
     * @param roundId the round id of the required data.
     * @param componentId the component id of the required data.
     *
     * Notes: ContestID, RoundID and ComponentID are mirrored as requested by the front-end application.
     *
     * @return the builded object (DefineComponentContest).
     */
    protected static DefineComponentContest getContestDefinitionMessage(final ResultSetContainer rscComponentCoder, 
        final ResultSetContainer rscReviewerData, final ResultSetContainer rscComponentData, final long contestId, 
        final long roundId, final long componentId) {
        // builds the objects to be returned
        ComponentData componentData = null;
        if (rscComponentData.size() > 0) {
            // ComponentID is mirrored as requested by the front-end application
            componentData  = new ComponentData(
                componentId, 
                rscComponentData.getStringItem(0, "component_name"),
                rscComponentData.getStringItem(0, "category_name"));            
        }

        // builds component coders list
        ArrayList componentCoderList = new ArrayList(rscComponentCoder.size());
        if (rscComponentCoder.size() > 0) {
            Iterator it = rscComponentCoder.iterator();
            ResultSetContainer.ResultSetRow rsr;
            while (it.hasNext()) {
                 rsr = (ResultSetContainer.ResultSetRow) it.next();

                 Object rank = rsr.getItem("rating").getResultData();
                 Object wagerAmount = rsr.getItem("wager_amount").getResultData();

                // int casting must be done due to compatibility issues with the front-end.
                componentCoderList.add(new ComponentCoder(
                    (int) rsr.getLongItem("user_id"), 
                    rsr.getStringItem("handle"), 
                    rank == null ? 0 : (int)(((Number) rank).longValue()), 
                    wagerAmount == null ? 0 : ((Number) wagerAmount).intValue()));
            }
        }

        // builds reviewers list
        ArrayList reviewerDataList = new ArrayList(rscReviewerData.size());
        if (rscReviewerData.size() > 0) {
            Iterator it = rscReviewerData.iterator();
            ResultSetContainer.ResultSetRow rsr;
            while (it.hasNext()) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                // int casting must be done due to compatibility issues with the front-end.
                reviewerDataList.add(new CoderData(
                    (int) rsr.getLongItem("user_id"), 
                    rsr.getStringItem("handle"), 
                    (int) rsr.getLongItem("rating")));
            }
        }

        log.debug("componentCoderList filled with " +  componentCoderList.size() + " coders.");
        log.debug("reviewerDataList filled with " +  reviewerDataList.size() + " reviewers.");

        // creates DefineComponentContest instance
        // ContestID and RoundID are mirrored as requested by the front-end application
        // int casting must be done due to compatibility issues with the front-end.
        return new DefineComponentContest(
            (int) contestId, 
            (int) roundId,
            componentData,
            componentCoderList, 
            reviewerDataList);
    }

    /**
     * Builds and Gets the ComponentTimeUpdate message for the processor.
     *
     * @param rscComponentTime the ResultSetContainer retrieved from the DB with the time data.
     * @param componentId the component id of the required data.
     *
     * Notes: ComponentID are mirrored as requested by the front-end application.
     *
     * @return the builded objects (ComponentTimeUpdate list).
     */
    protected static List getComponentTimeUpdate(final ResultSetContainer rscComponentTime, 
        final long componentId) {
        // builds the objects to be returned
        ArrayList componentTimeList = new ArrayList(rscComponentTime.size());
        if (rscComponentTime.size() > 0) {
            Iterator it = rscComponentTime.iterator();
            ResultSetContainer.ResultSetRow rsr;
            while (it.hasNext()) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                componentTimeList.add(new ComponentTimeUpdate(
                		componentId, 
                    rsr.getTimestampItem("scheduled_start_time"), 
                    rsr.getTimestampItem("scheduled_end_time")));
            }
        }
        return componentTimeList;
    }
}
