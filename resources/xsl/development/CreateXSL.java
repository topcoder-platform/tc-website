import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.File;
import java.util.regex.*;
import java.util.Date;
import java.util.Collection;
import java.util.Hashtable;
import javax.naming.InitialContext;
import javax.naming.Context;
import javax.naming.NamingException;

import com.topcoder.dde.catalog.*;

import javax.rmi.PortableRemoteObject;
public class CreateXSL
{

    public static void main(String[] args)
    {
        File templateFile = null;
        FileInputStream templateFileStream = null;
        try{
            String appServer = null;
            String outputDir = null;
            if(args.length > 0)
            {
                appServer = args[0];
                outputDir = args[1];
                
            }
                long phase = 0L;
                String componentName = "";
                String componentId = "";
                String componentDesc = "";
                Context CONTEXT = getContext("org.jnp.interfaces.NamingContextFactory", appServer);
                //System.out.println("tesT3");
                Object objTechTypes = CONTEXT.lookup("CatalogEJB");
                //System.out.println("tesT3a");
                CatalogHome home = (CatalogHome) PortableRemoteObject.narrow(objTechTypes, CatalogHome.class);
                //System.out.println("tesT3b");
                Catalog catalog = home.create();
                //System.out.println("tesT4");
                Object objComponentMgr = CONTEXT.lookup("ComponentManagerEJB");
                ComponentManagerHome component_manager_home = (ComponentManagerHome) PortableRemoteObject.narrow(objComponentMgr, ComponentManagerHome.class);
                ComponentManager componentManager = null;
                //System.out.println("tesT2");
                
                long lngComponent = 0L;
                long version = -1L;
                Date phaseDate = null;
                java.util.Collection colComponents = catalog.getComponentsByStatus(ComponentInfo.APPROVED);
                ComponentSummary summaries[] = (ComponentSummary[])colComponents.toArray(new ComponentSummary[0]);
                for(int k = 0; k < summaries.length; k++)
                //for(int k = 0; k < 1; k++)
                {
                    phase = 0L;
                    version = -1L;
                    phaseDate = null;
                    Document requirementsDoc = null;
                    try {
    
                        lngComponent = summaries[k].getComponentId();
                        componentManager = component_manager_home.create(lngComponent);
                        
                        Collection colVersions = componentManager.getAllVersionInfo();
                        ComponentVersionInfo versions[] = (ComponentVersionInfo[])colVersions.toArray(new ComponentVersionInfo[0]);
                        
                        for(int i=0;i<versions.length;i++)
                        {
                            ;
                            if(versions[i].getVersion() > version && ((versions[i].getPhase() == ComponentVersionInfo.SPECIFICATION) || 
                                    (versions[i].getPhase() == ComponentVersionInfo.DEVELOPMENT)))
                            {
                                version = versions[i].getVersion();
                                phaseDate = versions[i].getPhaseDate();
                                phase = versions[i].getPhase();
                            }
                        }
                    } catch (CatalogException e) {
                        System.out.println(e.getMessage());
        
                    } catch (Exception e) {
                        System.out.println("here:" + e.getMessage());
                    }           
    
    /** Getting file**/
                    
                    if(phase == ComponentVersionInfo.SPECIFICATION || 
                       phase == ComponentVersionInfo.DEVELOPMENT)
                    {
                        System.out.println(lngComponent + ": " + version);
                        componentManager = component_manager_home.create(lngComponent, version);
                        java.util.Collection colTempDocuments = componentManager.getDocuments();

                        java.util.Iterator itr = colTempDocuments.iterator();
                        
                        while( itr.hasNext()) {
                            Document doc = (Document) itr.next();
                            //if(doc.getType() == Document.COMPONENT_SPECIFICATION && 
                            //    doc.getName().toLowerCase().startsWith("require"))
                            if(doc.getType() == 0)
                            {
                                requirementsDoc = doc;
                            }
                        }
                        
                /*
                 final String DESIGN_PROJECTS = "\n<tr valign=\"top\">" + "\n" +
                                              "    <td background=\"\" width=\"10\" class=\"statText\"><img src=\"/i/clear.gif\" alt=\"\" width=\"10\" height=\"1\" border=\"0\" /></td>" + "\n" +
                                              "    <td background=\"\" class=\"statText\"><a class=\"statText\" href=\"/index?t=development&amp;c=<<<FILENAME>>>&amp;payment=<<<PAYMENT>>>&amp;date=<<<DAY>>>&#47;<<<MONTH>>>&#47;<<<YEAR>>>\"><<<COMPONENT_SPACE_NAME>>></a></td>" +"\n" +
                                              "    <td background=\"\" class=\"statText\" align=\"center\"><<<PAYMENT>>></td>" +"\n" +
                                              "    <td background=\"\" class=\"statText\" align=\"center\"><<<DATE>>></td>" +"\n" +
                                              "    <td background=\"\" width=\"10\" class=\"statText\"><img src=\"/i/clear.gif\" alt=\"\" width=\"10\" height=\"1\" border=\"0\" /></td>" +"\n" +
                                              "</tr>\n";
                        String designProjects = "";
                  */      
                        
                        

                        ComponentVersionInfo versionInfo = componentManager.getVersionInfo();
                        
                        ComponentInfo comp = componentManager.getComponentInfo();
                        
                        componentDesc = comp.getDescription();
                        componentName = comp.getName();
                        System.out.println(componentName);
                        componentId = Long.toString(comp.getId());


                        String postfix = "development";
                        java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("MM/dd/yyyy");
                        java.util.Calendar cal = java.util.Calendar.getInstance();
                        if(phaseDate == null){
                            System.out.println("phase date is null");
                        }
                        else
                            System.out.println("PhaseDate is: " + phaseDate);
                        cal.setTime(phaseDate);

                        //formatting file name for output
                        String fileName = replacePattern(componentName, " ", "_");
                        if(fileName.startsWith(".")){
                            fileName = "dot" + fileName.substring(1);   
                        }

                        if(phase == ComponentVersionInfo.SPECIFICATION)
                        {
                            postfix = "design";
                            /*
                            String tempDesignProjects = DESIGN_PROJECTS;
                            tempDesignProjects = replacePattern(tempDesignProjects, "<<<FILENAME>>>", fileName.toLowerCase() + "-" + postfix);
                            tempDesignProjects = replacePattern(tempDesignProjects, "<<<DATE>>>", df.format(phaseDate));
                            tempDesignProjects = replacePattern(tempDesignProjects, "<<<DAY>>>", String.valueOf(cal.get(java.util.Calendar.DATE)));
                            tempDesignProjects = replacePattern(tempDesignProjects, "<<<MONTH>>>", String.valueOf(cal.get(java.util.Calendar.MONTH)+1));
                            tempDesignProjects = replacePattern(tempDesignProjects, "<<<YEAR>>>", String.valueOf(cal.get(java.util.Calendar.YEAR)));
                            tempDesignProjects = replacePattern(tempDesignProjects, "<<<COMPONENT_SPACE_NAME>>>", componentName);
                            System.out.println(tempDesignProjects);
                            */
                        }
                        else if (phase == ComponentVersionInfo.DEVELOPMENT)
                        {
                            postfix = "development";
                            
                        }
                                                
                        templateFile = new File("tcs_template-" + postfix + ".xsl");
                        templateFileStream = new FileInputStream(templateFile);
                        if(templateFile.length() > Integer.MAX_VALUE){
                            System.out.println("PROGRAM HAS PROBLEM!!!");
                        }
                        int bufferSize = (int)templateFile.length();
                        byte[] fileContents = new byte[bufferSize];
                        long n = templateFileStream.read(fileContents, 0, bufferSize); 
                        String output = "";
                        if (n != templateFile.length()) 
                            throw new Exception("Error in reading file '" + templateFile.getName() + "'"); 
     
                        if(outputDir != null)
                            fileName = outputDir + "/" + fileName;
                        
        
                        output = new String(fileContents);
                        output = replacePattern(output, "<<<OVERVIEW>>>", componentDesc);
                        String formattedComponentName = replacePattern(componentName," ", "%20");
                        output = replacePattern(output, "<<<COMPONENT_NAME>>>", formattedComponentName);
                        output = replacePattern(output, "<<<COMPONENT_SPACE_NAME>>>", componentName);
                        output = replacePattern(output, "<<<COMPONENT_ID>>>", componentId);
                        output = replacePattern(output, "<<<VERSION>>>", Long.toString(version));
                        output = replacePattern(output, "<<<PHASE>>>", Long.toString(phase));
    
                        if(requirementsDoc != null)
                        {
                            output = replacePattern(output, "<<<REQUIREMENTS_FILE>>>", "http://www.topcodersoftware.com/catalog/document?id=" + requirementsDoc.getId());
                        }
                        else{                       
                            System.out.println("Warning: no requirements for: " + componentName); 
                        }
        
        
                        
                        
                        System.out.println(fileName.toLowerCase() + "-" + postfix +".xsl");
                        FileOutputStream fos = new FileOutputStream(fileName.toLowerCase() + "-" + postfix +".xsl");
                        byte[] outputBytes = output.getBytes();
                        for(int i = 0; i < outputBytes.length; i++)
                        {
                            fos.write(outputBytes[i]);
                        }
                        fos.close();
                    }
                }
        }
        catch(Exception e){
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
        finally
        {
            try{
                templateFileStream.close();
            }
            catch(Exception e){
            }
        }
        //test();
      
    }

    private static String replacePattern(String sourceString, String patternMatch,
        String replaceString){
        String output = "";
        Pattern pattern = Pattern.compile(patternMatch);
        //System.out.println(pattern.pattern());
        Matcher m = pattern.matcher(sourceString);
        return m.replaceAll(replaceString);

     }

    public static Context getContext(String initialContextFactory, String providerUrl) throws NamingException {
        Hashtable env = new Hashtable();
        env.put(Context.INITIAL_CONTEXT_FACTORY, initialContextFactory);
        env.put(Context.PROVIDER_URL, providerUrl);
        return new InitialContext(env);
    }

}