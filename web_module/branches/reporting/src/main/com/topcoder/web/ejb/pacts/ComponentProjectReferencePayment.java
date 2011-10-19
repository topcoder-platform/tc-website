package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

/**
 * Payment for a component that includes a reference to a project.
 *
 * @author cucu
 *
 */
public abstract class ComponentProjectReferencePayment extends BasePayment {
    private long projectId;
    private String jiraIssueName;

    /**
     * Create a payment that references a component project.
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param projectId project that is being paid.
     */
    public ComponentProjectReferencePayment(int paymentTypeId, long coderId, double grossAmount, long projectId) {
        this(paymentTypeId, coderId, grossAmount, null, projectId, 0);
    }

    /**
     * Create a payment that references a component project.
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param projectId project that is being paid.
     * @param placed the place of the coder in the contest.
     */
    public ComponentProjectReferencePayment(int paymentTypeId, long coderId, double grossAmount, long projectId, int placed) {
        this(paymentTypeId, coderId, grossAmount, null, projectId, placed);
    }

    /**
     * Create a payment that references a component project.
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client of the project.
     * @param projectId project that is being paid.
     */
    public ComponentProjectReferencePayment(int paymentTypeId, long coderId, double grossAmount,
            String client, long projectId) {

        this(paymentTypeId, coderId, grossAmount, client, projectId, 0);
    }

    /**
     * Create a payment that references a component project.
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client of the project.
     * @param projectId project that is being paid.
     * @param placed the place of the coder in the contest.
     */
    public ComponentProjectReferencePayment(int paymentTypeId, long coderId, double grossAmount,
            String client, long projectId, int placed) {

        super(paymentTypeId, coderId, client, grossAmount, placed);
        this.projectId = projectId;
        this.jiraIssueName = null;
    }

    /**
     * Get the id of the project paid.
     *
     * @return the id of the project paid.
     */
    public long getProjectId() {
        return projectId;
    }

    /**
     * Set the id of the project paid.
     *
     * @param projectId the id of the project paid.
     */
    public void setProjectId(long projectId) {
        fieldChanged(MODIFICATION_REFERENCE, projectId != this.projectId);
        this.projectId = projectId;
    }

    /**
     * Get the name of the associated JIRA issue.
     *
     * @return the name of the JIRA issue.
     */
    public String getJiraIssueName() {
        return jiraIssueName;
    }

    /**
     * Set the name of the associated JIRA issue.
     *
     * @param jiraIssueName the name of the JIRA issue.
     */
    public void setJiraIssueName(String jiraIssueName) {
        fieldChanged(MODIFICATION_REFERENCE, jiraIssueName != this.jiraIssueName);
        this.jiraIssueName = jiraIssueName;
    }

    /**
     * Get whether the project referenced is a design project.
     * @return whether the project referenced is a design project.
     * @throws SQLException
     */
    public boolean isDesign() throws SQLException {
    	return "Design".equals(((ComponentProjectReferencePayment.Processor) getProcessor()).getProjectType(projectId));
    }
    
    /**
     * Processor for a payment referencing a project.
     * It provides methods for retrieving the name of the component, the type of project and the date of completion.
     *
     * @author Cucu
     */
    protected static abstract class Processor extends BasePayment.Processor {
        private String componentName = null;
        private String projectType = null;
        private Date completeDate = null;

        /**
         * Get the name of the referenced project.
         *
         * @return the name of the referenced project.
         * @throws SQLException if an error occurred trying to access db.
         */
        public String lookupReferenceDescription(BasePayment payment) throws SQLException {
            long id = ((ComponentProjectReferencePayment) payment).getProjectId();
            return getComponentName(id) + " - " + getProjectType(id);
        }

        /**
         * Get the date that the event took place.
         *
         * @param payment payment to look for its date.
         * @return the date that the event took place.
         */
        public Date lookupEventDate(BasePayment payment) throws SQLException {
            return getCompleteDate(((ComponentProjectReferencePayment) payment).getProjectId());
        }


        /**
         * Get the date that the project was completed.
         *
         * @param projectId project to look for.
         * @return the date that the project was completed.
         * @throws SQLException
         */
        protected Date getCompleteDate(long projectId) throws SQLException {
            if (completeDate == null) {
                lookupData(projectId);
            }
            return completeDate;
        }

        /**
         * Get the name of the component.
         *
         * @param projectId project to look for.
         * @return the name of the component.
         * @throws SQLException
         */
        protected String getComponentName(long projectId) throws SQLException {
            if (componentName == null) {
                lookupData(projectId);
            }
            return componentName;
        }
        
        /**
         * Get the type of project.
         *
         * @param projectId project to look for.
         * @return the type of project (1-design, 2-develop)
         * @throws SQLException
         */
        protected String getProjectType(long projectId) throws SQLException {
            if (projectType == null) {
                lookupData(projectId);
            }
            return projectType;
        }

        /**
         * Do the actual lookup of data in the db.
         *
         * @param projectId id of the project to lookup.
         * @throws SQLException
         */
        private void lookupData(long projectId) throws SQLException {
            StringBuffer query = new StringBuffer(300);
           
            query.append("select c.component_name, pc.name as phase_name, pi_complete.value as complete_date , pi_rt.value as version_text, cat.category_name ");
            query.append("from project p,   ");
            query.append("comp_catalog c,   ");
            query.append("project_info pi_comp, ");  
            query.append("project_category_lu pc,   ");
            query.append("project_info pi_rt, ");
            query.append("project_info pi_ri, ");
            query.append("categories cat,  ");
            query.append("OUTER  project_info pi_complete ");
            query.append("where pi_comp.value = c.component_id ");  
            query.append("and pi_complete.project_info_type_id = 21 ");  
            query.append("and pi_rt.project_id = p.project_id ");
            query.append("and pi_rt.project_info_type_id = 7 ");
            query.append("and p.project_category_id = pc.project_category_id ");    
            query.append("and pi_complete.project_id = p.project_id   ");
            query.append("and pi_comp.project_info_type_id = 2   ");
            query.append("and pi_comp.project_id = p.project_id   ");
            query.append("and pi_ri.project_id = p.project_id ");
            query.append("and pi_ri.project_info_type_id = 5 ");
            query.append("and pi_ri.value = cat.category_id ");
            query.append("and cat.parent_category_id is null ");
            query.append("and p.project_id = " + projectId);
            

            
            ResultSetContainer rsc = runSelectQuery(DBMS.TCS_OLTP_DATASOURCE_NAME, query.toString());

            if (rsc.getRowCount() != 1) {
                throw new IllegalArgumentException("Project " + projectId + " does not exist or is not unique");
            }

            componentName = "(" + rsc.getStringItem(0, "category_name") + ", v" +  
            	rsc.getStringItem(0, "version_text").trim() + ") " + rsc.getStringItem(0, "component_name");
                       		
            try {
				completeDate =  rsc.getStringItem(0, "complete_date") == null? new Date() : new SimpleDateFormat("MM/dd/yyyy HH:mm").parse(rsc.getStringItem(0, "complete_date"));
			} catch (ParseException e) {
				completeDate = new Date();
			}
            projectType = rsc.getStringItem(0, "phase_name");
        }

    }

}
