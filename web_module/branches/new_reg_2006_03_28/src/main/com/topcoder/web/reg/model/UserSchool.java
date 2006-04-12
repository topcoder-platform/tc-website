package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 11, 2006
 */
public class UserSchool extends Base {

    private Identifier id;
    private User user;
    private School school;
    private Boolean current;
    private Degree degree;
    private Float GPA;
    private Float GPAScale;
    private Boolean viewable;

    public User getUser() {
        return user;
    }

    public School getSchool() {
        return school;
    }

    public Boolean isCurrent() {
        return current;
    }

    public void setCurrent(Boolean current) {
        this.current = current;
    }

    public Degree getDegree() {
        return degree;
    }

    public void setDegree(Degree degree) {
        this.degree = degree;
    }

    public Float getGPA() {
        return GPA;
    }

    public void setGPA(Float GPA) {
        this.GPA = GPA;
    }

    public Float getGPAScale() {
        return GPAScale;
    }

    public void setGPAScale(Float GPAScale) {
        this.GPAScale = GPAScale;
    }

    public Boolean isViewable() {
        return viewable;
    }

    public void setViewable(Boolean viewable) {
        this.viewable = viewable;
    }


    public Object clone() throws CloneNotSupportedException {
        UserSchool ret = (UserSchool) super.clone();
        ret.user = (User)user.clone();
        ret.school = (School)school.clone();
        ret.degree = (Degree)degree.clone();
        return ret;
    }

    public static class Identifier implements Serializable {
        private Long userId;
        private Long schoolId;

        public Identifier() {

        }

        public Identifier(Long userId, Long schoolId) {
            this.userId = userId;
            this.schoolId = schoolId;
        }

        public Long getUserId() {
            return userId;
        }

        public void setUserId(Long userId) {
            this.userId = userId;
        }

        public Long getSchoolId() {
            return schoolId;
        }

        public void setSchoolId(Long schoolId) {
            this.schoolId = schoolId;
        }


        public boolean equals(Object o) {
            if (o == null) {
                return false;
            } else {
                try {
                    UserSchool.Identifier oa = (UserSchool.Identifier) o;
                    return (oa.userId.equals(userId) &&
                            oa.schoolId.equals(schoolId));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(userId);
            buf.append(" ");
            buf.append(schoolId);
            return buf.toString().hashCode();
        }
    }



}
