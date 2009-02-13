<%@page
	import="com.topcoder.json.object.JSONObject,com.topcoder.json.object.io.StandardJSONDecoder,com.topcoder.web.tc.view.voting.AssetManager,com.topcoder.web.tc.view.voting.AssetPair,java.util.Date,com.topcoder.web.tc.view.voting.Asset,com.topcoder.json.object.io.StandardJSONEncoder,com.topcoder.json.object.JSONArray,com.topcoder.web.tc.view.voting.Base64CodecUtils, com.topcoder.web.tc.view.voting.AssetPersistenceException"%>
<%@ page language="java"%>
<jsp:useBean id="sessionInfo"
	class="com.topcoder.web.common.SessionInfo" scope="request" />

<%
    String jsonData = request.getParameter("compareAssetsJsonRequest");
    Object asssetManagerObject = application.getAttribute("assetManager");
    if (asssetManagerObject instanceof AssetManager) {
        // creating root json object
        JSONObject root = new JSONObject();
        // checking wheather the user id is defined
        if (sessionInfo.getHandle() == null) {
            createError(root, 100, "user is not defined");
        } else {
            try {
System.out.println("a");
                // instantinating asset manager
                AssetManager assetManager = (AssetManager) asssetManagerObject;
                // creating decoder
System.out.println("b");
                StandardJSONDecoder decoder = new StandardJSONDecoder();
                JSONObject result = decoder.decodeObject(jsonData);
                // getting the data
                AssetPair assetPair = null;
                boolean assetId1Defined = result.isKeyDefined("asset_id_1");
System.out.println("c");
                boolean assetId2Defined = result.isKeyDefined("asset_id_2");
                boolean winnerAssetDefined = result.isKeyDefined("winner_asset");
                if (assetId1Defined || assetId2Defined || winnerAssetDefined) {
                    // checking for existence
                    checkAttributes(root, assetId1Defined, "asset_id_1");
System.out.println("d");
                    checkAttributes(root, assetId2Defined, "asset_id_2");
                    checkAttributes(root, winnerAssetDefined, "winner_asset");
                    if (assetId1Defined && assetId2Defined && winnerAssetDefined) {
	                    assetPair = new AssetPair();
	                    assetPair.setId1(result.getInt("asset_id_1"));
System.out.println("e");
	                    assetPair.setId2(result.getInt("asset_id_2"));
	                    assetPair.setWinnerId(result.getInt("winner_asset"));
	                    assetPair.setCreateUser(sessionInfo.getHandle());
	                    assetPair.setCreateDate(new Date());
                    }
System.out.println("f");
                }
                if (!root.isKeyDefined("error_data")) {
	                // getting next pair
System.out.println("g");
	                Asset[] assets =
	                    assetPair == null ? assetManager.getNextAssetPairing() : assetManager
	                        .getNextAssetPairing(assetPair);
	                // adding asset to result
System.out.println(assets.length);
	                JSONArray array = new JSONArray();
if (assets[0] == null) System.out.println("0 is null");
if (assets[1] == null) System.out.println("1 is null");
	                array.addJSONObject(createAsset(assets[0].getId(), assets[0].getData()));
	                array.addJSONObject(createAsset(assets[1].getId(), assets[1].getData()));
System.out.println("i");
	                root.setArray("assets", array);
                }
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
                createError(root, 110, e.getMessage() == null ? " " : e.getMessage());
            } catch (AssetPersistenceException e) {
                e.printStackTrace();
                createError(root, 120, e.getMessage() == null ? " " : e.getMessage());
            } catch (Exception e) {
                e.printStackTrace();
                createError(root, 190, e.getMessage() == null ? " " : e.getMessage());
            }
        }
        StandardJSONEncoder encoder = new StandardJSONEncoder();
        response.getWriter().write(encoder.encode(root));
    }
%>
<%!
private void checkAttributes(JSONObject root, boolean defined, String parameter) {
    if (!defined) {
        createError(root, 111, parameter + " must exist in JSON request");
    }
}
%>
<%!
private void createError(JSONObject root, int errorCode, String errorDescription) {
    JSONObject error = new JSONObject();
    error.setString("error_code", String.valueOf(errorCode));
    error.setString("error_message", errorDescription);
    root.setNestedObject("error_data", error);
}
%>
<%!
private JSONObject createAsset(int assetId, byte[] asssetData) {
    JSONObject asset = new JSONObject();
    asset.setString("asset_id", String.valueOf(assetId));
    asset.setString("encoding", "BASE64");
    asset.setString("asset_data", new String(Base64CodecUtils.encode(asssetData, asssetData.length)));
    return asset;
}
%>
