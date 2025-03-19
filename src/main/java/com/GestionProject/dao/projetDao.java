package com.GestionProject.dao;

import com.GestionProject.model.Projet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class projetDao {
  public  int inserProjet(Projet projet){
  String  SQL= "insert into Projet(NomProjet,descriptionProjet,dateDebut,dateFin,budget) value (?,?,?,?,?);";
     int result=0;

     try{
       Connection connection = ConnectionBase.getConnection();
         PreparedStatement pst=connection.prepareStatement(SQL);
         pst.setString(1,projet.getNomProjet());
         pst.setString(2,projet.getDescriptionProjet());
         pst.setDate(3,projet.getDateDebut());
         pst.setDate(4,projet.getDateFin());
         pst.setDouble(5,projet.getBudget());

         result = pst.executeUpdate();
         if(result>0){
             System.out.println("insert valide");
         }else {
             System.out.println("insert invalide");
         }

     } catch (Exception e) {
         e.printStackTrace();
     }

      return result;

  }

}
