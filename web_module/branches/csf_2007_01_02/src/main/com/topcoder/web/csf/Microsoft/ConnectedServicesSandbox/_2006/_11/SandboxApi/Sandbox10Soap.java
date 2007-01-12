/**
 * Sandbox10Soap.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.SandboxApi;

import com.topcoder.web.csf.Microsoft.ConnectedServices._2006._10.ProductServiceMapping.PsmTagCloudResponse;
import com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.TeamFoundationServer.*;
import com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.UserProfileManager.SandboxUser;
import com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.UserProfileManager.UserType;
import com.topcoder.web.csf.Microsoft.ConnectedServicesSandbox._2006._11.UserProfileManager.holders.SandboxUserHolder;

public interface Sandbox10Soap extends java.rmi.Remote {
    public boolean userSignUp(SandboxUser sandboxUser, java.lang.String password) throws java.rmi.RemoteException;
    public boolean isProvisionCompleted(java.lang.String userName) throws java.rmi.RemoteException;
    public boolean deleteUser(java.lang.String userId) throws java.rmi.RemoteException;
    public boolean updateUser(SandboxUser userProfile) throws java.rmi.RemoteException;
    public void authenticate(java.lang.String userId, java.lang.String password, javax.xml.rpc.holders.BooleanHolder authenticateResult, SandboxUserHolder sandboxUser) throws java.rmi.RemoteException;
    public boolean loginExists(java.lang.String userId) throws java.rmi.RemoteException;
    public boolean changePassword(java.lang.String userName, java.lang.String newPassword) throws java.rmi.RemoteException;
    public SandboxUser getUserInfo(java.lang.String userName) throws java.rmi.RemoteException;
    public SandboxUser[] getAllUsers(UserType userType) throws java.rmi.RemoteException;
    public SandboxUser[] getUsersByPartnerCode(java.lang.String partnerCode) throws java.rmi.RemoteException;
    public java.lang.String checkPartnerCode(java.lang.String partnerCode) throws java.rmi.RemoteException;
    public ServiceList getServicesByUser(java.lang.String userId) throws java.rmi.RemoteException;
    public ServiceList listAllServices() throws java.rmi.RemoteException;
    public ServiceList queryServiceInformation(QueryServiceInformationRequest requestApi) throws java.rmi.RemoteException;
    public void deleteService(java.lang.String serviceKey) throws java.rmi.RemoteException;
    public ServiceList getTopRankedServices(int maxServicesToReturn) throws java.rmi.RemoteException;
    public ServiceList getServicesByCategory(java.lang.String category) throws java.rmi.RemoteException;
    public ServiceList getTodaysServices() throws java.rmi.RemoteException;
    public int getServiceCount() throws java.rmi.RemoteException;
    public ServiceList findServices(java.lang.String serviceNamePart) throws java.rmi.RemoteException;
    public GetServiceTagCloudResponse getServiceTagCloud() throws java.rmi.RemoteException;
    public ServiceList getServicesByTag(java.lang.String tagName) throws java.rmi.RemoteException;
    public java.lang.String createService(CreateServiceRequest apiRequest) throws java.rmi.RemoteException;
    public java.lang.String createAlert(CreateAlertRequest apiRequest) throws java.rmi.RemoteException;
    public void deleteAlert(java.lang.String alertId) throws java.rmi.RemoteException;
    public void updateAlert(Alert alert) throws java.rmi.RemoteException;
    public GetAlertsResponse getAlerts(GetAlertsRequest apiRequest) throws java.rmi.RemoteException;
    public java.lang.String createBinding(CreateBindingRequest apiRequest) throws java.rmi.RemoteException;
    public void deleteBinding(java.lang.String bindingKey) throws java.rmi.RemoteException;
    public void updateBinding(Binding binding) throws java.rmi.RemoteException;
    public NameValuePair getProperty(GetPropertyRequest apiRequest) throws java.rmi.RemoteException;
    public GetAllServiceCatalogCategoriesResponse getAllServiceCatalogCategories() throws java.rmi.RemoteException;
    public void setServiceRank(SetServiceRankRequest apiRequest) throws java.rmi.RemoteException;
    public void setServiceTags(SetServiceTagsRequest apiRequest) throws java.rmi.RemoteException;
    public ServiceList getUserServiceMappings(java.lang.String userId) throws java.rmi.RemoteException;
    public GetServiceTagsResponse getServiceTags(GetServiceTagsRequest apiRequest) throws java.rmi.RemoteException;
    public boolean createProduct(CreateProduct createProductApi) throws java.rmi.RemoteException;
    public GetSerevicePolicyResponseGetSerevicePolicyResult getSerevicePolicy(java.lang.String serviceLocation) throws java.rmi.RemoteException;
    public boolean updateProduct(UpdateProduct updateProductApi) throws java.rmi.RemoteException;
    public boolean deleteProduct(DeleteProduct deleteProductApi) throws java.rmi.RemoteException;
    public GetProductResponse getProduct(GetProduct getProductApi) throws java.rmi.RemoteException;
    public SearchProductsResponse searchProducts(SearchProducts searchProductsApi) throws java.rmi.RemoteException;
    public GetAllCategoriesResponse getAllCategories() throws java.rmi.RemoteException;
    public void insertCategory(InsertCategory requestApi) throws java.rmi.RemoteException;
    public java.lang.String getBlipContent(java.lang.String blipId) throws java.rmi.RemoteException;
    public PsmGetAllBlipContentResponsePsmGetAllBlipContentResult getAllBlipContent() throws java.rmi.RemoteException;
    public Menu[] getMenuItems(int userType) throws java.rmi.RemoteException;
    public ListUsersByProjectResponse listAllUsers(Project listUsersByProjectRequest) throws java.rmi.RemoteException;
    public DeleteProjectResponse deleteProject(DeleteProjectRequest deleteProjectRequest) throws java.rmi.RemoteException;
    public ProjectInfo[] listMyProjects(ListMyProjectsRequest listMyProjectsRequest) throws java.rmi.RemoteException;
    public ProjectInfo[] listAllProjects() throws java.rmi.RemoteException;
    public java.lang.String[] getServiceActions(java.lang.String serviceUrl) throws java.rmi.RemoteException;
    public java.lang.String[] getServiceActionMessageMappings(java.lang.String serviceUrl, java.lang.String action, java.lang.String message) throws java.rmi.RemoteException;
    public ActionInfo[] getOperationActions(java.lang.String strServiceURL) throws java.rmi.RemoteException;
    public PsmTagCloudResponse getProductTagCloud() throws java.rmi.RemoteException;
    public void addBlipContent(java.lang.String blip_id, java.lang.String page_name, java.lang.String blip_content) throws java.rmi.RemoteException;
    public void updateBlipContent(int id, java.lang.String blip_id, java.lang.String page_name, java.lang.String blip_content) throws java.rmi.RemoteException;
}
