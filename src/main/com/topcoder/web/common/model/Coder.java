package com.topcoder.web.common.model;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import com.topcoder.web.common.model.algo.RoomResult;
import com.topcoder.web.common.model.algo.RoundRegistration;
import com.topcoder.web.common.model.educ.Classroom;
import com.topcoder.web.common.model.educ.StudentClassroom;

/**
 * A class to hold coder data.
 *
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class Coder extends Base {

    private Long id;
    private Timestamp memberSince;
    private String quote;
    private CoderType coderType;
    private Country compCountry;
    /*
        private HSAlgoRating hsRating;
        private TCAlgoRating tcRating;
    */
    private CurrentSchool currentSchool;
    private CoderReferral coderReferral;
    private Set resumes;
    private User user;
    private Set teams;
    private Set images;

    private Set ratings;

    private Set<StudentClassroom> studentClassrooms;
    private Set<RoundRegistration> roundRegistrations;

    private Set<RoomResult> roomResults;

    public Coder() {
        this.resumes = new HashSet();
        this.teams = new HashSet();
        this.images = new HashSet();
        this.ratings = new HashSet();
        this.studentClassrooms = new HashSet<StudentClassroom>();
        this.roundRegistrations = new HashSet<RoundRegistration>();
        this.roomResults = new HashSet<RoomResult>();
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public Timestamp getMemberSince() {
        return memberSince;
    }

    public void setMemberSince(Timestamp memberSince) {
        this.memberSince = memberSince;
    }

    public String getQuote() {
        return quote;
    }

    public void setQuote(String quote) {
        this.quote = quote;
    }


    public Country getCompCountry() {
        return compCountry;
    }

    public void setCompCountry(Country compCountry) {
        this.compCountry = compCountry;
    }

/*
    public HSAlgoRating getHSRating() {
        return hsRating;
    }

    public void setHSRating(HSAlgoRating hsRating) {
        this.hsRating = hsRating;
    }

    public TCAlgoRating getTCRating() {
        return tcRating;
    }

    public void setTCRating(TCAlgoRating tcRating) {
        this.tcRating = tcRating;
    }
*/

    public CoderType getCoderType() {
        return coderType;
    }

    public void setCoderType(CoderType coderType) {
        this.coderType = coderType;
    }

    public CurrentSchool getCurrentSchool() {
        return currentSchool;
    }

    public void setCurrentSchool(CurrentSchool currentSchool) {
        this.currentSchool = currentSchool;
        currentSchool.setCoder(this);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set getResumes() {
        return Collections.unmodifiableSet(resumes);
    }

    public void setResumes(Set resumes) {
        this.resumes = resumes;
    }

    public void addResume(Resume resume) {
        this.resumes.add(resume);
    }

    public Set getTeams() {
        return Collections.unmodifiableSet(teams);
    }

    public void setTeams(Set teams) {
        this.teams = teams;
    }

    public void addTeam(Team t) {
        this.teams.add(t);
    }

    public void removeTeam(Team t) {
        this.teams.remove(t);
    }

    public Set getImages() {
        return Collections.unmodifiableSet(images);
    }

    public void setImages(Set images) {
        this.images = images;
    }

    public Set getRatings() {
        return Collections.unmodifiableSet(ratings);
    }

    public void setRatings(Set ratings) {
        this.ratings = ratings;
    }

    public void addRating(AlgoRating rating) {
        this.ratings.add(rating);
    }

    public boolean hasHSRating() {
        boolean found = false;
        for (Iterator it = getRatings().iterator(); it.hasNext() && !found;) {
            if (((AlgoRating) it.next()).getType().getId().equals(AlgoRatingType.HIGH_SCHOOL)) {
                found = true;
            }
        }
        return found;
    }

    public boolean hasTCRating() {
        boolean found = false;
        for (Iterator it = getRatings().iterator(); it.hasNext() && !found;) {
            if (((AlgoRating) it.next()).getType().getId().equals(AlgoRatingType.TC)) {
                found = true;
            }
        }
        return found;
    }

    public void addClassroom(Classroom c) {
        this.studentClassrooms.add(new StudentClassroom(this, c, StudentClassroom.PENDING_STATUS));
    }

    public void addClassrooms(Set<Classroom> classrooms) {
        Set<StudentClassroom> sc = new HashSet<StudentClassroom>();
        for (Classroom c : classrooms) {
            sc.add(new StudentClassroom(this, c, StudentClassroom.PENDING_STATUS));
        }
        this.studentClassrooms.addAll(sc);
    }

    public Set<StudentClassroom> getStudentClassrooms() {
        return Collections.unmodifiableSet(studentClassrooms);
    }

    
    public void setStudentClassrooms(Set<StudentClassroom> studentClassrooms) {
        this.studentClassrooms = studentClassrooms;
    }

    public Set<RoundRegistration> getRoundRegistrations() {
        return Collections.unmodifiableSet(roundRegistrations);
    }

    public void setRoundRegistrations(Set<RoundRegistration> roundRegistrations) {
        this.roundRegistrations = roundRegistrations;
    }

    public void removeRegistration(RoundRegistration rr) {
        rr.getId().setCoder(this);
        if (this.roundRegistrations.contains(rr)) {
            this.roundRegistrations.remove(rr);
        }
    }

    public Set<RoomResult> getRoomResults() {
        return Collections.unmodifiableSet(roomResults);
    }

    public void setRoomResults(Set<RoomResult> roomResults) {
        this.roomResults = roomResults;
    }

    public void removeRoomResult(RoomResult rs) {
        rs.getId().setCoder(this);
        if (this.roomResults.contains(rs)) {
            this.roomResults.remove(rs);
        }
    }

    public Image getMemberPhoto() {
        CoderImage c;
        for (Iterator it = images.iterator(); it.hasNext();) {
            c = (CoderImage) it.next();
            if (c.getDisplay().equals(Boolean.TRUE) && c.getImage().getImageTypeId().equals(Image.MEMBER_PHOTO_TYPE)) {
                return c.getImage();
            }
        }
        return null;
    }

    public Team getHighSchoolTeam() {
        Team t;
        Team ret = null;
        for (Iterator it = teams.iterator(); it.hasNext();) {
            t = (Team) it.next();
            if (t.getType().getId().equals(TeamType.HIGH_SCHOOL_TYPE)) {
                ret = t;
            }
        }
        return ret;
    }

    public CoderReferral getCoderReferral() {
        return coderReferral;
    }

    public void setCoderReferral(CoderReferral coderReferral) {
        this.coderReferral = coderReferral;
    }


}
