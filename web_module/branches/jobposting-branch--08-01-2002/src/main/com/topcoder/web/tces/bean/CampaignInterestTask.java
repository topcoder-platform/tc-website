package com.topcoder.web.tces.bean;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tces.common.TCESConstants;
import com.topcoder.web.tces.common.TCESAuthenticationException;

import javax.servlet.http.*;
import java.io.Serializable;
import java.util.*;

/**
 * Processes the campaign interest task.
 * @author bigjake <kitz@mit.edu>
 *
 */

public class CampaignInterestTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(CampaignInterestTask.class);

    private int campaignID;
    private String companyName;
    private String campaignName;
    private String campaignStatus;
    private ArrayList hitList;

    private int uid;

    private String sortBy;
    private String sortOrder;

    public CampaignInterestTask() {
        super();
        setNextPage(TCESConstants.CAMPAIGN_INTEREST_PAGE);

        uid=-1;

        sortBy="";
        sortOrder="";
    }

    public void setCampaignName( String campaignName ) {
        this.campaignName = campaignName;
    }

    public String getCampaignName() {
        return campaignName;
    }

    public void setCampaignStatus( String campaignStatus ) {
        this.campaignStatus = campaignStatus;
    }

    public String getCampaignStatus() {
        return campaignStatus;
    }

    public void setHitList( ArrayList hitList ) {
        this.hitList=hitList;
    }

    public List getHitList() {
        return hitList;
    }

    public int getCampaignID() {
        return campaignID;
    }

    public void setCampaignID(int campaignID) {
        this.campaignID = campaignID;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
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
        viewCampaignInterest();
    }

    private void viewCampaignInterest() throws Exception
    {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_campaign_interest");

        dataRequest.setProperty("uid", Integer.toString(uid) );
        dataRequest.setProperty("cid", Integer.toString(getCampaignID()) );
        DataAccessInt dai = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.OLTP_DATASOURCE_NAME));
        Map resultMap = dai.getData(dataRequest);

        ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_Company_Name");
        if (rsc.getRowCount() == 0) {
            throw new Exception ("No company name!");
        }
        ResultSetContainer.ResultSetRow cmpyNameRow = rsc.getRow(0);
        setCompanyName( cmpyNameRow.getItem("company_name").toString() );

        rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_Info");
        if (rsc.getRowCount() == 0) {
            throw new Exception ("Bad campaign ID or campaign does not belong to user.");
        }
        ResultSetContainer.ResultSetRow cpgnInfRow = rsc.getRow(0);
        setCampaignName( cpgnInfRow.getItem("campaign_name").toString() );

        rsc = (ResultSetContainer) resultMap.get("TCES_Verify_Campaign_Access");
        if (rsc.getRowCount() == 0) {
            throw new Exception (" cid="+Integer.toString(getCampaignID())+
                                 "does not belong to uid="+Integer.toString(uid) );
        }

        rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_Hit_List");
        ArrayList hitList = new ArrayList();
        ResultSetContainer.ResultSetRow hitListRow = null;
        for (int rowI=0;rowI<rsc.getRowCount();rowI++) {
            hitListRow = rsc.getRow(rowI);
            HashMap hit = new HashMap();

            hit.put("coder_id", ((Long)hitListRow.getItem("coder_id").getResultData()).toString() );
            hit.put("job_id", ((Long)hitListRow.getItem("job_id").getResultData()).toString() );
            hit.put("handle", hitListRow.getItem("handle").toString() );
            hit.put("ha",
                    hitListRow.getItem("handle").toString().trim().toLowerCase() );

            if (((Integer)hitListRow.getItem("rating").getResultData()).intValue() > 0) {
                hit.put("rating",
                        ((Integer)hitListRow.getItem("rating").getResultData()).toString() );
log.debug("rating_int inserted: "+hitListRow.getItem("rating").getResultData());
                hit.put("ra",((Integer)hitListRow.getItem("rating").getResultData()));
            }
            else {
                // member is unrated.
                hit.put("rating", "Not rated");
                hit.put("ra",new Integer(0));
            }

            hit.put("state",
                    hitListRow.getItem("state_code").toString().trim() );

            hit.put("position", hitListRow.getItem("job_desc").toString() );

            if ( ((String)hit.get("state")).trim().length()>0)
                hit.put("st",((String)hit.get("state")).trim().toUpperCase());
            else
                hit.put("st","ZZZ");

            hit.put("country",
                    hitListRow.getItem("country_code").toString().trim() );
            hit.put("type",
                    hitListRow.getItem("coder_type_desc").toString().trim() );
            hit.put("school",
                    hitListRow.getItem("school_name").toString().trim() );

            if (((String)hit.get("school")).trim().length() > 0 &&
                ((String)hit.get("school")).indexOf("N/A") < 0) {
                hit.put("sc",
                        hitListRow.getItem("school_name").toString().trim().toLowerCase() );
            }
            else
                hit.put("sc", "zzz"); // to ensure last in sortlist.

            hit.put("hit_date",
                    getDate(hitListRow, "timestamp"));
            hit.put("hd",
                    hitListRow.getItem("timestamp").toString() );

            hitList.add(hit);
        }

        if (sortBy!=null&&sortBy.length()>0) {
            if (sortOrder.length()>0) {
                hitList=JSPUtils.sortMapList(hitList,sortBy,sortOrder.equals(TCESConstants.SORT_ORDER_ASC)?true:false);
            }
            else {
                hitList=JSPUtils.sortMapList(hitList,sortBy,true);
            }
        }

        setHitList( hitList );

        setNextPage( TCESConstants.CAMPAIGN_INTEREST_PAGE );
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(TCESConstants.SORT_PARAM))
            sortBy = value;
        if (paramName.equalsIgnoreCase(TCESConstants.SORT_ORDER_PARAM))
            sortOrder = value;
        if (paramName.equalsIgnoreCase(TCESConstants.CAMPAIGN_ID_PARAM))
            setCampaignID(Integer.parseInt(value));
    }

}


