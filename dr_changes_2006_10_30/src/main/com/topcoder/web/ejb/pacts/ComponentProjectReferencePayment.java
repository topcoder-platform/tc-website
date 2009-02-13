package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
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
    private String client = null;


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

        super(paymentTypeId, coderId, grossAmount, placed);
        this.projectId = projectId;
        this.client = client;
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
     * Get the client for the project.
     *
     * @return the client for the project.
     */
    public String getClient() {
        return client;
    }

    /**
     * Set the client for the project.
     *
     * @param client the client for the project.
     */
    public void setClient(String client) {
        fieldChanged(MODIFICATION_REFERENCE, client != this.client);
        this.client = client;
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
            query.append("SELECT cc.component_name, p.complete_date, p.project_type_id ");
            query.append("FROM project p, comp_versions cv, comp_catalog cc ");
            query.append("WHERE p.comp_vers_id = cv.comp_vers_id ");
            query.append("AND cv.component_id = cc.component_id ");
            query.append("AND p.project_id = " + projectId + " ");
            query.append("AND p.cur_version = 1");
            ResultSetContainer rsc = runSelectQuery(DBMS.TCS_OLTP_DATASOURCE_NAME, query.toString());

            if (rsc.getRowCount() != 1) {
                throw new IllegalArgumentException("Project " + projectId + " does not exist or is not unique");
            }

            componentName = rsc.getStringItem(0, "component_name");
            completeDate =  rsc.getStringItem(0, "complete_date") == null? new Date() : rsc.getTimestampItem(0, "complete_date");
            projectType = rsc.getIntItem(0, "project_type_id") == 1? "Design" : "Development";
        }

    }

}
