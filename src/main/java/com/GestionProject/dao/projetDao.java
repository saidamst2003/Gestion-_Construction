package com.GestionProject.dao;

import com.GestionProject.model.Projet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class projetDao {
  public  static int inserProjet(Projet projet){
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
 public  static List displayProject(){
     List<Projet> projets = new ArrayList<>();
     String SQL ="select*from Projet;";
     try {
         Connection connection = ConnectionBase.getConnection();
         PreparedStatement pst=connection.prepareStatement(SQL);
         ResultSet resultSet = pst.executeQuery();
         while(resultSet.next()){
             Projet projet = new Projet(
                     resultSet.getInt("idProjet") ,
                     resultSet.getString("NomProjet"),
                     resultSet.getString("descriptionProjet"),
                     resultSet.getDate("dateDebut"),
                     resultSet.getDate("dateFin"),
                     resultSet.getDouble("budget")
             );
             //ajouter l'objet projet a la list projets
             projets.add(projet);
         }

     } catch (Exception e) {
         throw new RuntimeException(e);
     }


     return projets;

 }
}
