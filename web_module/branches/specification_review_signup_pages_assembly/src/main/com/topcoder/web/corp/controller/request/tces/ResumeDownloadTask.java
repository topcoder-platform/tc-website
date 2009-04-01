package com.topcoder.web.corp.controller.request.tces;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.corp.common.TCESConstants;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.tc.model.Resume;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public class ResumeDownloadTask extends BaseTask {

    private Resume resume = null;
    private static Logger log = Logger.getLogger(ResumeDownloadTask.class);
    private long userId = -1;
    private long jobId = -1;
    private long campaignId = -1;
    private long memberId = -1;


    protected void businessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            log.debug("User not logged in, can't download a file.");
            throw new Exception("User not logged in, can't download a file.");
        } else {
            userId = getUser().getId();
        }

        setCampaignId(Long.parseLong(getRequest().getParameter(TCESConstants.CAMPAIGN_ID_PARAM)));
        setJobId(Long.parseLong(getRequest().getParameter(TCESConstants.JOB_ID_PARAM)));
        setMemberId(Long.parseLong(getRequest().getParameter(TCESConstants.MEMBER_ID_PARAM)));

        Request oltpDataRequest = new Request();
        oltpDataRequest.setContentHandle("tces_verify_member_access");
        oltpDataRequest.setProperty("uid", String.valueOf(getUserId()));
        oltpDataRequest.setProperty("jid", String.valueOf(getJobId()));
        oltpDataRequest.setProperty("cid", String.valueOf(getCampaignId()));
        oltpDataRequest.setProperty("mid", String.valueOf(getMemberId()));

        ResumeServices resumeServices = (ResumeServices) BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
        resume = resumeServices.getResume(getMemberId(), getOltp());

        Map oltpResultMap = getDataAccess(getOltp()).getData(oltpDataRequest);

        ResultSetContainer oltpRSC = (ResultSetContainer) oltpResultMap.get("TCES_Verify_Member_Access");
        if (oltpRSC.getRowCount() == 0 && !super.getSessionInfo().isAdmin()) {
            throw new Exception(" mid=" + String.valueOf(getMemberId())
                    + " jid=" + String.valueOf(getJobId())
                    + " cid=" + String.valueOf(getCampaignId())
                    + "does not belong to uid=" + String.valueOf(getUserId()));
        }

        getResponse().addHeader("content-disposition", "inline; filename=\"" + resume.getFileName() + "\"");
        getResponse().setContentType(resume.getMimeType());
        ServletOutputStream sos = getResponse().getOutputStream();
        sos.write(resume.getFile());
        getResponse().setStatus(HttpServletResponse.SC_OK);
        /* this is not really what i want to do, but i can't think of another
         * way to complete the download without having to forward to another page.
         */
        sos.flush();
        sos.close();
    }


    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getMemberId() {
        return memberId;
    }

    public void setMemberId(long memberId) {
        this.memberId = memberId;
    }

    public long getJobId() {
        return jobId;
    }

    public void setJobId(long jobId) {
        this.jobId = jobId;
    }

    public long getCampaignId() {
        return campaignId;
    }

    public void setCampaignId(long campaignId) {
        this.campaignId = campaignId;
    }

    public Resume getResume() {
        return resume;
    }

    public void setResume(Resume resume) {
        this.resume = resume;
    }

}
