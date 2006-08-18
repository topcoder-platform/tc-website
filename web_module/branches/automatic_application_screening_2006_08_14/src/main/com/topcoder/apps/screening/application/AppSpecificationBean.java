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

    public ApplicationSpecification getSpecification(Connection conn, long specificationId) throws RemoteException {
        try {
            log.debug("Retrieving specifications...");
            ResultSetContainer rsc = selectSet("specifications",
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
     * @param rUserRoleVId the existing userRoleVId
     * @param userId the user to insert
     * @param projectId the related project Id
     * @param reviewRespId the reviewer's responsibility
     * @param rUserRoleId the user role Id to insert
     * @param rRoleId the role Id to insert
     * @param paymentInfoId the payment information Id to insert
     */
    public void insertSpecification(Connection conn, ApplicationSpecification appSpec)  throws RemoteException {
        try {

            if (appSpec.getSpecificationId() == ApplicationSpecification.UNDEFINED_ID) {
                log.debug("Generating new specification ID...");

/*                IdGen idGen = null;
                try {
                    idGen = createIDGen();
                } catch (CreateException e) {
                    throw (new EJBException("Couldn't create IDGenerator", e));
                }*/

                appSpec.setSpecificationId(generateNewID());

                //appSpec.setSpecificationId(idGen.nextId("STUDIO_SUBMISSION_SEQ"));
                //appSpec.setSpecificationId(idGen.nextId("SPECIFICATION_SEQ"));
            }

            log.debug("Inserting specifications...");

            insert(conn, "specifications",
                    new String[]{"specification_id", "specification_uploader_id", "specification_type_id"},
                    new String[]{String.valueOf(appSpec.getSpecificationId()),
                        String.valueOf(appSpec.getSpecificationUploaderId()),
                        String.valueOf(appSpec.getSpecificationTypeId())});
        } catch (Exception e) {
            throw new EJBException(e);
        }
    }


    /**
     * Creates IdGenerator EJB
     *
     * @param dataSource the current datasource
     * @return the IdGenerator
     * @throws CreateException if bean creation fails.
     */
/*    private IdGen createIDGen() throws CreateException {
        try {
            InitialContext context = new InitialContext();

            Object o = context.lookup("idgenerator/IdGenEJB");
            IdGenHome idGenHome = (IdGenHome) PortableRemoteObject.narrow(o,
                    IdGenHome.class);
            return idGenHome.create();

        } catch (Exception e) {
            throw new CreateException("Could not find bean!" + e);
        }
    }*/

    /**
     * Creates IdGenerator EJB
     *
     * @param dataSource the current datasource
     * @return the IdGenerator
     * @throws CreateException if bean creation fails.
     */
    private static long generateNewID() throws IDGenerationException {
        IDGenerator gen = IDGeneratorFactory.getIDGenerator("SPECIFICATION_SEQ");
        return gen.getNextID();
    }
}
