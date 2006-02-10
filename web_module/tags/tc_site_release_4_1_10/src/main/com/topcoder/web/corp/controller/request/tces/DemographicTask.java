package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.security.NotAuthorizedException;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.corp.common.TCESConstants;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * Processes the demographic task.
 * @author bigjake <kitz@mit.edu>
 *
 */

public class DemographicTask extends BaseTask {

    private static Logger log = Logger.getLogger(DemographicTask.class);

    /* Holds the ID of the campaign to which the job belongs */
    private long campaignID;

    /* Holds the ID of the job */
    private long jobID;

    /* Holds the name of the company to which the job belongs */
    private String companyName;

    /* Holds the name of the campaign to which the job belongs */
    private String campaignName;

    /* Holds the name of job */
    private String positionName;

    /* Holds the number of student coders that have expressed interest in this job */
    private int studentCoderCount;

    /* Holds the number of pro coders that have expressed interest in this job */
    private int proCoderCount;

    /* Holds the a mapping representing various demographics on the student members that have expressed interest in this job */
    private Map studentDemoInfo;

    /* Holds the a mapping representing various demographics on the pro members that have expressed interest in this job */
    private Map proDemoInfo;

    /* Holds the ID of the currently logged-in user */
    //private long uid;  // moved to BaseTask

    /** Setter for property studentDemoInfo.
     * @param studentDemoInfo New value of property studentDemoInfo.
     */
    public void setStudentDemoInfo(Map studentDemoInfo) {
        this.studentDemoInfo = studentDemoInfo;
    }

    /** Getter for property studentDemoInfo
     * @return Value of property studentDemoInfo
     */
    public Map getStudentDemoInfo() {
        return studentDemoInfo;
    }

    /** Setter for property proDemoInfo.
     * @param proDemoInfo New value of property proDemoInfo.
     */
    public void setProDemoInfo(Map proDemoInfo) {
        this.proDemoInfo = proDemoInfo;
    }

    /** Getter for property proDemoInfo
     * @return Value of property proDemoInfo
     */
    public Map getProDemoInfo() {
        return proDemoInfo;
    }

    /** Setter for property studentCoderCount.
     * @param studentCoderCount New value of property studentCoderCount.
     */
    public void setStudentCoderCount(int studentCoderCount) {
        this.studentCoderCount = studentCoderCount;
    }

    /** Getter for property studentCoderCount
     * @return Value of property studentCoderCount
     */
    public int getStudentCoderCount() {
        return studentCoderCount;
    }

    /** Setter for property proCoderCount.
     * @param proCoderCount New value of property proCoderCount.
     */
    public void setProCoderCount(int proCoderCount) {
        this.proCoderCount = proCoderCount;
    }

    /** Getter for property proCoderCount
     * @return Value of property proCoderCount
     */
    public int getProCoderCount() {
        return proCoderCount;
    }

    /** Setter for property campaignName.
     * @param campaignName New value of property campaignName.
     */
    public void setCampaignName(String campaignName) {
        this.campaignName = campaignName;
    }

    /** Getter for property campaignName
     * @return Value of property campaignName
     */
    public String getCampaignName() {
        return campaignName;
    }

    /** Setter for property positionName.
     * @param positionName New value of property positionName.
     */
    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    /** Getter for property positionName
     * @return Value of property positionName
     */
    public String getPositionName() {
        return positionName;
    }

    /** Getter for property campaignID
     * @return Value of property campaignID
     */
    public long getCampaignID() {
        return campaignID;
    }

    /** Setter for property campaignID.
     * @param campaignID New value of property campaignID.
     */
    public void setCampaignID(long campaignID) {
        this.campaignID = campaignID;
    }

    /** Getter for property jobID
     * @return Value of property jobID
     */
    public long getJobID() {
        return jobID;
    }

    /** Setter for property jobID.
     * @param jobID New value of property jobID.
     */
    public void setJobID(long jobID) {
        //log.debug("setJobID() called...");
        this.jobID = jobID;
    }

    /** Getter for property companyName
     * @return Value of property companyName
     */
    public String getCompanyName() {
        return companyName;
    }

    /** Setter for property companyName.
     * @param companyName New value of property companyName.
     */
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }


    protected void businessProcessing() throws Exception {
        setCampaignID(Long.parseLong(getRequest().getParameter(TCESConstants.CAMPAIGN_ID_PARAM)));
        if (getRequest().getParameter(TCESConstants.JOB_ID_PARAM)!=null) {
            setJobID(Long.parseLong(getRequest().getParameter(TCESConstants.JOB_ID_PARAM)));
        }

        viewDemographics();
        ArrayList a = new ArrayList();
        a.add(new TrailItem(getSessionInfo().getServletPath() +
                "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.MAIN_TASK + "&" +
                TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID(), TCESConstants.MAIN_NAME));
        a.add(new TrailItem(getSessionInfo().getServletPath() +
                "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.CAMPAIGN_DETAIL_TASK + "&" +
                TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID(), TCESConstants.CAMPAIGN_DETAIL_NAME));
        a.add(new TrailItem(getSessionInfo().getServletPath() +
                "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.CAMPAIGN_INTEREST_TASK + "&" +
                TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID(), TCESConstants.CAMPAIGN_INTEREST_NAME));
        if (getJobID() > 0) {
            a.add(new TrailItem(getSessionInfo().getServletPath() +
                    "?" + TCESConstants.TASK_PARAM + "=" + TCESConstants.POSITION_INTEREST_TASK + "&" +
                    TCESConstants.CAMPAIGN_ID_PARAM + "=" + getCampaignID() +
                    "&" + TCESConstants.JOB_ID_PARAM + "=" + getJobID(), TCESConstants.POSITION_INTEREST_NAME));
        }
        setTrail(a);
        setNextPage(TCESConstants.DEMOGRAPHIC_PAGE);
        setIsNextPageInContext(true);
        getRequest().setAttribute(this.getClass().getName().substring(this.getClass().getName().lastIndexOf('.')+1), this);
        


    }

    private void viewDemographics() throws Exception {
        Request dataRequest = new Request();
        ResultSetContainer rsc = null;
        Map resultMap = null;

        if (getJobID() > 0) {
            // Position Demographics
            dataRequest.setContentHandle("tces_position_demographics");
        } else {
            // Campaign Demographics
            dataRequest.setContentHandle("tces_campaign_demographics");
        }

        int types[] = {TCESConstants.PRO_CODER_TYPE,
                       TCESConstants.STUDENT_CODER_TYPE};

        for (int typeI = 0; typeI < types.length; typeI++) {
            if (getJobID() > 0) {
                // Position Demographics
                dataRequest.setProperty("jid", String.valueOf(getJobID()));
            }

            dataRequest.setProperty("uid", String.valueOf(getUser().getId()));
            dataRequest.setProperty("cid", String.valueOf(getCampaignID()));
            dataRequest.setProperty("ct", String.valueOf(types[typeI]));
            resultMap = getDataAccess(getOltp()).getData(dataRequest);

            if (super.getSessionInfo().isAdmin())
                setCompanyName(TCESConstants.ADMIN_COMPANY);
            else {
                rsc = (ResultSetContainer) resultMap.get("TCES_Company_Name");
                ResultSetContainer.ResultSetRow cmpyNameRow = rsc.getRow(0);
                setCompanyName(cmpyNameRow.getItem("company_name").toString());
            }

            rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_Info");
            ResultSetContainer.ResultSetRow cpgnInfRow = rsc.getRow(0);
            setCampaignName(cpgnInfRow.getItem("campaign_name").toString());

            if (getJobID() > 0) {
                rsc = (ResultSetContainer) resultMap.get("TCES_Position_Name");
                ResultSetContainer.ResultSetRow posNameRow = rsc.getRow(0);
                setPositionName(posNameRow.getItem("job_desc").toString());
            }


            rsc = (getJobID() > 0) ?
                    (ResultSetContainer) resultMap.get("TCES_Position_Coders_By_Type")
                    : (ResultSetContainer) resultMap.get("TCES_Campaign_Coders_By_Type");
            ResultSetContainer.ResultSetRow coderCountRow = rsc.getRow(0);
            if (types[typeI] == TCESConstants.STUDENT_CODER_TYPE)
                setStudentCoderCount(Integer.parseInt(coderCountRow.getItem("coder_type_count").toString()));
            else if (types[typeI] == TCESConstants.PRO_CODER_TYPE)
                setProCoderCount(Integer.parseInt(coderCountRow.getItem("coder_type_count").toString()));

            HashMap demoInfoMap = new HashMap();

            rsc = (getJobID() > 0) ?
                    (ResultSetContainer) resultMap.get("TCES_Position_Referral_Responses")
                    : (ResultSetContainer) resultMap.get("TCES_Campaign_Referral_Responses");
            ResultSetContainer.ResultSetRow refRspRow = null;
            ArrayList referralMapList = new ArrayList();
            if (rsc != null) {
                for (int rowI = 0; rowI < rsc.getRowCount(); rowI++) {
                    refRspRow = rsc.getRow(rowI);
                    Map referralItem = new HashMap();

                    double pct = (((Long) refRspRow.getItem("resp_count").getResultData())).doubleValue() / ((types[typeI] == TCESConstants.STUDENT_CODER_TYPE) ?
                            ((double) getStudentCoderCount()) : ((double) getProCoderCount()));

                    pct = (int) (pct * 10000 + 0.5) / 100.0;

                    referralItem.put("title", refRspRow.getItem("response").toString());
                    referralItem.put("count", refRspRow.getItem("resp_count").toString());
                    referralItem.put("percent", Double.toString(pct) + "%");

                    referralMapList.add(referralItem);
                }
            }
            demoInfoMap.put(TCESConstants.DEMOGRAPHIC_REFERRAL_KEY, referralMapList);

            rsc = (getJobID() > 0) ?
                    (ResultSetContainer) resultMap.get("TCES_Position_Demographic_Responses")
                    : (ResultSetContainer) resultMap.get("TCES_Campaign_Demographic_Responses");
            ResultSetContainer.ResultSetRow demoInfoRow = null;
            HashMap demoOtherMap = new HashMap();

            for (int rowI = 0; rowI < rsc.getRowCount(); rowI++) {
                demoInfoRow = rsc.getRow(rowI);

                if (demoOtherMap.get(demoInfoRow.getItem("demographic_question_text").toString()) == null) {
                    demoOtherMap.put(demoInfoRow.getItem("demographic_question_text").toString(),
                            new ArrayList());
                }
                ArrayList respList = (ArrayList) demoOtherMap.get(demoInfoRow.getItem("demographic_question_text").toString());

                double pct =
                        (((Long) demoInfoRow.getItem("resp_count").getResultData())).doubleValue()
                        / ((types[typeI] == TCESConstants.STUDENT_CODER_TYPE) ?
                        ((double) getStudentCoderCount()) : ((double) getProCoderCount()));
                pct = (int) (pct * 10000 + 0.5) / 100.0;

                HashMap respItem = new HashMap();

                respItem.put("title", demoInfoRow.getItem("response").toString());
                respItem.put("count", demoInfoRow.getItem("resp_count").toString());
                respItem.put("percent", Double.toString(pct) + "%");

                respList.add(respItem);
            }
            demoInfoMap.put(TCESConstants.DEMOGRAPHIC_INFO_KEY, demoOtherMap);

            if (types[typeI] == TCESConstants.STUDENT_CODER_TYPE)
                setStudentDemoInfo(demoInfoMap);
            else if (types[typeI] == TCESConstants.PRO_CODER_TYPE)
                setProDemoInfo(demoInfoMap);
        }

        if (getJobID() > 0) {
            // Position Demographics

            rsc = (ResultSetContainer) resultMap.get("TCES_Verify_Job_Access");
            if (rsc.getRowCount() == 0 && !super.getSessionInfo().isAdmin()) {
                throw new NotAuthorizedException(" cid=" + String.valueOf(getCampaignID()) +
                        " pid=" + String.valueOf(getJobID()) +
                        " does not belong to uid=" + String.valueOf(getUser().getId()));
            }
        } else {
            // Campaign Demographics

            rsc = (ResultSetContainer) resultMap.get("TCES_Verify_Campaign_Access");
            if (rsc.getRowCount() == 0 && !super.getSessionInfo().isAdmin()) {
                throw new NotAuthorizedException(" cid=" + String.valueOf(getCampaignID()) +
                        "does not belong to uid=" + String.valueOf(getUser().getId()));
            }
        }

    }


}


