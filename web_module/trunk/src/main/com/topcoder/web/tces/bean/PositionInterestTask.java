package com.topcoder.web.tces.bean;

import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tces.common.*;

import javax.servlet.http.*;
import java.io.Serializable;
import java.util.*;

/**
 * Processes the position interest task.
 * @author bigjake <kitz@mit.edu>
 *
 */

public class PositionInterestTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(PositionInterestTask.class);

    /* Holds the ID of the campaign to which this position belongs */
    private int campaignID;

    /* Holds the name of the company to which this position belongs */
    private String companyName;

    /* Holds the name of the campaign to which this position belongs */
    private String campaignName;

    /* Holds the name of this position */
    private String positionName;

    /* Holds the status of the campaign to which this position belongs */
    private String campaignStatus;

    /* Holds a list of mappings representing hits on this position */
    private ArrayList hitList;

    /* Holds the id of the user currently logged in */
    private int uid;

    /* Holds the id of this position */
    private int jid;

    /* Holds the field that the hit list should be sorted by */
    private String sortBy;

    /* Holds the order that the hit list should be sorted in */
    private String sortOrder;

    /* Creates new PositionInterestTask */
    public PositionInterestTask() {
        super();
        setNextPage(TCESConstants.POSITION_INTEREST_PAGE);

        uid=-1;
        sortBy="";
        sortOrder="";
    }


    /** Setter for property campaignName.
     * @param campaignName New value of property campaignName.
     */
    public void setCampaignName( String campaignName ) {
        this.campaignName = campaignName;
    }

    /** Getter for property campaignName
     * @return Value of property campaignName
     */
    public String getCampaignName() {
        return campaignName;
    }

    /** Setter for property campaignStatus.
     * @param campaignStatus New value of property campaignStatus.
     */
    public void setCampaignStatus( String campaignStatus ) {
        this.campaignStatus = campaignStatus;
    }

    /** Getter for property campaignStatus
     * @return Value of property campaignStatus
     */
    public String getCampaignStatus() {
        return campaignStatus;
    }

    /** Setter for property positionName.
     * @param positionName New value of property positionName.
     */
    public void setPositionName( String positionName ) {
        this.positionName = positionName;
    }

    /** Getter for property positionName
     * @return Value of property positionName
     */
    public String getPositionName() {
        return positionName;
    }

    /** Setter for property hitList.
     * @param hitList New value of property hitList.
     */
    public void setHitList( ArrayList hitList ) {
        this.hitList=hitList;
    }

    /** Getter for property hitList
     * @return Value of property hitList
     */
    public List getHitList() {
        return hitList;
    }

    /** Setter for property campaignID.
     * @param campaignID New value of property campaignID.
     */
    public void setCampaignID(int campaignID) {
        this.campaignID = campaignID;
    }

    /** Getter for property campaignID
     * @return Value of property campaignID
     */
    public int getCampaignID() {
        return campaignID;
    }

    /** Setter for property jobID.
     * @param jobID New value of property jobID.
     */
    public void setJobID(int jid) {
        this.jid=jid;
    }

    /** Getter for property jobID
     * @return Value of property jobID
     */
    public int getJobID() {
        return jid;
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

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response)
        throws Exception {

        ArrayList a = new ArrayList();
        a.add(new TrailItem(request.getContextPath() + request.getServletPath() + 
            "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.MAIN_TASK + "&" + 
            TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID(), TCESConstants.MAIN_NAME));
        a.add(new TrailItem(request.getContextPath() + request.getServletPath() + 
            "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.CAMPAIGN_DETAIL_TASK + "&" + 
            TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID(), TCESConstants.CAMPAIGN_DETAIL_NAME));
        a.add(new TrailItem(request.getContextPath() + request.getServletPath() + 
            "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.CAMPAIGN_INTEREST_TASK + "&" + 
            TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID(), TCESConstants.CAMPAIGN_INTEREST_NAME));
        setTrail(a);

    }

    public void processStep(String step)
        throws Exception
    {
        viewPositionInterest();
    }

    private void viewPositionInterest() throws Exception
    {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_position_interest");

        dataRequest.setProperty("uid", Integer.toString(uid) );
        dataRequest.setProperty("cid", Integer.toString(getCampaignID()) );
        dataRequest.setProperty("jid", Integer.toString(getJobID()) );
        DataAccessInt dai = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.OLTP_DATASOURCE_NAME));
        Map resultMap = dai.getData(dataRequest);

        ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_Company_Name");
        if (rsc.getRowCount() == 0) {
            throw new Exception ("No company name!");
        }
        ResultSetContainer.ResultSetRow cmpyNameRow = rsc.getRow(0);
        setCompanyName( cmpyNameRow.getItem("company_name").toString() );

        rsc = (ResultSetContainer) resultMap.get("TCES_Position_Name");
        if (rsc.getRowCount() == 0) {
            throw new Exception ("No position name!");
        }
        ResultSetContainer.ResultSetRow posNameRow = rsc.getRow(0);
        setPositionName( posNameRow.getItem("job_desc").toString() );

        rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_Info");
        if (rsc.getRowCount() == 0) {
            throw new TCESAuthenticationException ("Bad campaign ID or campaign does not belong to user.");
        }
        ResultSetContainer.ResultSetRow cpgnInfRow = rsc.getRow(0);
        setCampaignName( cpgnInfRow.getItem("campaign_name").toString() );

        rsc = (ResultSetContainer) resultMap.get("TCES_Verify_Job_Access");
        if (rsc.getRowCount() == 0) {
            throw new TCESAuthenticationException ("jid="+Integer.toString(getJobID())+
                                 " cid="+Integer.toString(getCampaignID())+
                                 "does not belong to uid="+Integer.toString(uid) );
        }

        rsc = (ResultSetContainer) resultMap.get("TCES_Position_Hit_List");
        ArrayList hitList = new ArrayList();
        ResultSetContainer.ResultSetRow hitListRow = null;
        for (int rowI=0;rowI<rsc.getRowCount();rowI++) {
            hitListRow = rsc.getRow(rowI);
            HashMap hit = new HashMap();

            hit.put("coder_id",
                    ((Long)hitListRow.getItem("coder_id").getResultData()).toString().trim() );
            hit.put("ha",
                    hitListRow.getItem("handle").toString().trim().toLowerCase() );
            hit.put("handle",
                    hitListRow.getItem("handle").toString().trim() );
            if (((Integer)hitListRow.getItem("rating").getResultData()).intValue() > 0) {
                hit.put("rating",
                        ((Integer)hitListRow.getItem("rating").getResultData()).toString() );
                hit.put("ra",((Integer)hitListRow.getItem("rating").getResultData()));
            }
            else {
                // member is unrated.
                hit.put("rating", "Not rated");
                hit.put("ra",new Integer(0));
            }
            hit.put("state",
                    hitListRow.getItem("state_code").toString().trim() );

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

            hit.put("gpa",
                    hitListRow.getItem("gpa").toString().trim() );
            hit.put("has_resume",
                    hitListRow.getItem("has_resume").toString().trim() );
            hit.put("grad_year",
                    hitListRow.getItem("grad_year").toString().trim() );
            hit.put("grad_month",
                    hitListRow.getItem("grad_month").toString().trim() );

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

        setNextPage( TCESConstants.POSITION_INTEREST_PAGE );
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());
        log.debug("setAttributes name: " + paramName + " value: " + value);

        if (paramName.equalsIgnoreCase(TCESConstants.SORT_PARAM))
            sortBy = value;
        if (paramName.equalsIgnoreCase(TCESConstants.SORT_ORDER_PARAM))
            sortOrder = value;
        if (paramName.equalsIgnoreCase(TCESConstants.CAMPAIGN_ID_PARAM))
            setCampaignID(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.JOB_ID_PARAM))
            setJobID(Integer.parseInt(value));
    }

}


