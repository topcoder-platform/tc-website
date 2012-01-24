/*
 * Copyright (c) 2005-2011 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.controller.request.statistics;

import java.util.Iterator;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Country;
import com.topcoder.web.common.model.Path;
import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.UserPreference;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.WebConstants;

/**
 * <p>
 * This class retrieve the member profile information.
 * </p>
 * 
 * <p>
 *   Version 1.1 (Member Profile Enhancement 1.0) Change notes:
 *   <ol>
 *     <li>
 *     Added support for retrieving informations about the newly
 *     added tracks (conceptualization, specification, architecture, assembly,
 *     and application testing).
 *     </li>
 *   </ol>
 *
 *   Version 1.2 Change notes:
 *   <ol>
 *     <li>Added support for the Test Scenarios, UI Prototype and RIA Build tracks.</li>
 *   </ol> 
 *
 *   Version 1.3 (BUG#TCCC-3216 and TCC-3348) Change notes:
 *   <ol>
 *     <li>Member photo is now retrieved from informixoltp database, using query tool.</li>
 *   </ol>
 * </p>
 * 
 * @author rfairfax, elkhawajah, VolodymyrK, pvmagacho
 * @version 1.3
 */
public class MemberProfile extends Base {
    
    /**
     * <p>
     * Process the request of displaying member profile page.
     * </p>
     *
     * <p>
     * This has been updated to support all tracks.
     * </p>
     *
     * @since Member Profile Enhancement assembly
     */
    protected void businessProcessing() throws TCWebException {
        try {
            // step 1, get the base data used for the top section
            if (!hasParameter("cr")) {
                throw new TCWebException("Invalid Coder ID");
            }

            String coderId = getRequest().getParameter("cr");

            Request r = new Request();
            r.setContentHandle("member_profile");
            r.setProperty("cr", coderId);

            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) result.get("Coder_Data");

            // here we want to get the current tab, then load data for that tab
            boolean hasAlg = false;
            boolean hasHS = false;
            boolean registeredHS = false;
            boolean hasDes = false;
            boolean hasDev = false;
            boolean hasLong = false;
            boolean hasConcept = false;
            boolean hasSpec = false;
            boolean hasArch = false;
            boolean hasAssembly = false;
            boolean hasTest = false;
            boolean hasTestScenarios = false;
            boolean hasUIPrototype = false;
            boolean hasRIABuild = false;
            boolean hasContentCreation = false;
            boolean hasReporting = false;

            int algRating = 0;
            int hsRating = 0;
            int mmRating = 0;
            int desRating = 0;
            int devRating = 0;
            int conceptRating = 0;
            int specRating = 0;
            int archRating = 0;
            int assemblyRating = 0;
            int testRating = 0;
            int testScenariosRating = 0;
            int uiPrototypeRating = 0;
            int riaBuildRating = 0;
            int contentCreationRating = 0;
            int reportingRating = 0;

            String tab = StringUtils.checkNull(getRequest().getParameter("tab"));

            String defaultTab = "";
            int maxRating = 0;

            // Added - image from informixoltp - since 1.3
            r = new Request();
            r.setContentHandle("member_image");
            r.setProperty("cr", coderId);
            ResultSetContainer imageResult = new DataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("coder_image_data");

            Integer image = null;
            if ((imageResult.size() > 0) && (imageResult.getItem(0, "image_id").getResultData() != null) && (imageResult.getIntItem(0, "image_id") != 0)) {
            	image = imageResult.getIntItem(0, "image_id");
            	String image_path = imageResult.getStringItem(0, "image_path");
            	String fileName = imageResult.getStringItem(0, "file_name");
            	getRequest().setAttribute("pathImage", image_path + fileName);
            
            }
            getRequest().setAttribute("userImage", image);
            
            if (rsc.size() != 0) {

                if ((rsc.getItem(0, "rating").getResultData() != null)
                    && (rsc.getIntItem(0, "rating") != 0)) {
                    hasAlg = true;
                    algRating = rsc.getIntItem(0, "rating");
                    defaultTab = "alg";
                    maxRating = algRating;
                }

                if ((rsc.getItem(0, "hs_rating").getResultData() != null)
                    && (rsc.getIntItem(0, "hs_rating") != 0)) {
                    hasHS = true;
                    hsRating = rsc.getIntItem(0, "hs_rating");

                    if(hsRating > maxRating) {
                        maxRating = hsRating;
                        defaultTab = "hs";
                    }
                }

                if ((rsc.getItem(0, "mm_rating").getResultData() != null)
                    && (rsc.getIntItem(0, "mm_rating") != 0)) {
                    //hasLong = true;
                    mmRating = rsc.getIntItem(0, "mm_rating");

                    if(mmRating > maxRating) {
                        maxRating = mmRating;
                        defaultTab = "long";
                    }
                }

                if ((rsc.getItem(0, "concept_rating").getResultData() != null)
                    && (rsc.getIntItem(0, "concept_rating") != 0)) {
                    hasConcept = true;
                    conceptRating = rsc.getIntItem(0, "concept_rating");

                    if(conceptRating > maxRating) {
                        maxRating = conceptRating;
                        defaultTab = "concept";
                    }
                }

                if ((rsc.getItem(0, "spec_rating").getResultData() != null)
                    && (rsc.getIntItem(0, "spec_rating") != 0)) {
                    hasSpec = true;
                    specRating = rsc.getIntItem(0, "spec_rating");

                    if(specRating > maxRating) {
                        maxRating = specRating;
                        defaultTab = "spec";
                    }
                }

                if ((rsc.getItem(0, "arch_rating").getResultData() != null)
                    && (rsc.getIntItem(0, "arch_rating") != 0)) {
                    hasArch = true;
                    archRating = rsc.getIntItem(0, "arch_rating");

                    if(archRating > maxRating) {
                        maxRating = archRating;
                        defaultTab = "arch";
                    }
                }

                if (rsc.getItem(0, "design_rating").getResultData() != null) {
                    hasDes = true;
                    desRating = rsc.getIntItem(0, "design_rating");

                    if(desRating > maxRating) {
                        maxRating = desRating;
                        defaultTab = "des";
                    }
                }

                if (rsc.getItem(0, "development_rating").getResultData() != null) {
                    hasDev = true;
                    devRating = rsc.getIntItem(0, "development_rating");

                    if(devRating > maxRating) {
                        maxRating = devRating;
                        defaultTab = "dev";
                    }
                }

                if ((rsc.getItem(0, "assembly_rating").getResultData() != null)
                    && (rsc.getIntItem(0, "assembly_rating") != 0)) {
                    hasAssembly = true;
                    assemblyRating = rsc.getIntItem(0, "assembly_rating");

                    if(assemblyRating > maxRating) {
                        maxRating = assemblyRating;
                        defaultTab = "assembly";
                    }
                }

                if ((rsc.getItem(0, "test_rating").getResultData() != null)
                    && (rsc.getIntItem(0, "test_rating") != 0)) {
                    hasTest = true;
                    testRating = rsc.getIntItem(0, "test_rating");

                    if(testRating > maxRating) {
                        maxRating = testRating;
                        defaultTab = "test";
                    }
                }
				
                if ((rsc.getItem(0, "test_scenarios_rating").getResultData() != null)
                    && (rsc.getIntItem(0, "test_scenarios_rating") != 0)) {
                    hasTestScenarios = true;
                    testScenariosRating = rsc.getIntItem(0, "test_scenarios_rating");

                    if(testScenariosRating > maxRating) {
                        maxRating = testScenariosRating;
                        defaultTab = "test_scenarios";
                    }
                }
				
                if ((rsc.getItem(0, "ui_prototype_rating").getResultData() != null)
                    && (rsc.getIntItem(0, "ui_prototype_rating") != 0)) {
                    hasUIPrototype = true;
                    uiPrototypeRating = rsc.getIntItem(0, "ui_prototype_rating");

                    if(uiPrototypeRating > maxRating) {
                        maxRating = uiPrototypeRating;
                        defaultTab = "ui_prototype";
                    }
                }
				
                if ((rsc.getItem(0, "ria_build_rating").getResultData() != null)
                    && (rsc.getIntItem(0, "ria_build_rating") != 0)) {
                    hasRIABuild = true;
                    riaBuildRating = rsc.getIntItem(0, "ria_build_rating");

                    if(riaBuildRating > maxRating) {
                        maxRating = riaBuildRating;
                        defaultTab = "ria_build";
                    }
                }

                if ((rsc.getItem(0, "content_creation_rating").getResultData() != null)
                    && (rsc.getIntItem(0, "content_creation_rating") != 0)) {
                    hasContentCreation = true;
                    contentCreationRating = rsc.getIntItem(0, "content_creation_rating");

                    if(contentCreationRating > maxRating) {
                        maxRating = contentCreationRating;
                        defaultTab = "content_creation";
                    }
                }

                if ((rsc.getItem(0, "reporting_rating").getResultData() != null)
                    && (rsc.getIntItem(0, "reporting_rating") != 0)) {
                    hasReporting = true;
                    reportingRating = rsc.getIntItem(0, "reporting_rating");

                    if(reportingRating > maxRating) {
                        maxRating = reportingRating;
                        defaultTab = "reporting";
                    }
                }

                if (log.isDebugEnabled()) {
                    log.debug("has long comp is " + rsc.getStringItem(0, "has_long_comp"));
                }
                hasLong = rsc.getStringItem(0, "has_long_comp").equals("1");

                registeredHS = rsc.getIntItem(0, "hs_registered") == 1;

                // get the selected tab
                if (tab.equals("")) {
                    if (!hasAlg && !hasHS && !hasDes && !hasDev && !hasLong && !hasConcept && !hasSpec && !hasArch
                        && !hasAssembly && !hasTest && !hasTestScenarios && !hasUIPrototype && !hasRIABuild
                        && !hasContentCreation && !hasReporting) {
                        tab = "";
                    } else{
                        tab = defaultTab;
                    }
                }

                if (tab.equals("alg")) {
                    // load algo data from Coder_Alg_Data
                    r = new Request();
                    r.setContentHandle("Coder_Alg_Data");
                    r.setProperty("cr", coderId);
                    r.setProperty("ratid", "1");

                    dai = getDataAccess(true);
                    Map algoData = dai.getData(r);
                    Iterator it = algoData.keySet().iterator();
                    while (it.hasNext()) {
                        String key = (String) it.next();
                        result.put(key, algoData.get(key));
                    }
                } else if (tab.equals("hs")) {
                    // load algo data from Coder_HS_Data
                    r = new Request();
                    r.setContentHandle("Coder_hs_Data");
                    r.setProperty("cr", coderId);
                    r.setProperty("ratid", "2");

                    dai = getDataAccess(true);
                    Map algoData = dai.getData(r);
                    Iterator it = algoData.keySet().iterator();
                    while (it.hasNext()) {
                        String key = (String) it.next();
                        result.put(key, algoData.get(key));
                    }
                } else if (tab.equals("des")) {
                    // load des data from Coder_Des_Data
                    r = new Request();
                    r.setContentHandle("Coder_Des_Data");
                    r.setProperty("cr", coderId);
                    // design phase id
                    r.setProperty(Constants.PHASE_ID, "112");

                    dai = getDataAccess(true);
                    Map algoData = dai.getData(r);
                    Iterator it = algoData.keySet().iterator();
                    while (it.hasNext()) {
                        String key = (String) it.next();
                        result.put(key, algoData.get(key));
                    }
                } else if (tab.equals("dev")) {
                    // load des data from Coder_Des_Data
                    r = new Request();
                    r.setContentHandle("Coder_Dev_Data");
                    r.setProperty("cr", coderId);
                    // development phase id
                    r.setProperty(Constants.PHASE_ID, "113");

                    dai = getDataAccess(true);
                    Map algoData = dai.getData(r);
                    Iterator it = algoData.keySet().iterator();
                    while (it.hasNext()) {
                        String key = (String) it.next();
                        result.put(key, algoData.get(key));
                    }
                } else if (tab.equals("long")) {
                    r = new Request();
                    r.setContentHandle("Coder_Long_Data");
                    r.setProperty("cr", coderId);

                    dai = getDataAccess(true);
                    Map longData = dai.getData(r);
                    Iterator it = longData.keySet().iterator();
                    while (it.hasNext()) {
                        String key = (String) it.next();
                        result.put(key, longData.get(key));
                    }
                } else if (tab.equals("concept") || tab.equals("spec") || tab.equals("arch")
                    || tab.equals("assembly") || tab.equals("test") || tab.equals("test_scenarios")
                    || tab.equals("ui_prototype") || tab.equals("ria_build") || tab.equals("content_creation")
                    || tab.equals("reporting")) {
                    r = new Request();
                    r.setContentHandle("Coder_Track_Data");
                    r.setProperty("cr", coderId);

                    if (tab.equals("concept")) {
                        r.setProperty(Constants.PHASE_ID, "134");
                    } else if (tab.equals("spec")) {
                        r.setProperty(Constants.PHASE_ID, "117");
                    } else if (tab.equals("arch")) {
                        r.setProperty(Constants.PHASE_ID, "118");
                    } else if (tab.equals("assembly")) {
                        r.setProperty(Constants.PHASE_ID, "125");
                    } else if (tab.equals("test")) {
                        r.setProperty(Constants.PHASE_ID, "124");
                    } else if (tab.equals("test_scenarios")) {
                        r.setProperty(Constants.PHASE_ID, "137");
                    } else if (tab.equals("ui_prototype")) {
                        r.setProperty(Constants.PHASE_ID, "130");
                    } else if (tab.equals("ria_build")) {
                        r.setProperty(Constants.PHASE_ID, "135");
                    } else if (tab.equals("content_creation")) {
                        r.setProperty(Constants.PHASE_ID, "146");
                    } else if (tab.equals("reporting")) {
                        r.setProperty(Constants.PHASE_ID, "147");
                    }

                    dai = getDataAccess(true);
                    Map longData = dai.getData(r);
                    Iterator it = longData.keySet().iterator();
                    while (it.hasNext()) {
                        String key = (String) it.next();
                        result.put(key, longData.get(key));
                    }
                }
            }

            r = new Request();
            r.setContentHandle("member_contact_enabled");
            r.setProperty("cr", coderId);

            DataAccessInt dai2 = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, false);
            Map result2 = dai2.getData(r);
            ResultSetContainer rsc2 = (ResultSetContainer) result2.get("member_contact_enabled");

            boolean memberContactEnabled = false;
            if (rsc2.size() > 0) {
                memberContactEnabled = "yes".equals(rsc2.getStringItem(0, "value"));
            }


            // check whether the current member is in copilot pool.
            DataAccessInt dai3 = getDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME, false);
            r = new Request();
            r.setContentHandle("copilot_posting");
            r.setProperty("uid", String.valueOf(coderId));
            Map result3 = dai3.getData(r);
            ResultSetContainer rsc3 = (ResultSetContainer) result3.get("is_in_copilot_pool");
            boolean isInCopilotPool = !rsc3.isEmpty();

            // check whether or not show earnings
            if (!DAOUtil.useQueryToolFactory) {
                HibernateUtils.getSession().beginTransaction();
            }
            
            UserPreference up = DAOUtil.getQueryToolFactory().getUserPreferenceDAO().find(Long.parseLong(coderId),
                Preference.SHOW_EARNINGS_PREFERENCE_ID);
            boolean hidePayments = up != null && "hide".equals(up.getValue());

            getRequest().setAttribute("resultMap", result);

            getRequest().setAttribute("hasAlg", new Boolean(hasAlg));
            getRequest().setAttribute("hasHS", new Boolean(hasHS));
            getRequest().setAttribute("registeredHS", new Boolean(registeredHS));
            getRequest().setAttribute("hasDes", new Boolean(hasDes));
            getRequest().setAttribute("hasDev", new Boolean(hasDev));
            getRequest().setAttribute("hasLong", new Boolean(hasLong));
            getRequest().setAttribute("hasConcept", new Boolean(hasConcept));
            getRequest().setAttribute("hasSpec", new Boolean(hasSpec));
            getRequest().setAttribute("hasArch", new Boolean(hasArch));
            getRequest().setAttribute("hasAssembly", new Boolean(hasAssembly));
            getRequest().setAttribute("hasTest", new Boolean(hasTest));
            getRequest().setAttribute("hasTestScenarios", new Boolean(hasTestScenarios));
            getRequest().setAttribute("hasUIPrototype", new Boolean(hasUIPrototype));
            getRequest().setAttribute("hasRIABuild", new Boolean(hasRIABuild));
            getRequest().setAttribute("hasContentCreation", new Boolean(hasContentCreation));
            getRequest().setAttribute("hasReporting", new Boolean(hasReporting));
            getRequest().setAttribute("memberContactEnabled", new Boolean(memberContactEnabled));
            getRequest().setAttribute("isInCopilotPool", new Boolean(isInCopilotPool));
            getRequest().setAttribute("hidePayments", new Boolean(hidePayments));
            getRequest().setAttribute("tab", tab);

            setNextPage(Constants.MEMBER_PROFILE);
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
