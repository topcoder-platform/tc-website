/*
 * RemoteCatalogTestCase.java
 *
 * By John C. Bollinger
 *
 * Copyright (c) 2002
 */
package com.topcoder.dde.catalog.test;

import com.topcoder.dde.catalog.*;
import com.topcoder.dde.user.*;
import com.topcoder.util.idgenerator.bean.IdGen;
import com.topcoder.util.idgenerator.bean.IdGenHome;
import com.topcoder.security.admin.PolicyMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;

import java.util.ArrayList;
import java.util.Date;
import java.util.Hashtable;
import javax.naming.*;
import javax.rmi.PortableRemoteObject;

import junit.framework.*;

/**
 * an abstract superclass for test cases exercising the remote interfaces of the
 * security manager EJBs.  Contains static member variables for the remote home
 * interfaces of all the beans, and hooks initialization of those variables into
 * the test case setup chain
 */
public abstract class RemoteCatalogTestCase extends TestCase {

    protected CatalogHome catalogHome;
    protected ComponentManagerHome componentManagerHome;
    protected PolicyMgrRemoteHome policyManagerHome;
    protected PrincipalMgrRemoteHome principalManagerHome;
    protected User defaultUser;
    protected User extraUser;
    protected Date requestDate1, requestDate2;
    protected LicenseLevel defaultLevel;
    protected ComponentSummary compSummary;
    protected ComponentManager manager;
    protected IdGen idGen;
//    protected Catalog catalog;

    protected static final String DEF_COMP_NAME =
            CatalogTestSetup.DEF_COMP_NAME;
    protected static final String DEF_COMP_SHORTD =
            CatalogTestSetup.DEF_COMP_SHORTD;
    protected static final String DEF_COMP_DESC =
            CatalogTestSetup.DEF_COMP_DESC;
    protected static final String DEF_COMP_FUNCTIONAL =
            CatalogTestSetup.DEF_COMP_FUNCTIONAL;
    protected static final String DEF_COMP_KEYWORDS =
            CatalogTestSetup.DEF_COMP_KEYWORDS;
    protected static final String DEF_COMP_COMMENTS =
            CatalogTestSetup.DEF_COMP_COMMENTS;
    protected static final String DEF_COMP_VERSION =
            CatalogTestSetup.DEF_COMP_VERSION;

    protected RemoteCatalogTestCase(String testName) {
        super(testName);
    }

    public void setUp() throws Exception {
        super.setUp();
        catalogHome = CatalogTestSetup.catalogHome;
        componentManagerHome = CatalogTestSetup.componentManagerHome;
        policyManagerHome = CatalogTestSetup.policyManagerHome;
        principalManagerHome = CatalogTestSetup.principalManagerHome;
        defaultUser = CatalogTestSetup.defaultUser;
        extraUser = CatalogTestSetup.extraUser;
        requestDate1 = CatalogTestSetup.requestDate1;
        requestDate2 = CatalogTestSetup.requestDate2;
        defaultLevel = CatalogTestSetup.defaultLevel;
        compSummary = CatalogTestSetup.compSummary;
        idGen = CatalogTestSetup.idGen;
        manager = componentManagerHome.create(compSummary.getComponentId());
    }

    public void tearDown() throws Exception {
        manager.remove();
        super.tearDown();
    }

}
