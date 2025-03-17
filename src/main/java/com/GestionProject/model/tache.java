package com.GestionProject.model;

import java.util.Date;

public class tache {
private int  idtache;
private String descriptionTache;
private Date dateDebutTache;
private Date dateFintTache;
private int idProjet;

    public tache(int idtache, String descriptionTache, Date dateDebutTache, Date dateFintTache, int idProjet) {
        this.idtache = idtache;
        this.descriptionTache = descriptionTache;
        this.dateDebutTache = dateDebutTache;
        this.dateFintTache = dateFintTache;
        this.idProjet = idProjet;
    }

    public tache() {
    }

    public int getIdtache() {
        return idtache;
    }

    public void setIdtache(int idtache) {
        this.idtache = idtache;
    }

    public String getDescriptionTache() {
        return descriptionTache;
    }

    public void setDescriptionTache(String descriptionTache) {
        this.descriptionTache = descriptionTache;
    }

    public Date getDateDebutTache() {
        return dateDebutTache;
    }

    public void setDateDebutTache(Date dateDebutTache) {
        this.dateDebutTache = dateDebutTache;
    }

    public Date getDateFintTache() {
        return dateFintTache;
    }

    public void setDateFintTache(Date dateFintTache) {
        this.dateFintTache = dateFintTache;
    }

    public int getIdProjet() {
        return idProjet;
    }

    public void setIdProjet(int idProjet) {
        this.idProjet = idProjet;
    }
}
