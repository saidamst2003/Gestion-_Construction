package com.GestionProject.model;

public class Ressources {
    private int idRessource;
    private String nomRessource;
    private String typrRessource;
    private int quantite;
    private int idFournisseur ;

    public Ressources(int idRessource, String nomRessource, String typrRessource, int quantite, int idFournisseur) {
        this.idRessource = idRessource;
        this.nomRessource = nomRessource;
        this.typrRessource = typrRessource;
        this.quantite = quantite;
        this.idFournisseur = idFournisseur;
    }

    public Ressources() {
    }

    public int getIdRessource() {
        return idRessource;
    }

    public void setIdRessource(int idRessource) {
        this.idRessource = idRessource;
    }

    public String getNomRessource() {
        return nomRessource;
    }

    public void setNomRessource(String nomRessource) {
        this.nomRessource = nomRessource;
    }

    public String getTyprRessource() {
        return typrRessource;
    }

    public void setTyprRessource(String typrRessource) {
        this.typrRessource = typrRessource;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public int getIdFournisseur() {
        return idFournisseur;
    }

    public void setIdFournisseur(int idFournisseur) {
        this.idFournisseur = idFournisseur;
    }
}
