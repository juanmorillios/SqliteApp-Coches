//
//  AppDelegate.swift
//  SqliteApp
//
//  Created by Juan Morillo on 4/9/16.
//  Copyright © 2016 JuanMorillios. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
       
        //Cuando la app termina de cargar copia la base de datos al directorio
        copiarBaseDatos("Coches")
        
        
        return true
    }
    
    
    func copiarBaseDatos(nombreDB: String) {
    
        let objetoFileManager = NSFileManager.defaultManager()
        let objetoFileHerper = FileHelper()
        let pathDbEnDocumentos = objetoFileHerper.pathArchivoEnCarpetaDocumentos(nombreDB)
        let pathDbEnBunble = objetoFileHerper.pathBaseDatosEnBundle(nombreDB)
    
        //Pasar archivo de nuestra base de datos al path de carpeta de documentos
        
        
        if  objetoFileHerper.existeArchivoEnDocumentos(nombreDB) {
        
            //Ya tengo la BD en la carpeta de documentos

        
        }else {
            
            do{
            
                try objetoFileManager.copyItemAtPath(pathDbEnBunble, toPath: pathDbEnDocumentos )
            
            
            
            }catch _{
            
                print("Error al copiar archivo al directorio de documentos")
            
            
            
            }
        
        
        
        }
    
    }
    
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

