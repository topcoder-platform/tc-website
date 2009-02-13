/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.screening.application;

import java.rmi.RemoteException;
import java.sql.Connection;

import javax.ejb.CreateException;
import javax.ejb.EJBException;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.util.idgenerator.IDGenerationException;
import com.topcoder.util.idgenerator.IDGenerator;
import com.topcoder.util.idgenerator.IDGeneratorFactory;

import com.topcoder.shared.util.logging.Logger;

/**
 * Implementation of the AppSpecification EJB.
 *
 * Simple EJB for rboard_payment table.
 *
 * @author pulky
 * @version 1.0.0
 */
public class AppSpecificationBean extends BaseEJB {

    private static Logger log = Logger.getLogger(AppSpecificationBean.class);

    /**
     * gets a particular specification
     *
     * @param conn the connection being used
     * @param specificationId the aplication specification Id
     */
    public ApplicationSpecification getSpecification(Connection conn, long specificationId) throws RemoteException {
        try {
            log.debug("Retrieving specifications...");
            ResultSetContainer rsc = selectSet("specification",
                    new String[] {"specification_id", "specification_uploader_id", "specification_type_id"},
                    new String[] {"specification_id"},
                    new String[] {String.valueOf(specificationId)},
                    conn);

            if (rsc.size() != 1) {
                return null;
            } else {
                return new ApplicationSpecification(rsc.getLongItem(0, "specification_id"),
                        rsc.getLongItem(0, "specification_uploader_id"),
                        rsc.getLongItem(0, "specification_type_id"));
            }
        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    /**
     * Inserts a specified user role
     *
     * @param conn the connection being used
     * @param appSpec the aplication specification bean
     */
    public void insertSpecification(Connection conn, ApplicationSpecification appSpec)  throws RemoteException {
        try {

            if (appSpec.getSpecificationId() == ApplicationSpecification.UNDEFINED_ID) {
                log.debug("Generating new specification ID...");

                appSpec.setSpecificationId(generateNewID());
            }

            log.debug("Inserting specifications...");

            insert(conn, "specification",
                    new String[]{"specification_id", "specification_uploader_id", "specification_type_id"},
                    new String[]{String.valueOf(appSpec.getSpecificationId()),
                        String.valueOf(appSpec.getSpecificationUploaderId()),
                        String.valueOf(appSpec.getSpecificationTypeId())});
        } catch (Exception e) {
            throw new EJBException(e);
        }
    }

    /**
     * Generate Ids for specification table
     *
     * @return the next Id
     * @throws IDGenerationException if bean creation fails.
     */
    private static long generateNewID() throws IDGenerationException {
        IDGenerator gen = IDGeneratorFactory.getIDGenerator("SPECIFICATION_SEQ");
        return gen.getNextID();
    }
}
