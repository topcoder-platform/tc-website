package com.topcoder.web.resume.bean;

import com.topcoder.web.resume.ejb.ResumeServices.ResumeServicesHome;
import com.topcoder.web.resume.ejb.ResumeServices.ResumeServices;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.web.resume.common.Constants;
import com.topcoder.web.tces.bean.Authentication;
import com.topcoder.web.tces.common.TCESConstants;

import javax.servlet.http.*;
import javax.servlet.ServletOutputStream;
import javax.naming.Context;
import java.util.Map;

public class CorporateDownloadTask extends ResumeTask{
    private Resume resume = null;
    private static Logger log = Logger.getLogger(CorporateDownloadTask.class);
    private int userId = -1;
    private int jobId = -1;
    private int campaignId = -1;
    private int memberId = -1;

    public CorporateDownloadTask() throws ResumeTaskException{
        super();
    }

    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession(true);

        if (!Authentication.isLoggedIn(session)) {
            log.debug("User not logged in, can't download a file.");
            throw new Exception("User not logged in, can't download a file.");
        } else {
            userId = Authentication.userLoggedIn(session);
        }

       
        Request oltpDataRequest = new Request();
        oltpDataRequest.setContentHandle("tces_verify_member_access");
        oltpDataRequest.setProperty("uid", Integer.toString(getUserId()));
        oltpDataRequest.setProperty("jid", Integer.toString(getJobId()));
        oltpDataRequest.setProperty("cid", Integer.toString(getCampaignId()));
        oltpDataRequest.setProperty("mid", Integer.toString(getMemberId()));

        DataAccess oltp = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.OLTP_DATASOURCE_NAME));
        Map oltpResultMap = oltp.getData(oltpDataRequest);

        ResultSetContainer oltpRSC = (ResultSetContainer) oltpResultMap.get("TCES_Verify_Member_Access");
        if (oltpRSC.getRowCount() == 0) {
            throw new ResumeTaskException (" mid="+Integer.toString(getMemberId())
                                 + " jid="+Integer.toString(getJobId())
                                 + " cid="+Integer.toString(getCampaignId())
                                 + "does not belong to uid="+Integer.toString(getUserId()) );
        }



    }

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setHeader("content-disposition","inline; filename="+resume.getFileName());
        response.setContentType(resume.getMimeType());
        ServletOutputStream sos = response.getOutputStream();
        sos.write(resume.getFile());
        response.setStatus(HttpServletResponse.SC_OK);
        /* this is not really what i want to do, but i can't think of another
         * way to complete the download without having to forward to another page.
         */
        sos.flush();
        sos.close();
    }

    public void processStep(String step) throws Exception {
        Context context = null;
        try{
            context = super.getInitialContext();
            ResumeServicesHome resumeServicesHome =
                    (ResumeServicesHome) context.lookup(ApplicationServer.RESUME_SERVICES);
            ResumeServices resumeServices = resumeServicesHome.create();
            resume = resumeServices.getResume(getMemberId());
        }catch(Exception e){
            throw new ResumeTaskException(e);
        }

    }

    /** Sets attributes for the task.
     * @param paramName The name of the attribute being set.
     * @param paramValues The values to be associated with the given attribute.
     */    
    public void setAttributes(String paramName, String paramValues[]) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());
        if (paramName.equalsIgnoreCase(TCESConstants.CAMPAIGN_ID_PARAM))
            setCampaignId(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.JOB_ID_PARAM))
            setJobId(Integer.parseInt(value));
        if (paramName.equalsIgnoreCase(TCESConstants.MEMBER_ID_PARAM))
            setMemberId(Integer.parseInt(value));
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getCampaignId() {
        return campaignId;
    }

    public void setCampaignId(int campaignId) {
        this.campaignId = campaignId;
    }

    public Resume getResume() {
        return resume;
    }

    public void setResume(Resume resume) {
        this.resume = resume;
    }

}
