package com.GestionProject.model;

public class tacheRessource {

    private int idtacheRS;
    private int quantiteAssocier;
    private int idTache;
    private int idRessource;

    public tacheRessource(int idtacheRS, int quantiteAssocier, int idTache, int idRessource) {
        this.idtacheRS = idtacheRS;
        this.quantiteAssocier = quantiteAssocier;
        this.idTache = idTache;
        this.idRessource = idRessource;
    }

    public tacheRessource() {
    }

    public int getIdtacheRS() {
        return idtacheRS;
    }

    public void setIdtacheRS(int idtacheRS) {
        this.idtacheRS = idtacheRS;
    }

    public int getQuantiteAssocier() {
        return quantiteAssocier;
    }

    public void setQuantiteAssocier(int quantiteAssocier) {
        this.quantiteAssocier = quantiteAssocier;
    }

    public int getIdTache() {
        return idTache;
    }

    public void setIdTache(int idTache) {
        this.idTache = idTache;
    }

    public int getIdRessource() {
        return idRessource;
    }

    public void setIdRessource(int idRessource) {
        this.idRessource = idRessource;
    }
}
