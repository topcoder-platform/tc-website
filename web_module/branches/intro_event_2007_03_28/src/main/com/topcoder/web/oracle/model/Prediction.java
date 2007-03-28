package com.topcoder.web.oracle.model;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.User;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 14, 2007
 */
public class Prediction extends Base {

    private Integer id;
    private User user;
    private Candidate candidate;
    private Round round;
    private Integer value;
    private Float score;

    public Prediction() {

    }


    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Candidate getCandidate() {
        return candidate;
    }

    public Round getRound() {
        return round;
    }

    public void setRound(Round round) {
        this.round = round;
    }

    public void setCandidate(Candidate candidate) {
        this.candidate = candidate;
    }


    public Float getScore() {
        return score;
    }

    public void setScore(Float score) {
        this.score = score;
    }
}
