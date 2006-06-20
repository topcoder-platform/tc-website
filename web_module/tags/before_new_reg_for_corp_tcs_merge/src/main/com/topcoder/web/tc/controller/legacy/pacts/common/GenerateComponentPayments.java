package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;

/**
 * Generates all the payments for the people who won money for the given project (designers, developers,
 * and review board members). Returns the number of payments generated. <p>
 *
 * @param projectId The ID of the project
 * @param status The project's status (see /topcoder/apps/review/projecttracker/ProjectStatus.java)
 * @param makeChanges If true, updates the database; if false, logs
 * the changes that would have been made had this parameter been true.
 * @return The number of component payments generated, followed by the number of review board payments generated.
 *
 * @author Mark Tong
 * @version 1.00, 05/16/2005
 * @see DataInterfaceBean
 */
public class GenerateComponentPayments {
    public void generatePayments(long projectId, int status, boolean makeChanges) throws Exception {
        DataInterfaceBean d = new DataInterfaceBean();
        int[] paymentsGenerated = d.generateComponentPayments(projectId, status, makeChanges);
    }
}
