package com.topcoder.web.common.model;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import javax.persistence.*;

/*
* @author dok
* @version $Revision$Date:  4:28:09 PM
*          Create Date: Oct 11, 2007
*/
@Entity
@Table(name = "user_school")
public class UserSchool extends Base {

    private Long id;
    private Boolean primary;
    private SchoolAssociationType schoolAssociationType;
    private User user;
    private School school;

    public UserSchool() {
    }

    @GenericGenerator(name = "generator", strategy = "com.topcoder.web.common.model.IdGenerator", parameters = @Parameter(name = "sequence_name", value = "USER_SCHOOL_SEQ"))
    @Id
    @GeneratedValue(generator = "generator")
    @Column(name = "user_school_id", nullable = false)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "primary_ind", nullable = false)
    public Boolean isPrimary() {
        return primary;
    }

    public void setPrimary(Boolean primary) {
        this.primary = primary;
    }

    @ManyToOne()
    @JoinColumn(name = "school_association_type_id", nullable = false)
    public SchoolAssociationType getAssociationType() {
        return schoolAssociationType;
    }

    public void setAssociationType(SchoolAssociationType schoolAssociationType) {
        this.schoolAssociationType = schoolAssociationType;
    }

    @ManyToOne()
    @JoinColumn(name = "user_id", nullable = false)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    //@ManyToOne()
    @ManyToOne()
    @Cascade(org.hibernate.annotations.CascadeType.SAVE_UPDATE)
    @JoinColumn(name = "school_id", nullable = false)
    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
    }
}
