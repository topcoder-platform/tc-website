/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.screening.application;

import java.net.URL;
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
     * gets specifications
     *
     * @param conn the connection being used
     * @param specificationUploaderId the aplication specification submitter Id
     */
    public ApplicationSpecification[] getSpecifications(Connection conn, long specificationUploaderId) throws RemoteException {
        try {
            log.debug("Retrieving specifications...");
            ResultSetContainer rsc = selectSet("specification",
                    new String[] {"specification_id", "specification_uploader_id",
                    "specification_type_id", "passed_auto_screening", "specification_url"},
                    specificationUploaderId == -1 ? new String[] {} : new String[] {"specification_uploader_id"},
                    specificationUploaderId == -1 ? new String[] {} : new String[] {String.valueOf(specificationUploaderId)},
                    conn);

            if (rsc.size() < 1) {
                return null;
            } else {
                ApplicationSpecification[] appSpecs = new ApplicationSpecification[rsc.size()];
                for (int i = 0; i < rsc.size(); i++) {
                    appSpecs[i] = new ApplicationSpecification(rsc.getLongItem(i, "specification_id"),
                        rsc.getLongItem(i, "specification_uploader_id"),
                        rsc.getLongItem(i, "specification_type_id"),
                        rsc.getItem(i, "passed_auto_screening") == null ? false : true,
                        rsc.getItem(i, "passed_auto_screening") == null ? 0 : rsc.getIntItem(i, "passed_auto_screening"),
                        new URL(rsc.getStringItem(i, "specification_url")));
                }
                return appSpecs;
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
                    new String[]{"specification_id", "specification_uploader_id",
                    "specification_type_id", "specification_url"},
                    new String[]{String.valueOf(appSpec.getSpecificationId()),
                        String.valueOf(appSpec.getSpecificationUploaderId()),
                        String.valueOf(appSpec.getSpecificationTypeId()),
                        String.valueOf(appSpec.getSpecificationUrl().toString())
                        });
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
