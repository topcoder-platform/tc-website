package com.topcoder.web.common.model.educ;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.topcoder.web.common.model.Base;

/*
* @author dok
* @version $Revision: 66662 $Date:  10:42:59 PM
*          Create Date: Oct 12, 2007
*/
@Entity
@Table(name = "professor_status_lu")
public class ProfessorStatus extends Base {
    private Integer id;
    private String description;

    public static final Integer ACTIVE = 1;
    public static final Integer PENDING = 2;
    public static final Integer DELETED = 3;

    public ProfessorStatus() {
        super();
    }

    @Id
    @Column(name = "status_id")
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
