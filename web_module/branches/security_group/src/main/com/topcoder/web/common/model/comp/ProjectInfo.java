package com.topcoder.web.common.model.comp;

import java.io.Serializable;
import com.topcoder.web.common.model.Base;


/**
 * @author cucu
= */
public class ProjectInfo extends Base {

    protected Identifier id = new Identifier();
    protected String value = null;

    public ProjectInfo() {
    }

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public static class Identifier implements Serializable {

        private Project project = null;
        private Integer typeId = null;


        public Identifier() {

        }


        public Identifier(Project project, Integer typeId) {
            this.project = project;
            this.typeId = typeId;
        }


        public Project getProject() {
            return project;
        }


        public void setProject(Project project) {
            this.project = project;
        }


        public Integer getTypeId() {
            return typeId;
        }


        public void setTypeId(Integer typeId) {
            this.typeId = typeId;
        }


        public boolean equals(Object o) {
            
            if (o == null || !(o instanceof ProjectInfo.Identifier)) {
                return false;
            }
            ProjectInfo.Identifier iec = (ProjectInfo.Identifier) o;
            return iec.getProject().getId().equals(this.getProject().getId())
                && iec.getTypeId().equals(this.getTypeId());
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(getProject().getId());
            buf.append(" ");
            buf.append(getTypeId());
            return buf.toString().hashCode();
        }
    }



}
