package com.GestionProject.model;

public class Administrateur {
private int idAdmin;
private String Nomadmin ;
private String Prenomadmin;
private String email;
private String Password;

    public Administrateur(int idAdmin, String nomadmin, String prenomadmin, String email, String password) {
        this.idAdmin = idAdmin;
        Nomadmin = nomadmin;
        Prenomadmin = prenomadmin;
        this.email = email;
        Password = password;
    }

    public Administrateur() {
    }

    public int getIdAdmin() {
        return idAdmin;
    }

    public void setIdAdmin(int idAdmin) {
        this.idAdmin = idAdmin;
    }

    public String getNomadmin() {
        return Nomadmin;
    }

    public void setNomadmin(String nomadmin) {
        Nomadmin = nomadmin;
    }

    public String getPrenomadmin() {
        return Prenomadmin;
    }

    public void setPrenomadmin(String prenomadmin) {
        Prenomadmin = prenomadmin;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }
}

