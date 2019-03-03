//
//  LoginService.swift
//  smartremit
//
//  Created by Shajedul Islam on 25/2/19.
//  Copyright © 2019 NazTech. All rights reserved.
//

import Foundation
//import almofire

typealias CompletionHandler = (_ success : Bool) -> ()

//Login Service to validate login credentials
class LoginServices
{
    static let instance = LoginServices()
    
    let defaults = UserDefaults.standard
    
    func login(username: String, password: String, completion: @escaping CompletionHandler)
    {
        let path = Bundle.main.path(forResource: "login", ofType: "json")

        let url = URL(fileURLWithPath: path!)

        DispatchQueue.main.async(execute:{
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in

            do
            {
                let loginitems = try JSONDecoder().decode(LoginJson.self, from: data!)
                
                if(loginitems.username == username && loginitems.password == password)
                {
                    //A handler that returns from this async function
                    completion(true)
                }
                else{
                    completion(false)
                }
            } 
            catch
            {
               
            }
        }.resume()
            
             })
   
    }
   
    
}
