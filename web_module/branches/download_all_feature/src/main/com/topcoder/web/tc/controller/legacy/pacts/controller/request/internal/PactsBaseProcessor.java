package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.resultSet.ResultFilter;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader;

/**
 * Provides some helper methods to Pacts processors.
 *
 * @author Cucu
 */
public abstract class PactsBaseProcessor extends BaseProcessor{

    protected UserProfileHeader getUserProfileHeader(long userId) throws Exception {
        DataInterfaceBean bean = new DataInterfaceBean();

        Map results = bean.getUserProfileHeader(userId);

        if (results == null) {
            throw new TCWebException("User not found: " + userId);
        }

        return new UserProfileHeader(results);
    }

    protected long getOptionalLongParameter(String name) {
        return getOptionalLongParameter(name, -1);
    }
    protected long getOptionalLongParameter(String name, long defaultValue) {
        return getRequest().getParameter(name) == null? defaultValue :
                Long.parseLong(getRequest().getParameter(name));
    }

    protected int getOptionalIntParameter(String name) {
        return getOptionalIntParameter(name, -1);
    }
    protected int getOptionalIntParameter(String name, int defaultValue) {
        return getRequest().getParameter(name) == null? defaultValue :
                Integer.parseInt(getRequest().getParameter(name));
    }

    protected long getLongParameter(String name) {
        if (getRequest().getParameter(name) == null) {
            throw new IllegalArgumentException("Missing parameter " + name);
        }
        return Long.parseLong(getRequest().getParameter(name));
    }

    protected double getDoubleParameter(String name) {
        if (getRequest().getParameter(name) == null) {
            throw new IllegalArgumentException("Missing parameter " + name);
        }
        return Double.parseDouble(getRequest().getParameter(name));
    }

    protected String getStringParameter(String name) {
        if (getRequest().getParameter(name) == null) {
            throw new IllegalArgumentException("Missing parameter " + name);
        }
        return (String) getRequest().getParameter(name);
    }

    protected int getIntParameter(String name) {
        if (getRequest().getParameter(name) == null) {
            throw new IllegalArgumentException("Missing parameter " + name);
        }
        return Integer.parseInt(getRequest().getParameter(name));
    }
    protected String checkNotEmptyString(String name, String errorMsg) {
        if (getRequest().getParameter(name) == null || getRequest().getParameter(name).trim().length() == 0) {
            addError("error", errorMsg);
        }
        return (String) getRequest().getParameter(name);
    }

    protected int checkNonNegativeInt(String name, String errorMsg) {
        return checkNonNegativeInt(name, -1, errorMsg);
    }

    protected int checkNonNegativeInt(String name, int maxValue, String errorMsg) {
        int value = -1;
        try {
            value = Integer.parseInt(getRequest().getParameter(name));
        } catch(NumberFormatException e) {}

        if (value < 0 || (maxValue > 0 && value > maxValue)) {
            addError("error", errorMsg);
        }
        return value;
    }

    protected double checkNonNegativeDouble(String name, String errorMsg) {
        double value = -1;
        try {
            value = Double.parseDouble(getRequest().getParameter(name));
        } catch(NumberFormatException e) {}

        if (value < 0) {
            addError("error", errorMsg);
        }
        return value;
    }

    protected Date checkDate(String name, String errorMsg, boolean allowFutureDate) {
        SimpleDateFormat dfmt = new SimpleDateFormat("MM/dd/yy");
        Date d = null;
        try {
            d = dfmt.parse((String) getRequest().getParameter(name));
            log.debug("parsed Date = " + d);

            if (!allowFutureDate && d.compareTo(new Date())>0) {
                addError("error", "The date should not be a future date.");
                return null;
            }
        } catch (Exception e3) {
            addError("error", errorMsg);
        }
        return d;
    }

    protected Date checkDate(String name, String errorMsg) {
        return checkDate(name, errorMsg, true);
    }

    protected int calculateAge(Date birthday) {
        Calendar today = Calendar.getInstance();
        Calendar birth = Calendar.getInstance();
        birth.setTime(birthday);

        int age = today.get(Calendar.YEAR) - birth.get(Calendar.YEAR);

        birth.set(Calendar.YEAR, today.get(Calendar.YEAR));
        if (today.before(birth)){
            age--;
        }
        return age;
    }

    protected List getPaymentTypeList() throws SQLException, RemoteException {
        DataInterfaceBean dib = new DataInterfaceBean();
        ResultSetContainer rsc = (ResultSetContainer) dib.getPaymentTypes().get(PactsConstants.PAYMENT_TYPE_LIST);
        return new ResultSetContainer(rsc, new FilterPaymentTypes());
    }

    /**
     * Filter the payment types that the user can select
     */
    static class FilterPaymentTypes implements ResultFilter {

        public boolean include(ResultSetRow rsr) {
            int typeId = rsr.getIntItem("payment_type_id");
            return typeId != PactsConstants.PROBLEM_PAYMENT &&  // deprecated
                  typeId != PactsConstants.CHARITY_PAYMENT; // don't show charity!
        }
    }
}
