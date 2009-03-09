package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.corp.common.TCData;
import com.topcoder.web.corp.common.TCESConstants;

import java.util.List;
import java.util.Map;

/**
 * Processes the main task
 * @author bigjake <kitz@mit.edu>
 *
 */

public class MainTask extends BaseTask  {

    private static Logger log = Logger.getLogger(MainTask.class);

    /* Holds the name of the company of the currently logged-in user for which campaigns are being listed */
    private String companyName;

    /* Holds the list of mappings representing campaigns for the company of the currently logged in user */
    private List campaignInfoList;

    /* Holds the ID currently logged-in user */
    //private long uid;  //moved to BaseTask

    /* Holds whether or not there are multiple different companies in the campaign list */
    private boolean hasManyCompanies;

    /** Setter for property companyName.
     * @param companyName New value of property companyName.
     */
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    /** Getter for property companyName
     * @return Value of property companyName
     */
    public String getCompanyName() {
        return companyName;
    }

    /** Setter for property campaignInfoList.
     * @param campaignInfoList New value of property campaignInfoList.
     */
    public void setCampaignInfoList(List campaignInfoList) {
        this.campaignInfoList = campaignInfoList;
    }

    /** Getter for property campaignInfoList
     * @return Value of property campaignInfoList
     */
    public List getCampaignInfoList() {
        return campaignInfoList;
    }

    /** Setter for property hasManyCompanies.
     * @param hasManyCompanies New value of property hasManyCompanies.
     */
    public void setHasManyCompanies(boolean hasManyCompanies) {
        this.hasManyCompanies = hasManyCompanies;
    }

    /** Getter for property hasManyCompanies
     * @return Value of property hasManyCompanies
     */
    public boolean hasManyCompanies() {
        return hasManyCompanies;
    }


    protected void businessProcessing() throws Exception {
        viewMain();
        setNextPage(TCESConstants.MAIN_PAGE);
        setIsNextPageInContext(true);
        getRequest().setAttribute(this.getClass().getName().substring(this.getClass().getName().lastIndexOf('.')+1), this);
        

        
    }

    private void viewMain() throws Exception {
        Request dataRequest = new Request();
        ResultSetContainer rsc = null;

        if (super.getSessionInfo().isAdmin()) {
            dataRequest.setContentHandle("tces_admin_main");
            Map resultMap = getDataAccess(getOltp()).getData(dataRequest);

            rsc = (ResultSetContainer) resultMap.get("TCES_Admin_Campaign_List");

            setCompanyName(TCESConstants.ADMIN_COMPANY);
            setHasManyCompanies(true);
            setCampaignInfoList(rsc);

        } else {
            dataRequest.setContentHandle("tces_main");

            log.debug("Database Source: " + DBMS.OLTP_DATASOURCE_NAME + " User ID:" + getUser().getId());

            dataRequest.setProperty("uid", String.valueOf(getUser().getId()));
            Map resultMap = getDataAccess(getOltp()).getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("TCES_Company_Name");

            if (rsc.getRowCount() == 0) {
                throw new Exception("No company name found for user id #" + getUser().getId());
            }

            ResultSetContainer.ResultSetRow rRow = rsc.getRow(0);

            setCompanyName(TCData.getTCString(rRow, "company_name"));

            rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_List");

            setHasManyCompanies(false);

            setCampaignInfoList(rsc);

        }

    }


}


