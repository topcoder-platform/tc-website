package com.topcoder.dde.persistencelayer.testbean;

import javax.ejb.EJBContext;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;

public class DDEFooBean implements SessionBean {

    private EJBContext ejbContext;

    public DDEFooBean() {
    }

    public void ejbCreate() {
    }

    public void setSessionContext(SessionContext sessionContext) {
        ejbContext = sessionContext;
    }

    public void ejbRemove() {
    }

    public void ejbActivate() {
    }

    public void ejbPassivate() {
    }

    private void test(DDEServerTestCase testCase) throws Throwable {
        try {
            testCase.runBare();
        } catch (Throwable throwable) {
            ejbContext.setRollbackOnly();
            throw throwable;
        }
    }

    public void testAll() throws Throwable {
        test(new DDEPhaseTest());
        test(new DDECountryCodesTest());
        test(new DDECompanySizeTest());
        test(new DDEPriceTiersTest());
        test(new DDEStatusTest());
        test(new DDECompCatalogTest());
        test(new DDEDocTypesTest());
        test(new DDEContactTypeTest());
        test(new DDETechnologyTypesTest());
        test(new DDECategoriesTest());
        test(new DDERolesTest());
        test(new DDECompVersionsTest());
        test(new DDECompKeywordsTest());
        test(new DDECompExamplesTest());
        test(new DDECompDependenciesTest());
        test(new DDECompTechnologyTest());
        test(new DDECompDocumentationTest());
        test(new DDECompCategoriesTest());
        test(new DDEUserMasterTest());
        test(new DDECompReviewsTest());
        test(new DDEUserRoleTest());
        test(new DDEUserContactTest());
        test(new DDEUserTechnologiesTest());
        test(new DDEUserMemberTest());
        test(new DDEUserCustomerTest());
        test(new DDECompForumXrefTest());
        test(new DDEDocForumXrefTest());
        test(new DDEDownloadTrackingTest());
        test(new DDELicenseLevelTest());
        test(new DDECompDownloadTest());
    }

}
