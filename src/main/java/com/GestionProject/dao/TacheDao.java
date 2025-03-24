package com.GestionProject.dao;

import com.GestionProject.model.Tache;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TacheDao {
    public static int inserTache(Tache tache) {
        String sql = "INSERT INTO tache (descriptionTache, dateDebutTache, dateFinTache, idProjet) VALUES (?, ?, ?, ?)";
        int rowsAffected = 0;

        try (Connection connection = ConnectionBase.getConnection();
             PreparedStatement pst = connection.prepareStatement(sql)) {

            pst.setString(1, tache.getDescriptionTache());
            pst.setDate(2,  tache.getDateDebutTache());
            pst.setDate(3, tache.getDateFintTache());
            pst.setInt(4, tache.getIdProjet());

            rowsAffected = pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rowsAffected;


    }




    public static List<Tache> displaytache() {
        List<Tache> taches = new ArrayList<>();
        String sql = "SELECT * FROM tache";

        try (Connection connection = ConnectionBase.getConnection();
             PreparedStatement pst = connection.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                Tache tache = new Tache(
                        rs.getInt("idTache"),
                        rs.getString("descriptionTache"),
                        rs.getDate("dateDebutTache"),
                        rs.getDate("dateFinTache"),
                        rs.getInt("idProjet")
                );
                taches.add(tache);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return taches;



    }
}



