//
//  AppDelegate.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 03/08/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Configurações iniciais do aplicativo

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        let navigationBar = UINavigationBar.appearance()
        navigationBar.standardAppearance = appearance
        navigationBar.tintColor = .white
        navigationBar.barStyle = .default
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationBar.isHidden = true
        navigationBar.scrollEdgeAppearance =  navigationBar.standardAppearance
        
        window = UIWindow.init(frame: UIScreen.main.bounds)

        let navController = UINavigationController(rootViewController: ViewController())
        navController.modalPresentationStyle = .fullScreen
        navController.navigationItem.hidesBackButton = true
        
        window?.rootViewController = navController
        window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Pausa tarefas que não devem continuar enquanto o aplicativo está inativo
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Salva dados e libera recursos antes que o aplicativo entre em segundo plano
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Reverte as alterações feitas quando o aplicativo entrou em segundo plano
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Reinicia tarefas que foram pausadas ou não iniciadas
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Salva dados se apropriado
    }

}
