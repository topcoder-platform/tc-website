package com.topcoder.common.web.data.report;

import com.topcoder.common.web.util.Conversion;

import java.io.Serializable;
import java.util.ArrayList;

public class Profile implements Serializable {

    private Query generalQuery;
    private Query educationQuery;
    private Query demographicQuery;
    private Query jobQuery;
    private ResultItem[] generalInfo;
    private ArrayList educationList;
    private ArrayList demographicList;
    private ArrayList jobList;

    private String handle;
    private String firstName;
    private String lastName;

    private static final int[] GENERAL_QUERY_TYPES = {ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.DATE, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.DATE, ResultItem.STRING, ResultItem.STRING, ResultItem.STRING};
    private static final String GENERAL_QUERY =
            " SELECT u.user_id" +
            " ,r.rating" +
            " ,r.num_ratings" +
            " ,c.member_since" +
            " ,c.first_name" +
            " ,c.middle_name" +
            " ,c.last_name" +
            " ,u.email" +
            " ,c.address1" +
            " ,c.address2" +
            " ,c.city" +
            " ,c.state_code" +
            " ,c.zip" +
            " ,c.home_phone" +
            " ,c.work_phone" +
            " ,re.referral_desc" +
            " ,ct.coder_type_desc" +
            " ,u.handle" +
            " ,r.last_rated_event" +
            " ,c.notify" +
            " ,CASE WHEN cref.referral_id = 6 THEN (SELECT name " +
            " FROM school" +
            " WHERE school_id = cref.reference_id)" +
            " WHEN cref.referral_id = 10 THEN cref.other" +
            " WHEN cref.referral_id = 40 THEN (SELECT handle" +
            " FROM user" +
            " WHERE user_id = cref.reference_id)" +
            " ELSE '' END" +
            " ,us.user_status_desc" +
            " FROM user u" +
            " JOIN coder c ON u.user_id = c.coder_id" +
            " AND LOWER(u.handle) like LOWER('?')" +
            " AND LOWER(c.first_name) like LOWER('?')" +
            " AND LOWER(c.last_name) like LOWER('?')" +
            " JOIN rating r ON r.coder_id = c.coder_id  " +
            " JOIN coder_referral cref ON cref.coder_id = c.coder_id" +
            " JOIN referral re ON re.referral_id = cref.referral_id" +
            " JOIN coder_type ct ON c.coder_type_id = ct.coder_type_id" +
            " JOIN user_status_lu us ON u.status = us.user_status_id";


    private static final int[] EDUCATION_QUERY_TYPES = {ResultItem.STRING, ResultItem.STRING, ResultItem.STRING, ResultItem.INT, ResultItem.INT};
    private static final String EDUCATION_QUERY =
            " SELECT s.name" +
            " ,d.degree_desc" +
            " ,e.major" +
            " ,e.graduation_year" +
            " ,e.graduation_month" +
            " FROM education e" +
            " JOIN school s ON e.school_id = s.school_id" +
            " JOIN degree d ON d.degree_id = e.degree_id" +
            " AND e.coder_id = ?" +
            " ORDER BY graduation_year, graduation_month";


    private static final int[] JOB_QUERY_TYPES = {ResultItem.STRING, ResultItem.STRING, ResultItem.INT, ResultItem.INT, ResultItem.INT, ResultItem.INT};
    private static final String JOB_QUERY =
            "SELECT company" +
            " ,title" +
            " ,start_month" +
            " ,start_year" +
            " ,end_month" +
            " ,end_year" +
            " FROM experience e" +
            " WHERE coder_id = ?" +
            " ORDER BY start_year, start_month";


    private static final int[] DEMOGRAPHIC_QUERY_TYPES = {ResultItem.STRING, ResultItem.STRING};
    private static final String DEMOGRAPHIC_QUERY =
            " SELECT dq.demographic_question_text" +
            " ,da.demographic_answer_text" +
            " ,dq.demographic_question_id" +
            " FROM demographic_question dq" +
            " JOIN demographic_answer da ON da.demographic_question_id = dq.demographic_question_id" +
            " JOIN demographic_response dr ON dr.demographic_answer_id = da.demographic_answer_id" +
            " AND dr.coder_id = ?" +
            " ORDER BY dq.demographic_question_id";


    public Profile(String handle, String firstName, String lastName) {
        if (Conversion.checkNull(handle).equals(""))
            this.handle = "%";
        else
            this.handle = handle.trim();
        if (Conversion.checkNull(firstName).equals(""))
            this.firstName = "%";
        else
            this.firstName = firstName.trim();
        if (Conversion.checkNull(lastName).equals(""))
            this.lastName = "%";
        else
            this.lastName = lastName.trim();
        generalInfo = null;
        educationList = new ArrayList();
        generalQuery = new Query(GENERAL_QUERY, GENERAL_QUERY_TYPES);
        educationQuery = new Query(EDUCATION_QUERY, EDUCATION_QUERY_TYPES);
        demographicQuery = new Query(DEMOGRAPHIC_QUERY, DEMOGRAPHIC_QUERY_TYPES);
        jobQuery = new Query(JOB_QUERY, JOB_QUERY_TYPES);
    }


    public String getHandle() {
        if (generalInfo == null) return "";
        return generalInfo[17].toString();
    }

    public String getUserId() {
        if (generalInfo == null) return "";
        return generalInfo[0].toString();
    }

    public String getCoderType() {
        if (generalInfo == null) return "";
        return generalInfo[16].toString();
    }

    public String getFirstName() {
        if (generalInfo == null) return "";
        return generalInfo[4].toString();
    }

    public String getLastName() {
        if (generalInfo == null) return "";
        return generalInfo[6].toString();
    }

    public String getEmail() {
        if (generalInfo == null) return "";
        return generalInfo[7].toString();
    }

    public String getRating() {
        if (generalInfo == null) return "";
        return generalInfo[1].toString();
    }

    public String getNumRatings() {
        if (generalInfo == null) return "";
        return generalInfo[2].toString();
    }

    public String getAddress1() {
        if (generalInfo == null) return "";
        return generalInfo[8].toString();
    }

    public String getAddress2() {
        if (generalInfo == null) return "";
        return generalInfo[9].toString();
    }

    public String getCity() {
        if (generalInfo == null) return "";
        return generalInfo[10].toString();
    }

    public String getState() {
        if (generalInfo == null) return "";
        return generalInfo[11].toString();
    }

    public String getZip() {
        if (generalInfo == null) return "";
        return generalInfo[12].toString();
    }

    public String getHomePhone() {
        if (generalInfo == null) return "";
        return generalInfo[13].toString();
    }

    public String getWorkPhone() {
        if (generalInfo == null) return "";
        return generalInfo[14].toString();
    }

    public String getMemberSince() {
        if (generalInfo == null) return "";
        return generalInfo[3].toString();
    }

    public String getLastRatedEvent() {
        if (generalInfo == null) return "";
        return generalInfo[18].toString();
    }

    public String getReferralType() {
        if (generalInfo == null) return "";
        return generalInfo[15].toString();
    }

    public String getNotify() {
        if (generalInfo == null)
            return "";
        else if (generalInfo[19].toString().compareToIgnoreCase("Y") == 0)
            return "Yes";
        else if (generalInfo[19].toString().compareToIgnoreCase("N") == 0)
            return "No";
        else
            return "?";
    }

    public String getReferralInfo() {
        if (generalInfo == null)
            return "";
        else if (generalInfo[20].toString() == null)
            return "";
        else
            return generalInfo[20].toString();
    }

    public String getStatus() {
        if (generalInfo == null) return "";
        return generalInfo[21].toString();
    }


    public ArrayList getEducationList() {
        return educationList;
    }

    public ArrayList getDemographicList() {
        return demographicList;
    }

    public ArrayList getJobList() {
        return jobList;
    }

    public String toString() {
        return "Report: " + handle;
    }

    public void execute() throws Exception {
        generalQuery.setValue(handle);
        generalQuery.setValue(firstName);
        generalQuery.setValue(lastName);
        ArrayList a = generalQuery.execute();
        if (a.size() == 0)
            throw new Exception("Could not find user with handle: " + handle + " first name: " + firstName + " last name: " + lastName);
        else
            generalInfo = (ResultItem[]) a.get(0);

        educationQuery.setValue(getUserId());
        educationList = educationQuery.execute();
        demographicQuery.setValue(getUserId());
        demographicList = demographicQuery.execute();
        jobQuery.setValue(getUserId());
        jobList = jobQuery.execute();
    }

}







