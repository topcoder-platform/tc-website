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

        //try {
            // decodes request
            RequestComponentUpdate requestComponentUpdate = 
                (RequestComponentUpdate) MessageUtil.decodeQueryStringMessage(getRequest().getQueryString());

            // retrieves data from DB
            Map m = getComponentUpdateData(requestComponentUpdate.getContestID());
            ResultSetContainer rscComponentAppeal = (ResultSetContainer)m.get(Constants.COMPONENT_APPEAL_QUERY);
            ResultSetContainer rscComponentScore = (ResultSetContainer)m.get(Constants.COMPONENT_SCORE_QUERY);
            log.debug("Got " +  rscComponentAppeal.size() + " rows for: " + Constants.COMPONENT_APPEAL_QUERY);
            log.debug("Got " +  rscComponentScore.size() + " rows for: " + Constants.COMPONENT_SCORE_QUERY);

            // adds all ComponentAppeal messages.
            mp.addAll(getAppealsMessagePacket(requestComponentUpdate, rscComponentAppeal));
    
            // adds all ComponentScoreUpdate messages.
            mp.addAll(getScoresMessagePacket(requestComponentUpdate, rscComponentScore));
        //} catch (Exception e) {
            // do nothing, an empty message packet will be returned.
        //}

        // encodes and returns the messages packet
        log.debug("MessagePacket filled with " +  mp.getMessages().size() + " messages.");
        String xmlString = MessageUtil.encodeXMLMessagePacket(mp);
        getResponse().setContentType(Constants.RESPONSE_CONTENT_TYPE);
        getResponse().getOutputStream().print(xmlString);
        getResponse().flushBuffer();
    }

    protected List getScoresMessagePacket(final RequestComponentUpdate requestComponentUpdate, 
        final ResultSetContainer rscComponentScore) {
        List scoresList = new ArrayList();
        if (rscComponentScore.size() > 0) {
            Iterator it = rscComponentScore.iterator();
            ResultSetContainer.ResultSetRow rsr;
            while (it.hasNext()) {
                rsr = (ResultSetContainer.ResultSetRow) it.next();

                // ContestID, RoundID and ComponentID are mirrored as requested by the front-end application
                scoresList.add(new ComponentScoreUpdate(
                    requestComponentUpdate.getContestID(),
                    requestComponentUpdate.getRoundID(),
                    requestComponentUpdate.getComponentID(), 
                    rsr.getIntItem(Constants.CODER_ID_COL), 
                    rsr.getIntItem(Constants.REVIEWER_ID_COL),
                    rsr.getIntItem(Constants.SCORE_COL)));
            }
        }
        return scoresList;
    }

    protected List getAppealsMessagePacket(final RequestComponentUpdate requestComponentUpdate, 
            final ResultSetContainer rscComponentAppeal) {
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
                    requestComponentUpdate.getContestID(),
                    requestComponentUpdate.getRoundID(),
                    requestComponentUpdate.getComponentID(), 
                    rsr.getIntItem(Constants.CODER_ID_COL), 
                    rsr.getIntItem(Constants.REVIEWER_ID_COL),
                    appealStatus));
            }
        }
        return appealsList;
    }
}
