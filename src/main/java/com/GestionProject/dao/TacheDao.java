package com.GestionProject.dao;

import com.GestionProject.model.Tache;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

public class TacheDao {
    public static int inserTache(Tache tache){
   String sql= "INSERT INTO tache (descriptionTache, dateDebutTache, dateFinTache,idProjet)VALUES (?, ?, ?, ?)";
        int result=0;
try{

    Connection connection = ConnectionBase.getConnection();
    PreparedStatement pst= connection.prepareStatement(sql);
  pst.setString(1, tache.getDescriptionTache());
  pst.setDate(2, (Date) tache.getDateDebutTache());
  pst.setDate(3, (Date) tache.getDateFintTache());
  pst.setInt(4,tache.getIdProjet());
    result = pst.executeUpdate();
    if(result>0){
        System.out.println("insert tache valide");
    }else {
        System.out.println("insert tache invalide");
    }
} catch (Exception e) {
    e.printStackTrace();
}

        return result;
    }

}
