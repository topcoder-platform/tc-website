/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.onsite.controller.request;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.onsite.Constants;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.BaseProcessor;
import java.util.Map;
import com.topcoder.shared.netCommon.messages.MessageUtil;
import com.topcoder.shared.netCommon.messages.MessagePacket;
import com.topcoder.shared.netCommon.messages.spectator.RequestComponentUpdate;
import com.topcoder.web.onsite.controller.request.SpectatorMessagesHelper;

/**
 * <strong>Purpose</strong>:
 * A processor to handle RequestComponentUpdate requests from the Spectator front-end.
 * Any failure will result in an empty message packet.
 * 
 * @author pulky
 * @version 1.0
 */
public class ComponentUpdate extends BaseProcessor {

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(ComponentUpdate.class);

    /**
     * Retrieves data from the DB to the requestor.
     *
     * @param contestId the contest id of the required data.
     *
     * @return a Map with the retrieved ResultSetContainers.
     */
    private Map getComponentUpdateData(long contestId) throws Exception {
        Request request = new Request();
        request.setContentHandle(Constants.COMPONENT_UPDATE_COMMAND);
        request.setProperty(Constants.CONTEST_ID, String.valueOf(contestId));
        DataAccessInt dai = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);

        return dai.getData(request);
    }

    /**
     * Process the ComponentUpdate request.
     * Retrieves information from DB and builds the objects to return them as xml encoded messages.
     */
    protected void businessProcessing() throws Exception {
        log.debug("QueryString: " + getRequest().getQueryString());

        MessagePacket mp = new MessagePacket();

        try {
            // decodes request
            RequestComponentUpdate requestComponentUpdate = 
                (RequestComponentUpdate) MessageUtil.decodeQueryStringMessage(getRequest().getQueryString());

            // retrieves data from DB
            Map m = getComponentUpdateData(requestComponentUpdate.getContestID());
            ResultSetContainer rscComponentAppeal = (ResultSetContainer)m.get(Constants.COMPONENT_APPEAL_QUERY);
            ResultSetContainer rscComponentScore = (ResultSetContainer)m.get(Constants.COMPONENT_SCORE_QUERY);
            ResultSetContainer rscComponentTime = (ResultSetContainer)m.get(Constants.COMPONENT_TIME_QUERY);
            log.debug("Got " +  rscComponentAppeal.size() + " rows for: " + Constants.COMPONENT_APPEAL_QUERY);
            log.debug("Got " +  rscComponentScore.size() + " rows for: " + Constants.COMPONENT_SCORE_QUERY);
            log.debug("Got " +  rscComponentTime.size() + " rows for: " + Constants.COMPONENT_TIME_QUERY);

            // these are ints due to compatibility issues with the front-end. (should be longs)
            int contestId = requestComponentUpdate.getContestID();
            int roundId = requestComponentUpdate.getRoundID();
            long componentId = requestComponentUpdate.getComponentID();

            // adds all ComponentAppeal messages.
            mp.addAll(SpectatorMessagesHelper.getAppealsMessagePacket(rscComponentAppeal, contestId, roundId, 
                componentId));

            // adds all ComponentScoreUpdate messages.
            mp.addAll(SpectatorMessagesHelper.getScoresMessagePacket(rscComponentScore, contestId, roundId, 
                componentId));

            // add componentTimeUpdate
            mp.addAll(SpectatorMessagesHelper.getComponentTimeUpdate(rscComponentTime, componentId));
        } catch (Exception e) {
            // do nothing, an empty message packet will be returned.
            e.printStackTrace();
        }

        // encodes and returns the messages packet
        log.debug("MessagePacket filled with " +  mp.getMessages().size() + " messages.");
        String xmlString = MessageUtil.encodeXMLMessagePacket(mp);
        getResponse().setContentType("text/xml");
        getResponse().getOutputStream().print(xmlString);
        getResponse().flushBuffer();
    }
}
