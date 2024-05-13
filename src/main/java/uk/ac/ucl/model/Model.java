package uk.ac.ucl.model;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;


public class Model
{
  // The example code in this class should be replaced by your Model class code.
  // The data should be stored in a suitable data structure.

  private final ArrayList<HashMap<String, String>> patient_list = new ArrayList<>();  // List of lists of items
  private final ArrayList<String> patient_list_names = new ArrayList<>(); // Each list has a name

  private final ArrayList<String> keys = new ArrayList<>();

  private File file;

  public List<String> getKeys() {
    return keys;
  }

  public List<String> getPatientNames()
  {
    return patient_list_names;
  }

  public List<String> getPatientIDs() {
    ArrayList<String> ids = new ArrayList<>();
    for (HashMap<String, String> patient : patient_list) {
      ids.add(patient.get("ID"));
    }
    return ids;
  }

  public void readFile(File f) {
    try {
      file = f;
      Scanner scanner = new Scanner(file);
      keys.addAll(List.of(scanner.nextLine().split(",")));
      ArrayList<String> values = new ArrayList<>();

      while (scanner.hasNextLine()) {
        values.addAll(List.of(scanner.nextLine().split(",", -1)));
        HashMap<String, String> patient = new HashMap<>();
        for (int i = 0; i < keys.size(); i++) {
          patient.put(keys.get(i), values.get(i));
        }
        patient_list.add(patient);
        patient_list_names.add(patient.get("FIRST") + " " + patient.get("LAST"));
        values.clear();
      }
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    }
  }

  private void updateFile() {
    try {
      BufferedWriter out = new BufferedWriter(new FileWriter(file));

      // Write the keys
      for (int i = 0; i < keys.size() - 1; i++) {
        out.write(keys.get(i));
        out.write(",");
      }
      out.write(keys.get(keys.size()-1));
      out.newLine();

      // Write the records
      for (HashMap<String, String> patient : patient_list) {
        for (int i = 0; i < patient.size() - 1; i++) {
          out.write(patient.get(keys.get(i)));
          out.write(",");
        }
        out.write(patient.get(keys.get(keys.size()-1)));
//        out.write(",");
        out.newLine();
      }

      out.close();

    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  // This also returns dummy data. The real version should use the keyword parameter to search
  // the data and return a list of matching items.
  public List<String> searchFor(String searchtype, String keyword)
  {
    ArrayList<String> results = new ArrayList<>();
    results.add("Search type is: " + searchtype);
    for (HashMap<String, String> patient : patient_list) {
      if (patient.get(searchtype).equals(keyword)) {
        results.add(patient.get("PREFIX") + " " + patient.get("FIRST") + " " + patient.get("LAST"));
      }
    }
    return results;
  }

  public List<String> searchForID(String searchtype, String keyword) {
    ArrayList<String> results = new ArrayList<>();
    results.add("Search type is: " + searchtype);
    for (HashMap<String, String> patient : patient_list) {
      if (patient.get(searchtype).equals(keyword)) {
        results.add(patient.get("ID"));
      }
    }
    return results;
  }

  public HashMap<String, String> findPatientInfo(String id) {
    for (HashMap<String, String> patient : patient_list) {
      if (patient.get("ID").equals(id)) {
        return patient;
      }
    }
    return null;
  }

  public void addPatient(HashMap<String, String> patient) {
    patient_list_names.add(patient.get("FIRST") + patient.get("LAST"));
    patient_list.add(patient);
    this.updateFile();
  }

  public boolean deletePatient(String id) {
    for (int i = 0; i < patient_list_names.size(); i++) {
      if (patient_list.get(i).get("ID").equals(id)) {
        this.deleteProfileFile(patient_list.get(i).get("PROFILE"));
        patient_list_names.remove(i);
        patient_list.remove(i);
        this.updateFile();
        return true;
      }
    }
    return false;
  }

  public void updatePatient(HashMap<String, String> patient) {
    for (int i = 0; i < patient_list.size(); i++) {
      if (patient_list.get(i).get("ID").equals(patient.get("ID"))) {
        patient_list.set(i, patient);
        patient_list_names.set(i, patient.get("FIRST") + patient.get("LAST"));
        this.updateFile();
        break;
      }
    }
  }

  public HashMap<String, String> updatePatientProfile(String id, String profile) {
    for (HashMap<String, String> patient : patient_list) {
      if (patient.get("ID").equals(id)) {
        if (profile.equals("") && !patient.get("PROFILE").equals("")) {
          this.deleteProfileFile(patient.get("PROFILE"));
        }
        patient.put("PROFILE", profile);
        this.updateFile();
        return patient;
      }
    }
    return null;
  }

  private void deleteProfileFile(String profile) {
    File location = new File("./src/main/webapp/images/"+profile);
    try {
      Files.deleteIfExists(location.toPath());
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

}
