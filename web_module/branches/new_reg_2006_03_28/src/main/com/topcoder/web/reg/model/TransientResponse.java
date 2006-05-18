package com.topcoder.web.reg.model;

/**
 * This is a hoke class because i can't figure out a way to get hibernate
 * to persist the demographic responses on it's own.  the intended usage is
 * that one makes "sets" via this class, and "gets" via Demographic response.
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 18, 2006
 */
public class TransientResponse {

    private User user;
    private DemographicQuestion question;
    private DemographicAnswer  answer;
    private String response;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


    public DemographicQuestion getQuestion() {
        return question;
    }

    public void setQuestion(DemographicQuestion question) {
        this.question = question;
    }

    public DemographicAnswer getAnswer() {
        return answer;
    }

    public void setAnswer(DemographicAnswer answer) {
        this.answer = answer;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }


}
