package com.topcoder.web.tces.bean;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tces.common.TCData;
import com.topcoder.web.tces.common.TCESConstants;
import com.topcoder.web.tces.common.TCESAuthenticationException;

import javax.servlet.http.*;
import java.io.Serializable;
import java.util.*;

/**
 * Processes the main task
 * @author bigjake <kitz@mit.edu>
 *
 */

public class MainTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(MainTask.class);

    /* Holds the name of the company of the currently logged-in user for which campaigns are being listed */
    private String companyName;

    /* Holds the list of mappings representing campaigns for the company of the currently logged in user */
    private List campaignInfoList;

    /* Holds the ID currently logged-in user */
    private int uid;

    /* Holds whether or not there are multiple different companies in the campaign list */
    private boolean hasManyCompanies;

    /* Creates a new MainTask */
    public MainTask() {
        super();
        setNextPage(TCESConstants.MAIN_PAGE);

        uid=-1;
    }

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
    public void setCampaignInfoList( List campaignInfoList ) {
        this.campaignInfoList = campaignInfoList;
    }

    /** Getter for property campaignInfoList
     * @return Value of property campaignInfoList
     */
    public List getCampaignInfoList( ) {
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


    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        HttpSession session = request.getSession(true);

        if (!Authentication.isLoggedIn(session)) {
            log.debug("User not authenticated for access to TCES resource.");
            throw new TCESAuthenticationException("User not authenticated for access to TCES resource.");
        }

        uid = Authentication.userLoggedIn(session);
    }

    public void processStep(String step)
        throws Exception
    {
        viewMain();
    }

    private void viewMain() throws Exception
    {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_main");

        dataRequest.setProperty("uid", Integer.toString(uid) );
        DataAccessInt dai = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.OLTP_DATASOURCE_NAME));
        Map resultMap = dai.getData(dataRequest);
        ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_Company_Name");

        if (rsc.getRowCount() == 0) {
            throw new Exception ("No company name!");
        }

        ResultSetContainer.ResultSetRow rRow = rsc.getRow(0);

        setCompanyName( TCData.getTCString(rRow, "company_name") );

        rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_List");

        setHasManyCompanies(false);
        if (!rsc.isEmpty()) {
            int firstCompany = -1;
            firstCompany = Integer.parseInt(rsc.getItem(0, "company_id").toString());
            int companyId = -1;
            /* figure out if there are more than one companies in this compaign list */
            for (int i=0; i<rsc.size()&&!hasManyCompanies(); i++) {
                companyId = Integer.parseInt(rsc.getItem(i, "company_id").toString());
                if (companyId != firstCompany) {
                    setHasManyCompanies(true);
                }
            }
        }

        setCampaignInfoList(rsc);

        setNextPage( TCESConstants.MAIN_PAGE );
    }

    public void setAttributes(String paramName, String paramValues[]) {
    }

}


