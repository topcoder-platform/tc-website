package com.topcoder.web.jobposting.bean;

import com.topcoder.shared.util.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.jobposting.common.Constants;
import com.topcoder.web.jobposting.ejb.JobPostingServices.JobPostingServicesHome;
import com.topcoder.web.jobposting.ejb.JobPostingServices.JobPostingServices;
import com.topcoder.web.resume.ejb.ResumeServices.ResumeServices;
import com.topcoder.web.resume.ejb.ResumeServices.ResumeServicesHome;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.util.Cache;
import com.topcoder.ejb.AuthenticationServices.User;
import com.topcoder.ejb.DataCache.DataCache;

import javax.servlet.http.*;
import javax.naming.InitialContext;
import javax.naming.Context;
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
    private String password;
    private String quote;
    private String email;
    private String editor;
    private String language;
    private HashMap demographics;
    private HashSet notifications;
    private String schoolState;
    private String school;
    private String schoolName;
    private String coderType;
    private boolean hasResume;


    /** Creates new JobHitTask */
    public JobHitTask() {
        super();
        jobId = -1;
        userId = -1;
        hitType = -1;
        jobHits = new ArrayList();
        firstName = "";
        lastName = "";
        address1 = "";
        address2 = "";
        city = "";
        state = "";
        zip = "";
        country = "";
        phone = "";
        handle = "";
        password = "";
        quote = "";
        email = "";
        editor = "";
        language = "";
        coderType = "";
        demographics = new HashMap();
        notifications = new HashSet();
        schoolState = "";
        school = "";
        schoolName = "";
        hasResume = false;
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

        if (paramName.equalsIgnoreCase(Constants.JOB_HIT_TYPE_PARAM))
            setHitType(Integer.parseInt(value));
        else if (paramName.equalsIgnoreCase(Constants.JOB_ID_PARAM))
            setJobId(Integer.parseInt(value));
        else if (paramName.startsWith(Constants.JOB_HIT_PREFIX))
            jobHits.add(new Integer(paramName.substring(Constants.JOB_HIT_PREFIX.length())));
    }

    private void loadUserInfo(com.topcoder.ejb.AuthenticationServices.User user) throws Exception {
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
        setQuote(coder.getQuote());
        setEmail(user.getEmail());
        setEditor(Integer.toString(coder.getEditor().getEditorId()));
        setLanguage(Integer.toString(coder.getLanguage().getLanguageId()));
        setCoderType(Integer.toString(coder.getCoderType().getCoderTypeId()));
        ArrayList notificationObjects = coder.getNotifications();
        for (int i = 0; i < notificationObjects.size(); i++) {
            Notify notify = (Notify) notificationObjects.get(i);
            notifications.add(Integer.toString(notify.getNotifyId()));
        }

        ArrayList assignments = getDemographicAssignments(coder.getCoderType().getCoderTypeId());
        for (int i = 0; i < assignments.size(); i++) {
            DemographicAssignment assignment = (DemographicAssignment) assignments.get(i);
            DemographicQuestion question = assignment.getDemographicQuestion();
            String questionId = Integer.toString(question.getDemographicQuestionId());
            ArrayList responseList = getDemographicResponses(coder.getDemographicResponses(), question.getDemographicQuestionId());
            if (responseList != null) {
                for (int j = 0; j < responseList.size(); j++) {
                    DemographicResponse response = (DemographicResponse) responseList.get(j);
                    String answer = null;
                    if (question.getSelectable().equals("Y") || question.getSelectable().equals("M")) {
                        answer = Integer.toString(response.getDemographicAnswerId());
                    } else {
                        answer = response.getDemographicResponseText();
                    }
                    setDemographic(questionId, answer);
                }
             }
        }
        schoolState = coder.getCurrentSchool().getState().getStateCode();
        school = Integer.toString(coder.getCurrentSchool().getSchoolId());
        schoolName = coder.getCurrentSchool().getName();

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getQuote() {
        return quote;
    }

    public void setQuote(String quote) {
        this.quote = quote;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEditor() {
        return editor;
    }

    public void setEditor(String editor) {
        this.editor = editor;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public HashMap getDemographics() {
        return demographics;
    }

    public void setDemographics(HashMap demographics) {
        this.demographics = demographics;
    }

    public HashSet getNotifications() {
        return notifications;
    }

    public void setNotifications(HashSet notifications) {
        this.notifications = notifications;
    }

    public String getSchoolState() {
        return schoolState;
    }

    public void setSchoolState(String schoolState) {
        this.schoolState = schoolState;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getCoderType() {
        return coderType;
    }

    public void setCoderType(String coderType) {
        this.coderType = coderType;
    }



    private ArrayList getDemographicAssignments(int coderType)
            throws Exception {
        ArrayList demographicAssignments = new ArrayList();
        Context context = null;
        try {
            DataCache cache = Cache.get();
            demographicAssignments.addAll(cache.getDemographicAssignments(coderType));
        } catch (Exception e) {
            log.error(e.toString());
            throw e;
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (Exception e) {
                }
            }
        }
        return demographicAssignments;
    }


    private ArrayList getDemographicResponses(ArrayList responses, int questionId) {
        ArrayList result = null;
        for (int i = 0; i < responses.size(); i++) {
            DemographicResponse response = (DemographicResponse) responses.get(i);
            if (response.getDemographicQuestionId() == questionId) {
                if (result == null) {
                    result = new ArrayList(responses.size());
                }
                result.add(response);
            }
        }
        if (result != null) {
            result.trimToSize();
        }
        return result;
    }



     private void setDemographic(String questionId, String value) {
        try {
            Integer.parseInt(questionId);
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }

        ArrayList answers = null;
        if (this.demographics.containsKey(questionId)) {
            answers = (ArrayList) this.demographics.get(questionId);
            log.debug("setDemographic: demographics hash: found QId for: " + questionId);
        } else {
            answers = new ArrayList();
            this.demographics.put(questionId, answers);
            log.debug("setDemographic: demographics hash: did not find QId for: " + questionId);
        }

        int pos = answers.indexOf(value);
        log.debug("setDemographic: found in answer list: " + value + " at " + pos);

        if (pos > -1) {
            answers.remove(pos);
            log.debug("setDemographic: answer list removed: " + pos);
        }

        //if ( !isEmpty(value) ) {
        answers.add(value);
        log.debug("setDemographic: answer list added: " + value);
        //}

        if (answers.size() == 0) {
            this.demographics.remove(questionId);
            log.debug("setDemographic: questionId removed from demographics hash: " + questionId);
        }

    }
}
