package com.profile.bean;

public class ProfileBean {
    //private attributes
    private int id;
    private String studentID;
    private String name;
    private String programme;
    private String email;
    private String hobbies;
    private String introduction;
    
    // constructor 
    public ProfileBean() {
    }
 
    public ProfileBean(String studentID, String name, String programme, String email, String hobbies, String introduction) {
        this.studentID = studentID;
        this.name = name;
        this.programme = programme;
        this.email = email;
        this.hobbies = hobbies;
        this.introduction = introduction;
    }
    
    // public getter methods 
    public int getId() {
        return id;
    }
    
    public String getStudentID() {
        return studentID;
    }
    
    public String getName() {
        return name;
    }
    
    public String getProgramme() {
        return programme;
    }
    
    public String getEmail() {
        return email;
    }
    
    public String getHobbies() {
        return hobbies;
    }
    
    public String getIntroduction() {
        return introduction;
    }
    
    //public setter methods
    public void setId(int id) {
        this.id = id;
    }
 
    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }
 
    public void setName(String name) {
        this.name = name;
    }
 
    public void setProgramme(String programme) {
        this.programme = programme;
    }
 
    public void setEmail(String email) {
        this.email = email;
    }
 
    public void setHobbies(String hobbies) {
        this.hobbies = hobbies;
    }
 
    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }
   
    
}


