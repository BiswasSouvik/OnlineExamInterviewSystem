/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pk;

/**
 *
 * @author SouvikPRAT
 */
public class GenerateID {
   public int generateID(String name)
        {
            int id=0;
            id=((int)name.charAt(1))+((int)name.charAt((name.length())-1));
            return id;
        }
    
}
