/*
 * CoderDemographicsTask.java
 *
 * Created on August 26, 2002, 12:50 AM
 */

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
 *
 * @author  George Dean
 */
public class CoderDemographicsTask extends BaseTask implements Task, Serializable {

    private static Logger log = Logger.getLogger(CoderDemographicsTask.class);

    private int uid;
    private int cid;
    private int jid;
    private int mid;

    /** Holds value of property questionList. */
    private List questionList;

    /** Holds value of property handle. */
    private String handle;

    /** Creates new CoderDemographicsTask */
    public CoderDemographicsTask() {
        super();
        setNextPage(TCESConstants.CODER_DEMOGRAPHICS_PAGE);

        uid=-1;
    }

    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
        throws Exception
    {
        super.servletPreAction(request, response);
        HttpSession session = request.getSession(true);

        if (!Authentication.isLoggedIn(session)) {
            log.debug("User not authenticated for access to TCES resource.");
            throw new TCESAuthenticationException("User not authenticated for access to TCES resource.");
        }

        uid = Authentication.userLoggedIn(session);
    }

    public void processStep(String step) throws Exception {
        viewCoderDemographics();
    }

    public void viewCoderDemographics() throws Exception {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("tces_member_demographics");

        dataRequest.setProperty("uid", Integer.toString(uid) );
        dataRequest.setProperty("cid", Integer.toString(getCampaignID()) );
        dataRequest.setProperty("jid", Integer.toString(getJobID()) );
        dataRequest.setProperty("mid", Integer.toString(getMemberID()) );

        DataAccessInt dai = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.OLTP_DATASOURCE_NAME));
        Map resultMap = dai.getData(dataRequest);

        ResultSetContainer rsc = (ResultSetContainer) resultMap.get("TCES_Member_Handle");
        if (rsc.getRowCount() == 0) {
            throw new Exception ("No member handle!");
        }
        ResultSetContainer.ResultSetRow handleRow = rsc.getRow(0);
        setHandle( handleRow.getItem("handle").toString() );

        rsc = (ResultSetContainer) resultMap.get("TCES_Verify_Member_Access");
        if (rsc.getRowCount() == 0) {
            throw new Exception ("mid="+Integer.toString(getMemberID())+
                                 " jid="+Integer.toString(getJobID())+
                                 " cid="+Integer.toString(getCampaignID())+
                                 " does not belong to uid="+Integer.toString(uid) );
        }

        rsc = (ResultSetContainer) resultMap.get("TCES_Member_Demographics");
        ArrayList qrList = new ArrayList();
        ResultSetContainer.ResultSetRow qrListRow = null;
        for (int rowI=0;rowI<rsc.getRowCount();rowI++) {
            qrListRow = rsc.getRow(rowI);
            HashMap qr = new HashMap();

            qr.put("question",
                    qrListRow.getItem("demographic_question_text").toString() );
            qr.put("response",
                    qrListRow.getItem("demographic_answer_text").toString() );

            qrList.add(qr);
        }

        setQuestionList( qrList );

        setNextPage( TCESConstants.CODER_DEMOGRAPHICS_PAGE );
    }

    public void setAttributes(String paramName, String[] paramValues) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(TCESConstants.CAMPAIGN_ID_PARAM))
            setCampaignID(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.JOB_ID_PARAM))
            setJobID(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.MEMBER_ID_PARAM))
            setMemberID(Integer.parseInt(value));
    }

    /** Getter for property campaignID.
     * @return Value of property campaignID.
     */
    public int getCampaignID() {
        return cid;
    }

    /** Setter for property campaignID.
     * @param campaignID New value of property campaignID.
     */
    public void setCampaignID(int campaignID) {
        cid = campaignID;
    }

    /** Getter for property jobID.
     * @return Value of property jobID.
     */
    public int getJobID() {
        return jid;
    }

    /** Setter for property jobID.
     * @param jobID New value of property jobID.
     */
    public void setJobID(int jobID) {
        jid = jobID;
    }

    /** Getter for property memberID.
     * @return Value of property memberID.
     */
    public int getMemberID() {
        return mid;
    }

    /** Setter for property memberID.
     * @param memberID New value of property memberID.
     */
    public void setMemberID(int memberID) {
        mid = memberID;
    }

    /** Getter for property questionList.
     * @return Value of property questionList.
     */
    public List getQuestionList() {
        return this.questionList;
    }

    /** Setter for property questionList.
     * @param questionList New value of property questionList.
     */
    public void setQuestionList(List questionList) {
        this.questionList = questionList;
    }

    /** Getter for property handle.
     * @return Value of property handle.
     */
    public String getHandle() {
        return this.handle;
    }

    /** Setter for property handle.
     * @param handle New value of property handle.
     */
    public void setHandle(String handle) {
        this.handle = handle;
    }

}
