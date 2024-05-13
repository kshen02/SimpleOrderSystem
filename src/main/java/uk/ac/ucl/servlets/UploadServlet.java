package uk.ac.ucl.servlets;

import uk.ac.ucl.model.Model;
import uk.ac.ucl.model.ModelFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;

@WebServlet("/runUpload.html")
@MultipartConfig
public class UploadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Model model = ModelFactory.getModel();
        String id = request.getParameter("ID");
        Part filePart = request.getPart("profile");
        String fileName = filePart.getSubmittedFileName();
        fileName = id + "." + fileName.split("\\.")[1];
        InputStream fileContent = filePart.getInputStream();
        File location = new File("./src/main/webapp/images/"+fileName);
        Files.copy(fileContent, location.toPath(), StandardCopyOption.REPLACE_EXISTING);
        HashMap<String, String> patient = model.updatePatientProfile(id, fileName);
        request.setAttribute("patient", patient);
        request.setAttribute("ID", id);
        request.setAttribute("profile", patient.get("PROFILE"));

        // Invoke the JSP page.
        ServletContext context = getServletContext();
        RequestDispatcher dispatch = context.getRequestDispatcher("/patientinfo.jsp");
//        RequestDispatcher dispatch = context.getRequestDispatcher("/test.jsp");
        dispatch.forward(request, response);
    }

}
