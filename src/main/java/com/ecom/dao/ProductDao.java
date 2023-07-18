/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ecom.dao;

import com.ecom.entities.Product;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author shaikh
 */
public class ProductDao {
    
    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    
    
    public boolean saveProduct(Product product) {
        
        boolean f = false;
        try {
            
            try (Session session = this.factory.openSession()) {
                Transaction tx = session.beginTransaction();
                
                session.save(product);
                tx.commit();
                f= true;
                session.close();
            }
            
            
            
            
            
            
            
        } catch (HibernateException e) {
            
            f = false;
        }
        
        
        return f;
    }
    
    
    // get all products 
    public List <Product> getAllProducts() {
        
        Session s= this.factory.openSession();
        Query query = s.createQuery("from Product");
        List<Product> list = query.list();
        return list;
    }
    
    // get all products by categoryid
    public List <Product> getAllProductsbyid(int cid) {
        
        Session s= this.factory.openSession();
        Query query = s.createQuery("from Product as p where p.category.categoryId =: id ");
        query.setParameter("id", cid);
        List<Product> list = query.list();
        return list;
    }
    
}


