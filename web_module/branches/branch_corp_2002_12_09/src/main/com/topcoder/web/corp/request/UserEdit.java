package com.topcoder.web.corp.request;

/**
 * This processing module is responsible for user creation/modification. 
 * 
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 */
public class UserEdit extends BaseProcessor {
    public static final String KEY_TARGET_USER_ID = "id";
//    public static final String KEY_TARGET_USER_ID = "id";
    
    public UserEdit() {
        pageInContext = true;
        // For this processor next page is always in the context. It is either same
        // form page (if any errors were encountered) or next workflow page
        // (presumably same page from where he started the process)
    }

    /**
     * @see com.topcoder.web.corp.request.BaseProcessor#businessProcessing()
     */
    void businessProcessing() throws Exception {
//        //check if user is logged in - *must be*
//        if( ! getAuthenticityToken().isLoggedIn(true)) {
//            throw new AuthenticationException("You must be logged in to perform this action");
//        }
//        
//        // well, user is logged in
//        // now we will define what action requested
//        // if ID of user is omitted, is negative or absent (also if page is to be fetched 
//        // by non POST method) then will suppose that it is 'user create' request
//        int targetUserID = -1;
//        try {
//            targetUserID = Integer.parseInt(request.getParameter(KEY_TARGET_USER_ID));
//        }
//        catch(Exception e) {
//        }
// 
//        User thisUser = getAuthenticityToken().getLoggedInUser();
//        if( targetUserID < 0 ) { // create new user
//            // check if permissions allow create user
//            if( ! getPermissions().hasPermission(Resource.RC_CREATE_NEW_USER_IN_GROUP) ) {
//                throw new AuthenticationException("You are not allowed perform this action");
//            }
//            // create action is allowed
//        }
//        else { // modify existent user
//            // to ensure that user groups match
//            User targetUser = lookupUserByID(targetUserID);
//            if( targetUser == null ) {
//                throw new AuthenticationException("You are not allowed perform this action");
//            }
//            // ok, user was found
//            // check if groups matched
//            if( !thisUser.getGroup().equals(targetUser.getGroup()) ) {
//                throw new AuthenticationException("You are not allowed perform this action");
//            }
//            // so, groups matched. ensure this user has permission to edit
//            if( ! getPermissions().hasPermission(Resource.RC_MODIFY_USER_IN_GROUP) ) {
//                throw new AuthenticationException("You are not allowed perform this action");
//            }
//            // it is ok, edit action allowed
//            //populate form with user data and return it back
//        }
//        
//        // well, security checks had passed
//        // for all methods except POST just return form to the user
//        // same for create request
//        if( targetUserID < 0 || ! "POST".equals(request.getMethod()) ) {
//            nextPage = "/acc_admin/add-edit-user.jsp"; // empty form
//            return;
//        }
//        else { // request for modification
//            // populate form with user data
//            setFormFieldDefault(KEY_TARGET_USER_ID, new Integer(targetUserID));
//            nextPage = "/acc_admin/add-edit-user.jsp"; // empty form
//            return;
//        }
    }
    

}
