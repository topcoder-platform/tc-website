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
import com.topcoder.shared.netCommon.messages.spectator.DefineComponentContest;
import com.topcoder.shared.netCommon.messages.MessageUtil;
import com.topcoder.shared.netCommon.messages.spectator.ComponentData;
import com.topcoder.shared.netCommon.messages.spectator.ComponentCoder;
import com.topcoder.shared.netCommon.messages.spectator.CoderData;
import com.topcoder.shared.netCommon.messages.spectator.ComponentScoreUpdate;
import com.topcoder.shared.netCommon.messages.MessagePacket;
import com.topcoder.shared.netCommon.messages.spectator.RequestComponentRoundInfo;

/**
 * <strong>Purpose</strong>:
 * A processor to handle RequestComponentRoundInfo requests from the Spectator front-end.
 * 
 * @author pulky
 * @version 1.0
 */
public class RoundInfo extends BaseProcessor {

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(RoundInfo.class);

    /**
     * Retrieves data from the DB to the requestor.
     *
     * @param contestId the contest id of the required data.
     *
     * @return a Map with the retrieved ResultSetContainers.
     */
    private Map getComponentRoundInfoData(long componentId, long contestId) throws Exception {
        Request request = new Request();
        request.setContentHandle(Constants.COMPONENT_ROUND_INFO_COMMAND);
        request.setProperty(Constants.COMPONENT_ID, String.valueOf(componentId));
        request.setProperty(Constants.CONTEST_ID, String.valueOf(contestId));
        DataAccessInt dai = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);

        return dai.getData(request);
    }

    /**
     * Process the ComponentRoundInfo request.
     * Retrieves information from DB and builds the objects to return them as xml encoded messages.
     */
    protected void businessProcessing() throws Exception {
        // decodes request
        log.debug("QueryString: " + getRequest().getQueryString());

        // plk - take out the "?"
        RequestComponentRoundInfo requestComponentRoundInfo = 
            (RequestComponentRoundInfo) MessageUtil.decodeQueryStringMessage(getRequest().getQueryString());

        
        // retrieves data from DB
        Map m = getComponentRoundInfoData(requestComponentRoundInfo.getComponentID(),
            requestComponentRoundInfo.getContestID());

        ResultSetContainer rscComponentData = (ResultSetContainer)m.get(Constants.COMPONENT_DATA_QUERY);
        ResultSetContainer rscComponentCoder = (ResultSetContainer)m.get(Constants.COMPONENT_CODER_QUERY);
        ResultSetContainer rscReviewerData = (ResultSetContainer)m.get(Constants.REVIEWER_DATA_QUERY);
        ResultSetContainer rscComponentScore = (ResultSetContainer)m.get(Constants.COMPONENT_SCORE_QUERY);
        
        log.debug("Got " +  rscComponentData.size() + " rows for: " + Constants.COMPONENT_DATA_QUERY);
        log.debug("Got " +  rscComponentCoder.size() + " rows for: " + Constants.COMPONENT_CODER_QUERY);
        log.debug("Got " +  rscReviewerData.size() + " rows for: " + Constants.REVIEWER_DATA_QUERY);
        log.debug("Got " +  rscComponentScore.size() + " rows for: " + Constants.COMPONENT_SCORE_QUERY);
        
        // builds the objects to be returned
        ComponentData componentData = null;
        if (rscComponentData.size() > 0) {
            // ComponentID is mirrored from the request as requested by the front-end application
            componentData  = new ComponentData(
                requestComponentRoundInfo.getComponentID(), 
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
        
        // creates DefineComponentContest instance
        // ContestID and RoundID are mirrored from the request as requested by the front-end application
        DefineComponentContest defineComponentContest = new DefineComponentContest(
            requestComponentRoundInfo.getContestID(), 
            requestComponentRoundInfo.getRoundID(),
            componentData,
            componentCoderList, 
            reviewerDataList);
        
        // first adds message for DefineComponentContest.
        MessagePacket mp = new MessagePacket();
        mp.add(defineComponentContest);
        
        // adds all ComponentScoreUpdate messages.
        if (rscComponentScore.size() > 0) {
            Iterator it = rscComponentScore.iterator();
            ResultSetContainer.ResultSetRow rsr;
            while (it.hasNext()) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();
                
                // ContestID, RoundID and ComponentID are mirrored 
                // from the request as requested by the front-end application
                mp.add(new ComponentScoreUpdate(
                    requestComponentRoundInfo.getContestID(),
                    requestComponentRoundInfo.getRoundID(),
                    requestComponentRoundInfo.getComponentID(), 
                    rsr.getIntItem(Constants.CODER_ID_COL), 
                    rsr.getIntItem(Constants.REVIEWER_ID_COL),
                    rsr.getIntItem(Constants.SCORE_COL)));
            }
        }

        log.debug("MessagePacket filled with " +  mp.getMessages().size() + " messages.");

        // encodes and returns the messages packet
        String xmlString = MessageUtil.encodeXMLMessagePacket(mp);
        getResponse().setContentType(Constants.RESPONSE_CONTENT_TYPE);
        getResponse().getOutputStream().print(xmlString);
        getResponse().flushBuffer();
    }
}
