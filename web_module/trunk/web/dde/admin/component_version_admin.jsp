<%@ page import="javax.naming.*,
                 com.topcoder.dde.submission.Submission,
                 com.topcoder.dde.submission.Submitter,
                 com.topcoder.dde.submission.Submitters,
                 com.topcoder.dde.submission.Utility" %>
<%@ page import="javax.ejb.CreateException" %>
<%@ page import="java.io.*" %>
<%@ page import="java.rmi.*" %>
<%@ page import="javax.rmi.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.reflect.*" %>

<%@ page import="com.topcoder.dde.catalog.*" %>
<%@ page import="com.topcoder.dde.forum.*" %>
<%@ page import = "com.topcoder.util.config.*" %>
<%@ page import = "com.topcoder.servlet.request.*" %>

<%@ include file="/includes/util.jsp" %>
<%@ include file="session.jsp" %>
<%@ include file="/includes/formclasses.jsp" %>

<%
    // STANDARD PAGE VARIABLES
    String page_name = "component_version_admin.jsp";
    String action = request.getParameter("a");
    String namespace = "com.topcoder.servlet.request.FileUpload";
    java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("MM/dd/yyyy");
%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>TopCoder Software</title>

<link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />

<script language="JavaScript" type="text/javascript" src="/scripts/javascriptAdmin.js">
</script>
<script language="JavaScript" type="text/javascript" >
    	function hide()
		{
                        //alert('here');
			//if (Exists("date_row1"))
			//	document.all("date_row1").style.display = "none";
		}

</script>
<%
Object objTechTypes = CONTEXT.lookup("CatalogEJB");
CatalogHome home = (CatalogHome) PortableRemoteObject.narrow(objTechTypes, CatalogHome.class);
Catalog catalog = home.create();

Collection colTechnology = catalog.getTechnologies();

Object objComponentMgr = CONTEXT.lookup("ComponentManagerEJB");
ComponentManagerHome component_manager_home = (ComponentManagerHome) PortableRemoteObject.narrow(objComponentMgr, ComponentManagerHome.class);
ComponentManager componentManager = null;

long lngComponent = 0;
long lngVersion = 0;

String strError = "";
String strMessage = "";

if (request.getMethod().equals("POST")) {
    try {
        // File Upload - Config manager
        FileUpload fu = new FileUpload(request,false);
        lngComponent = Long.parseLong(fu.getParameter("comp"));
        lngVersion = Long.parseLong(fu.getParameter("ver"));
        Iterator fileUploads = fu.getAllUploadedFiles();
        action = fu.getParameter("a");

        // File Upload - parse request
        strMessage += "File was uploaded.";
        if (lngVersion > 0) {
            componentManager = component_manager_home.create(lngComponent, lngVersion);
        } else {
            componentManager = component_manager_home.create(lngComponent);
        }

        String rootDir = fu.getCurrentDefaultDir();
        if (!rootDir.endsWith("/")) {
            rootDir += "/";
        }
        String dir = "" + lngComponent + "/";
        dir += componentManager.getVersionInfo().getVersionId() + "/";
        //Create the directories if they do not already exist.


        if (action != null) {
            // Documents
            if (action.equals("Add Document")) {
                String name = fu.getParameter("txtDocumentName");
                String type = fu.getParameter("selDocType");
                long lngType = -1;
                try {
                    lngType = Long.parseLong(type);
                } catch (Exception ignore) {}
                if (name.trim().length() == 0) {
                    strError += "Name cannot be blank.<BR>";
                } else {
                    if (fileUploads.hasNext()) {
                        UploadedFile uf = (UploadedFile)fileUploads.next();
                        String url = dir + uf.getRemoteFileName();
                        InputStream is = uf.getInputStream();
                        new File(rootDir + dir).mkdirs();
                        File f = new File(rootDir + url);
                        if (!f.exists()) {
                            FileOutputStream fos = new FileOutputStream(f);
                            int b = is.read();
                            while (b != -1) {
                                fos.write(b);
                                b = is.read();
                            }
                            fos.close();
                            is.close();
                            if (lngType == Document.JAVADOCS) {
                                File jDocDir = new File(f.getParent(),"javadoc");
                                jDocDir.mkdir();
                                System.err.println("Executing: jar -xf "+f.getAbsolutePath()+" in "+jDocDir.getAbsolutePath());
                                Runtime.getRuntime().exec("jar -xf "+f.getAbsolutePath(), new String[0], jDocDir);
//                                sun.tools.jar.Main.main(new String[]{"-xf",f.getAbsolutePath(),"-C",jDocDir.getAbsolutePath()});
                            }
                            com.topcoder.dde.catalog.Document document = new com.topcoder.dde.catalog.Document(name, url, Long.parseLong(type));
                            componentManager.addDocument(document);
                        } else {
                            strError += "File: " + f.getName() + " already exists";
                        }
                    }
                }
            }

            if (action.equals("Upload Document")) {
                com.topcoder.dde.catalog.Document document = catalog.getDocument(Long.parseLong(fu.getParameter("lngDocument")));
                if (fileUploads.hasNext()) {
                    try {
                        new File(rootDir + document.getURL()).delete();
                    } catch (Exception e) {}
                    UploadedFile uf = (UploadedFile)fileUploads.next();
                    String url = dir + uf.getRemoteFileName();
                    InputStream is = uf.getInputStream();
                    new File(rootDir + dir).mkdirs();
                    File f = new File(rootDir + url);
                    if (!f.exists()) {
                        FileOutputStream fos = new FileOutputStream(f);
                        int b = is.read();
                        while (b != -1) {
                            fos.write(b);
                            b = is.read();
                        }
                        fos.close();
                        is.close();
                        if (document.getType() == Document.JAVADOCS) {
                            File jDocDir = new File(f.getParent(),"javadoc");
                            jDocDir.mkdir();
                            System.err.println("Executing: jar -xf "+f.getAbsolutePath()+" in "+jDocDir.getAbsolutePath());
                            Runtime.getRuntime().exec("jar -xf "+f.getAbsolutePath(), new String[0], jDocDir);
//                                sun.tools.jar.Main.main(new String[]{"-xf",f.getAbsolutePath(),"-C",jDocDir.getAbsolutePath()});
                        }
                        document.setURL(url);
                        componentManager.updateDocument(document);
                    } else {
                        strError += "File: " + f.getName() + " already exists.  ";
                    }
                }
            }

            // Downloads
            if (action.equals("Add Download")) {
                String desc = fu.getParameter("txtDownloadDescription");
                if (desc.trim().length() == 0) {
                    strError += "Name cannot be blank.<BR>";
                } else {
                    if (fileUploads.hasNext()) {
                        UploadedFile uf = (UploadedFile)fileUploads.next();
                        String url = dir + uf.getRemoteFileName();
                        InputStream is = uf.getInputStream();
                        new File(rootDir + dir).mkdirs();
                        File f = new File(rootDir + url);
                        if (!f.exists()) {
                            FileOutputStream fos = new FileOutputStream(f);
                            int b = is.read();
                            while (b != -1) {
                                fos.write(b);
                                b = is.read();
                            }
                            fos.close();
                            is.close();
                            Download download = new Download(desc, url);
                            componentManager.addDownload(download);
                        } else {
                            strError += "File: " + f.getName() + " already exists.  ";
                        }
                    }
                }
            }

            if (action.equals("Upload Download")) {
                Download download = catalog.getDownload(Long.parseLong(fu.getParameter("lngDownload")));
                if (fileUploads.hasNext()) {
                    try {
                        new File(rootDir + download.getURL()).delete();
                    } catch (Exception e) {}
                    UploadedFile uf = (UploadedFile)fileUploads.next();
                    String url = dir + uf.getRemoteFileName();
                    InputStream is = uf.getInputStream();
                    new File(rootDir + dir).mkdirs();
                    File f = new File(rootDir + url);
                    if (!f.exists()) {
                        FileOutputStream fos = new FileOutputStream(f);
                        int b = is.read();
                        while (b != -1) {
                            fos.write(b);
                            b = is.read();
                        }
                        fos.close();
                        is.close();
                        download.setURL(url);
                        componentManager.updateDownload(download);
                    } else {
                        strError += "File: " + f.getName() + " already exists.  ";
                    }
                }
            }
        }
    } catch (FileSizeLimitExceededException fe) {
        strError += "File size exceeds limit: " + fe.getMessage();
    } catch (DisallowedDirectoryException dde) {
        strError += "Directory access is denied: " + dde.getMessage();
    } catch (ConfigManagerException e) {
        strError += "ConfigManager exception occurred: " + e.getMessage();
    } catch (InvalidContentTypeException icte) {
    }
}

if (componentManager == null) {
    debug.addMsg("component version admin", "Component = " + request.getParameter("comp"));
    debug.addMsg("component version admin", "Version = " + request.getParameter("ver"));
    try {
        lngComponent = Long.parseLong(request.getParameter("comp"));
    } catch (Exception e) {
        response.sendRedirect("catalog.jsp");
        return;
    }

    try {
        lngVersion = Long.parseLong(request.getParameter("ver"));
    } catch (Exception e) {
        debug.addMsg("component version admin", "no version found - must be in create mode");
    }

    if (lngVersion > 0) {
        componentManager = component_manager_home.create(lngComponent, lngVersion);
    } else {
        componentManager = component_manager_home.create(lngComponent);
    }
}

ComponentVersionInfo ver = null;
VersionDateInfo verDateInfo = null;
Hashtable technologies = new Hashtable();
String postingDate = "";
long postingStatusId = 0L;
long levelId = 0L;
String initialSubmissionDate = "";
String finalSubmissionDate = "";
String winnerAnnouncedDate = "";
String estimatedDevDate = "";
String screeningCompleteDate = "";
String reviewCompleteDate = "";
String aggregationCompleteDate = "";
String phaseCompleteDate = "";
String productionDate = "";
double phasePrice = 0;
String aggregationCompleteDateComment = "";
String phaseCompleteDateComment= "";
String productionDateComment= "";
String reviewCompleteDateComment = "";
String winnerAnnouncedDateComment= "";
String initialSubmissionDateComment= "";
String screeningCompleteDateComment = "";
String finalSubmissionDateComment = "";
//GT Added this to allow for public forums;
String publicForum = "";
ComponentInfo component = null;
component = componentManager.getComponentInfo();
if (lngVersion > 0) {
    ver = componentManager.getVersionInfo();

    try{
        verDateInfo = componentManager.getVersionDateInfo(ver.getVersionId(), ver.getPhase());
        postingDate = dateFormat.format(verDateInfo.getPostingDate());
        initialSubmissionDate = dateFormat.format(verDateInfo.getInitialSubmissionDate());
        finalSubmissionDate = dateFormat.format(verDateInfo.getFinalSubmissionDate());

        postingStatusId =  verDateInfo.getStatusId();
        levelId = verDateInfo.getLevelId();

	if(verDateInfo.getEstimatedDevDate() != null ){
           estimatedDevDate = dateFormat.format(verDateInfo.getEstimatedDevDate());
        }
	if(verDateInfo.getScreeningCompleteDate() != null){
           screeningCompleteDate = dateFormat.format(verDateInfo.getScreeningCompleteDate());
        }
	if(verDateInfo.getReviewCompleteDate() != null){
           reviewCompleteDate = dateFormat.format(verDateInfo.getReviewCompleteDate());
        }
	if(verDateInfo.getAggregationCompleteDate() != null){
           aggregationCompleteDate = dateFormat.format(verDateInfo.getAggregationCompleteDate());
           winnerAnnouncedDate = dateFormat.format(verDateInfo.getAggregationCompleteDate());
        }
	if(verDateInfo.getPhaseCompleteDate() != null){
           phaseCompleteDate = dateFormat.format(verDateInfo.getPhaseCompleteDate());
        }
	if(verDateInfo.getProductionDate() != null){
           productionDate = dateFormat.format(verDateInfo.getProductionDate());
        }


        phasePrice = verDateInfo.getPrice();

        aggregationCompleteDateComment = verDateInfo.getAggregationCompleteDateComment();
        phaseCompleteDateComment= verDateInfo.getPhaseCompleteDateComment();
        productionDateComment= verDateInfo.getProductionDateComment();
        reviewCompleteDateComment = verDateInfo.getReviewCompleteDateComment();
        winnerAnnouncedDateComment= null; //verDateInfo.getWinnerAnnouncedDateComment();
        initialSubmissionDateComment= verDateInfo.getInitialSubmissionDateComment();
        screeningCompleteDateComment    = verDateInfo.getScreeningCompleteDateComment();
        finalSubmissionDateComment = verDateInfo.getFinalSubmissionDateComment();
    }
    catch(CatalogException ce)
    {
        //version date info has not been added yet
        verDateInfo = new VersionDateInfo();
    }
}

Collection colVerTechs = componentManager.getTechnologies();

Iterator iterVerTechs = colVerTechs.iterator();
while (iterVerTechs.hasNext()) {
    Technology tech = (Technology)iterVerTechs.next();
    technologies.put("" + tech.getId(), "hit");
}

if (request.getParameter("add.x") != null) {
    // Add dependency
    String strDependency = request.getParameter("selMasterDependency");
    debug.addMsg("component version admin", "adding dependency " + strDependency);
    if (strDependency != null) {
        try {
            componentManager.addDependency(Long.parseLong(strDependency));
        } catch (Exception e) {
            debug.addMsg("component version admin", "error: " + e.getMessage());
        }
    }
}

if (request.getParameter("remove.x") != null) {
    // Remove dependency
    String strDependency = request.getParameter("selVersionDependency");
    debug.addMsg("component version admin", "removing dependency " + strDependency);
    try {
    componentManager.removeDependency(Long.parseLong(strDependency));
    } catch (Exception e) {
        debug.addMsg("component version admin", "error: " + e.getMessage());
    }
}

if (action != null) {
    //strMessage += "action is " + action + "<BR>";
    if (action.equalsIgnoreCase("Save")) {
        // Get fields and set component info

        String versionLabel =       request.getParameter("txtVersionLabel");
        String comments =  request.getParameter("taComments");
        String price =  "0"; //     request.getParameter("txtPrice");
        postingDate =   "5/5/1976"; //request.getParameter("txtPostingDate");

        //GT Added this to allow for public forums;
        publicForum = request.getParameter("public_forum");
        //if (publicForum != null && publicForum.equalsIgnoreCase("on")) {
        if (publicForum != null && publicForum.equalsIgnoreCase("1")) {
            ver.setPublicForum(true);
        }
  	    initialSubmissionDate = "01/01/2000";
        finalSubmissionDate =  initialSubmissionDate;

        estimatedDevDate =   initialSubmissionDate;
        screeningCompleteDate = initialSubmissionDate;

        reviewCompleteDate=initialSubmissionDate;


        winnerAnnouncedDate=initialSubmissionDate;
        aggregationCompleteDate=initialSubmissionDate;
        phaseCompleteDate=initialSubmissionDate;


	if(request.getParameter("txtProductionDate")!=""){
	        productionDate= request.getParameter("txtProductionDate");
        }
        else{
            productionDate = null;
        }


        String phaseVersionPrice =   request.getParameter("txtPhaseVersionPrice");
        phasePrice = Double.parseDouble(phaseVersionPrice);
        String strPostingStatus =   request.getParameter("selPostingStatus");
        postingStatusId = Long.parseLong(request.getParameter("selPostingStatus"));
        levelId = Long.parseLong(request.getParameter("selLevelId"));

        aggregationCompleteDateComment = null;
        phaseCompleteDateComment= null;
        productionDateComment= request.getParameter("txtProductionDateComment");
        reviewCompleteDateComment = null;
        winnerAnnouncedDateComment= null;
        initialSubmissionDateComment= null;
        screeningCompleteDateComment    = null;
        finalSubmissionDateComment = null;

        String phaseDate =   "9/9/2000";
        String phase =   request.getParameter("selPhase");
        ver.setVersionLabel(versionLabel);
        ver.setComments(comments);
        ver.setPrice(Double.parseDouble(price));



        //StringTokenizer stDate = new StringTokenizer(phaseDate, "/");
        String month = "5";
        String date = "4";
        String year = "1976";
        GregorianCalendar gcDate = new GregorianCalendar(Integer.parseInt(year), Integer.parseInt(month)-1, Integer.parseInt(date));
        ver.setPhaseDate(gcDate.getTime());
        ver.setPhase(Long.parseLong(phase));

        try {
            if (colTechnology != null) {
                Iterator iter = colTechnology.iterator();
                while (iter.hasNext()) {
                    Object obj = iter.next();
                    if (obj instanceof Technology) {
                        String tmp = request.getParameter("tech_" + ((Technology)obj).getId());
                        if (tmp != null && technologies.get("" + ((Technology)obj).getId()) == null) {
                            componentManager.addTechnology(((Technology)obj).getId());
                        } else {
                            if (tmp == null && technologies.get("" + ((Technology)obj).getId()) != null) {
                                componentManager.removeTechnology(((Technology)obj).getId());
                            }
                        }
                    }
                }
            }
            componentManager.updateVersionInfo(ver, tcSubject, levelId);
            if(verDateInfo != null && (ver.getPhase() == ComponentVersionInfo.DEVELOPMENT || ver.getPhase() == ComponentVersionInfo.SPECIFICATION || ver.getPhase() == ComponentVersionInfo.COMPLETED))
            {

                verDateInfo.setComponentVersionId(ver.getVersionId());
                verDateInfo.setPhaseId(ver.getPhase());
                verDateInfo.setPostingDate(dateFormat.parse(postingDate));
                verDateInfo.setInitialSubmissionDate(dateFormat.parse(initialSubmissionDate));
                verDateInfo.setFinalSubmissionDate(dateFormat.parse(finalSubmissionDate));

                if(estimatedDevDate != null && !estimatedDevDate.equals("")){
                   verDateInfo.setEstimatedDevDate(dateFormat.parse(estimatedDevDate));
                }
                verDateInfo.setPrice(phasePrice);
                verDateInfo.setStatusId(Long.parseLong(strPostingStatus));
                verDateInfo.setLevelId(levelId);

        verDateInfo.setAggregationCompleteDateComment(aggregationCompleteDateComment);
        verDateInfo.setPhaseCompleteDateComment(phaseCompleteDateComment);
        verDateInfo.setProductionDateComment(productionDateComment);
        verDateInfo.setReviewCompleteDateComment(reviewCompleteDateComment);
        verDateInfo.setWinnerAnnouncedDateComment(null);
        verDateInfo.setInitialSubmissionDateComment(initialSubmissionDateComment);
        verDateInfo.setScreeningCompleteDateComment(screeningCompleteDateComment);
        verDateInfo.setFinalSubmissionDateComment(finalSubmissionDateComment);

        	    if(estimatedDevDate != null && !estimatedDevDate.equals("")){
                    verDateInfo.setEstimatedDevDate(dateFormat.parse(estimatedDevDate));
        		}
        		else{
        		    verDateInfo.setEstimatedDevDate(null);
        	    }
        	    if(screeningCompleteDate != null && !screeningCompleteDate.equals("")){
                    verDateInfo.setScreeningCompleteDate(dateFormat.parse(screeningCompleteDate));
        		}
        		else{
        		    verDateInfo.setScreeningCompleteDate(null);
        	    }

        	    if(phaseCompleteDate != null && !phaseCompleteDate.equals("")){
                    verDateInfo.setPhaseCompleteDate(dateFormat.parse(phaseCompleteDate));
        		}
        		else{
        		    verDateInfo.setPhaseCompleteDate(null);
        	    }
        	    if(productionDate != null && !productionDate.equals("") ){
                    verDateInfo.setProductionDate(dateFormat.parse(productionDate));
        		}
        		else{
        		    verDateInfo.setProductionDate(null);
        	    }

        	    if(reviewCompleteDate != null && !reviewCompleteDate.equals("")){
                    verDateInfo.setReviewCompleteDate(dateFormat.parse(reviewCompleteDate));
        		}
        		else{
        		    verDateInfo.setReviewCompleteDate(null);
        	    }

        	    if(aggregationCompleteDate != null && !aggregationCompleteDate.equals("") ){
                    verDateInfo.setAggregationCompleteDate(dateFormat.parse(aggregationCompleteDate));
                    verDateInfo.setWinnerAnnouncedDate(dateFormat.parse(aggregationCompleteDate));
        		}
        		else{
        		    verDateInfo.setAggregationCompleteDate(null);
        	    }

                componentManager.updateVersionDatesInfo(verDateInfo);
            }
            strMessage += "Version info was saved.";
            colVerTechs = componentManager.getTechnologies();
            iterVerTechs = colVerTechs.iterator();
            technologies.clear();
            while (iterVerTechs.hasNext()) {
                Technology tech = (Technology)iterVerTechs.next();
                technologies.put("" + tech.getId(), "hit");
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
            if (e.getMessage().startsWith("Online Review:")) {
                strError += e.getMessage();
            } else {
                strError += "An error occurred while updating version info.";
            }
            ver = componentManager.getVersionInfo();
        }
    }
    if (action.equalsIgnoreCase("Create") && tcUser != null) {

        // Get fields and request version info
        String versionLabel     =  "";//request.getParameter("txtVersionLabel");
        String comments         =  "";//request.getParameter("taComments");

        try {
            debug.addMsg("component version admin", "creating request");
            debug.addMsg("component version admin", "ComponentVersionRequest versionRequest = new ComponentVersionRequest(" + comments + ", " + versionLabel + ", " + tcUser.getId() + ");");
            ComponentVersionRequest versionRequest = new ComponentVersionRequest(comments, versionLabel, tcUser.getId());
            debug.addMsg("component version admin", "created request");

            if (colTechnology != null) {
                Iterator iter = colTechnology.iterator();
                while (iter.hasNext()) {
                    Object obj = iter.next();
                    if (obj instanceof Technology) {
                        String tmp = request.getParameter("tech_" + ((Technology)obj).getId());
                        if (tmp != null) {
                            versionRequest.addTechnology(((Technology)obj).getId());
                        }
                    }
                }
            }

            debug.addMsg("component version admin", "creating new version");
            lngVersion = componentManager.createNewVersion(versionRequest);


            debug.addMsg("component version admin", "created new version");
            componentManager = component_manager_home.create(lngComponent, lngVersion);
            debug.addMsg("component version admin", "retrieved new version");
            ver = componentManager.getVersionInfo();
            strMessage += "Version request was created.";


            if(verDateInfo == null && (ver.getPhase() == ComponentVersionInfo.DEVELOPMENT || ver.getPhase() == ComponentVersionInfo.SPECIFICATION || ver.getPhase() == ComponentVersionInfo.COMPLETED))
            {
        		java.util.Date dtEstimatedDevDate = null;
        		java.util.Date dtScreeningCompleteDate = null;
                java.util.Date dtPhaseCompleteDate = null;
                java.util.Date dtProductionDate = null;
        		java.util.Date dtReviewCompleteDate = null;
        		java.util.Date dtAggregationCompleteDate = null;
        	    if(estimatedDevDate != null ){
                    dtEstimatedDevDate =  dateFormat.parse(estimatedDevDate);
        		}
        	    if(screeningCompleteDate != null ){
                    dtScreeningCompleteDate =  dateFormat.parse(screeningCompleteDate);
        		}
        	    if(phaseCompleteDate != null ){
                    dtPhaseCompleteDate =  dateFormat.parse(phaseCompleteDate);
        		}
        	    if(reviewCompleteDate != null ){
                    dtReviewCompleteDate =  dateFormat.parse(reviewCompleteDate);
        		}
        	    if(aggregationCompleteDate != null ){
                    dtAggregationCompleteDate =  dateFormat.parse(aggregationCompleteDate);
        		}
                if(productionDate != null ){
                    dtProductionDate =  dateFormat.parse(productionDate);
        		}
                verDateInfo = new VersionDateInfo(ver.getVersionId(),
                                                  ver.getPhase(),
                                                  dateFormat.parse(postingDate),
                                                  dateFormat.parse(initialSubmissionDate),
                                                  dateFormat.parse(finalSubmissionDate),
                                                  dateFormat.parse(winnerAnnouncedDate),
                                                  dtEstimatedDevDate ,
                                                  Double.parseDouble(request.getParameter("txtPhaseVersionPrice")),
                                                  Long.parseLong(request.getParameter("selPostingStatus")),
                                                  Long.parseLong(request.getParameter("selLevelId")),
                                                  dtScreeningCompleteDate, dtPhaseCompleteDate,
                                                  dtAggregationCompleteDate,dtReviewCompleteDate,
                                                  null,
                                                  null,
                                                  null,
                                                  null,
                                                  null,
                                                  null,
                                                  null,
                                                  dtProductionDate,
                                                  request.getParameter("txtProductionDateComment")
                                                );

                componentManager.updateVersionDatesInfo(verDateInfo);
            }

            colVerTechs = componentManager.getTechnologies();
            iterVerTechs = colVerTechs.iterator();
            technologies.clear();



            while (iterVerTechs.hasNext()) {
                Technology tech = (Technology)iterVerTechs.next();
                technologies.put("" + tech.getId(), "hit");
            }
        } catch (Exception e) {
            debug.addMsg("component version admin", "error: " + e.getMessage());
            response.sendRedirect("component_admin.jsp?comp=" + lngComponent);
            return;
        }
    }
    if (action.equals(">>")) {
        // Add dependency
        String strDependency = request.getParameter("selMasterDependency");
        debug.addMsg("component version admin", "adding dependency " + strDependency);
        if (strDependency != null) {
            try {
                componentManager.addDependency(Long.parseLong(strDependency));
            } catch (Exception e) {
                debug.addMsg("component version admin", "error: " + e.getMessage());
            }
        }
    }

    if (action.equals("<<")) {
        // Remove dependency
        String strDependency = request.getParameter("selVersionDependency");
        debug.addMsg("component version admin", "removing dependency " + strDependency);
        try {
        componentManager.removeDependency(Long.parseLong(strDependency));
        } catch (Exception e) {
            debug.addMsg("component version admin", "error: " + e.getMessage());
        }
    }

    // Example
    if (action.equals("Add Example")) {
        String desc = request.getParameter("txtExampleDescription");
        String url = request.getParameter("txtExampleURL");
        Example example = new Example(desc, url);
        componentManager.addExample(example);
        //response.sendRedirect("component_version_admin.jsp?comp=" + lngComponent + "ver=" + lngVersion);
    }

    if (action.equals("DeleteExample")) {
        String strExample = request.getParameter("example");
        long exampleId = Long.parseLong(strExample);
        componentManager.removeExample(exampleId);
        //response.sendRedirect("component_version_admin.jsp?comp=" + lngComponent + "ver=" + lngVersion);
    }

    // Assign a user a role that has permissions to download this component
    if (action.equals("Assign Download Role")) {
        String txtUsername = request.getParameter("txtHandle");
        DownloadPermission permission = new DownloadPermission(lngComponent);
        long lngRole = 0;
        try {
            debug.addMsg("component version admin", "getting principal for '" + txtUsername + "'");
            com.topcoder.security.UserPrincipal selectedPrincipal = PRINCIPAL_MANAGER.getUser(txtUsername);
            debug.addMsg("component version admin", "got principal for '" + txtUsername + "'");
            RolePrincipal roles[] = (RolePrincipal[])PRINCIPAL_MANAGER.getRoles(null).toArray(new RolePrincipal[0]);
            for (int i=0; i < roles.length && lngRole == 0; i++) {
                if (roles[i].getName().equals("DDEComponentDownload " + lngComponent)) {
                    lngRole = roles[i].getId();
                }
            }
            debug.addMsg("component version admin", "assigning role " + lngRole);
            PRINCIPAL_MANAGER.assignRole(selectedPrincipal, PRINCIPAL_MANAGER.getRole(lngRole), tcSubject);
            debug.addMsg("component version admin", "assigned role " + lngRole);
            strMessage += "Download role was assigned to " + txtUsername;
        } catch (RemoteException re) {
            strError += "RemoteException occurred while assigning role: " + re.getMessage();
        } catch (GeneralSecurityException gse) {
            strError += "GeneralSecurityException occurred while assigning role: " + gse.getMessage();
        } catch (Exception e) {
            strError += "Principal user could not be found.";
        }
    }

    // Assign a user a role that has permissions to moderate a forum
    if (action.equals("Assign Collaboration Moderator Role")) {
        String txtUsername = request.getParameter("txtHandle");
        com.topcoder.dde.catalog.Forum activeCollab = null;
        String matchCollab = "";
        long lngRole1 = 0;
        try {
            activeCollab = componentManager.getForum(com.topcoder.dde.catalog.Forum.COLLABORATION);
        } catch (CatalogException ce) {
            debug.addMsg("component version admin", "catalog exception occurred");
        }

        if (activeCollab != null) {
            matchCollab = "ForumModerator " + activeCollab.getId();
            debug.addMsg("component version admin", "loooking for role for " + matchCollab);
        }
        try {
            com.topcoder.security.UserPrincipal selectedPrincipal = PRINCIPAL_MANAGER.getUser(txtUsername);
            RolePrincipal roles[] = (RolePrincipal[])PRINCIPAL_MANAGER.getRoles(null).toArray(new RolePrincipal[0]);
            for (int i=0; i < roles.length; i++) {
                debug.addMsg("component version admin", "role: '" + roles[i].getName() + "'");
                if (roles[i].getName().equals(matchCollab)) {
                    debug.addMsg("component version admin", "found collab role " + activeCollab.getId());
                    lngRole1 = roles[i].getId();
                }
            }
            if (lngRole1 > 0) {
                PRINCIPAL_MANAGER.assignRole(selectedPrincipal, PRINCIPAL_MANAGER.getRole(lngRole1), tcSubject);
                strMessage += "Forum moderator role was assigned to " + txtUsername;
            }
        } catch (RemoteException re) {
            strError += "RemoteException occurred while assigning role: " + re.getMessage();
        } catch (GeneralSecurityException gse) {
            strError += "GeneralSecurityException occurred while assigning role: " + gse.getMessage();
        } catch (Exception e) {
            strError += "Principal user could not be found.";
        }
    }

    // Assign a user a role that has permissions to participate in specification forum for this component
    if (action.equals("Assign Specification User Role")) {
        String txtUsername = request.getParameter("txtHandle");
        com.topcoder.dde.catalog.Forum activeSpec = null;
        try {
            activeSpec = componentManager.getForum(com.topcoder.dde.catalog.Forum.SPECIFICATION);
        } catch (CatalogException ce) {
        }

        ForumModeratePermission permission = null;
        if (activeSpec != null) permission = new ForumModeratePermission(activeSpec.getId());
        long lngRole = 0;
        try {
            com.topcoder.security.UserPrincipal selectedPrincipal = PRINCIPAL_MANAGER.getUser(txtUsername);
            RolePrincipal roles[] = (RolePrincipal[])PRINCIPAL_MANAGER.getRoles(null).toArray(new RolePrincipal[0]);
            for (int i=0; i < roles.length && (permission != null && lngRole == 0); i++) {
                //debug.addMsg("component version admin", "role: '" + roles[i].getName() + "'");
                if (permission != null) {
                    if (roles[i].getName().equals("ForumUser " + activeSpec.getId())) {
                        debug.addMsg("component version admin", "found spec role " + activeSpec.getId());
                        lngRole = roles[i].getId();
                    }
                }
            }
            if (lngRole > 0) {
                PRINCIPAL_MANAGER.assignRole(selectedPrincipal, PRINCIPAL_MANAGER.getRole(lngRole), tcSubject);
                strMessage += "Specification role was assigned to " + txtUsername;
            }
        } catch (RemoteException re) {
            strError += "RemoteException occurred while assigning role: " + re.getMessage();
        } catch (GeneralSecurityException gse) {
            strError += "GeneralSecurityException occurred while assigning role: " + gse.getMessage();
        } catch (Exception e) {
            strError += "Principal user could not be found.";
        }
    }

    // Assign a user a role that has permissions to participate in specification forum for this component
    if (action.equals("Assign Specification Moderator Role")) {
        String txtUsername = request.getParameter("txtHandle");
        com.topcoder.dde.catalog.Forum activeSpec = null;
        try {
            activeSpec = componentManager.getForum(com.topcoder.dde.catalog.Forum.SPECIFICATION);
        } catch (CatalogException ce) {
        }

        ForumModeratePermission permission = null;
        if (activeSpec != null) permission = new ForumModeratePermission(activeSpec.getId());
        long lngRole = 0;
        try {
            com.topcoder.security.UserPrincipal selectedPrincipal = PRINCIPAL_MANAGER.getUser(txtUsername);
            RolePrincipal roles[] = (RolePrincipal[])PRINCIPAL_MANAGER.getRoles(null).toArray(new RolePrincipal[0]);
            for (int i=0; i < roles.length && (permission != null && lngRole == 0); i++) {
                //debug.addMsg("component version admin", "role: '" + roles[i].getName() + "'");
                if (permission != null) {
                    if (roles[i].getName().equals("ForumUser " + activeSpec.getId())) {
                        debug.addMsg("component version admin", "found spec role " + activeSpec.getId());
                        lngRole = roles[i].getId();
                    }
                }
            }
            if (lngRole > 0) {
                PRINCIPAL_MANAGER.assignRole(selectedPrincipal, PRINCIPAL_MANAGER.getRole(lngRole), tcSubject);
                strMessage += "Specification role was assigned to " + txtUsername;
            }
        } catch (RemoteException re) {
            strError += "RemoteException occurred while assigning role: " + re.getMessage();
        } catch (GeneralSecurityException gse) {
            strError += "GeneralSecurityException occurred while assigning role: " + gse.getMessage();
        } catch (Exception e) {
            strError += "Principal user could not be found.";
        }
    }

    // Review
    if (action.equals("Add Review")) {
        String username = request.getParameter("txtReviewUsername");
        String rating = request.getParameter("txtReviewRating");
        String comments = request.getParameter("txtReviewComments");
        // Find username
        try {
            User user = USER_MANAGER.getUser(username);
            Review review = new Review(user, Integer.parseInt(rating), comments);
            componentManager.addReview(review);
            strMessage += "Review was added.";
            //response.sendRedirect("component_version_admin.jsp?comp=" + lngComponent + "ver=" + lngVersion);
        } catch (com.topcoder.dde.user.NoSuchUserException nsue) {
            strError = "User '" + username + "' was not found.";
        } catch (NumberFormatException nfe) {
            strError = "Rating must be an integer.";
        }
    }

    if (action.equals("DeleteReview")) {
        String strReview = request.getParameter("review");
        long reviewId = Long.parseLong(strReview);
        componentManager.removeReview(reviewId);
        //response.sendRedirect("component_version_admin.jsp?comp=" + lngComponent + "ver=" + lngVersion);
    }

    // Team Member Role
    if (action.equals("Add Role")) {
        String strUsername = request.getParameter("txtTeamMemberRoleUsername");
        String strRole = request.getParameter("selRole");
        String strRating = request.getParameter("txtTeamMemberRating");
        try {
            User user = USER_MANAGER.getUser(strUsername);
            TeamMemberRole role = new TeamMemberRole(user, catalog.getRole(Long.parseLong(strRole)), Integer.parseInt(strRating));
            componentManager.addTeamMemberRole(role);
            strMessage += "Role " + strRole + " was assigned.";
            //response.sendRedirect("component_version_admin.jsp?comp=" + lngComponent + "ver=" + lngVersion);
        } catch (com.topcoder.dde.user.NoSuchUserException nsue) {
            strError = "User '" + strUsername + "' was not found.";
        } catch (NumberFormatException nfe) {
            strError = "Rating must be an integer.";
        }
    }

    if (action.equals("DeleteRole")) {
        String strRole = request.getParameter("role");
        long roleId = Long.parseLong(strRole);
        componentManager.removeTeamMemberRole(roleId);
        //response.sendRedirect("component_version_admin.jsp?comp=" + lngComponent + "ver=" + lngVersion);
    }

    String rootDir = "";
    try {
        ConfigManager cm = ConfigManager.getInstance();
        if (cm.existsNamespace(namespace)) {
            cm.refresh(namespace);
        } else {
            cm.add(namespace, ConfigManager.CONFIG_XML_FORMAT);
        }
        rootDir = (String)cm.getProperty(namespace, "default_directory");
        if (!rootDir.endsWith("/")) {
            rootDir += "/";
        }
    } catch (ConfigManagerException cme) {
        System.err.println(cme.toString());
    }

    if (action.equals("DeleteDocument")) {
        String strDocument = request.getParameter("document");
        long documentId = Long.parseLong(strDocument);
        com.topcoder.dde.catalog.Document document = catalog.getDocument(documentId);
        String deletedDocURL = document.getURL();
        componentManager.removeDocument(documentId);
        try{
            System.out.println(deletedDocURL);
            java.io.File file = new java.io.File(rootDir + deletedDocURL);
            file.delete();
        }
        catch(Exception e)
        {
            strError = e.getMessage();
        }
        //response.sendRedirect("component_version_admin.jsp?comp=" + lngComponent + "ver=" + lngVersion);
        File f = new File(rootDir + document.getURL());
        f.delete();
    }

    if (action.equals("DeleteDownload")) {
        String strDownload = request.getParameter("download");
        long downloadId = Long.parseLong(strDownload);
        com.topcoder.dde.catalog.Download download = catalog.getDownload(downloadId);
        componentManager.removeDownload(downloadId);
        //response.sendRedirect("component_version_admin.jsp?comp=" + lngComponent + "ver=" + lngVersion);
        File f = new File(rootDir + download.getURL());
        f.delete();
    }

}


%>

</head>

<body class="body">

<!-- Header begins -->
<%@ include file="/includes/adminHeader.jsp" %>
<%@ include file="/includes/adminNav.jsp" %>
<!-- Header ends -->

<!-- breadcrumb begins -->
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td valign="middle" width="1%" class="adminBreadcrumb"><img src="/images/clear.gif" alt="" width="10" height="1" border="0"/></td>
		<td valign="middle" width="1%" class="adminBreadcrumb" nowrap><a class="breadcrumbLinks" href="catalog.jsp">Catalog Admin</a> > <a class="breadcrumbLinks" href="javascript:history.back()">Component Description</a> > <strong>Component Version</strong></td>
		<td valign="middle" width="98%" class="adminBreadcrumb"><img src="/images/clear.gif" alt="" width="10" height="1" border="0"/></td>
	</tr>
</table>
<!-- breadcrumb ends -->

<% if (strError.length() > 0) { %>
    <font color="RED"><%= strError %></font>
    <hr><br>
<% } %>

<% if (strMessage.length() > 0) { %>
    <%= strMessage %>
    <hr><br>
<% } %>

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="middle">
	<tr valign="top">

<!-- Left Column begins -->
		<td width="165" class="leftColumn">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr><td height="5"><img src="/images/clear.gif" alt="" width="165" height="5" border="0" /></td></tr>
<!-- Catalog Admin Navigation -->
				<tr valign="top">
					<td class="adminLeftNav">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="5" class="adminLeftHead"><img src="/images/clear.gif" alt="" width="5" height="10" border="0"></td>
								<td width="155" class="adminLeftHead" colspan="2">Catalog Admin</td>
								<td width="10" class="adminLeftHead" valign="top"><img src="/images/leftNavHead.gif" alt="" width="10" height="22" border="0" /></td>
							</tr>
							<tr valign="top">
								<td><img src="/images/clear.gif" alt="" width="5" height="5" border="0"></td>
								<td class="adminLeftNavText">::&nbsp;</td>
								<td class="adminLeftNavText"><a href="catalog.jsp">Request Component</a></td>
								<td><img src="/images/clear.gif" alt="" width="10" height="5" border="0" /></td>
							</tr>
							<tr valign="top">
								<td><img src="/images/clear.gif" alt="" width="5" height="5" border="0"></td>
								<td class="adminLeftNavText">::&nbsp;</td>
								<td class="adminLeftNavText"><a href="comp_status.jsp">View Components by Status</a></td>
								<td><img src="/images/clear.gif" alt="" width="10" height="5" border="0" /></td>
							</tr>
							<tr><td colspan="4"><img src="/images/adminLeftNavFoot.gif" alt="" width="165" height="11" border="0" /></td></tr>
						</table>
					</td>
				</tr>
				<tr><td height="5"><img src="/images/clear.gif" alt="" width="10" height="5" border="0" /></td></tr>
			</table>
		</td>
		<td width="5" class="leftColumn"><img src="/images/clear.gif" alt="" width="5" height="10" border="0" /></td>
<!-- Left Column ends -->

<!-- Gutter 1 begins -->
		<td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 1 ends -->

<!-- Middle Column begins -->
		<td width="100%">

<% if (ver != null) { %>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
    <tr><td class="normal"><img src="/images/headUserAdmin.gif" alt="User Admin" width="545" height="35" border="0" /></td></tr>
    <tr><td class="adminSubhead"><%= componentManager.getComponentInfo().getName() %> version <%= ver.getVersionLabel() %></td></tr>
</table>

<table width="100%" cellpadding="0" cellspacing="0" align="center" border="0">
    <tr valign="top">
        <td align="center">

            <table width="100%" cellpadding="0" cellspacing="6" align="center" border="0">
                <tr valign="top">
                    <td align="center">
                        <table cellpadding="0" cellspacing="0" border="0">
                                <tr><td width="445" height="29" colspan="2"><img src="../images/adminNameDescHead.gif" alt="Name and Description" width="500" height="29" border="0" /></td></tr>
                        </table>
                        <table width="500" border="0" cellspacing="8" cellpadding="0" align="center" class="admin">
<!-- Version Label Name -->
<form name="frmComponent" action="component_version_admin.jsp" method="POST">
<input type="hidden" name="comp" value="<%= lngComponent %>">
<input type="hidden" name="ver" value="<%= ver.getVersion() %>">
                            <tr valign="middle">
                                <td width="48%">
                                    <img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Version Label</td>
                                <td width="1%" class="adminText"><input class="adminSearchForm" type="text" size="8" maxlength="20" name="txtVersionLabel"  value="<%= ver.getVersionLabel() %>"></input></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
<!-- Comments -->
                            <tr valign="top">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Comments</td>
                                <td width="1%" class="adminText"><textarea class="compSearchForm" name="taComments" rows="4" cols="35"><%= ver.getComments() %></textarea></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
<!--
<!-- Price
                            <tr valign="middle">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Price</td>
                                <td width="1%" class="adminText"><input class="adminSearchForm" type="text" size="20" maxlength="40" name="txtPrice" value="<%= ver.getPrice() %>"></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
-->
<!-- Phase -->
                            <tr valign="middle">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Phase</td>
                                <td width="1%" class="adminText">
                                    <select class="adminForm" type="text" name="selPhase" onChange="hide()">
                                        <option value="<%= ComponentVersionInfo.COLLABORATION %>"<%= (ver.getPhase() == ComponentVersionInfo.COLLABORATION ? " SELECTED" : "") %>>Collaboration</option>
                                        <option value="<%= ComponentVersionInfo.COMPLETED %>"<%= (ver.getPhase() == ComponentVersionInfo.COMPLETED ? " SELECTED" : "") %>>Completed</option>
                                        <option value="<%= ComponentVersionInfo.DEVELOPMENT %>"<%= (ver.getPhase() == ComponentVersionInfo.DEVELOPMENT ? " SELECTED" : "") %>>Development</option>
                                        <option value="<%= ComponentVersionInfo.SPECIFICATION %>"<%= (ver.getPhase() == ComponentVersionInfo.SPECIFICATION ? " SELECTED" : "") %>>Specification</option>
                                    </select></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>

<!-- Phase Date
                            <tr valign="top">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Phase Date</td>
                                <td width="1%" class="adminText"><input class="adminSearchForm" type="text" size="20" maxlength="40" name="txtPhaseDate" value="<%= dateFormat.format(ver.getPhaseDate()) %>"><br/><span class="adminSmall">MM/DD/YYYY</span></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>

<!-- Posting Date
                            <tr valign="top" ID="date_row1">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Posting Date</td>
                                <td width="1%" class="adminText"><input class="adminSearchForm" type="text" size="20" maxlength="40" name="txtPostingDate" value="<%= postingDate %>"><br/><span class="adminSmall">MM/DD/YYYY</span></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>

<!-- Initial Submission Date
                            <tr valign="top" ID="date_row">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Initial Submission Date</td>
                                <td width="1%" class="adminText"><input class="adminSearchForm" type="text" size="20" maxlength="40" name="txtInitialSubmissionDate" value="<%= initialSubmissionDate %>"><br/><span class="adminSmall">MM/DD/YYYY</span></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>


                           <tr valign="top">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Comments</td>
                                <td width="1%" class="adminText"><textarea class="compSearchForm" name="txtInitialSubmissionDateComment" rows="4" cols="35"><%=initialSubmissionDateComment  %></textarea></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>

<!-- screening Complete date
                            <tr valign="top" ID="date_row">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Screening Complete Date</td>
                                <td width="1%" class="adminText"><input class="adminSearchForm" type="text" size="20" maxlength="40" name="txtScreeningCompleteDate" value="<%= screeningCompleteDate %>"><br/><span class="adminSmall">MM/DD/YYYY</span></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
                            <tr valign="top">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Comments</td>
                                <td width="1%" class="adminText"><textarea class="compSearchForm" name="txtScreeningCompleteDateComment" rows="4" cols="35"><%=screeningCompleteDateComment  %></textarea></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>

<!-- Review  Complete Phase
                            <tr valign="top" ID="date_row">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Review Complete Date</td>
                                <td width="1%" class="adminText"><input class="adminSearchForm" type="text" size="20" maxlength="40" name="txtReviewCompleteDate" value="<%= reviewCompleteDate %>"><br/><span class="adminSmall">MM/DD/YYYY</span></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
                            <tr valign="top">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Comments</td>
                                <td width="1%" class="adminText"><textarea class="compSearchForm" name="txtReviewCompleteDateComment" rows="4" cols="35"><%=reviewCompleteDateComment  %></textarea></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>

<!-- Aggregation Complete Phase
                            <tr valign="top" ID="date_row">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Aggregation Complete Date</td>
                                <td width="1%" class="adminText"><input class="adminSearchForm" type="text" size="20" maxlength="40" name="txtAggregationCompleteDate" value="<%= aggregationCompleteDate %>"><br/><span class="adminSmall">MM/DD/YYYY</span></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
                            <tr valign="top">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Comments</td>
                                <td width="1%" class="adminText"><textarea class="compSearchForm" name="txtAggregationCompleteDateComment" rows="4" cols="35"><%=aggregationCompleteDateComment %></textarea></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>

<!--
<!-- Winner Announced
                            <tr valign="top" ID="date_row">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Winner Announced</td>
                                <td width="1%" class="adminText"><input class="adminSearchForm" type="text" size="20" maxlength="40" name="txtWinnerAnnouncedDate" value="<%= winnerAnnouncedDate %>"><br/><span class="adminSmall">MM/DD/YYYY</span></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
                           <tr valign="top">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Comments</td>
                                <td width="1%" class="adminText"><textarea class="compSearchForm" name="txtWinnerAnnouncedDateComment" rows="4" cols="35"><%=winnerAnnouncedDateComment  %></textarea></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>

<!-- Final Submission
                            <tr valign="top" ID="date_row">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Final Submission Due Date</td>
                                <td width="1%" class="adminText"><input class="adminSearchForm" type="text" size="20" maxlength="40" name="txtFinalSubmissionDate" value="<%= finalSubmissionDate %>"><br/><span class="adminSmall">MM/DD/YYYY</span></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
                           <tr valign="top">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Comments</td>
                                <td width="1%" class="adminText"><textarea class="compSearchForm" name="txtFinalSubmissionDateComment" rows="4" cols="35"><%=finalSubmissionDateComment  %></textarea></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
<!-- Estimated Development Phase
                            <tr valign="top" ID="date_row">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Estimated Next Phase Date</td>
                                <td width="1%" class="adminText"><input class="adminSearchForm" type="text" size="20" maxlength="40" name="txtEstimatedDevDate" value="<%= estimatedDevDate %>"><br/><span class="adminSmall">MM/DD/YYYY</span></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>


<!-- Phase Complete Phase
                            <tr valign="top" ID="date_row">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Phase Complete Date</td>
                                <td width="1%" class="adminText"><input class="adminSearchForm" type="text" size="20" maxlength="40" name="txtPhaseCompleteDate" value="<%= phaseCompleteDate %>"><br/><span class="adminSmall">MM/DD/YYYY</span></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
                            <tr valign="top">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Comments</td>
                                <td width="1%" class="adminText"><textarea class="compSearchForm" name="txtPhaseCompleteDateComment" rows="4" cols="35"><%=phaseCompleteDateComment  %></textarea></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
			    -->
<!-- Production Phase -->
                            <tr valign="top" ID="date_row">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Production Date</td>
                                <td width="1%" class="adminText"><input class="adminSearchForm" type="text" size="20" maxlength="40" name="txtProductionDate" value="<%= productionDate %>"><br/><span class="adminSmall">MM/DD/YYYY</span></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
                            <tr valign="top">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Comments</td>
                                <td width="1%" class="adminText"><textarea class="compSearchForm" name="txtProductionDateComment" rows="4" cols="35"><%=productionDateComment  %></textarea></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>


<!-- Phase Version Price -->
                            <tr valign="middle" ID="date_row">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Phase Version Price</td>
                                <td width="1%" class="adminText"><input class="adminSearchForm" type="text" size="20" maxlength="40" name="txtPhaseVersionPrice" value="<%= phasePrice %>"></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
<!-- component status -->
                            <tr valign="middle" ID="date_row">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Posting Status</td>
                                <td width="1%" class="adminText">
                                    <select name="selPostingStatus">
                                        <option value="301" <%= (postingStatusId == 301L ? " SELECTED" : "") %>>NEW POST</option>
                                        <option value="302"<%= (postingStatusId == 302L ? " SELECTED" : "") %>>REPOST</option>
                                        <option value="303"<%= (postingStatusId == 303L ? " SELECTED" : "") %>>TCO</option>
                                    </select>
                                </td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
<!-- component status -->
                            <tr valign="middle" ID="date_row">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Component Level</td>
                                <td width="1%" class="adminText">
                                    <select name="selLevelId">
                                        <option value="100" <%= (levelId == 100L ? " SELECTED" : "") %>>Level 1</option>
                                        <option value="200"<%= (levelId == 200L ? " SELECTED" : "") %>>Level 2</option>
                                        <option value="300" <%= (levelId == 300L ? " SELECTED" : "") %>>Level 3</option>
                                        <option value="400"<%= (levelId == 400L ? " SELECTED" : "") %>>Level 4</option>\
                                        <option value="500"<%= (levelId == 500L ? " SELECTED" : "") %>>Level 5</option>\
                                    </select>
                                </td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>

<!-- Public Forums -->
                            <tr valign="middle" ID="date_row">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Public Forums</td>
                                <td width="1%" class="adminText">
                                   <!-- <input type="checkbox" name="public_forum" value ="1" checked> </input> -->
                                   <input type="checkbox" name="public_forum" value ="1" <%= ( ver.getPublicForum() == true ? " CHECKED" : "") %> > </input>
                                   <br />
                                </td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
<!-- Technologies-->
                            <tr valign="top">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel" nowrap>Technologies Used</td>
                                <td width="1%" class="adminText"></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>

<%
	if (colTechnology != null) {
		Iterator iter = colTechnology.iterator();
		while (iter.hasNext()) {
			Object obj = iter.next();
			if (obj instanceof Technology) {
%>
                            <tr valign="top">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminLabel"></td>
                                <td width="1%" class="adminText">
                                    <input type="checkbox" name="tech_<%= ((Technology)obj).getId() %>" value ="<%= ((Technology)obj).getId() %>"<%= ( technologies.get("" + ((Technology)obj).getId()) != null ? " CHECKED" : "") %>> <%= ((Technology)obj).getName() %></input><br />
                                </td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
<%                      }
		}
	}
%>

<!-- Submit Button -->
                            <tr valign="middle">
                                    <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                    <td colspan="2"><img src="../images/clear.gif" alt="" width="5" height="5" border="0"/></td>
                                    <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
                            <tr valign="middle">
                                    <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                    <td colspan="2" class="adminTextCenter"><input class="adminButton" type="submit" name="a" value="Save"></td>
                                    <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
                        </table>

                        <table width="500" cellpadding="0" cellspacing="0" border="0" align="center" class="admin">
                           <tr><td><img src="../images/adminFoot.gif" alt="" width="500" height="11" border="0" /></td></tr>
                        </table>
<!-- User Info Ends -->

                        <table width="500" cellpadding="0" cellspacing="0" border="0" align="center">
                            <tr><td height="15"><img src="../images/clear.gif" alt="" width="10" height="15" border="0"/></td></tr>
                        </table>
                    </td>
                </tr>
            </table>

            <table width="100%" cellpadding="0" cellspacing="6" align="center" border="0">
                <tr valign="top">
                    <td align="center">
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr><td width="445" height="29" colspan="2"><img src="../images/adminBaseDependHead.gif" alt="Base Component Dependencies" width="500" height="29" border="0" /></td></tr>
                        </table>

                        <table width="500" border="0" cellspacing="8" cellpadding="0" align="center" class="admin">
    <!-- Master List -->
                            <tr valign="middle">
                                <td width="48%">
                                    <img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminTextCenter">Base Components Master List</td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
<%
    // List all completed components
    ComponentSummary approvedComps[] = (ComponentSummary[])catalog.getComponentsByStatusAndCatalog(ComponentInfo.APPROVED, componentManager.getRootCategory()).toArray(new ComponentSummary[0]);
    //debug.addMsg("component version admin", "got approved summaries");

    // List components for this version
    ComponentSummary versionComps[] = (ComponentSummary[])componentManager.getDependencies().toArray(new ComponentSummary[0]);
    //debug.addMsg("component version admin", "got component's summaries");
    Hashtable htHits = new Hashtable();
    for (int i=0; i< versionComps.length; i++) {
        htHits.put("" + versionComps[i].getVersionId(), "hit");
    }
%>

                            <tr valign="middle">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminTextCenter">
                                    <select name="selMasterDependency" size="8" multiple="multiple">
<%
                            for (int i=0; i < approvedComps.length; i++) {
                                //debug.addMsg("component version admin", "got master component " + (i+1) + "/" + approvedComps.length);
                                if (htHits.get("" + approvedComps[i].getVersionId()) == null) {
%>
                                        <option value="<%= approvedComps[i].getVersionId() %>"><%= approvedComps[i].getName() %> v.<%= approvedComps[i].getVersionLabel() %></option>
<%                              }
                            }
%>
                                    </select>
                                </td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>

<!-- Navigation Buttons -->
                            <tr valign="middle">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminTextCenter"><input type="image" src="../images/buttonAdd.gif" alt="\/" name="add" value=">>" /></input>&nbsp;&nbsp;&nbsp;<input type="image" src="../images/buttonRemove.gif" alt="/\" name="remove" value="<<" /></input></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>

<!-- Associated Categories -->
                            <tr valign="middle">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminTextCenter">
                                    <select name="selVersionDependency" size="4" multiple="multiple">
    <% for (int i=0; i < versionComps.length; i++) {
        //debug.addMsg("component version admin", "got version component " + (i+1) + "/" + versionComps.length);
    %>
                                        <option value="<%= versionComps[i].getVersionId() %>"><%= versionComps[i].getName() %> v.<%= versionComps[i].getVersionLabel() %></option>
    <% } %>
                                    </select></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>

                            <tr valign="middle">
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                                <td width="1%" class="adminTextCenter" nowrap>Base Components for <strong><%= componentManager.getComponentInfo().getName() %> version <%= ver.getVersionLabel() %></strong></td>
                                <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            </tr>
                        </table>

                        <table width="500" cellpadding="0" cellspacing="0" border="0" align="center" class="admin">
                            <tr><td><img src="../images/adminFoot.gif" alt="" width="500" height="11" border="0" /></td></tr>
                        </table>

                        <table width="500" cellpadding="0" cellspacing="0" border="0" align="center">
                            <tr><td height="15"><img src="../images/clear.gif" alt="" width="10" height="15" border="0"/></td></tr>
                        </table>
                    </td>
                </tr>
</form>
            </table>

<!-- Documentation begins -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                <tr><td class="adminSubhead">Documentation</td></tr>
            </table>

            <table width="100%" border="0" cellpadding="0" cellspacing="1" align="center" bgcolor="#FFFFFF">
                <tr valign="top">
                    <td width="30%" class="adminTitle">Name</td>
                    <td width="30%" class="adminTitle">Type</td>
                    <td width="30%" class="adminTitle">URL</td>
                    <td width="10%" class="adminTitleCenter">Action</td>
                </tr>

	<%
		com.topcoder.dde.catalog.Document documents[] = (com.topcoder.dde.catalog.Document[])componentManager.getDocuments().toArray(new com.topcoder.dde.catalog.Document[0]);
		for (int i=0; i < documents.length; i++) {
	%>
<form action="<%= page_name %>" enctype="multipart/form-data" method="POST">
<input type="hidden" name="comp" value="<%= lngComponent %>">
<input type="hidden" name="ver" value="<%= ver.getVersion() %>">
<input type="hidden" name="lngDocument" value="<%= documents[i].getId() %>">
                <tr valign="top">
                    <td class="forumText"><%= documents[i].getName() %></td>
                    <td class="forumText"><%= documents[i].getType() %></td>
                    <td class="forumText">
                        <A HREF="/pages/c_component_doc.jsp?path=<%= documents[i].getURL() %>"><%= documents[i].getURL() %></A>
                    </td>
                    <td class="forumTextCenter" nowrap>
                        <input type="file" name="file1" value="" maxlength="250" size="25">
                        <BR>
                        <input type="submit" class="adminButton" name="a" value="Upload Document">
                        <strong><a href="component_version_admin.jsp?comp=<%= lngComponent %>&ver=<%= lngVersion %>&document=<%= documents[i].getId() %>&a=DeleteDocument">Delete Document</a></strong>
                    </td>
                </tr>
</form>
	<% } %>

<form action="<%= page_name %>" enctype="multipart/form-data" method="POST">
<input type="hidden" name="comp" value="<%= lngComponent %>">
<input type="hidden" name="ver" value="<%= ver.getVersion() %>">
                <tr valign="top">
                    <td class="forumText"><input class="adminSearchForm" type="text" size="25" maxlength="64" name="txtDocumentName" value=""></input></td>
                    <td class="forumText">
                    <select name="selDocType">
                        <option value="0">Requirement Specification</option>
                        <option value="1">Component Specification</option>
                        <option value="2">Use Case Diagram</option>
                        <option value="3">Class Diagram</option>
                        <option value="4">Test Scorecard</option>
                        <option value="5">Deployment</option>
                        <option value="6">Other (misc.)</option>
                        <option value="7">Specification Forum documents</option>
                        <option value="8">Screen shots</option>
                        <option value="9">Screen shots Thumbnail</option>
                        <option value="10">Process Flow</option>
                        <option value="11">Class Diagram Cell Level</option>
                        <option value="12">Class Diagram Top Level</option>
                        <option value="13">Component Diagram</option>
                        <option value="14">Developer Guide</option>
                        <option value="15">Sequence Diagram</option>
                        <option value="16">Interaction Diagram</option>
                        <option value="22">Aggregated Scorecard</option>
                        <option value="23">Javadocs</option>
                    </select></td>
                    <td class="forumText">&nbsp;<!--input class="adminSearchForm" type="text" size="25" maxlength="64" name="txtDocumentURL" value=""></input--></td>
                    <td class="forumTextCenter">
                        <input type="file" name="file1" value="" maxlength="250" size="25">
                        <input class="adminButton" type="submit" name="a" value="Add Document"></input>
                    </td>
                </tr>

                <tr><td class="adminTitle" colspan="4"><img src="../images/clear.gif" alt="" width="10" height="1" border="0"/></td></tr>
<!-- Documentation ends -->

                <tr><td colspan="2" height="15"><img src="../images/clear.gif" alt="" width="10" height="15" border="0"/></td></tr>
</form>
            </table>

<!-- Downloads begins -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                <tr><td class="adminSubhead">Downloads</td></tr>
            </table>

            <table width="100%" border="0" cellpadding="0" cellspacing="1" align="center" bgcolor="#FFFFFF">
                <tr valign="top">
                    <td width="30%" class="adminTitle">Name</td>
                    <td width="60%" class="adminTitle">URL</td>
                    <td width="10%" class="adminTitleCenter">Action</td>
                </tr>

<%
    Download downloads[] = (Download[])componentManager.getDownloads().toArray(new Download[0]);
    for (int i=0; i < downloads.length; i++) {
%>
<form name="frmComponent" action="<%= page_name %>" enctype="multipart/form-data" method="POST">
<input type="hidden" name="comp" value="<%= lngComponent %>">
<input type="hidden" name="ver" value="<%= ver.getVersion() %>">
<input type="hidden" name="lngDownload" value="<%= downloads[i].getId() %>">
                <tr valign="top">
                    <td class="forumText"><%= downloads[i].getDescription() %></td>
                    <td class="forumText">
                        <A HREF="/pages/c_component_doc.jsp?path=<%= downloads[i].getURL() %>"><%= downloads[i].getURL() %></A>
                    </td>
                    <td class="forumTextCenter" nowrap>
                        <input type="file" name="file1" value="" maxlength="250" size="25">
                        <BR>
                        <input class="adminButton" type="submit" name="a" value="Upload Download">
                        <strong><a href="component_version_admin.jsp?comp=<%= lngComponent %>&ver=<%= lngVersion %>&download=<%= downloads[i].getId() %>&a=DeleteDownload">Delete Download</a></strong>
                </td>
                </tr>
</form>
<% } %>

<form action="<%= page_name %>" enctype="multipart/form-data" method="POST">
<input type="hidden" name="comp" value="<%= lngComponent %>">
<input type="hidden" name="ver" value="<%= ver.getVersion() %>">

                <tr valign="top">
                    <td class="forumText"><input class="adminSearchForm" type="text" size="25" maxlength="64" name="txtDownloadDescription" value=""></input></td>
                    <td class="forumText">&nbsp;<!--input class="adminSearchForm" type="text" size="45" name="txtDownloadURL" value=""></input--></td>
                    <td class="forumTextCenter"><input type="file" name="file1" value="" maxlength="250" size="25"><input class="adminButton" type="submit" name="a" value="Add Download"></input></td>
                </tr>

                <tr><td class="adminTitle" colspan="3"><img src="../images/clear.gif" alt="" width="10" height="1" border="0"/></td></tr>
</form>
<!-- Downloads ends -->

                <tr><td colspan="2" height="15"><img src="../images/clear.gif" alt="" width="10" height="15" border="0"/></td></tr>
            </table>

<!-- Submissions begins -->

<%--            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                <tr><td class="adminSubhead">Submissions</td></tr>
            </table>

            <table width="100%" border="0" cellpadding="0" cellspacing="1" align="center" bgcolor="#FFFFFF">
                <tr valign="top">
                    <td class="adminTitle">Phase</td>
                    <td class="adminTitle">Submitter</td>
                    <td class="adminTitle">Date</td>
                    <td class="adminTitle">Action</td>
                </tr>

<%

    Submission submissions[] = Utility.getSubmissions(componentManager.getVersionInfo().getVersionId());
    Submitters submittersEJB = Utility.getSubmitters();
    for (int i=0; i < submissions.length; i++) {
        Submitter submitter = submittersEJB.getSubmitter(submissions[i].getSubmitterId());
        User u = USER_MANAGER.getUser(submitter.getLoginId());
        RegistrationInfo inf = u.getRegInfo();
        String userName = inf.getUsername();
        Calendar cal = new GregorianCalendar();
        cal.setTimeInMillis(submissions[i].getDate().getTime());
%>
<form name="frmComponent" action="<%= "/catalog/submission" %>" method="POST">
<input type="hidden" name="submission_id" value="<%= submissions[i].getSubmissionId() %>">
<input type="hidden" name="Project" value="<%= component.getName() %>">
<input type="hidden" name="ver" value="<%= ver.getVersion() %>">
<%      boolean comment = submissions[i].getComment() != null && !submissions[i].getComment().equals("");
        if (comment) {
%>
<SCRIPT LANGUAGE="JavaScript">
    function comment<%= submissions[i].getSubmissionId() %>() {
        newWindow = window.open('','newWin','toolbar=no,location=no,scrollbars=no,status=no,width=630,height=400');
        newWindow.document.write("<HTML><HEAD><TITLE>Comment from <%= userName %></TITLE></HEAD><BODY><PRE><%= Utility.stripHTML(submissions[i].getComment()) %></PRE></BODY></HTML>");
        newWindow.document.close();
    }
</SCRIPT>
<%      }
%>
                <tr valign="top">
                    <td class="forumText"><%= ComponentVersionInfo.getPhaseName(submitter.getPhaseId()) %></td>
                    <td class="forumText"><%= userName %></td>
                    <td class="forumText" nowrap><%= ""+cal.get(Calendar.DAY_OF_MONTH)+"/"+(1+cal.get(Calendar.MONTH))+"/"+cal.get(Calendar.YEAR)+" "+cal.get(Calendar.HOUR_OF_DAY)+":"+cal.get(Calendar.MINUTE)+":"+cal.get(Calendar.SECOND) %></td>
<%      if (comment) {
%>
                    <td><input class="adminButton" type="submit" name="a" value="Download Submission"><input class="adminButton" type="button" onClick="comment<%= submissions[i].getSubmissionId() %>()" value="View Comment"></td>
<%      } else {
%>
                    <td><input class="adminButton" type="submit" name="a" value="Download Submission"> No Comment</td>
<%      }
%>
                </tr>
</form>
<% } %>

<form action="<%= page_name %>" enctype="multipart/form-data" method="POST">
<input type="hidden" name="comp" value="<%= lngComponent %>">
<input type="hidden" name="ver" value="<%= ver.getVersion() %>">

                <tr><td class="adminTitle" colspan="3"><img src="../images/clear.gif" alt="" width="10" height="1" border="0"/></td></tr>
</form>
<!-- Submissions ends -->

                <tr><td colspan="2" height="15"><img src="../images/clear.gif" alt="" width="10" height="15" border="0"/></td></tr>
            </table>--%>

<form action="<%= page_name %>" method="POST">
<input type="hidden" name="comp" value="<%= lngComponent %>">
<input type="hidden" name="ver" value="<%= ver.getVersion() %>">
<%--
<!-- Examples begins -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                <tr><td class="adminSubhead">Examples</td></tr>
            </table>

            <table width="100%" border="0" cellpadding="0" cellspacing="1" align="center" bgcolor="#FFFFFF">
                <tr valign="top">
                    <td width="30%" class="adminTitle">Name</td>
                    <td width="60%" class="adminTitle">URL</td>
                    <td width="10%" class="adminTitleCenter">Action</td>
                </tr>

<%
    Example examples[] = (Example[])componentManager.getExamples().toArray(new Example[0]);
    for (int i=0; i < examples.length; i++) {
    debug.addMsg("component version admin", "got example " + (i+1) + "/" + examples.length);
%>
                <tr valign="top">
                    <td class="forumText"><%= examples[i].getDescription() %></td>
                    <td class="forumText"><%= examples[i].getURL() %></td>
                    <td class="forumTextCenter" nowrap><strong><a href="component_version_admin.jsp?comp=<%= lngComponent %>&ver=<%= lngVersion %>&example=<%= examples[i].getId() %>&a=DeleteExample">Delete Example</a></strong></td>
                </tr>
<% } %>

                <tr valign="top">
                    <td class="forumText"><input class="adminSearchForm" type="text" size="25" maxlength="64" name="txtExampleDescription" value=""></td>
                    <td class="forumText"><input class="adminSearchForm" type="text" size="45" name="txtExampleURL" value=""></td>
                    <td class="forumTextCenter"><input class="adminButton" type="submit" name="a" value="Add Example"></input></td>
                </tr>

                <tr><td class="adminTitle" colspan="3"><img src="../images/clear.gif" alt="" width="10" height="1" border="0"/></td></tr>
<!-- Examples ends -->

                <tr><td colspan="2" height="15"><img src="../images/clear.gif" alt="" width="10" height="15" border="0"/></td></tr>
            </table>
--%>

<!-- Reviews begins -->
<%--
            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                <tr><td class="adminSubhead">Reviews</td></tr>
            </table>

            <table width="100%" border="0" cellpadding="0" cellspacing="1" align="center" bgcolor="#FFFFFF">
                <tr valign="top">
                    <td width="25%" class="adminTitle">Username</td>
                    <td width="20%" class="adminTitle">Rating</td>
                    <td width="15%" class="adminTitle">Review Date</td>
                    <td width="30%" class="adminTitle">Comments</td>
                    <td width="10%" class="adminTitleCenter">Action</td>
                </tr>

<%
    Review reviews[] = (Review[])componentManager.getReviews().toArray(new Review[0]);
    for (int i=0; i < reviews.length; i++) {
%>
                <tr valign="top">
                    <td class="forumText"><%= reviews[i].getUsername() %></td>
                    <td class="forumText"><%= reviews[i].getRating() %></td>
                    <td class="forumText"><% //= reviews[i].getReviewDate() %></td>
                    <td class="forumText"><%= reviews[i].getComments() %></td>
                    <td class="forumTextCenter" nowrap><strong><a href="component_version_admin.jsp?comp=<%= lngComponent %>&ver=<%= lngVersion %>&review=<%= reviews[i].getId() %>&a=DeleteReview">Delete Review</a></strong></td>
                </tr>
<% } %>

                <tr valign="top">
                    <td class="forumText"><input class="adminSearchForm" type="text" size="25" maxlength="64" name="txtReviewUsername" value=""></input></td>
                    <td class="forumText"><input class="adminSearchForm" type="text" size="10" name="txtReviewRating" value=""></input></td>
                    <td class="forumText">&nbsp;</td>
                    <td class="forumText"><input class="adminSearchForm" type="text" size="30" name="txtReviewComments" value=""></input></td>
                    <td class="forumTextCenter"><input class="adminButton" type="submit" name="a" value="Add Review"></input></td>
                </tr>

                <tr><td class="adminTitle" colspan="5"><img src="../images/clear.gif" alt="" width="10" height="1" border="0"/></td></tr>
<!-- Reviews ends -->

                <tr><td colspan="2" height="15"><img src="../images/clear.gif" alt="" width="10" height="15" border="0"/></td></tr>
            </table>
--%>

<!-- Team Member Roles begins -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                <tr><td class="adminSubhead">Team Member Roles</td></tr>
            </table>

<%
    Role roles[] = (Role[])catalog.getRoles().toArray(new Role[0]);
%>
            <table width="100%" border="0" cellpadding="0" cellspacing="1" align="center" bgcolor="#FFFFFF">
                <tr valign="top">
                    <td width="30%" class="adminTitle">Username</td>
                    <td width="30%" class="adminTitle">Role</td>
                    <td width="30%" class="adminTitle">Rating</td>
                    <td width="10%" class="adminTitleCenter">Action</td>
                </tr>

<%
    TeamMemberRole teamMemberRoles[] = (TeamMemberRole[])componentManager.getTeamMemberRoles().toArray(new TeamMemberRole[0]);
    for (int i=0; i < teamMemberRoles.length; i++) {
%>
                <tr valign="top">
                    <td class="forumText"><%= teamMemberRoles[i].getUsername() %></td>
                    <td class="forumText"><%= teamMemberRoles[i].getRoleName() %></td>
                    <td class="forumText"><%= teamMemberRoles[i].getTCSRating() %></td>
                    <td class="forumTextCenter" nowrap><strong><a href="component_version_admin.jsp?comp=<%= lngComponent %>&ver=<%= lngVersion %>&role=<%= teamMemberRoles[i].getId() %>&a=DeleteRole">Delete Role</a></strong></td>
                </tr>
<% } %>

                <tr valign="top">
                    <td class="forumText"><input class="adminSearchForm" type="text" size="25" maxlength="64" name="txtTeamMemberRoleUsername" value=""></td>
                    <td class="forumText">
                        <select name="selRole">
<% for (int i=0; i < roles.length; i++) { %>
                            <option value="<%= roles[i].getId() %>"><%= roles[i].getName() %></option>
<% } %>
                        </select></td>
                    <td class="forumText"><input class="adminSearchForm" type="text" size="10" maxlength="4" name="txtTeamMemberRating" value=""></td>
                    <td class="forumTextCenter"><input class="adminButton" type="submit" name="a" value="Add Role"></input></td>
                </tr>
            </table>

<!-- Permission Roles begins -->
            <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                <tr><td class="adminSubhead">Permissions</td></tr>
            </table>

            <table width="100%" border="0" cellpadding="0" cellspacing="1" align="center" bgcolor="#FFFFFF">
                <tr valign="top">
                    <td>
                        <input class="adminSearchForm" type="text" size="20" name="txtHandle">
                    </td>
                    <td>
                        <input class="adminButton" type="submit" name="a" value="Assign Collaboration Moderator Role">
<%if (ver.getPhase() != ver.COLLABORATION) {%>
                        <input class="adminButton" type="submit" name="a" value="Assign Specification User Role">
                        <input class="adminButton" type="submit" name="a" value="Assign Specification Moderator Role">
<%}%>
                        <input class="adminButton" type="submit" name="a" value="Assign Download Role">
                    </td>
                </tr>
            </table>

        </td>
</form>
<!-- Middle Column ends -->

<% } else { %>

<!-- Middle Column begins -->
    <td width="100%">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
            <tr><td class="normal"><img src="/images/headUserAdmin.gif" alt="User Admin" width="545" height="35" border="0" /></td></tr>
            <tr><td class="adminSubhead"><%= componentManager.getComponentInfo().getName() %></td></tr>
        </table>

        <table width="100%" cellpadding="0" cellspacing="0" align="center" border="0">
            <tr valign="top">
                <td align="center">

                    <table cellpadding="0" cellspacing="0" border="0">
                        <tr><td width="445" height="29" colspan="2"><img src="../images/adminNameDescHead.gif" alt="Name and Description" width="500" height="29" border="0" /></td></tr>
                    </table>

                    <table width="500" border="0" cellspacing="8" cellpadding="0" align="center" class="admin">

<!-- Version Label Name -->
                        <tr valign="middle">
<form name="frmComponent" action="<%= page_name %>" method="POST">
<input type="hidden" name="comp" value="<%= lngComponent %>">
<input type="hidden" name="ver" value="<%= ver.getVersion() %>">
                            <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            <td width="1%" class="adminLabel" nowrap>Version Label</td>
                            <td width="1%" class="adminText"><input class="adminSearchForm" type="text" size="8" maxlength="8" name="txtVersionLabel"  value=""></input></td>
                            <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                        </tr>

<!-- Comments -->
                        <tr valign="top">
                            <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            <td width="1%" class="adminLabel" nowrap>Comments</td>
                            <td width="1%" class="adminText"><textarea class="compSearchForm" name="taComments" rows="4" cols="35"></textarea></td>
                            <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                        </tr>

<!-- Technology -->
                        <tr valign="top">
                            <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            <td width="1%" class="adminLabel" nowrap>Technologies Used</td>
                            <td width="1%" class="adminText"></td>
                            <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                        </tr>

<%
if (colTechnology != null) {
    Iterator iter = colTechnology.iterator();
    while (iter.hasNext()) {
            Object obj = iter.next();
            if (obj instanceof Technology) {
%>
                        <tr valign="top">
                            <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            <td width="1%" class="adminLabel"></td>
                            <td width="1%" class="adminText">
                                <input type="checkbox" name="tech_<%= ((Technology)obj).getId() %>" value ="<%= ((Technology)obj).getId() %>"<%= ( technologies.get("" + ((Technology)obj).getId()) != null ? " CHECKED" : "") %>> <%= ((Technology)obj).getName() %></input><br />
                            </td>
                            <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                        </tr>
<%
            }
    }
}
%>

<!-- Submit Button -->
                        <tr valign="middle">
                            <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            <td colspan="2"><img src="../images/clear.gif" alt="" width="5" height="5" border="0"/></td>
                            <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                        </tr>

                        <tr valign="middle">
                            <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                            <td colspan="2" class="adminTextCenter"><input class="adminButton" type="submit" name="a" value="Create"></td>
                            <td width="48%"><img src="../images/clear.gif" alt="" width="5" height="1" border="0"/></td>
                        </tr>
                    </table>

                    <table width="500" cellpadding="0" cellspacing="0" border="0" align="center" class="admin">
                        <tr><td><img src="../images/adminFoot.gif" alt="" width="500" height="11" border="0" /></td></tr>
                    </table>

                    <table width="500" cellpadding="0" cellspacing="0" border="0" align="center">
                        <tr><td height="40"><img src="../images/clear.gif" alt="" width="10" height="40" border="0"/></td></tr>
                    </table>
                </td>
<!-- Middle Column Ends -->

            </tr>
        </table>
    </td>
</form>
<% } %>

<!-- Middle Column ends -->

<!-- Gutter 2 begins -->
		<td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 2 ends -->

<!-- Right Column begins -->
		<td width="245">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr><td height="15"><img src="/images/clear.gif" alt="" width="245" height="15" border="0" /></td></tr>
			</table>
		</td>
<!--Right Column ends -->

<!-- Gutter 3 begins -->
		<td width="10"><img src="/images/clear.gif" alt="" width="10" height="10" border="0" /></td>
<!-- Gutter 3 ends -->
	</tr>
</table>

<!-- Footer begins -->
<jsp:include page="/includes/footer.jsp" flush="true" />
<!-- Footer ends -->

</body>
</html>
