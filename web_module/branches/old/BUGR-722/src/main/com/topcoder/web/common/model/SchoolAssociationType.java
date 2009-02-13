package com.topcoder.web.common.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/*
* @author dok
* @version $Revision: 66662 $Date:  4:30:12 PM
*          Create Date: Oct 11, 2007
*/
@Entity
@Table(name = "school_association_type_lu")
public class SchoolAssociationType extends Base {
    private Integer id;
    private String description;

    public static final Integer STUDENT = 1;
    public static final Integer TEACHER = 2;

    public SchoolAssociationType() {
        super();
    }

    @Id
    @Column(name = "school_association_type_id")
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "school_association_type_desc")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
