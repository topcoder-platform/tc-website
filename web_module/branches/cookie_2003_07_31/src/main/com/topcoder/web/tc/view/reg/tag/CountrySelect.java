package com.topcoder.web.tc.view.reg.tag;

import com.topcoder.common.web.data.Country;
import com.topcoder.common.web.util.Cache;
import com.topcoder.ejb.DataCache.DataCache;
import com.topcoder.ejb.DataCache.DataCacheHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.jsp.JspException;
import java.util.ArrayList;

public class CountrySelect
        extends Select {
    private ArrayList eligibleCountries;

    public CountrySelect() {
        super();
        init();
    }

    void init() {
        eligibleCountries = new ArrayList();
        eligibleCountries.add(getCountry("840", "United States"));
        eligibleCountries.add(getCountry("036", "Australia"));
        eligibleCountries.add(getCountry("124", "Canada"));
        eligibleCountries.add(getCountry("156", "China"));
        eligibleCountries.add(getCountry("554", "New Zealand"));
        eligibleCountries.add(getCountry("826", "United Kingdom"));
        eligibleCountries.add(getCountry("372", "Ireland"));
        eligibleCountries.add(getCountry(" ", "-----------------------"));
    }

    Country getCountry(String code, String name) {
        Country c = new Country();
        c.setCountryCode(code);
        c.setCountryName(name);
        return c;
    }

    String getOptionValue(Object o) {
        return ((Country) o).getCountryCode();
    }

    String getOptionText(Object o) {
        return ((Country) o).getCountryName();
    }

    ArrayList getSelectOptions()
            throws JspException {
        ArrayList countries = new ArrayList();
        countries.addAll(eligibleCountries);
        InitialContext context = null;
        try {
            context = TCContext.getInitial();
            DataCache dataCache = Cache.get(context);
            ArrayList cacheCountries = dataCache.getCountries();
            ArrayList temp = new ArrayList(cacheCountries);
            for (int i = 0; i < temp.size(); i++) {
                Country country = (Country) temp.get(i);
                if (eligibleCountries.contains(country)) {
                    temp.remove(i);
                }
            }
            countries.addAll(temp);
        } catch (Exception e) {
            throw new JspException(e.toString());
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (Exception e) {
                }
            }
        }
        if (countries != null) {
        }
        return countries;
    }
}
