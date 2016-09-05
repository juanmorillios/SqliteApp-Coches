//
//  FileHelper.swift
//  Created by Juan on 6/6/16.
//  Copyright © 2016 Juan Villalvazo. All rights reserved.
//

import Foundation

class FileHelper {

let objetoFileManager = NSFileManager.defaultManager()


//Regresa el path de la carpeta de documentos de la app
func pathCarpetaDocumentos() -> String {
    
    let documentsFolderPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
    
    return documentsFolderPath
}

//Regresa el path completo de un archivo que este dentro de la carpeta de documentos
func pathArchivoEnCarpetaDocumentos(nombreArchivo: String) -> String{
    return (pathCarpetaDocumentos() as NSString).stringByAppendingPathComponent(nombreArchivo)
}

//Revisa si existe o no un archivo en el directorio de documentos

func existeArchivoEnDocumentos(nombreArchivo: String) -> Bool{
    var existe:Bool?
    
    if (objetoFileManager.fileExistsAtPath(pathArchivoEnCarpetaDocumentos(nombreArchivo)))
    {
        print("El archivo \(nombreArchivo) existe en el path de documentos.");
        existe = true
    }
    else
    {
        print("El archivo \(nombreArchivo) No existe en el path de documentos.");
        existe = false
    }
    
    return existe!
}

//Data Base

func pathBaseDatosEnBundle(nombreBaseDatos: String) -> String{
    let path = NSBundle.mainBundle().pathForResource(nombreBaseDatos, ofType:"sqlite")
    return path!
}


func dbExisteEnBundle(nombreBaseDatos: String) -> Bool{
    var valor:Bool?
    
    
    
    if ((NSBundle.mainBundle().pathForResource(nombreBaseDatos, ofType:"sqlite")) != nil)
    {
        print("La base de datos si existe en el bundle");
        valor = true
    }
    else
    {
        print("La base de datos no existe en el bundle");
        valor = false
    }
    
    return valor!
}



}
