package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.DemographicResponse;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.ejb.user.UserAddress;
import com.topcoder.web.ejb.address.Address;
import com.topcoder.security.UserPrincipal;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.List;
import java.util.Iterator;

public class VerizonRegSubmit extends FullRegSubmit {

    protected void setNextPage() {
        if (isEligible()) {
            setNextPage(Constants.VERIZON_REG_SUCCESS_PAGE);
        } else {
            setNextPage(Constants.VERIZON_INELIGIBLE_PAGE);
        }
        setIsNextPageInContext(true);
    }

    /**
     *
     * @return
     */
    protected boolean isEligible() {
        boolean ret = true;
        ret &= regInfo.getCity().toLowerCase().equals("chennai");
        ret &= regInfo.getCountryCode().equals("356"); //india
        ret &= hasDegree();
        return ret;
    }

    /**
     * check if they've chosen a demographic answer that suggests they have
     * not gotten a degree.
     * @return
     */
    private boolean hasDegree() {
        boolean hasDegree = true;
        List l = ((FullRegInfo)regInfo).getResponses();
        DemographicResponse dr = null;
        for (Iterator it = l.iterator(); hasDegree&&it.hasNext();) {
            dr = (DemographicResponse)it.next();
            //we're assuming that no other question has this as a valid answer.
            hasDegree = dr.getAnswerId()!=Constants.NO_DEGREE_ANSWER;
        }
        return hasDegree;
    }

    /**
     * set verizon specific stuff
     * @param regInfo
     * @param newUser
     * @return
     * @throws Exception
     */
    protected UserPrincipal store(SimpleRegInfo regInfo, UserPrincipal newUser) throws Exception {
        UserPrincipal ret = super.store(regInfo, newUser);
        Address address = (Address) createEJB(getInitialContext(), Address.class);
        UserAddress userAddress = (UserAddress) createEJB(getInitialContext(), UserAddress.class, "main:");

        ResultSetContainer addresses = userAddress.getUserAddresses(ret.getId());
        if (addresses.size()!=1) {
            throw new RuntimeException("found " + addresses.size() + " addresses for " + ret.getId() + " dunno what to do");
        }

        long addressId = addresses.getLongItem(0, "address_id");
        address.setProvince(addressId, regInfo.getProvince());
        return newUser;

    }

}
