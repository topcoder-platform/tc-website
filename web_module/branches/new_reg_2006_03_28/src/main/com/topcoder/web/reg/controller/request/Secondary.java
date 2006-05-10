package com.topcoder.web.reg.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.dao.RegistrationTypeDAO;
import com.topcoder.web.reg.model.Address;
import com.topcoder.web.reg.model.User;
import com.topcoder.web.reg.model.Email;
import com.topcoder.web.reg.validation.ValidationHelper;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class Secondary extends Base {

    protected void registrationProcessing() throws Exception {
        if ((getRegUser()==null||getRegUser().isNew()) || userLoggedIn()) {
            User u = getRegUser();
            Set types = getRequestedTypes();

            Map errorMap = ValidationHelper.validateMain(getRequest(), u);

            Map.Entry me;
            for (Iterator it = errorMap.entrySet().iterator(); it.hasNext();) {
                me = (Map.Entry)it.next();
                addError((String)me.getKey(), me.getValue());
            }
            if (hasErrors()) {
                setNextPage("/main.jsp");
                setIsNextPageInContext(true);
            } else {
                RegistrationTypeDAO regTypeDAO = new RegistrationTypeDAO();
                if (types.contains(regTypeDAO.getCompetitionType())||types.contains(regTypeDAO.getHighSchoolType())) {

                }
                Address a = new Address();
                a.setAddress1(getTrimmedParameter(Constants.ADDRESS1));
                a.setAddress2(getTrimmedParameter(Constants.ADDRESS2));
                a.setAddress3(getTrimmedParameter(Constants.ADDRESS3));
                a.setCity(getTrimmedParameter(Constants.CITY));
                //a.setCountry();
                a.setPostalCode(getTrimmedParameter(Constants.POSTAL_CODE));
                a.setProvince(getTrimmedParameter(Constants.PROVINCE));

                Email e = new Email();
                e.setAddress(getTrimmedParameter(Constants.EMAIL));
                if (e.isNew()) {
                    e.setPrimary(Boolean.TRUE);
                    e.setEmailTypeId(Email.TYPE_ID_PRIMARY);
                    e.setStatusId(Email.STATUS_ID_UNACTIVE);
                }






                u.setFirstName(getTrimmedParameter(Constants.GIVEN_NAME));
                u.setMiddleName(getTrimmedParameter(Constants.MIDDLE_NAME));
                u.setLastName(getTrimmedParameter(Constants.SURNAME));

                u.setPassword(getTrimmedParameter(Constants.PASSWORD));

                u.setHandle(getTrimmedParameter(Constants.HANDLE));



/*
        String companyName = StringUtils.getTrimmedParameter(r, Constants.COMPANY_NAME);
        String quote = StringUtils.getTrimmedParameter(r, Constants.QUOTE);
        String title = StringUtils.getTrimmedParameter(r, Constants.TITLE);
*/




                setNextPage("/secondary.jsp");
                setIsNextPageInContext(true);
            }

        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }


    }
}
