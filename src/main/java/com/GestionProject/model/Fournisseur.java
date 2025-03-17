package com.GestionProject.model;

public class Fournisseur {
   private int idFournisseur;
   private String NomeFournisseur;

    public Fournisseur(int idFournisseur, String nomeFournisseur) {
        this.idFournisseur = idFournisseur;
        NomeFournisseur = nomeFournisseur;
    }

    public Fournisseur() {
    }

    public int getIdFournisseur() {
        return idFournisseur;
    }

    public void setIdFournisseur(int idFournisseur) {
        this.idFournisseur = idFournisseur;
    }

    public String getNomeFournisseur() {
        return NomeFournisseur;
    }

    public void setNomeFournisseur(String nomeFournisseur) {
        NomeFournisseur = nomeFournisseur;
    }
}
