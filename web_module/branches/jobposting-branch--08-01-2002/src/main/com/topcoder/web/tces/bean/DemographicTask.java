package com.topcoder.web.tces.bean;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.web.tces.common.*;
import com.topcoder.web.tces.ejb.TCESServices.TCESServices;
import com.topcoder.web.tces.ejb.TCESServices.TCESServicesHome;

import javax.naming.InitialContext;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

/**
 * Processes the demographic task.
 * @author bigjake <kitz@mit.edu>
 *
 */

public class DemographicTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(DemographicTask.class);

    private int campaignID;
    private int positionID;
    private String companyName;
    private String campaignName;
    private String positionName;
    private int studentCoderCount;
    private int proCoderCount;

    private int uid;

    public DemographicTask() {
        super();
        setNextPage(TCESConstants.DEMOGRAPHIC_PAGE);

        uid=-1;

        setPositionID(-1);
        setCampaignID(-1);
    }

    public void setStudentCoderCount( int studentCoderCount ) {
        this.studentCoderCount = studentCoderCount;
    }

    public int getStudentCoderCount() {
        return studentCoderCount;
    }

    public void setProCoderCount( int proCoderCount ) {
        this.proCoderCount = proCoderCount;
    }

    public int getProCoderCount() {
        return proCoderCount;
    }

    public void setCampaignName( String campaignName ) {
        this.campaignName = campaignName;
    }

    public String getCampaignName() {
        return campaignName;
    }

    public void setPositionName( String positionName ) {
        this.positionName = positionName;
    }

    public String getPositionName() {
        return positionName;
    }

    public int getCampaignID() {
        return campaignID;
    }

    public void setCampaignID(int campaignID) {
        this.campaignID = campaignID;
    }

    public int getPositionID() {
        return positionID;
    }

    public void setPositionID(int positionID) {
        this.positionID = positionID;
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

        Integer userId = (Integer)session.getAttribute("user_id");
        if (userId == null || (userId.intValue()<0) ) {
            log.debug("User not authenticated for access to ES main page.");
            throw new Exception("User not authenticated for access to ES main page.");
        }

        uid = userId.intValue();
    }

    public void processStep(String step)
        throws Exception
    {
        viewDemographics();
    }

    private void viewDemographics() throws Exception
    {
        Request dataRequest = new Request();

        if (getPositionID()>0) {
            // Position Demographics
            dataRequest.setContentHandle("tces_campaign_demographics");
        }
        else {
            // Campaign Demographics
            dataRequest.setContentHandle("tces_position_demographics");
            dataRequest.setProperty("pid", Integer.toString(getPositionID()) );
        }

        dataRequest.setProperty("uid", Integer.toString(uid) );
        dataRequest.setProperty("cid", Integer.toString(getCampaignID()) );
        DataAccessInt dai = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.OLTP_DATASOURCE_NAME));
        Map resultMap = dai.getData(dataRequest);

        ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_Info");
        ResultSetContainer.ResultSetRow cpgnInfRow = rsc.getRow(0);
        setCampaignName( cpgnInfRow.getItem("campaign_name").toString() );

        if (getPositionID()>0) {
            rsc = (ResultSetContainer) resultMap.get("TCES_Position_Name");
            ResultSetContainer.ResultSetRow posNameRow = rsc.getRow(0);
            setPositionName( posNameRow.getItem("job_desc").toString() );
        }

        if (getPositionID()>0) {
            // Position Demographics

//            dataRequest.setProperty("pid", Integer.toString(getPositionID()) );


        }
        else {
            // Campaign Demographics

            int types[] = { TCESConstants.PRO_CODER_TYPE,
                            TCESConstants.STUDENT_CODER_TYPE };

            for (int typeI=0;typeI<types.length;typeI++) {
                dataRequest.setProperty("uid", Integer.toString(uid) );
                dataRequest.setProperty("cid", Integer.toString(getCampaignID()) );
                dataRequest.setProperty("ct", new Integer(types[typeI]) );
                dai = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.OLTP_DATASOURCE_NAME));
                resultMap = dai.getData(dataRequest);

                rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_Coders_By_Type");
                ResultSetContainer.ResultSetRow coderCountRow = rsc.getRow(0);
                if (types[typeI]==TCESConstants.STUDENT_CODER_TYPE)
                    setStudentCoderCount( ((Integer)coderCountRow.getItem("coder_type_count").getResultData()).intValue() );
                else if (types[typeI]==TCESConstants.PRO_CODER_TYPE)
                    setProCoderCount( ((Integer)coderCountRow.getItem("coder_type_count").getResultData()).intValue() );

                HashMap demoInfoMap = new HashMap();

                rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_Referral_Responses");
                ResultSetContainer.ResultSetRow refRspRow = null;
                ArrayList referralMapList = new ArrayList();
                for (int rowI=0;rowI<rsc.getRowCount();rowI++) {
                    Map refRspRow = rsc.getRow(rowI);
                    Map referralItem = new HashMap();

                    double pct = ((double)((Integer)refRspRow.getItem("resp_count").getResultData()).intValue()) /
                            ((double) getStudentCoderCount());

                    referralItem.put("title", refRspRow.getItem("referral_desc").toString() );
                    referralItem.put("count", refRspRow.getItem("resp_count").toString() );
                    referralItem.put("percent", Double.toString(pct)+"%");

                    referralMapList.add(referralItem);
                }
                demoInfoMap.put( TCESConstants.DEMOGRAPHIC_REFERRAL_KEY , referralMapList );

                rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_Notify_Responses");
                ResultSetContainer.ResultSetRow notifyRow = null;
                ArrayList notifyMapList = new ArrayList();
                for (int rowI=0;rowI<rsc.getRowCount();rowI++) {
                    Map notifyRow = rsc.getRow(rowI);
                    Map notifyItem = new HashMap();

                    double pct =
                        ((double)((Integer)notifyRow.getItem("resp_count").getResultData()).intValue())
                        / ((double) getStudentCoderCount());

                    notifyItem.put("response", notifyRow.getItem("response").toString() );
                    notifyItem.put("percent", Double.toString(pct)+"%");

                    notifyMapList.add(notifyItem);
                }
                demoInfoMap.put( TCESConstants.DEMOGRAPHIC_NOTIFY_KEY , notifyMapList );


                rsc = (ResultSetContainer) resultMap.get("TCES_Campaign_Demographic_Responses");
                ResultSetContainer.ResultSetRow demoInfoRow = null;

                for (int rowI=0;rowI<rsc.getRowCount();rowI++) {
                    demoInfoRow = rsc.getRow(rowI);

                    if (demoInfoMap.get( demoInfoRow.getItem("demographic_question_text").toString()) == null) {
                        demoInfoMap.put( demoInfoRow.getItem("demographic_question_text").toString(),
                                         new ArrayList() );
                    }
                    ArrayList respList = (ArrayList)demoInfoMap.get(demoInfoRow.getItem("demographic_question_text").toString());

                    double pct =
                        ((double)((Integer)demoInfoRow.getItem("resp_count").getResultData()).intValue())
                        / ((double) getStudentCoderCount());

                    HashMap respItem = new HashMap();

                    respItem.put("response", demoInfoRow.getItem("response").toString() );
                    respItem.put("resp_count", demoInfoRow.getItem("resp_count").toString() );
                    respItem.put("percent", Double.toString(pct)+"%");

                    respList.add(respItem);
                }
                demoInfoMap.put( TCESConstants.DEMOGRAPHIC_INFO_KEY , referralMapList );

                if (types[typeI]==TCESConstants.STUDENT_CODER_TYPE)
                    setStudentDemoInfo(demoInfoMap);
                else if (types[typeI]==TCESConstants.PRO_CODER_TYPE)
                    setProDemoInfo(demoInfoMap);
            }

        }

        rsc = (ResultSetContainer) resultMap.get("TCES_Verify_Campaign_Access");
        if (rsc.getRowCount() == 0) {
            throw new Exception (" cid="+Integer.toString(getCampaignID())+
                                 "does not belong to uid="+Integer.toString(uid) );
        }

        if (getPositionID()>0) {
            // Position Demographics

            rsc = (ResultSetContainer) resultMap.get("TCES_Verify_Position_Access");
            if (rsc.getRowCount() == 0) {
                throw new Exception (" cid="+Integer.toString(getCampaignID())+
                                     " pid="+Integer.toString(getPositionID())+
                                     " does not belong to uid="+Integer.toString(uid) );
            }
        }


        setNextPage( TCESConstants.DEMOGRAPHIC_PAGE );
    }

    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(TCESConstants.CAMPAIGN_ID_PARAM))
            setCampaignID(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.POSITION_ID_PARAM))
            setPositionID(Integer.parseInt(value));
    }

}


