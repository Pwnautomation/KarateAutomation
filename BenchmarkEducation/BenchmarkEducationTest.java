package BenchmarkEducation;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.apache.commons.io.FileUtils;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

class BenchmarkEducationTest {
    
    @Test
    public void testParallel() {
    
   Results results =  Runner.path("classpath:BenchmarkEducation").tags("@Demo1").tags("@Demo2")
    
   .outputCucumberJson(true).parallel(1); 
   
    
    generateReport(results.getReportDir());
    
    assertEquals(0, results.getFailCount(), results.getErrorMessages());
    
    }
    
    
    public static void generateReport(String karateOutputPath) {
    
    Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
    
    List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
    
    jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
    
    Configuration config = new Configuration(new File("target"), "BenchmarkEducation");
    
    ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
    
    reportBuilder.generateReports();
    
    }


}
