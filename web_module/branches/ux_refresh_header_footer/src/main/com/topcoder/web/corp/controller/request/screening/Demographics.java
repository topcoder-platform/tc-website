/*
 * Demographics.java
 *
 * Created on July 13, 2004, 10:54 AM
 */

package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.ScreeningException;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.model.DemographicModel;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

/**
 *
 * @author  rfairfax
 */
public class Demographics extends BaseScreeningProcessor {

    private static Logger log = Logger.getLogger(Demographics.class);

    protected void screeningProcessing() throws com.topcoder.web.common.TCWebException {
        try {
            String campaignId = getRequest().getParameter(Constants.CAMPAIGN_ID);
            if (campaignId == null) {
                // notify the user about the error
                log.error("Campaign ID is not specified.");
                throw new ScreeningException("No campaign ID had been specified.");
            }

            log.debug("CAMPAIGN ID:" + campaignId);

            Request dataRequest = new Request();
            ResultSetContainer rsc = null;
            Map resultMap = null;

            DemographicModel m = new DemographicModel();

            // Campaign Demographics
            dataRequest.setContentHandle("campaign_demographics");

            int types[] = {Constants.PROFESSIONAL,
                           Constants.STUDENT};

            for (int typeI = 0; typeI < types.length; typeI++) {

                dataRequest.setProperty("uid", String.valueOf(getUser().getId()));
                dataRequest.setProperty("cgn", campaignId);
                dataRequest.setProperty("ct", Integer.toString(types[typeI]));
                resultMap = Util.getDataAccess().getData(dataRequest);

                rsc = (ResultSetContainer) resultMap.get("campaign_info");
                ResultSetContainer.ResultSetRow cpgnInfRow = rsc.getRow(0);
                m.setCampaignName(cpgnInfRow.getItem("campaign_name").toString());

                rsc = (ResultSetContainer) resultMap.get("campaign_coders_by_type");
                ResultSetContainer.ResultSetRow coderCountRow = rsc.getRow(0);

                log.debug("CODER TYPE: " + types[typeI]);
                log.debug("COUNT: " + coderCountRow.getItem("coder_type_count").toString());

                if (types[typeI] == Constants.STUDENT)
                    m.setStudentCount(Integer.parseInt(coderCountRow.getItem("coder_type_count").toString()));
                else if (types[typeI] == Constants.PROFESSIONAL)
                    m.setProCount(Integer.parseInt(coderCountRow.getItem("coder_type_count").toString()));

                rsc = (ResultSetContainer) resultMap.get("campaign_demographic_responses");
                ResultSetContainer.ResultSetRow demoInfoRow = null;
                TreeMap demoOtherMap = new TreeMap();
                ArrayList orderList = new ArrayList();

                for (int rowI = 0; rowI < rsc.getRowCount(); rowI++) {
                    demoInfoRow = rsc.getRow(rowI);

                    if (demoOtherMap.get(demoInfoRow.getItem("demographic_question_text").toString()) == null) {
                        demoOtherMap.put(demoInfoRow.getItem("demographic_question_text").toString(),
                                new ArrayList());
                        orderList.add(demoInfoRow.getItem("demographic_question_text").toString());
                    }
                    ArrayList respList = (ArrayList) demoOtherMap.get(demoInfoRow.getItem("demographic_question_text").toString());

                    double pct =
                            (((Long) demoInfoRow.getItem("resp_count").getResultData())).doubleValue()
                            / ((types[typeI] == Constants.STUDENT) ?
                            ((double) m.getStudentCount()) : ((double) m.getProCount()));
                    pct = (int) (pct * 10000 + 0.5) / 100.0;

                    HashMap respItem = new HashMap();

                    respItem.put("title", demoInfoRow.getItem("response").toString());
                    respItem.put("count", demoInfoRow.getItem("resp_count").toString());
                    respItem.put("percent", Double.toString(pct) + "%");

                    respList.add(respItem);
                }

                if (types[typeI] == Constants.STUDENT)
                    m.setStudentDemoInfo(demoOtherMap, orderList);
                else if (types[typeI] == Constants.PROFESSIONAL)
                    m.setProDemoInfo(demoOtherMap, orderList);
            }

            rsc = (ResultSetContainer) resultMap.get("verify_campaign_access");
            if (rsc.getRowCount() == 0) {
                throw new ScreeningException(" cid=" + campaignId +
                        "does not belong to uid=" + getUser().getId());
            }

            getRequest().setAttribute("demographicInfo", m);

            setNextPage(Constants.DEMOGRAPHICS_PAGE);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


}
