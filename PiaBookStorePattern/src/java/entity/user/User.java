/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity.user;

/**
 *
 * @author Tcat
 */
public class User {
    private int id;
    private String username;
    private String pass;
    private String email;
    private String dob;
    private int gender;
    private Address address;
    private NameSurname nameSurname;
    private int permission;

    
    public User(String username, String pass, String email, String dob, int gender, Address address, NameSurname nameSurname) {
        this.username = username;
        this.pass = pass;
        this.email = email;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.nameSurname = nameSurname;
    }

    public User(int id, String username, String pass, String email, String dob, int gender, Address address, NameSurname nameSurname,int Permission) {
        this.id = id;
        this.username = username;
        this.pass = pass;
        this.email = email;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.nameSurname = nameSurname;
        this.permission = Permission;
    }

    public int getPermission() {
        return permission;
    }

    public void setPermission(int Permission) {
        this.permission = Permission;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public NameSurname getNameSurname() {
        return nameSurname;
    }

    public void setNameSurname(NameSurname nameSurname) {
        this.nameSurname = nameSurname;
    }
    
    
}
