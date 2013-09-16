/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.pacts;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

/**
 * Payment for that includes a reference to a cockpit project.
 *
 * @author VolodymyrK
 *
 */
public abstract class CockpitProjectReferencePayment extends BasePayment {
    private long projectId;

    /**
     * Create a payment that references a cockpit project.
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param projectId project that is being paid.
     */
    public CockpitProjectReferencePayment(int paymentTypeId, long coderId, double grossAmount, long projectId) {
        this(paymentTypeId, coderId, grossAmount, null, projectId);
    }

    /**
     * Create a payment that references a cockpit project.
     *
     * @param paymentTypeId type of the payment
     * @param coderId coder to be paid.
     * @param grossAmount amount to be paid.
     * @param client the client of the project.
     * @param projectId project that is being paid.
     */
    public CockpitProjectReferencePayment(int paymentTypeId, long coderId, double grossAmount, String client, long projectId) {
        super(paymentTypeId, coderId, client, grossAmount);
        this.projectId = projectId;
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
     * Processor for a payment referencing a cockpit project.
     * It provides methods for retrieving the cockpit project name.
     *
     * @author VolodymyrK
     */
    protected static abstract class Processor extends BasePayment.Processor {
        private String projectName = null;

        /**
         * Get the name of the referenced project.
         *
         * @return the name of the referenced project.
         * @throws SQLException if an error occurred trying to access db.
         */
        public String lookupReferenceDescription(BasePayment payment) throws SQLException {
            long id = ((CockpitProjectReferencePayment) payment).getProjectId();
            return getProjectName(id);
        }
        
        /**
         * Get the event date (always returns today).
         *
         * @param payment payment to look for its date.
         * @return the date that the event took place.
         */
        public Date lookupEventDate(BasePayment payment) throws SQLException {
            return new Date();
        }

        /**
         * Get the name of the cockpit project.
         *
         * @param projectId project to look for.
         * @return the name of the cockpit project.
         * @throws SQLException
         */
        protected String getProjectName(long projectId) throws SQLException {
            if (projectName == null) {
                lookupData(projectId);
            }
            return projectName;
        }

        /**
         * Do the actual lookup of data in the db.
         *
         * @param projectId id of the project to lookup.
         * @throws SQLException
         */
        private void lookupData(long projectId) throws SQLException {
            StringBuffer query = new StringBuffer(300);
           
            query.append("select name from tc_direct_project ");
            query.append("where project_id = " + projectId);
            
            ResultSetContainer rsc = runSelectQuery(DBMS.TCS_OLTP_DATASOURCE_NAME, query.toString());
            if (rsc.getRowCount() != 1) {
                throw new IllegalArgumentException("Project " + projectId + " does not exist or is not unique");
            }

            projectName = rsc.getStringItem(0, "name");
        }

    }

}
