package com.topcoder.web.reg.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.RegFieldHelper;
import com.topcoder.web.reg.validation.*;
import com.topcoder.web.reg.dao.UserDAO;
import com.topcoder.web.reg.model.User;

import java.util.Set;
import java.util.Map;
import java.util.HashMap;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
abstract class Base extends BaseProcessor {


    private User user = null;

    protected void businessProcessing() throws Exception {
        registrationProcessing();
    }

    protected User getRegUser() {
        if (user==null) {
            if (userLoggedIn()) {
                user = (User)getRequest().getSession().getAttribute(Constants.USER);
                if (user==null) {
                    user = new UserDAO().find(new Long(getUser().getId()));
                    if (user!=null) {
                        getRequest().getSession().setAttribute(Constants.USER, user);
                        log.debug("get user from the dao");
                    }
                } else {
                    log.debug("got user from request");
                }
            }
        } else {
            log.debug("got user from processor");
        }
        return user;
    }

    protected void setRegUser(User u) {
        this.user = u;
        getRequest().getSession().setAttribute(Constants.USER, user);
    }

    protected Set getRequestedTypes() {
        return (Set)getRequest().getSession().getAttribute(Constants.REG_TYPES);
    }

    protected void setRequestedTypes(Set requestedTypes) {
        getRequest().getSession().setAttribute(Constants.REG_TYPES, requestedTypes);
    }

    protected void checkMainParameters() {

        //validate all their shit
        String address1 = getTrimmedParameter(Constants.ADDRESS1);
        String address2 = getTrimmedParameter(Constants.ADDRESS2);
        String address3 = getTrimmedParameter(Constants.ADDRESS3);
        String city = getTrimmedParameter(Constants.CITY);
        String companyName = getTrimmedParameter(Constants.COMPANY_NAME);
        String emailConfirm = getTrimmedParameter(Constants.EMAIL_CONFIRM);
        String email = getTrimmedParameter(Constants.EMAIL);
        String givenName = getTrimmedParameter(Constants.GIVEN_NAME);
        String middleName = getTrimmedParameter(Constants.MIDDLE_NAME);
        String passwordConfirm = getTrimmedParameter(Constants.PASSWORD_CONFIRM);
        String password = getTrimmedParameter(Constants.PASSWORD);
        String postalCode = getTrimmedParameter(Constants.POSTAL_CODE);
        String province = getTrimmedParameter(Constants.PROVINCE);
        String quote = getTrimmedParameter(Constants.QUOTE);
        String surname = getTrimmedParameter(Constants.SURNAME);
        String title = getTrimmedParameter(Constants.TITLE);
        String userName = getTrimmedParameter(Constants.HANDLE);


        Set fields = RegFieldHelper.getMainFieldSet(getRequestedTypes(), getRegUser());
        if (fields.contains(Constants.ADDRESS1)) {
            ValidationResult address1Result = new Address1Validator().validate(new StringInput(address1));
            if (!address1Result.isValid()) {
                ret.put(Constants.ADDRESS1, address1Result.getMessage());
            }
        }

        if (fields.contains(Constants.ADDRESS2)) {
            ValidationResult address2Result = new Address2Validator().validate(new StringInput(address2));
            if (!address2Result.isValid()) {
                ret.put(Constants.ADDRESS1, address2Result.getMessage());
            }
        }

        if (fields.contains(Constants.ADDRESS3)) {
            ValidationResult address3Result = new Address3Validator().validate(new StringInput(address3));
            if (!address3Result.isValid()) {
                ret.put(Constants.ADDRESS1, address3Result.getMessage());
            }
        }
        if (fields.contains(Constants.CITY)) {
            ValidationResult cityResult = new CityValidator().validate(new StringInput(city));
            if (!cityResult.isValid()) {
                ret.put(Constants.CITY, cityResult.getMessage());
            }
        }
        if (fields.contains(Constants.COMPANY_NAME)) {
            ValidationResult companyNameResult = new CompanyNameValidator().validate(new StringInput(companyName));
            if (!companyNameResult.isValid()) {
                ret.put(Constants.COMPANY_NAME, companyNameResult.getMessage());
            }
        }
        if (fields.contains(Constants.EMAIL_CONFIRM)) {
            ValidationResult emailConfirmResult = new EmailConfirmValidator(new StringInput(email)).validate(new StringInput(emailConfirm));
            if (!emailConfirmResult.isValid()) {
                ret.put(Constants.EMAIL_CONFIRM, emailConfirmResult.getMessage());
            }
        }
        if (fields.contains(Constants.EMAIL)) {
            ValidationResult emailResult = new EmailValidator().validate(new StringInput(email));
            if (!emailResult.isValid()) {
                ret.put(Constants.EMAIL, emailResult.getMessage());
            }
        }
        if (fields.contains(Constants.GIVEN_NAME)) {
            ValidationResult givenNameResult = new GivenNameValidator().validate(new StringInput(givenName));
            if (!givenNameResult.isValid()) {
                ret.put(Constants.GIVEN_NAME, givenNameResult.getMessage());
            }
        }
        if (fields.contains(Constants.MIDDLE_NAME)) {
            ValidationResult middleNameResult = new MiddleNameValidator().validate(new StringInput(middleName));
            if (!middleNameResult.isValid()) {
                ret.put(Constants.MIDDLE_NAME, middleNameResult.getMessage());
            }
        }
        if (fields.contains(Constants.PASSWORD_CONFIRM)) {
            ValidationResult passwordConfirmResult = new PasswordConfirmValidator(new StringInput(password)).validate(new StringInput(passwordConfirm));
            if (!passwordConfirmResult.isValid()) {
                ret.put(Constants.PASSWORD_CONFIRM, passwordConfirmResult.getMessage());
            }
        }
        if (fields.contains(Constants.PASSWORD)) {
            ValidationResult passwordResult = new PasswordValidator().validate(new StringInput(password));
            if (!passwordResult.isValid()) {
                ret.put(Constants.PASSWORD, passwordResult.getMessage());
            }
        }
        if (fields.contains(Constants.POSTAL_CODE)) {
            ValidationResult postalCodeResult = new PostalCodeValidator().validate(new StringInput(postalCode));
            if (!postalCodeResult.isValid()) {
                ret.put(Constants.POSTAL_CODE, postalCodeResult.getMessage());
            }
        }
        if (fields.contains(Constants.PROVINCE)) {
            ValidationResult provinceResult = new ProvinceValidator().validate(new StringInput(province));
            if (!provinceResult.isValid()) {
                ret.put(Constants.PROVINCE, provinceResult.getMessage());
            }
        }
        if (fields.contains(Constants.QUOTE)) {
            ValidationResult quoteResult = new QuoteValidator().validate(new StringInput(quote));
            if (!quoteResult.isValid()) {
                ret.put(Constants.QUOTE, quoteResult.getMessage());
            }
        }
        if (fields.contains(Constants.SURNAME)) {
            ValidationResult surnameResult = new SurnameValidator().validate(new StringInput(surname));
            if (!surnameResult.isValid()) {
                ret.put(Constants.SURNAME, surnameResult.getMessage());
            }
        }
        if (fields.contains(Constants.TITLE)) {
            ValidationResult titleResult = new TitleValidator().validate(new StringInput(title));
            if (!titleResult.isValid()) {
                ret.put(Constants.TITLE, titleResult.getMessage());
            }
        }
        if (fields.contains(Constants.HANDLE)) {
            ValidationResult userNameResult = new UserNameValidator(u).validate(new StringInput(userName));
            if (!userNameResult.isValid()) {
                ret.put(Constants.HANDLE, userNameResult.getMessage());
            }
        }
        return ret;
    }




    abstract protected void registrationProcessing() throws Exception;
}
