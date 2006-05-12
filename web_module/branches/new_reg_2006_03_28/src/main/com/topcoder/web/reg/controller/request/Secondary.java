package com.topcoder.web.reg.controller.request;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.reg.RegFieldHelper;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.HibernateUtils;
import com.topcoder.web.reg.model.Address;
import com.topcoder.web.reg.model.User;
import com.topcoder.web.reg.model.Company;
import com.topcoder.web.reg.model.Email;

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
        if (getRegUser() == null || getRegUser().isNew() || userLoggedIn()) {
            Map params = getMainUserInput();
            checkMainFields(params);

            if (hasErrors()) {
                Map.Entry me;
                for (Iterator it = params.entrySet().iterator();it.hasNext();) {
                    me = (Map.Entry)it.next();
                    setDefault((String)me.getKey(), me.getValue());
                }
                getRequest().setAttribute(Constants.FIELDS,
                        RegFieldHelper.getMainFieldSet(getRequestedTypes(), getRegUser()));

                setNextPage("/main.jsp");
                setIsNextPageInContext(true);
            } else {
                //set the fields in the user object

                User u = getRegUser();
                Set fields = RegFieldHelper.getMainFieldSet(getRequestedTypes(), u);

                HibernateUtils.getSession().update(u);

                Address a = u.getHomeAddress();
                //we'll consider address1 to be the indicator as to whether or not we're getting an address
                if (fields.contains(Constants.ADDRESS1)) {
                    if (a==null) {
                        a = new Address();
                    }
                    a.setAddress1((String)params.get(Constants.ADDRESS1));
                }
                if (fields.contains(Constants.ADDRESS2)) {
                    a.setAddress2((String)params.get(Constants.ADDRESS2));
                }
                if (fields.contains(Constants.ADDRESS3)) {
                    a.setAddress3((String)params.get(Constants.ADDRESS3));
                }
                if (fields.contains(Constants.CITY)) {
                    a.setCity((String)params.get(Constants.CITY));
                }
                if (fields.contains(Constants.POSTAL_CODE)) {
                    a.setPostalCode((String)params.get(Constants.POSTAL_CODE));
                }
                if (fields.contains(Constants.PROVINCE)) {
                    a.setProvince((String)params.get(Constants.PROVINCE));
                }
                if (fields.contains(Constants.GIVEN_NAME)) {
                    u.setFirstName((String)params.get(Constants.GIVEN_NAME));
                }
                if (fields.contains(Constants.SURNAME)) {
                    u.setLastName((String)params.get(Constants.SURNAME));
                }
                if (fields.contains(Constants.MIDDLE_NAME)) {
                    u.setMiddleName((String)params.get(Constants.MIDDLE_NAME));
                }
                if (fields.contains(Constants.PASSWORD)) {
                    u.setPassword((String)params.get(Constants.PASSWORD));
                }

                if (fields.contains(Constants.COMPANY_NAME)) {
                    String name = (String)params.get(Constants.COMPANY_NAME);

                    //we can assume the user's contact object is not null because it should have been
                    //created by the Main processor when they selected a reg type that requires it.
                    if (u.getContact().getId()==null) {
                        //it's a new contact we're creating
                        Company c = new Company();
                        c.setName(name);
                        c.setPrimaryContact(u.getContact());
                        u.getContact().setCompany(c);
                    } else {
                        if (u.getContact().getCompany()==null) {
                            throw new TCWebException("Invalid state, user " + u.getId() + " missing company");
                        } else {
                            //if they're changing their company, create a new company record
                            if (!u.getContact().getCompany().getName().equals(name)) {
                                Company c = new Company();
                                c.setName(name);
                                c.setPrimaryContact(u.getContact());
                                u.getContact().setCompany(c);
                            }
                        }
                    }
                }

                if (fields.contains(Constants.TITLE)) {
                    u.getContact().setTitle((String)params.get(Constants.TITLE));
                }

                if (fields.contains(Constants.QUOTE)) {
                    u.getCoder().setQuote((String)params.get(Constants.QUOTE));
                }

                if (fields.contains(Constants.EMAIL)) {
                    Email e = u.getPrimaryEmailAddress();
                    if (e==null) {
                        e = new Email();
                        e.setAddress((String)params.get(Constants.EMAIL));
                        e.setPrimary(Boolean.TRUE);
                        e.setEmailTypeId(Email.TYPE_ID_PRIMARY);
                        e.setStatusId(Email.STATUS_ID_UNACTIVE);
                        e.setUser(u);
                    } else {
                        e.setAddress((String)params.get(Constants.EMAIL));
                    }
                }

                if (fields.contains(Constants.HANDLE)) {
                    //yeah...100% chance they'll contain it, but i'll be consistent with the code anyway
                    u.setHandle((String)params.get(Constants.HANDLE));
                }

                setNextPage("/secondary.jsp");
                setIsNextPageInContext(true);
            }

        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }


    }
}
