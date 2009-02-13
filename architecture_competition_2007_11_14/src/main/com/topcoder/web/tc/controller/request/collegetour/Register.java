package com.topcoder.web.tc.controller.request.collegetour;


/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 5, 2005
 */
public class Register extends Base {
    protected void collegeTourProcessing() throws Exception {
        /*
        if (SecurityHelper.hasPermission(getLoggedInUser(), new ClassResource(this.getClass()))) {
            TransactionManager tm = null;
            try {
                Timestamp now = new Timestamp(System.currentTimeMillis());
                if (log.isDebugEnabled()) {
                    log.debug("now: " + now + " start: " + getRegStart() + " end: " + getRegEnd());
                }
                if (now.before(getRegEnd()) && now.after(getRegStart())) {

                    tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                    tm.begin();
                    RegistrationLocal reg = (RegistrationLocal) createLocalEJB(getInitialContext(), Registration.class);
                    if (!reg.exists(getEventId(), getUser().getId(), DBMS.JTS_OLTP_DATASOURCE_NAME)) {
                        reg.create(getEventId(), getUser().getId(), DBMS.JTS_OLTP_DATASOURCE_NAME);
                    }
                    tm.commit();
                } else {
                    throw new NavigationException("Sorry, registration is not currently open");
                }
            } catch (Exception e) {
                if (tm != null && (tm.getStatus() == Status.STATUS_ACTIVE || tm.getStatus() == Status.STATUS_MARKED_ROLLBACK)) {
                    tm.rollback();
                }
                throw e;
            }
            setNextPage("/collegetour/success.jsp");
            setIsNextPageInContext(true);
        } else {
            throw new PermissionException(getLoggedInUser(), new ClassResource(this.getClass()));
        }*/
        setNextPage("tc?module=IntroEventRegister&eid=" + (getEventId() * 3 + 1001));
        setIsNextPageInContext(false);
        

    }
}