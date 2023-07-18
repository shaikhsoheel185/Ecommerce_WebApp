/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ecom.dao;


import com.ecom.entities.User;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author shaikh
 */
public class UserDao {
    
    
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public User getuserByNameandPassword( String name, String password) {
        
        User user=null;
        
        try {
            
            String query = "from User where userName =: n  and userPassword =: p";
            
            try (Session session = this.factory.openSession()) {
                 Query q = session.createQuery(query);
                
                q.setParameter("n", name);
                q.setParameter("p", password);
                
                
                user = (User)q.uniqueResult();
            }
            
            
            
        } catch (HibernateException e) {
            
            e.printStackTrace();
        }
        
        
        
        
                
        
        return user;
    }
    
    
    
}
