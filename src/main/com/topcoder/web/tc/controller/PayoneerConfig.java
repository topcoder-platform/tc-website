package com.topcoder.web.tc.controller;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.UnknownNamespaceException;
import org.apache.commons.lang3.StringUtils;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

public enum PayoneerConfig {
    INSTANCE(
            PayoneerConfig.getString("v4_base_api_url"),
            PayoneerConfig.getString("v4_partner_id"),
            PayoneerConfig.getString("v4_program_id"),
            PayoneerConfig.getString("v4_client_id"),
            PayoneerConfig.getString("v4_client_secret"),
            PayoneerConfig.getString("v4_login_url"),
            Boolean.valueOf(PayoneerConfig.getString("enable_v4")),
            Arrays.asList(Optional.ofNullable(StringUtils.split(PayoneerConfig.getString("v4_users"), ',')).orElse(new String[0]))
    );


    private String baseApiUrl = "";
    private String partnerId = "";
    private String programId = "";

    private String clientId = "";
    private String clientSecret = "";
    private String loginUrl = "";
    private boolean v4Enabled = false;
    private List<String> v4Users = null;

    private PayoneerConfig(String baseApiUrl, String partnerId, String programId, String clientId, String clientSecret, String loginUrl, boolean v4Enabled, List v4Users) {
        this.baseApiUrl = baseApiUrl;
        this.partnerId = partnerId;
        this.programId = programId;
        this.clientId = clientId;
        this.clientSecret = clientSecret;
        this.loginUrl = loginUrl;
        this.v4Enabled = v4Enabled;
        this.v4Users = v4Users;
    }

    public String getBaseApiUrl() {
        return baseApiUrl;
    }

    public String getPartnerId() {
        return partnerId;
    }

    public String getProgramId() {
        return programId;
    }


    public String getClientId() {
        return clientId;
    }

    public String getClientSecret() {
        return clientSecret;
    }

    public String getLoginUrl() {
        return loginUrl;
    }

    public boolean isV4Enabled() {
        return v4Enabled;
    }

    public List<String> getV4Users() {
        return v4Users;
    }

    private static Logger log = Logger.getLogger(PayoneerConfig.class);

    private static String getString(String key) {

        try {
            return ConfigManager.getInstance().getString("com.topcoder.web.tc.controller.PayoneerService", key);
        } catch (UnknownNamespaceException e) {
            log.error("UnknownNamespaceException while trying to initialize PayoneerConfig singleton", e);
            throw new RuntimeException(e);
        }

    }


}
