package com.topcoder.web.tc.controller.legacy.jobposting.bean;

import com.topcoder.shared.util.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.tc.controller.legacy.jobposting.common.Constants;
import com.topcoder.web.ejb.jobposting.JobPostingServices;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.util.Data;

import javax.servlet.http.*;
import java.io.Serializable;
import java.util.*;

/**
 * A class to process job hits.
 * @author  Greg Paul
 */
public class JobHitTask extends BaseTask implements TaskInt, Serializable {

    private static Logger log = Logger.getLogger(JobHitTask.class);

    public static final String CODER_TYPE_STUDENT = "1";
    private long jobId;
    private int hitType;
    private ArrayList jobHits;

    private long userId;
    private int rating;
    private String firstName;
    private String lastName;
    private String address1;
    private String address2;
    private String city;
    private String state;
    private String zip;
    private String country;
    private String phone;
    private String handle;
    private String email;
    private String coderType;
    private String coderTypeId;
    private String school;
    private String memberSince;
    private String mostRecentEvent;
    private String gpa;
    private String gpaScale;
    private Map demographics;
    private boolean hasResume;
    private boolean newbie;
    private long nextRoundId;
    private long nextContestId;
    private String nextRoundName;
    private String nextContestName;


    /** Creates new JobHitTask */
    public JobHitTask() {
        super();
        setJobHits(new ArrayList());
        setUserId(-1);
        setRating(0);
        setFirstName("");
        setLastName("");
        setAddress1("");
        setAddress2("");
        setCity("");
        setState("");
        setZip("");
        setCountry("");
        setPhone("");
        setHandle("");
        setEmail("");
        setCoderType("");
        setCoderTypeId("");
        setSchool("");
        setMemberSince("");
        setMostRecentEvent("");
        setGpa("");
        setGpaScale("");
        setDemographics(new TreeMap());
        setHasResume(false);
        setNewbie(false);
        setNextRoundId(0);
        setNextContestId(0);
        setNextRoundName("");
        setNextContestName("");
    }

    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        HttpSession session = request.getSession(true);

        Navigation navigation = (Navigation) session.getAttribute("navigation");
        if (navigation==null) navigation = new Navigation(request, response);
        if (navigation == null || !navigation.isIdentified()) {
            log.debug("User not logged in, can not add job hit.");
            throw new Exception("User not logged in, can not add job hit.");
        } else {
            Data.loadUser(navigation);
            loadUserInfo(navigation.getUser());
        }
    }

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
    }

    public void processStep(String step) throws Exception {
        JobPostingServices jpServices = null;
        try {
            log.debug("user rating: " + getRating());
            if (getRating() > 0) {
                if (hasResume()) {
                    jpServices = (JobPostingServices) BaseProcessor.createEJB(getInitialContext(), JobPostingServices.class);
                    if (jobHits.size() > 0) {
                        for (int i = 0; i < jobHits.size(); i++) {
                            long currJob = ((Long) jobHits.get(i)).intValue();
                            try {
                                if (jpServices.jobExists(currJob, DBMS.OLTP_DATASOURCE_NAME)) {
                                    jpServices.addJobHit(userId, currJob, Constants.JOB_POSTING_ID, DBMS.OLTP_DATASOURCE_NAME);
                                } else {
                                    throw new Exception("job: " + currJob + " either doesn't exist or isn't active");
                                }
                            } catch (Exception e) {
                                throw new Exception("failed to add job hit for user: " + userId +
                                        " job: " + jobHits.get(i) +
                                        " hit type: " + Constants.JOB_POSTING_ID);
                            }
                        }
                        setNextPage(Constants.PROFILE_PAGE);
                        setNextPageInternal(true);
                    } else {
                        try {
                            if (jpServices.jobExists(jobId, DBMS.OLTP_DATASOURCE_NAME)) {
                                jpServices.addJobHit(userId, jobId, hitType, DBMS.OLTP_DATASOURCE_NAME);
                                if (hitType==Constants.CLICK_THRU_ID) {
                                    setNextPage(jpServices.getLink(jobId, DBMS.OLTP_DATASOURCE_NAME));
                                    setNextPageInternal(false);
                                } else {
                                    setNextPage(Constants.PROFILE_PAGE);
                                    setNextPageInternal(true);
                                }
                            } else {
                                throw new Exception("job: " + jobId + " either doesn't exist or isn't active");
                            }
                        } catch (Exception e) {
                            throw new Exception("failed to add job hit for user: " + userId +
                                    " job: " + jobId +
                                    " hit type: " + Constants.JOB_POSTING_ID + "\n" + e.getMessage());
                        }
                    }
                } else {
                    setNextPage(Constants.NO_RESUME_PAGE);
                    setNextPageInternal(true);
                }
            } else {
                setNextPage(Constants.UNRATED_PAGE);
                setNextPageInternal(true);
            }
        } catch (Exception e) {
            throw e;
        }
    }


    public void setAttributes(String paramName, String[] paramValues) {
        String value = paramValues[0];
        value = (value == null?"":value.trim());

        if (paramName.equalsIgnoreCase(Constants.JOB_HIT_TYPE_PARAM)) {
            setHitType(Integer.parseInt(value));
        } else if (paramName.equalsIgnoreCase(Constants.JOB_ID_PARAM)) {
            setJobId(Long.parseLong(value));
        } else if (paramName.startsWith(Constants.JOB_HIT_PREFIX)) {
            jobHits.add(new Long(paramName.substring(Constants.JOB_HIT_PREFIX.length())));
        }
    }

    private void loadUserInfo(com.topcoder.common.web.data.User user) throws Exception {

        Request dataRequest = new Request();
        dataRequest.setContentHandle("member_profile_info");
        dataRequest.setProperty("mid", ""+getUserId());
        DataAccess data = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
        Map oltpMap = data.getData(dataRequest);
        ResultSetContainer profileInfo = (ResultSetContainer)oltpMap.get("TCES_Member_Profile");
        ResultSetContainer nextMatch = (ResultSetContainer)oltpMap.get("Next_SRM");

        data = new DataAccess(DBMS.DW_DATASOURCE_NAME);
        Map dwMap = data.getData(dataRequest);
        ResultSetContainer dwResult = (ResultSetContainer)dwMap.get("TCES_Coder_Stats");
        if (!dwResult.isEmpty()) {
            setMostRecentEvent(dwResult.getItem(0, "last_rated_event").toString());
        }

        CoderRegistration coder = (CoderRegistration) user.getUserTypeDetails().get("Coder");
        setUserId(user.getUserId());
        setRating(coder.getRating().getRating());
        setFirstName(coder.getFirstName());
        setLastName(coder.getLastName());
        setAddress1(coder.getHomeAddress1());
        setAddress2(coder.getHomeAddress2());
        setCity(coder.getHomeCity());
        setState(coder.getHomeState().getStateCode());
        setZip(coder.getHomeZip());
        setCountry(coder.getHomeCountry().getCountryCode());
        setPhone(coder.getHomePhone());
        setHandle(user.getHandle());
        setEmail(user.getEmail());
        setCoderType(coder.getCoderType().getCoderTypeDesc());
        setCoderTypeId(Integer.toString(coder.getCoderType().getCoderTypeId()));
        if (coder.getCurrentSchool().getGpa() > 0 && coder.getCurrentSchool().getGpaScale() > 0) {
            setGpa(String.valueOf(coder.getCurrentSchool().getGpa()));
            setGpaScale(String.valueOf(coder.getCurrentSchool().getGpaScale()));
        } else {
            setGpa("");
            setGpaScale("");
        }
        if (!profileInfo.isEmpty()) {
            setSchool(profileInfo.getItem(0, "school_name").toString());
            setMemberSince(profileInfo.getItem(0, "member_since_date").toString());
            setNewbie(((Integer)profileInfo.getItem(0, "num_ratings").getResultData()).intValue()==0);
        }
        if (!nextMatch.isEmpty()) {
            setNextRoundId(((Long)nextMatch.getItem(0, "round_id").getResultData()).intValue());
            setNextRoundName(nextMatch.getItem(0, "round_name").toString());
            setNextContestId(((Long)nextMatch.getItem(0, "contest_id").getResultData()).intValue());
            setNextContestName(nextMatch.getItem(0, "contest_name").toString());
        }

        dataRequest = new Request();
        dataRequest.setContentHandle("member_demographics");
        dataRequest.setProperty("mid", ""+getUserId());
        data = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
        Map resultMap = data.getData(dataRequest);
        ResultSetContainer rsc = (ResultSetContainer)resultMap.get("TCES_Member_Demographics");


        ResultSetContainer.ResultSetRow qrListRow = null;

        for (int rowI=0;rowI<rsc.getRowCount();rowI++) {
            qrListRow = rsc.getRow(rowI);

            demographics.put(qrListRow.getItem("demographic_question_text").toString(),
                    qrListRow.getItem("demographic_answer_text").toString());
        }


        ResumeServices rServices = null;
        try {
            rServices = (ResumeServices)BaseProcessor.createEJB(getInitialContext(), ResumeServices.class);
            setHasResume(rServices.hasResume(getUserId(), DBMS.OLTP_DATASOURCE_NAME));
        } catch (Exception e) {
            log.error("could not determine if user has a resume or not");
            throw e;
        }
    }
    public boolean hasResume() {
        return hasResume;
    }

    public void setHasResume(boolean hasResume) {
        this.hasResume = hasResume;
    }

    public boolean isNewbie() {
        return newbie;
    }

    public void setNewbie(boolean newbie) {
        this.newbie = newbie;
    }

    public ArrayList getJobHits() {
        return jobHits;
    }

    public void setJobHits(ArrayList jobHits) {
        this.jobHits = jobHits;
    }

    public int getHitType() {
        return hitType;
    }

    public void setHitType(int hitType) {
        this.hitType = hitType;
    }

    public long getJobId() {
        return jobId;
    }

    public void setJobId(long jobId) {
        this.jobId = jobId;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }


    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getHandle() {
        return handle;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Map getDemographics() {
        return demographics;
    }

    public void setDemographics(Map demographics) {
        this.demographics = demographics;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getCoderType() {
        return coderType;
    }

    public void setCoderType(String coderType) {
        this.coderType = coderType;
    }

    public String getCoderTypeId() {
        return coderTypeId;
    }

    public void setCoderTypeId(String coderTypeId) {
        this.coderTypeId = coderTypeId;
    }

    public String getMemberSince() {
        return memberSince;
    }

    public void setMemberSince(String memberSince) {
        this.memberSince = memberSince;
    }

    public String getMostRecentEvent() {
        return mostRecentEvent;
    }

    public void setMostRecentEvent(String mostRecentEvent) {
        this.mostRecentEvent = mostRecentEvent;
    }

    public String getGpa() {
        return gpa;
    }

    public void setGpa(String gpa) {
        this.gpa = gpa;
    }

    public String getGpaScale() {
        return gpaScale;
    }

    public void setGpaScale(String gpaScale) {
        this.gpaScale = gpaScale;
    }

    public long getNextRoundId() {
        return nextRoundId;
    }

    public void setNextRoundId(long nextRoundId) {
        this.nextRoundId = nextRoundId;
    }

    public long getNextContestId() {
        return nextContestId;
    }

    public void setNextContestId(long nextContestId) {
        this.nextContestId = nextContestId;
    }

    public String getNextRoundName() {
        return nextRoundName;
    }

    public void setNextRoundName(String nextRoundName) {
        this.nextRoundName = nextRoundName;
    }

    public String getNextContestName() {
        return nextContestName;
    }

    public void setNextContestName(String nextContestName) {
        this.nextContestName = nextContestName;
    }


}
