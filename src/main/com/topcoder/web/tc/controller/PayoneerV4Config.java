package com.topcoder.web.tc.controller;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.UnknownNamespaceException;
import com.topcoder.web.common.BaseProcessor;
import org.apache.commons.lang3.StringUtils;

import java.text.MessageFormat;
import java.util.Arrays;
import java.util.List;

public enum PayoneerV4Config {
    INSTANCE(
            PayoneerV4Config.getString("v4_base_api_url"),
            PayoneerV4Config.getString("v4_partner_id"),
            PayoneerV4Config.getString("v4_program_id"),
            PayoneerV4Config.getString("v4_client_id"),
            PayoneerV4Config.getString("v4_client_secret"),
            PayoneerV4Config.getString("v4_login_url"),
            Boolean.valueOf(PayoneerV4Config.getString("enable_v4")),
            Arrays.asList(StringUtils.split(PayoneerV4Config.getString("v4_users"), ',')!=null? StringUtils.split(PayoneerV4Config.getString("v4_users"), ',') :new String[0])
    );
    protected final Logger log = Logger.getLogger(PayoneerV4Config.class);

    private String baseApiUrl = "";
    private String partnerId = "";
    private String programId = "";

    private String clientId = "";
    private String clientSecret = "";
    private String loginUrl = "";
    private boolean v4Enabled = false;
    private List<String> v4Users = null;

    private PayoneerV4Config(String baseApiUrl, String partnerId, String programId, String clientId, String clientSecret, String loginUrl, boolean v4Enabled, List v4Users) {
        log.info("PayoneerV4Config V4 config constructor loaded");
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

    private static Logger log2 = Logger.getLogger(PayoneerV4Config.class);

    private static String getString(String key) {

        try {
            log2.debug(MessageFormat.format("PayoneerV4Config value retrieval for key = {0} ", key));
            return ConfigManager.getInstance().getString("com.topcoder.web.tc.controller.PayoneerService", key);
        } catch (UnknownNamespaceException e) {
            log2.error("UnknownNamespaceException while trying to initialize PayoneerConfig singleton", e);
            throw new RuntimeException(e);
        }

    }


}
