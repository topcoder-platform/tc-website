package com.topcoder.dde.persistencelayer.test;

import javax.naming.Context;

import junit.framework.*;

public class AllPersistenceLayerTests extends TestSuite {

    /**
     * constructs a TestSuite containing all the persistence layer tests.
     * Loads the static <code>PersistenceLayerTest.namingContextEnv</code>
     * with appropriate values (at present these are hardcoded values suitable
     * for the development environment)
     */
    public AllPersistenceLayerTests() {
        super("All persistence layer tests");
        PersistenceTestCase.namingContextEnv.put(Context.PROVIDER_URL,
                "localhost:1099");
        PersistenceTestCase.namingContextEnv.put(
                Context.INITIAL_CONTEXT_FACTORY,
                "org.jnp.interfaces.NamingContextFactory");
        addTest(new TestSuite(TestLocalDDECompanySizeHome.class));
        // addTest(new TestSuite(TestLocalDDECompanySize.class));
        addTest(new TestSuite(TestLocalDDEStatusHome.class));
        addTest(new TestSuite(TestLocalDDECategoriesHome.class));
        addTest(new TestSuite(TestLocalDDECompCatalogHome.class));
        addTest(new TestSuite(TestLocalDDECompCategoriesHome.class));
        addTest(new TestSuite(TestLocalDDECompVersionsHome.class));
        addTest(new TestSuite(TestLocalDDECompDependenciesHome.class));
        addTest(new TestSuite(TestLocalDDECompDocumentationHome.class));
        addTest(new TestSuite(TestLocalDDECompExamplesHome.class));
        addTest(new TestSuite(TestLocalDDECompKeywordsHome.class));
        addTest(new TestSuite(TestLocalDDEContactTypeHome.class));
        addTest(new TestSuite(TestLocalDDECountryCodesHome.class));
        addTest(new TestSuite(TestLocalDDEDocTypesHome.class));
        addTest(new TestSuite(TestLocalDDEPhaseHome.class));
        addTest(new TestSuite(TestLocalDDEPriceTiersHome.class));
        addTest(new TestSuite(TestLocalDDERolesHome.class));
        addTest(new TestSuite(TestLocalDDETechnologyTypesHome.class));
        addTest(new TestSuite(TestLocalDDEUserMasterHome.class));
        addTest(new TestSuite(TestLocalDDEUserMemberHome.class));
        addTest(new TestSuite(TestLocalDDECompDownloadHome.class));
        addTest(new TestSuite(TestLocalDDECompForumXrefHome.class));
        addTest(new TestSuite(TestLocalDDEDocForumXrefHome.class));
        addTest(new TestSuite(TestLocalDDECompReviewsHome.class));
        addTest(new TestSuite(TestLocalDDECompTechnologyHome.class));
        addTest(new TestSuite(TestLocalDDEUserContactHome.class));
        addTest(new TestSuite(TestLocalDDEUserTechnologiesHome.class));
        addTest(new TestSuite(TestLocalDDEUserRoleHome.class));
        addTest(new TestSuite(TestLocalDDEUserCustomerHome.class));
        addTest(new TestSuite(TestLocalDDELicenseLevelHome.class));
        addTest(new TestSuite(TestLocalDDEDownloadTrackingHome.class));
    }

    /**
     * a hook to tell JUnit which tests to run
     *
     * @return a Test specifiying the test(s) to run (in this case, a new
     *         <code>AllPersistenceLayerTests</code> instance)
     */
    public static Test suite() {
        return new AllPersistenceLayerTests();
    }

}