package com.topcoder.web.jobposting.bean;

import com.topcoder.shared.util.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCTimestampResult;
import com.topcoder.web.jobposting.common.Constants;
import com.topcoder.web.jobposting.ejb.JobPostingServices.JobPostingServicesHome;
import com.topcoder.web.jobposting.ejb.JobPostingServices.JobPostingServices;
import com.topcoder.web.resume.ejb.ResumeServices.ResumeServices;
import com.topcoder.web.resume.ejb.ResumeServices.ResumeServicesHome;
import com.topcoder.common.web.data.*;
import com.topcoder.ejb.AuthenticationServices.User;

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
    private int jobId;
    private int hitType;
    private ArrayList jobHits;

    private int userId;
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
    private Map demographics;
    private boolean hasResume;


    /** Creates new JobHitTask */
    public JobHitTask() {
        super();
        setJobHits(new ArrayList());
        setUserId(-1);
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
        setDemographics(new TreeMap());
        setHasResume(false);
    }

    public void servletPreAction(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        HttpSession session = request.getSession(true);

        Navigation navigation = (Navigation) session.getAttribute("navigation");
        if (navigation == null || !navigation.getLoggedIn()) {
            log.debug("User not logged in, can not add job hit.");
            throw new Exception("User not logged in, can not add job hit.");
        } else {
            loadUserInfo(navigation.getUser());
        }
    }

    public void servletPostAction(HttpServletRequest request, HttpServletResponse response) throws Exception {
    }

    public void processStep(String step) throws Exception {
        JobPostingServicesHome jpHome = null;
        JobPostingServices jpServices = null;
        try {
            jpHome = (JobPostingServicesHome) getInitialContext().lookup(ApplicationServer.JOB_POSTING_SERVICES);
            jpServices = jpHome.create();
            if (jobHits.size() > 0) {
                for (int i = 0; i < jobHits.size(); i++) {
                    try {
                        jpServices.addJobHit(userId, ((Integer) jobHits.get(i)).intValue(),
                                Constants.JOB_POSTING_ID);
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
                    jpServices.addJobHit(userId, jobId, hitType);
                    if (hitType==Constants.CLICK_THRU_ID) {
                        setNextPage(jpServices.getLink(jobId));
                        setNextPageInternal(false);
                    } else {
                        // don't know where to go with this...needs to change...
                        setNextPage(Constants.ERROR_PAGE);
                        setNextPageInternal(true);
                    }
                } catch (Exception e) {
                    throw new Exception("failed to add job hit for user: " + userId +
                            " job: " + jobId +
                            " hit type: " + Constants.JOB_POSTING_ID);
                }
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
            setJobId(Integer.parseInt(value));
        } else if (paramName.startsWith(Constants.JOB_HIT_PREFIX)) {
            jobHits.add(new Integer(paramName.substring(Constants.JOB_HIT_PREFIX.length())));
        }
    }

    private void loadUserInfo(com.topcoder.ejb.AuthenticationServices.User user) throws Exception {
        setUserId(user.getUserId());

        Request dataRequest = new Request();
        dataRequest.setContentHandle("member_profile_info");
        dataRequest.setProperty("mid", ""+getUserId());
        DataAccess data = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.OLTP_DATASOURCE_NAME));
        Map oltpMap = data.getData(dataRequest);
        ResultSetContainer oltpResult = (ResultSetContainer)oltpMap.get("TCES_Member_Profile");

        data = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.DW_DATASOURCE_NAME));
        Map dwMap = data.getData(dataRequest);
        ResultSetContainer dwResult = (ResultSetContainer)dwMap.get("TCES_Coder_Stats");
        if (!dwResult.isEmpty()) {
            setMostRecentEvent(getDate(dwResult.getRow(0), "last_rated_event"));
        }


        CoderRegistration coder = (CoderRegistration) user.getUserTypeDetails().get("Coder");
        setUserId(user.getUserId());
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
        if (!oltpResult.isEmpty()) {
            setSchool(oltpResult.getItem(0, "school_name").toString());
            setMemberSince(oltpResult.getItem(0, "member_since_date").toString());
        }


        dataRequest = new Request();
        dataRequest.setContentHandle("member_demographics");
        dataRequest.setProperty("mid", ""+getUserId());
        data = new DataAccess((javax.sql.DataSource)getInitialContext().lookup(DBMS.OLTP_DATASOURCE_NAME));
        Map resultMap = data.getData(dataRequest);
        ResultSetContainer rsc = (ResultSetContainer)resultMap.get("TCES_Member_Demographics");


        ResultSetContainer.ResultSetRow qrListRow = null;

        for (int rowI=0;rowI<rsc.getRowCount();rowI++) {
            qrListRow = rsc.getRow(rowI);

            demographics.put(qrListRow.getItem("demographic_question_text").toString(),
                    qrListRow.getItem("demographic_answer_text").toString());
        }


        ResumeServicesHome rHome = null;
        ResumeServices rServices = null;
        try {
            rHome = (ResumeServicesHome) getInitialContext().lookup(ApplicationServer.RESUME_SERVICES);
            rServices = rHome.create();
            hasResume = rServices.hasResume(getUserId());
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

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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


    /** Retreives and parses a date from a ResultSetRow
     * @param row Row from which the date should be retreived
     * @param key Key for the date item within row
     */
    private String getDate(ResultSetContainer.ResultSetRow row,
                                     String key) {
        String defaultVal = "00/00/0000";
        try {
            StringTokenizer tok1 = new StringTokenizer(
                    ((TCTimestampResult) row.getItem(key)).toString());
            StringTokenizer token = new StringTokenizer(
                    (String) tok1.nextElement(), "-");

            String year = (String) token.nextElement();
            String returnString = "";
            while (token.hasMoreElements()) {
                returnString += (String) token.nextElement() + "/";
            }

            return returnString + year;
        } catch (Exception e) {
            log.debug("getDate got excepted with key=" + key);
            e.printStackTrace();

            if (defaultVal != null && defaultVal.equals("00/00/00"))
                return "00/00/0000";
            else
                return defaultVal;
        }
    }


}
