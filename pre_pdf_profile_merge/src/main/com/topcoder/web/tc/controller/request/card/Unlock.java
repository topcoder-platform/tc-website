package com.topcoder.web.tc.controller.request.card;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.Transaction;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.user.UserPreference;
import com.topcoder.web.tc.Constants;

import javax.transaction.UserTransaction;

/**
 * @author dok
 * Date: Mar 10, 2004
 */
public class Unlock extends Preview {

    protected void businessProcessing() throws TCWebException {
        try {
            if (userLoggedIn()) {
                if (isRated()) {
                    UserPreference up = (UserPreference) createEJB(getInitialContext(), UserPreference.class);
                    if (!isUnlocked()) {
                        UserTransaction tx = null;
                        tx = Transaction.get();
                        Transaction.begin(tx);

                        try {
                            up.createUserPreference(getUser().getId(), Constants.UNLOCK_CARD_PREFERENCE_ID,
                                    DBMS.COMMON_OLTP_DATASOURCE_NAME);
                            up.setValue(getUser().getId(), Constants.UNLOCK_CARD_PREFERENCE_ID,
                                    String.valueOf(true), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                        } catch (Exception e) {
                            if (tx != null) {
                                Transaction.rollback(tx);
                            }
                            throw new TCWebException(e);
                        }
                        Transaction.commit(tx);
                    }
                    getRequest().setAttribute("cardUnlocked", new Boolean(true));
                    setNextPage(Constants.CARD_INSTRUCTIONS);
                    setIsNextPageInContext(true);
                } else {
                    throw new NavigationException("Sorry you have not been rated in competition.");
                }

            } else {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }

}
