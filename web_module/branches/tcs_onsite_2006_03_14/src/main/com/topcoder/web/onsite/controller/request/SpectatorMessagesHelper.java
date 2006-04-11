/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.onsite.controller.request;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.onsite.Constants;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.BaseProcessor;
import java.util.Map;
import java.util.Iterator;
import java.util.ArrayList;
import java.util.List;
import com.topcoder.shared.netCommon.messages.MessageUtil;
import com.topcoder.shared.netCommon.messages.spectator.ComponentScoreUpdate;
import com.topcoder.shared.netCommon.messages.spectator.ComponentAppeal;
import com.topcoder.shared.netCommon.messages.MessagePacket;
import com.topcoder.shared.netCommon.messages.spectator.RequestComponentUpdate;
import com.topcoder.shared.netCommon.messages.spectator.DefineComponentContest;
import com.topcoder.shared.netCommon.messages.spectator.ComponentScoreUpdate;
import com.topcoder.shared.netCommon.messages.spectator.ComponentData;
import com.topcoder.shared.netCommon.messages.spectator.ComponentCoder;
import com.topcoder.shared.netCommon.messages.spectator.CoderData;


/**
 * <strong>Purpose</strong>:
 * A processor to handle RequestComponentUpdate requests from the Spectator front-end.
 * Any failure will result in an empty message packet.
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
     * Retrieves data from the DB to the requestor.
     *
     * @param contestId the contest id of the required data.
     *
     * @return a Map with the retrieved ResultSetContainers.
     */
    protected static List getScoresMessagePacket(final ResultSetContainer rscComponentScore, final int contestId, 
        final int roundId, final int componentId) {
        List scoresList = new ArrayList();
        if (rscComponentScore.size() > 0) {
            Iterator it = rscComponentScore.iterator();
            ResultSetContainer.ResultSetRow rsr;
            while (it.hasNext()) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();

                // ContestID, RoundID and ComponentID are mirrored as requested by the front-end application
                scoresList.add(new ComponentScoreUpdate(
                    contestId, roundId, componentId, 
                    rsr.getIntItem(Constants.CODER_ID_COL), 
                    rsr.getIntItem(Constants.REVIEWER_ID_COL),
                    rsr.getIntItem(Constants.SCORE_COL)));
            }
        }
        return scoresList;
    }

    protected static List getAppealsMessagePacket(final ResultSetContainer rscComponentAppeal, final int contestId, 
        final int roundId, final int componentId) {
        List appealsList = new ArrayList();
        if (rscComponentAppeal.size() > 0) {
            Iterator it = rscComponentAppeal.iterator();
            ResultSetContainer.ResultSetRow rsr;
            while (it.hasNext()) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                String appealStatus = null;
                Object successful = rsr.getItem(Constants.SUCCESSFUL_COL).getResultData();
                if (successful == null) {
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
                appealsList.add(new ComponentAppeal(
                    contestId, roundId, componentId, 
                    rsr.getIntItem(Constants.CODER_ID_COL), 
                    rsr.getIntItem(Constants.REVIEWER_ID_COL),
                    appealStatus));
            }
        }
        return appealsList;
    }
    
    protected static DefineComponentContest getContestDefinition(final ResultSetContainer rscComponentCoder, 
        final ResultSetContainer rscReviewerData, final ResultSetContainer rscComponentData, final int contestId, 
        final int roundId, final int componentId) {
        // builds the objects to be returned
        ComponentData componentData = null;
        if (rscComponentData.size() > 0) {
            // ComponentID is mirrored as requested by the front-end application
            componentData  = new ComponentData(
                componentId, 
                rscComponentData.getStringItem(0, Constants.COMPONENT_NAME_COL),
                rscComponentData.getStringItem(0, Constants.CATALOG_COL));            
        }

        ArrayList componentCoderList = null;
        if (rscComponentCoder.size() > 0) {
            componentCoderList = new ArrayList(rscComponentCoder.size());

            Iterator it = rscComponentCoder.iterator();
            ResultSetContainer.ResultSetRow rsr;
            while (it.hasNext()) {
                 rsr = (ResultSetContainer.ResultSetRow) it.next();

                 Object rank = rsr.getItem(Constants.RANK_COL).getResultData();
                 Object wagerAmount = rsr.getItem(Constants.WAGER_AMOUNT_COL).getResultData();

                componentCoderList.add(new ComponentCoder(
                    rsr.getIntItem(Constants.CODER_ID_COL), 
                    rsr.getStringItem(Constants.HANDLE_COL), 
                    rank == null ? 0 : ((Number) rank).intValue(), 
                    wagerAmount == null ? 0 : ((Number) wagerAmount).intValue()));
            }
        }

        ArrayList reviewerDataList = null;
        if (rscComponentCoder.size() > 0) {
            reviewerDataList = new ArrayList(rscReviewerData.size());

            Iterator it = rscReviewerData.iterator();
            ResultSetContainer.ResultSetRow rsr;
            while (it.hasNext()) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                reviewerDataList.add(new CoderData(
                    rsr.getIntItem(Constants.CODER_ID_COL), 
                    rsr.getStringItem(Constants.HANDLE_COL), 
                    rsr.getIntItem(Constants.RANK_COL)));
            }
        }

        log.debug("componentCoderList filled with " +  componentCoderList.size() + " coders.");
        log.debug("reviewerDataList filled with " +  reviewerDataList.size() + " reviewers.");

        // creates DefineComponentContest instance
        // ContestID and RoundID are mirrored as requested by the front-end application
        return new DefineComponentContest(
            contestId, 
            roundId,
            componentData,
            componentCoderList, 
            reviewerDataList);
    }
}
