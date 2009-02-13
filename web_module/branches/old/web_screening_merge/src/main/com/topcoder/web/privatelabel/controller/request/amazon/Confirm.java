package com.topcoder.web.privatelabel.controller.request.amazon;

import com.topcoder.web.privatelabel.controller.request.FullRegDemog;
import com.topcoder.web.privatelabel.model.*;
import com.topcoder.web.privatelabel.Constants;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;

import java.util.*;

import com.topcoder.web.common.MultipartRequest;
import com.topcoder.servlet.request.*;

/**
 * @author dok
 * Date: Jan 22, 2004
 */
public class Confirm extends FullRegDemog {
    protected static Logger log = Logger.getLogger(Confirm.class);

    protected void setNextPage() {

        if (hasErrors()) {
            setNextPage(Constants.AMAZON_REG_PAGE);
        } else {
            setNextPage(Constants.AMAZON_REG_CONFIRM_PAGE);
        }
        setIsNextPageInContext(true);
    }

    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        super.checkRegInfo(info);

        ((FullRegInfo) info).setCoderType(Constants.PROFESSIONAL);

        //remove handle error
        removeError(Constants.HANDLE);
        //state is not required
        removeError(Constants.STATE_CODE);

        //generate handle
        String handle = "";
        if (info.getFirstName().length() != 0) {
            handle = info.getFirstName().substring(0, 1) + info.getLastName();
        } else {
            handle = info.getLastName();
        }

        if (handle.length() < Constants.MIN_HANDLE_LENGTH) {
            //pad handle with zeroes
            while (handle.length() < Constants.MIN_HANDLE_LENGTH) {
                handle = handle + "0";
            }
        }
        if (handle.length() > Constants.MAX_HANDLE_LENGTH) {
            handle = handle.substring(0, Constants.MAX_HANDLE_LENGTH);
        }

        handle = handle.toLowerCase();
        String baseHandle = handle;

        try {
            int num = 0;
            while (info.isNew() && userExists(handle)) {
                //add a number
                num++;
                if (baseHandle.length() + String.valueOf(num).length() > Constants.MAX_HANDLE_LENGTH) {
                    //trim to make number fit
                    handle = baseHandle.substring(0, Constants.MAX_HANDLE_LENGTH - String.valueOf(num).length()) + num;
                } else
                    handle = baseHandle + num;
            }
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        log.debug("CHOSEN HANDLE IS " + handle);

        info.setHandle(handle);
        setDefault(Constants.HANDLE, info.getHandle());

        //generate password
        removeError(Constants.PASSWORD);
        removeError(Constants.PASSWORD_CONFIRM);

        info.setPassword(generatePassword());
        info.setPasswordConfirm(info.getPassword());

        log.debug("CHOSEN PASSWORD IS " + info.getPassword());

        //we're not bothering with an email confirmation field, so don't require it
        removeError(Constants.EMAIL_CONFIRM);
        removeError(Constants.ADDRESS1);
        removeError(Constants.CITY);

    }

    private String generatePassword() {
        StringBuffer newPass = new StringBuffer();
        for (int i = 0; i < Constants.MAX_PASSWORD_LENGTH; ++i) {
            newPass.append(
                    Constants.VALID_PASS_CHAR_LIST.charAt(
                            rand(Constants.VALID_PASS_CHAR_LIST.length())));
        }

        return newPass.toString();
    }

    private int rand(int max) {
        return (int) Math.floor(Math.random() * max);
    }
}
