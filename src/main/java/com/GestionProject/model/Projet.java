package com.GestionProject.model;

import java.sql.Date;

public class Projet {
private int idProjet;
private String NomProjet;
private String descriptionProjet;
private Date dateDebut;
private Date dateFin;
private double budget ;

    public Projet(int idProjet, String nomProjet, String descriptionProjet, Date dateDebut, Date dateFin, double budget) {
        this.idProjet = idProjet;
         NomProjet = nomProjet;
        this.descriptionProjet = descriptionProjet;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.budget = budget;
    }

    public Projet(String nomProjet, String descriptionProjet, Date dateDebut, Date dateFin, double budget) {
        NomProjet = nomProjet;
        this.descriptionProjet = descriptionProjet;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.budget = budget;
    }

    public Projet() {
    }

    public int getIdProjet() {
        return idProjet;
    }

    public void setIdProjet(int idProjet) {
        this.idProjet = idProjet;
    }

    public String getNomProjet() {
        return NomProjet;
    }

    public void setNomProjet(String nomProjet) {
        NomProjet = nomProjet;
    }

    public String getDescriptionProjet() {
        return descriptionProjet;
    }

    public void setDescriptionProjet(String descriptionProjet) {
        this.descriptionProjet = descriptionProjet;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    public double getBudget() {
        return budget;
    }

    public void setBudget(double budget) {
        this.budget = budget;
    }
}
