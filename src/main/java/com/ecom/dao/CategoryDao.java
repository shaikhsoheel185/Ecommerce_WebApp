/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ecom.dao;

import com.ecom.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author shaikh
 */
public class CategoryDao {
    
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
     
    // save category to db
     public int saveCategory(Category cat){
         
         int catid;
        try (Session session = this.factory.openSession()) {
            Transaction tx  = session.beginTransaction();
            catid = (int) session.save(cat);
            tx.commit();
        }
         return catid;
     }
     
     public List<Category> getCategories(){
          Session s = this.factory.openSession();
          Query query =s.createQuery("from Category");
          List<Category> list = query.list();
          return list;
     }
     
     public Category getCategoryByID( int cid) {
         
         Category cat=null;
         
         try {
             
             Session session  = this.factory.openSession();
             
             cat = session.get(Category.class , cid);
             session.close();
             
         } catch (Exception e) {
         }
       
         
         return cat;
     }
     
}
