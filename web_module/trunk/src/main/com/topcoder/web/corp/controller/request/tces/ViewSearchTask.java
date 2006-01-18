package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.web.corp.common.TCESConstants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2006
 */
public class ViewSearchTask extends BaseTask {

    private long campaignId;

    public void processStep(String step) throws Exception {
        setNextPage(TCESConstants.SEARCH_PAGE);
    }

    /** Sets attributes for the task.
     * @param paramName The name of the attribute being set.
     * @param paramValues The values to be associated with the given attribute.
     */
    public void setAttributes(String paramName, String[] paramValues) {
        String value = paramValues[0];
        value = (value == null ? "" : value.trim());

        if (paramName.equalsIgnoreCase(TCESConstants.CAMPAIGN_ID_PARAM))
            setCampaignId(Integer.parseInt(value));
    }

    public long getCampaignId() {
        return campaignId;
    }

    public void setCampaignId(long campaignId) {
        this.campaignId = campaignId;
    }

}
