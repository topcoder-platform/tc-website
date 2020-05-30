package com.topcoder.dde.util.DWLoad;

import com.topcoder.dde.util.DWLoad.entity.*;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.client.fluent.Request;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.client.fluent.Executor;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.config.Registry;
import org.apache.http.ssl.SSLContexts;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.client.HttpClient;


import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import javax.net.ssl.SSLContext;

import com.topcoder.shared.util.logging.Logger;


import java.io.IOException;
import java.util.*;

public class Util {

    private static String groupsApiBase = "https://api.topcoder-dev.com/v5/groups/";
    private static final Logger logger = Logger.getLogger(Util.class);



    /**
     * Creates mapping of groups ids to list of child groups (multiple hierarchy levels are supported
     * @return group mapping
     * @throws IOException - if there is error getting group details from the api
     */
    public static Map<String, Set<String>> getGroups(int offset, int total) throws Exception {
        // get groups list
        logger.info("start fetching groups");
        String token = doGetToken();


        if (System.getenv("TC_GROUPS_API")!=null){
            groupsApiBase = System.getenv("TC_GROUPS_API");
        }

        PoolingHttpClientConnectionManager clientConnectionManager = new PoolingHttpClientConnectionManager(getRegistry());
        HttpClient client = HttpClients.custom().setConnectionManager(clientConnectionManager).build();
        Executor executor = Executor.newInstance(client);

        String url = groupsApiBase + "?page=" + (1 + offset/total) + "&perPage="+total+"&includeSubGroups=true&oneLevel=false";
        String groupsResponse = executor.execute(Request.Get(url)
                .addHeader("Authorization", "Bearer "+token))
                .returnContent().asString();
        ObjectMapper mapper = new ObjectMapper();
        List<GroupDetail> result = mapper.readValue(groupsResponse, new TypeReference<List<GroupDetail>>(){});
        Map<String, Set<String>> groupChildren = new TreeMap<String, Set<String>>();
        for (GroupDetail gd : result){
            if (gd.getOldId()==null){
                logger.warn("Group has oldId set as null and will be ignored: "+gd.getId());
                continue;
            }
            Set<String> children = new HashSet<String>();
            if (gd.getSubGroups()!=null) {
                for (GroupDetail cgd : gd.getSubGroups()) {
                    if (cgd.getOldId() == null) {
                        logger.warn("Group has oldId set as null: " + cgd.getId());
                        continue;
                    }
                    children.add(cgd.getOldId());
                }
            } else {
//                logger.warn("Child groups are null for: "+gd.getId()+" "+gd.getName());
            }
            groupChildren.put(gd.getOldId(),children);

            logger.info("Child groups for " + gd.getOldId() + ":" + Util.join(",", groupChildren.get(gd.getOldId())));
        }
        logger.info("Groups fetched: "+groupChildren.size());
        return groupChildren;
    }

    private static String doGetToken() throws Exception {
        String clientId = System.getenv("TC_CLIENT_ID");
        String clientSecret = System.getenv("TC_CLIENT_SECRET");
        String audience = System.getenv("TC_CLIENT_AUDIENCE");
        String domain = System.getenv("TC_CLIENT_DOMAIN");
        String auth0ProxyServerUrl = System.getenv("TC_CLIENT_PROXY_URL");
        return getMachineToken(clientId,clientSecret,audience,domain,auth0ProxyServerUrl);
    }

    //helper method to join String in Java 7
    public static String join(String delimeter, Set<String> set) {
        StringBuilder sb = new StringBuilder();
        boolean first = true;
        for (String item : set) {
            if (first) {
                first = false;
            } else {
                sb.append(delimeter);
            }
            sb.append(item);
        }
        return sb.toString();
    }

    private static String getMachineToken(String clientId, String clientSecret, String audience, String domain, String auth0ProxyServerUrl) throws Exception {
        if (audience == null || audience.trim().length() == 0) {
            throw new IllegalArgumentException("The audience should be non-null and non-empty string");
        }

        if (domain == null || domain.trim().length() == 0) {
            throw new IllegalArgumentException("The domain should be non-null and non-empty string");
        }


        String auth0Url = "https://" + domain + "/token" ;
        String authServerUrl = auth0ProxyServerUrl != null && auth0ProxyServerUrl.trim().length() > 0 ? auth0ProxyServerUrl : auth0Url;

        Map<String, String> postMap = new HashMap<String, String>();
        postMap.put("client_id", clientId);
        postMap.put("client_secret", clientSecret);
        postMap.put("grant_type", "client_credentials");
        postMap.put("audience",  audience);
        postMap.put("auth0_url",  auth0Url);
        postMap.put("fresh_token", "false");
        ObjectMapper mapper = new ObjectMapper();
        logger.info("auth url "+authServerUrl);
        String response = Request.Post(authServerUrl).bodyString(mapper.writeValueAsString(postMap), ContentType.APPLICATION_JSON)
                .execute().returnContent().asString();
        String token = mapper.readTree(response).path("access_token").asText();
        logger.info("got the m2m token, length "+token.length());
        return token;
    }

    public static Map<String, Set<String>> getGroup(String singleGroupId) throws Exception {
        // get groups list
        logger.info("start fetching groups");
        String token = Util.doGetToken();


        if (System.getenv("TC_GROUPS_API")!=null){
            groupsApiBase = System.getenv("TC_GROUPS_API");
        }

        String url = groupsApiBase + "?page=" + singleGroupId;
        String groupsResponse = Request.Get(url)
                .addHeader("Authorization", "Bearer "+token)
                .execute().returnContent().asString();
        ObjectMapper mapper = new ObjectMapper();
        GroupDetail result = mapper.readValue(groupsResponse, GroupDetail.class);
        Set<String> children = new HashSet<String>();
        for (GroupDetail cgd : result.getSubGroups()){
            if (cgd.getOldId()==null){
                logger.warn("Group has oldId set as null: "+cgd.getId());
                continue;
            }
            children.add(cgd.getOldId());
        }
        logger.info("Child groups for " + result.getOldId() + ":" + Util.join(",", children));

        Map<String, Set<String>> results = new HashMap<String, Set<String>>();
        if (result.getOldId()==null){
            logger.warn("Group has oldId set as null and will be ignored: "+result.getId());
        } else {
            results.put(result.getOldId(),children);
        }

        return results;
    }

    private static Registry<ConnectionSocketFactory> getRegistry() throws KeyManagementException, NoSuchAlgorithmException {
        SSLContext sslContext = SSLContexts.custom().build();
        SSLConnectionSocketFactory sslConnectionSocketFactory = new SSLConnectionSocketFactory(sslContext,
                new String[]{"TLSv1.2"}, null, SSLConnectionSocketFactory.getDefaultHostnameVerifier());
        return RegistryBuilder.<ConnectionSocketFactory>create()
                .register("http", PlainConnectionSocketFactory.getSocketFactory())
                .register("https", sslConnectionSocketFactory)
                .build();
    }
}
